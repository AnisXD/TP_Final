using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using CapaOperaciones;
using ENTIDADES;

namespace CapaPresentacion.Empleado
{
    public partial class Celulares : System.Web.UI.Page
    {

        #region Funciones
        private void limpiarTxt()
        {
            this.txtModelo2.Text = string.Empty;
            this.txtDescripcion.Text = string.Empty;
            this.txtPrecio2.Text = string.Empty;
            this.txtStock.Text = string.Empty;
            this.txtUbicacion.Text = string.Empty;
        }

        private void cargarDgv(DataTable Celulares)
        {
            gvwCelulares.DataSource = Celulares;
            gvwCelulares.DataBind();
            lblTotalRegistros.Text = "Registros encontrados: " + gvwCelulares.Rows.Count;
        }
        private void CargarDDL_Marcas()
        {
            NMarca Obj = new NMarca(); 
            ddlMarca.Items.Clear();
            ddlMarca.DataSource = Obj.Mostrar();
            ddlMarca.DataTextField = "Marca";
            ddlMarca.DataValueField = "Id";
            ddlMarca.DataBind();
        }

        private void CargarDDL_Modelo()
        {
            NCelular Obj = new NCelular();
            ddlModelo.Items.Clear();
            ddlModelo.DataSource = Obj.Mostrar();
            ddlModelo.DataTextField = "Modelo";
            ddlModelo.DataValueField = "Modelo";
            ddlModelo.DataBind();
        }
        private void CargarDDL_ModeloPorMarca()
        {
            NCelular Obj = new NCelular();
            ddlModelo.Items.Clear();
            ddlModelo.DataSource = Obj.BuscarPorMarca(ddlMarca.SelectedItem.Value);
            ddlModelo.DataTextField = "Modelo";
            ddlModelo.DataValueField = "Modelo";
            ddlModelo.DataBind();
        }
        //funcion que busca en el ddl la marca del regitro seleccionado en el gridview y la selecciona
        private void BuscarMarcaEnDdl(string marca)
        {
            foreach (ListItem Item in ddlMarca2.Items)
            {
                if (Item.Text == marca)
                    ddlMarca2.SelectedIndex = ddlMarca2.Items.IndexOf(Item);
            }
        }
        private void CargarDDL_Marcas2()
        {
            NMarca Obj = new NMarca();
            ddlMarca2.Items.Clear();
            ddlMarca2.DataSource = Obj.Mostrar();
            ddlMarca2.DataTextField = "Marca";
            ddlMarca2.DataValueField = "Id";
            ddlMarca2.DataBind();
        }
        private void CargarComboNumerico(ref DropDownList NombreCombo)
        {
            NombreCombo.Items.Add("Igual a:");
            NombreCombo.Items.Add("Mayor a:");
            NombreCombo.Items.Add("Menor a:");
        }
        public bool txtCompletos()
        {
            if ((txtModelo2.Text == string.Empty) || (txtDescripcion.Text == string.Empty) || (txtPrecio2.Text == string.Empty) || (txtStock.Text == string.Empty)||(txtUbicacion.Text==string.Empty))
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        public bool ExisteModelo(string id)
        {
            bool existe = false;
            DataTable dt = new DataTable();
            dt = new NCelular().BuscarPorModelo(id);

            if (dt == null) //si dt es null es por que el id ingresado no se encontro en la base de datos
            {
                lblEstado.Text = "El modelo ingresado no esta en la base de datos";
            }
            else //si dt vuelve con algun registro es por que el modelo ingresado ya esta en la base de datos
            {
                if (dt.Rows.Count > 0)
                {
                    existe = true;
                    lblEstado.Text = "El modelo ingresado ya existe en la base de datos";
                
                }
            }
            return existe;
        }

        #endregion

     #region Eventos
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                cargarDgv(new NCelular().Mostrar());
                CargarDDL_Marcas();
                CargarDDL_Modelo();
                CargarDDL_Marcas2();
                limpiarTxt();
                CargarComboNumerico(ref ddlPrecio);
                btnAgregar.Enabled = true;
                btnEditar.Enabled = false;
                btnEliminar.Enabled = false;
            }

        }

        protected void txtModelo2_TextChanged(object sender, EventArgs e)
        {
            lblEstado.Text = "txtID se modifico";
            if (txtModelo2.Text.Trim().Length == 0)
            {
                btnAgregar.Enabled = false;
                btnEditar.Enabled = false;
                btnEliminar.Enabled = false;
                lblEstado.Text = "Falta ingresar modelo";
            }
            else
            {
                if (ExisteModelo(txtModelo2.Text))
                {
                    btnAgregar.Enabled = false;
                    btnEditar.Enabled = true;
                    btnEliminar.Enabled = true;
                    lblEstado.Text = "El modelo ingresado ya fue registrado";
                }
                else
                {
                    btnAgregar.Enabled = true;
                    btnEditar.Enabled = false;
                    btnEliminar.Enabled = false;
                    lblEstado.Text = "El modelo ingresado es nuevo";
                }
            }
        }


        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            //hacer funcion que guarde el archivo seleccionado en la carpeta del programa y le asigne nueva ubicacion
            if (txtCompletos())
            {
                NCelular Obj = new NCelular();
                if (Obj.Insertar(txtModelo2.Text, ddlMarca2.SelectedValue, Convert.ToInt32(txtPrecio2.Text), Convert.ToInt32(txtStock.Text), txtDescripcion.Text, txtUbicacion.Text))
                {
                    lblEstado.Text = "El registro se insertó con exito";
                }
                else
                {
                    lblEstado.Text = "El registro no se pudo insertar";
                }
                cargarDgv(new NCelular().Mostrar());
                limpiarTxt();
            }
            else //si los txt no estan completos aviso al usuario
            {
                lblEstado.Text = "Atencion! Para agregar un registro debe completar todos los campos";
            }
        }



        protected void btnEditar_Click1(object sender, EventArgs e)
        {
            if (txtCompletos())
            {
                NCelular obj = new NCelular();
                
                if (obj.Editar(txtModelo2.Text, ddlMarca2.SelectedValue, Convert.ToInt32(txtPrecio2.Text), Convert.ToInt32(txtStock.Text), txtDescripcion.Text, txtUbicacion.Text))
                {
                    lblEstado.Text = "El registro se editó con exito -";
                }
                else
                {
                    lblEstado.Text = "El registro no se pudo editar";
                }
                cargarDgv(new NCelular().Mostrar());
                limpiarTxt();
            }
            else
            {
                lblEstado.Text = "Atencion! Para editar un registro debe completar todos los campos de datos";
            }
        }

        protected void btnEliminar_Click1(object sender, EventArgs e)
        {
            if (txtModelo2.Text!=string.Empty)
            {
                NCelular obj = new NCelular();
                if (obj.Eliminar(txtModelo2.Text))
                {
                    lblEstado.Text = "El registro se eliminó con exito";
                }
                else
                {
                    lblEstado.Text = "El registro no se pudo eliminar";
                }
                cargarDgv(new NCelular().Mostrar());
                limpiarTxt();
            }
            else
            {
                lblEstado.Text = "Atencion! Para eliminar un registro debe ingresar el modelo de celular o seleccionarlo de la tabla";
            }
        }

        protected void gvwCelulares_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.txtModelo2.Text = gvwCelulares.SelectedRow.Cells[1].Text;
            BuscarMarcaEnDdl(gvwCelulares.SelectedRow.Cells[2].Text);
            this.txtDescripcion.Text = gvwCelulares.SelectedRow.Cells[3].Text;
            this.txtStock.Text = gvwCelulares.SelectedRow.Cells[4].Text;
            this.txtPrecio2.Text = gvwCelulares.SelectedRow.Cells[5].Text;
            this.txtUbicacion.Text=gvwCelulares.SelectedRow.Cells[6].Text;
            btnAgregar.Enabled = false;
            btnEditar.Enabled = true;
            btnEliminar.Enabled = true;
            lblEstado.Text = "Puede editar o eliminar el registro seleccionado";
        }
        protected void ddlMarca_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarDDL_ModeloPorMarca();
        }

        protected void CbxModelo_CheckedChanged(object sender, EventArgs e)
        {
            if (CbxModelo.Checked)
            {
                CbxPrecio.Visible = false;
                ddlPrecio.Visible = false;
                txtPrecio.Visible = false;
                CbxPrecio.Checked = false;
            }
            else
            {
                CbxPrecio.Visible = true;
                ddlPrecio.Visible = true;
                txtPrecio.Visible = true;
            }         
        }
        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            string Filtro = "";
            NCelular Obj = new NCelular();
            if (CbxModelo.Checked)//si modelo esta seleccionado solo busca por modelo
            {
                lblFiltro.Text = "Filtrar por Modelo: " + ddlModelo.SelectedItem.Text + " - value: " + ddlModelo.SelectedValue;
                cargarDgv(Obj.BuscarPorModelo(ddlModelo.SelectedValue));
            }
            else //si modelo no esta seleccionado se fija si esta seleccionado marca Y precio
            {
                if (CbxMarca.Checked && CbxPrecio.Checked)
                {//como marca Y precio estan seleccionados arma un filtro
                    Obj.AgregarFiltro("ID_MARCA_CEL",
                                      "Es igual a:",
                                      ddlMarca.SelectedItem.Value,
                                      ref Filtro);
                    Obj.AgregarFiltro("PRECIO_UNITARIO_CEL",
                                      ddlPrecio.SelectedItem.Text,
                                      txtPrecio.Text,
                                      ref Filtro);
                    lblFiltro.Text = "Filtrar por marca: " + ddlMarca.SelectedItem.Text + " - value: " + ddlMarca.SelectedValue + " y por Precio: " + ddlPrecio.SelectedItem.Text + txtPrecio.Text;
                    //Ahora carga el gridview segun el filtro armado
                    cargarDgv(Obj.BuscarPorFiltro(Filtro));
                }
                else// Ahora tengo que buscar si marca O precio estan seleccionados
                {
                    if(CbxMarca.Checked)//En este punto solo el Rbtn Marca esta seleccionado
                    {
                        lblFiltro.Text = "Filtrar por marca: " + ddlMarca.SelectedItem.Text + " - value: " + ddlMarca.SelectedValue ;
                        cargarDgv(Obj.BuscarPorMarca(ddlMarca.SelectedItem.Value));
                    }
                    else 
                    {
                        if(CbxPrecio.Checked)//En este punto solo el Rbtn Precio esta seleccionado
                        {
                            Obj.AgregarFiltro("PRECIO_UNITARIO_CEL",
                                      ddlPrecio.SelectedItem.Text,
                                      txtPrecio.Text,
                                      ref Filtro);
                            lblFiltro.Text = "Filtrar por Precio: " + ddlPrecio.SelectedItem.Text + txtPrecio.Text;
                            //Ahora carga el gridview segun el filtro armado
                            cargarDgv(Obj.BuscarPorFiltro(Filtro));
                        }
                        else//si llega hasta aca ninguno de los Rbtn esta seleccionado
                        {
                            lblFiltro.Text = "Para filtrar los celulares debe seleccionar algun criterio";
                        }
                    }
                }
            }
        }

        protected void btnQuitarFiltro_Click(object sender, EventArgs e)
        {
            cargarDgv(new NCelular().Mostrar());
            CargarDDL_Marcas();
            CargarDDL_Modelo();
            txtPrecio.Text = string.Empty;
            CbxMarca.Checked = false;
            CbxModelo.Checked = false;
            CbxPrecio.Checked = false;
            limpiarTxt();

        }

        protected void btnVerUbicacion_Click(object sender, EventArgs e)
        {
            string URLdestino = @"~\Imagenes\";
            //chequeamos que haya un archivo cargado en el control
            if (UbicacionImagen.HasFile)
            {
                //chequeamos la extension del archivo elegido
                if (System.IO.Path.GetExtension(UbicacionImagen.FileName) == ".jpg")
                {
                    URLdestino += UbicacionImagen.FileName;
                    txtUbicacion.Text = URLdestino;
                    //chequeamos si ya existe un archivo con ese nombre en la carpeta de la aplicacion
                    if (File.Exists(Request.PhysicalApplicationPath + @"Imagenes\" + Server.HtmlEncode(UbicacionImagen.FileName)))
                    {
                        txtUbicacion.Text = URLdestino;
                    }
                    else
                    {//si no existe el archivo en la carpeta informamos al usuario
                        lblEstado.Text = "La imagen seleccionada no esta en la carpeta Imagenes de la aplicacion, debe seleccionar una imagen de dicha carpeta o almacenar la imagen seleccionada en esa carpeta para poder continuar ";
                        //btnGuardar.Visible = true;
                        //lblEstado.Text = "La imagen se guardara en: " + Request.PhysicalApplicationPath + @"Imagenes\" + Server.HtmlEncode(UbicacionImagen.FileName);
                    }
                }
                else
                {
                    lblEstado.Text = "Error: La imagen ingresada no tiene el formato .jpg ";
                }
            }
            else
            {
                lblEstado.Text = "Debe seleccionar una imagen para cargar";
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)

        {
            string fullpath = Request.PhysicalApplicationPath + @"Imagenes\" + Server.HtmlEncode(UbicacionImagen.FileName);
            try
            {
                //UbicacionImagen.SaveAs(fullpath);
                lblEstado.Text = "La imagen se cargo con exito";
            }
            catch (Exception ex)
            {
                lblEstado.Text = "La imagen no se pudo cargar: " + ex.Message;
            }
        }

        #endregion

    }
}
