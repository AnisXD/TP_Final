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
            this.ddlMarca2.Text = string.Empty;
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
            dt = new NCelular().BuscarPorIdModelo(id);
            if (dt.Rows.Count == 1 && id.Length > 0)
            {
                existe = true;
            }
            return existe;
        }

        public bool ExisteporMarca(string marca)
        {
            bool existe = false;
            DataTable dt = new DataTable();
            dt = new NCelular().BuscarPorIdMarca(marca);
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
            if (!IsPostBack)
            {
                cargarDgv();
                CargarDDL_Marca();
                limpiarTxt();
                btnAgregar.Enabled = true;
                btnEditar.Enabled = false;
                btnEliminar.Enabled = false;
            }

        }

        protected void txtIdModelo_TextChanged(object sender, EventArgs e)
        {
            //lblEstado.Text = "El Modelo se modifico";
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
                    lblEstado.Text = "El Modelo ingresado fue registrado";
                }
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            if (!txtCompletos())
            {
                lblEstado.Text = "Atencion! Para agregar un registro a la tabla debe completar todos los datos";
            }
            else
            {
                NCelular Obj = new NCelular();
                if (Obj.Insertar(txtModelo2.Text, ddlMarca.Text, txtPrecio2.Text, txtStock.Text, txtDescripcion.Text ))
                {
                    lblEstado.Text = "El registro se insertó con exito";
                }
                else
                {
                    lblEstado.Text = "El registro no se pudo insertar";
                }

            }
            cargarDgv();
            limpiarTxt();
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            if (txtCompletos())
            {
                NCelular obj = new NCelular();
                if (obj.Editar(txtModelo2.Text, ddlMarca.Text, txtPrecio2.Text, txtStock.Text, txtDescripcion.Text))
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

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            if (txtCompletos())
            {
                NCelular obj = new NCelular();
                if (obj.Eliminar(txtModelo2.Text, ddlMarca.Text, txtPrecio2.Text, txtStock.Text, txtDescripcion.Text))
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
        protected void gdvCelulares_SelectedIndexChanged(object sender, EventArgs e)
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

        public void CargarDDL_Marca()
        {
            NMarca ObjMarca = new NMarca();
            ddlMarca.DataSource = ObjMarca.Mostrar();
            ddlMarca.DataTextField = "Provincia";
            ddlMarca.DataValueField = "Id";
            ddlMarca.DataBind();
        }

        #endregion
    }
}
