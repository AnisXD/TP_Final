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
    public partial class Marca : System.Web.UI.Page
    {

        #region Funciones
        public void limpiarTxt()
        {
            this.txtIdMarca.Text = string.Empty;
            this.txtNombreMarca.Text = string.Empty;
        }

        public void cargarDgv()
        {
            gdvMarcas.DataSource = new NMarca().Mostrar();
            gdvMarcas.DataBind();
            lblTotalRegistros.Text = "Registros encontrados: " + gdvMarcas.Rows.Count;
        }

        public bool txtCompletos()
        {
            if ((txtIdMarca.Text == string.Empty) || (txtNombreMarca.Text == string.Empty) || txtIdMarca.Text.Trim().Length<1)
            {
                lblEstado.Text= "Atención!! Hay campos incompletos txt id= " + txtIdMarca.Text.Length + " txt nombre= " + txtNombreMarca.Text.Length;
                return false;
            }
            else
            {
                return true;
            }
        }

        public bool ExisteId(string id)
        {
            bool existe = false;
            DataTable dt = new DataTable();
            dt = new NMarca().BuscarPorId(id);
           
            if (dt == null)
            {
               // lblEstado.Text = "error con procedimiento";
            }
            else
            {
                if (dt.Rows.Count == 1 && id.Length > 0)
                {
                    existe = true;
                    this.txtNombreMarca.Text = dt.Rows[0].ItemArray[1].ToString();
                }
                else
                {
                    lblEstado.Text = "el ID es nuevo";
                }
            }

            return existe;
        }

        public bool ExisteNombre(string nombre)
        {
            bool existe = false;
            DataTable dt = new DataTable();
            dt = new NMarca().BuscarPorNombre(nombre);
            if (dt.Rows.Count == 1 && nombre.Length > 0)
            {
                existe = true;
            }
            return existe;
        }

        #endregion
        #region Eventos
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                cargarDgv();
                CargarDDL_Marcas();
                CargarDDL_IdMarcas();
                limpiarTxt();
                btnAgregar.Enabled = true;
                btnEditar.Enabled = false;
                btnEliminar.Enabled = false;
            }
        }
        protected void txtIdMarca_TextChanged(object sender, EventArgs e)
        {
            lblEstado.Text = "txtID se modifico";
            if (txtIdMarca.Text.Trim().Length == 0)
            {
                btnAgregar.Enabled = false;
                btnEditar.Enabled = false;
                btnEliminar.Enabled = false;
                //txt vacio
            }
            else
            {
                if (ExisteId(txtIdMarca.Text))
                {
                    btnAgregar.Enabled = false;
                    btnEditar.Enabled = true;
                    btnEliminar.Enabled = true;
                    lblEstado.Text = "El id ingresado ya fue registrado";
                }
                else
                {
                    btnAgregar.Enabled = true;
                    btnEditar.Enabled = false;
                    btnEliminar.Enabled = false;
                }
            }
        }
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            if (!txtCompletos())
            {
                lblEstado.Text+="Atencion!! Para agregar un registro a la tabla debe completar todos los campos de datos";
            }
            else
            {
                NMarca Obj = new NMarca();
                if (Obj.Insertar(txtIdMarca.Text, txtNombreMarca.Text))
                {
                    lblEstado.Text = "El registro se insertó con exito";
                }
                else
                {
                    lblEstado.Text = "El registro no se pudo insertar, pruebe usando un Id diferente.";
                }
                
            }
            cargarDgv();
            limpiarTxt();
        }
        protected void btnEditar_Click(object sender, EventArgs e)
        {
            if (txtCompletos())
            { 
                NMarca obj = new NMarca();
                if(obj.Editar(txtIdMarca.Text, txtNombreMarca.Text))
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
                lblEstado.Text = "Atencion!! Para editar un registro de la tabla debe completar todos los campos de datos";
            }
        }
        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            if (txtCompletos())
            {
                NMarca obj = new NMarca();
                if (obj.Eliminar(txtIdMarca.Text, txtNombreMarca.Text))
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
                lblEstado.Text = "Atencion!! Para eliminar un registro de la tabla debe completar todos los campos de datos";
            }
        }
         protected void gdvMarcas_SelectedIndexChanged(object sender, EventArgs e)
            {
            this.txtIdMarca.Text = gdvMarcas.SelectedRow.Cells[1].Text;
            this.txtNombreMarca.Text = gdvMarcas.SelectedRow.Cells[2].Text;
            btnAgregar.Enabled = false;
            btnEditar.Enabled = true;
            btnEliminar.Enabled = true;
            lblEstado.Text = "Puede editar o eliminar el registro seleccionado";
         }
        #endregion

        protected void cbMarca_CheckedChanged(object sender, EventArgs e)
        {
            if (cbMarca.Checked)
            {
                cbIdMarca.Visible = false;
                ddlIdMarca.Visible = false;
            }
            else
            {
                cbIdMarca.Visible = true;
                ddlIdMarca.Visible = true;
            }
        }

        protected void cbIdMarca_CheckedChanged(object sender, EventArgs e)
        {
            if (cbIdMarca.Checked)
            {
                cbMarca.Visible = false;
                ddlMarca.Visible = false;
            }
            else
            {
                cbMarca.Visible = true;
                ddlMarca.Visible = true;
            }
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            string MARCA;
            string IDMARCA;

            if (cbMarca.Checked)
            {
                MARCA = ddlMarca.SelectedItem.Text;
                 
                NMarca Obj = new NMarca();
                gdvMarcas.DataSource = Obj.BuscarMarcaPorNombre(MARCA);
                gdvMarcas.DataBind();
                lblTotalRegistros.Text = "Registros encontrados: " + gdvMarcas.Rows.Count;
            }
           
            if (cbIdMarca.Checked)
            {
                IDMARCA = ddlIdMarca.SelectedItem.Text;

                NMarca Obj = new NMarca();
                gdvMarcas.DataSource = Obj.BuscarMarcaPorId(IDMARCA);
                gdvMarcas.DataBind();
                lblTotalRegistros.Text = "Registros encontrados: " + gdvMarcas.Rows.Count;
            }
        }

        protected void btnQuitarFiltro_Click(object sender, EventArgs e)
        {
           Response.Redirect("/Empleado/Marca.aspx");
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
        private void CargarDDL_IdMarcas()
        {
            NMarca Obj = new NMarca();
            ddlIdMarca.Items.Clear();
            ddlIdMarca.DataSource = Obj.Mostrar();
            ddlIdMarca.DataTextField = "Id";
            ddlIdMarca.DataValueField = "Marca";
            ddlIdMarca.DataBind();
        }
    }
}