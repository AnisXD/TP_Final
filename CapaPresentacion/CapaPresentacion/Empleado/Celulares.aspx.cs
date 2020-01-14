using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CapaOperaciones;
using ENTIDADES;

namespace CapaPresentacion.Empleado
{
    public partial class Celulares : System.Web.UI.Page
    {

        #region Funciones
        public void limpiarTxt()
        {
            this.txtModelo2.Text = string.Empty;
            this.txtDescripcion.Text = string.Empty;
            this.txtPrecio2.Text = string.Empty;
            this.txtStock.Text = string.Empty;
        }

        public void cargarDgv()
        {
            gvwCelulares.DataSource = new NCelular().Mostrar();
            gvwCelulares.DataBind();
            lblTotalRegistros.Text = "Registros encontrados: " + gvwCelulares.Rows.Count;
        }
        public void CargarDDL_Marcas()
        {
            NMarca Obj = new NMarca();
            ddlMarca.DataSource = Obj.Mostrar();
            ddlMarca.DataTextField = "Marca";
            ddlMarca.DataValueField = "Id";
            ddlMarca.DataBind();
        }

        public void CargarDDL_Modelo()
        {
            NCelular Obj = new NCelular();
            ddlModelo.DataSource = Obj.BuscarPorMarca(ddlMarca.SelectedValue);
            ddlModelo.DataTextField = "Modelo";
            ddlModelo.DataValueField = "Modelo";
            ddlModelo.DataBind();
        }

        public void CargarDDL_Marcas2()
        {
            NMarca Obj = new NMarca();
            ddlMarca2.DataSource = Obj.Mostrar();
            ddlMarca2.DataTextField = "Marca";
            ddlMarca2.DataValueField = "Id";
            ddlMarca2.DataBind();
        }
        public bool txtCompletos()
        {
            if ((txtModelo2.Text == string.Empty) || (ddlMarca2.Text == string.Empty) || (txtDescripcion.Text == string.Empty) || (txtPrecio2.Text == string.Empty) || txtPrecio2.Text.Trim().Length < 1 || (txtStock.Text == string.Empty))
            {
                // lblEstado.Text = "Atención!! Hay campos incompletos txt id= " + txtIdMarca.Text.Length + " txt nombre= " + txtNombreMarca.Text.Length;
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

            if (dt == null)
            {
                //lblEstado.Text = "El modelo ingresado no esta en la base de datos";
            }
            else
            {
                if (dt.Rows.Count == 1 && id.Length > 0)
                {
                    existe = true;
                }
            }

            return existe;
        }

        public bool ExisteporMarca(string marca)
        {
            bool existe = false;
            DataTable dt = new DataTable();
            dt = new NCelular().BuscarPorMarca(marca);
            if (dt.Rows.Count == 1 && marca.Length > 0)
            {
                existe = true;
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
                cargarDgv();
                CargarDDL_Marcas2();
                CargarDDL_Modelo();
                CargarDDL_Marcas();
                limpiarTxt();
                btnAgregar.Enabled = true;
                btnEditar.Enabled = false;
                btnEliminar.Enabled = false;
            }

        }


        protected void txtModelo2_TextChanged(object sender, EventArgs e)
        {
            //lblEstado.Text = "El Modelo se modifico";
        }

        protected void btnAgregar_Click1(object sender, EventArgs e)
        {
            if (!txtCompletos())
            {
                lblEstado.Text = "Atencion! Para agregar un registro a la tabla debe completar todos los datos";
            }
            else
            {
                if (txtModelo2.Text.Length == 0)
                {
                    btnAgregar.Enabled = false;
                    btnEditar.Enabled = false;
                    btnEliminar.Enabled = false;
                    lblEstado.Text = "El Modelo esta vacio";
                }

                else
                {
                    if (ExisteModelo(txtModelo2.Text))
                    {
                        btnAgregar.Enabled = false;
                        btnEditar.Enabled = true;
                        btnEliminar.Enabled = true;
                        lblEstado.Text = "El Modelo ya existe";
                    }
                    else
                    {
                        btnAgregar.Enabled = true;
                        btnEditar.Enabled = false;
                        btnEliminar.Enabled = false;

                        NCelular Obj = new NCelular();
                        if (Obj.Insertar(txtModelo2.Text, ddlMarca.Text, Convert.ToInt32(txtPrecio2.Text), Convert.ToInt32(txtStock.Text), txtDescripcion.Text, UbicacionImagen.FileName.ToString()))
                        {
                            lblEstado.Text = "El registro se insertó con exito";
                        }
                        else
                        {
                            lblEstado.Text = "El registro no se pudo insertar";
                        }
                        //lblEstado.Text = "El Modelo ingresado fue registrado";
                    }
                }

            }
            cargarDgv();
            limpiarTxt();
        }

        protected void btnEditar_Click1(object sender, EventArgs e)
        {
            if (txtCompletos())
            {
                NCelular obj = new NCelular();
                if (obj.Editar(txtModelo2.Text, ddlMarca.Text, Convert.ToInt32(txtPrecio2.Text), Convert.ToInt32(txtStock.Text), txtDescripcion.Text, UbicacionImagen.FileName.ToString()))
                {
                    lblEstado.Text = "El registro se editó con exito";
                }
                else
                {
                    lblEstado.Text = "El registro no se pudo editar";
                }
                cargarDgv();
                limpiarTxt();
            }
            else
            {
                lblEstado.Text = "Atencion! Para editar un registro de la tabla debe completar todos los campos de datos";
            }
        }

        protected void btnEliminar_Click1(object sender, EventArgs e)
        {
            if (txtCompletos())
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
                cargarDgv();
                limpiarTxt();
            }
            else
            {
                lblEstado.Text = "Atencion! Para eliminar un registro de la tabla debe completar todos los campos de datos";
            }
        }

        protected void gvwCelulares_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.txtModelo2.Text = gvwCelulares.SelectedRow.Cells[1].Text;
            this.ddlMarca2.Text = gvwCelulares.SelectedRow.Cells[2].Text;
            this.txtDescripcion.Text = gvwCelulares.SelectedRow.Cells[3].Text;
            this.txtStock.Text = gvwCelulares.SelectedRow.Cells[4].Text;
            this.txtPrecio2.Text = gvwCelulares.SelectedRow.Cells[5].Text;
            // this.txt.Text = gvwCelulares.SelectedRow.Cells[5].Text;
            btnAgregar.Enabled = false;
            btnEditar.Enabled = true;
            btnEliminar.Enabled = true;
            lblEstado.Text = "Puede editar o eliminar el registro seleccionado";
        }


        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            //NCelular ObjCelular = new NCelular();
            //ObjCelular.BuscarPorModelo


            //    string ClausulaSQL = "";

            //if (Mayor.Checked)
            //    ObjCelular.ArmarClausula("Precio", rbmenorigual.Text, textBox1.Text, ref ClausulaSQL);

            //if (rbmayorigual.Checked && textBox1.Text != "")
            //    ArmarClausulaSQL("IdPedido", rbmayorigual.Text, textBox1.Text, ref ClausulaSQL);

            //if (rbigual.Checked && textBox1.Text != "")
            //    ArmarClausulaSQL("IdPedido", rbigual.Text, textBox1.Text, ref ClausulaSQL);

            //if (rb1.Checked)
            //    dtPedidosFiltrados = gp.ObtenerPedidosEnvio(1, ref ClausulaSQL);

            //if (rb2.Checked)
            //    dtPedidosFiltrados = gp.ObtenerPedidosEnvio(2, ref ClausulaSQL);

            //if (rb3.Checked)
            //    dtPedidosFiltrados = gp.ObtenerPedidosEnvio(3, ref ClausulaSQL);

            //textBox1.Text = "";

            //dataGridView1.DataSource = dtPedidosFiltrados;


        }
    

        #endregion

        protected void ddlMarca_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarDDL_Modelo();
        }
    }
}
