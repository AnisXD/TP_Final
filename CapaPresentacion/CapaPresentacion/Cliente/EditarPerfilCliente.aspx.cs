using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CapaOperaciones;
using ENTIDADES;

namespace CapaPresentacion.Cliente
{
    public partial class PerfilCliente : System.Web.UI.Page
    {
        public void limpiarTxt()
        {
            this.txbDNI.Text = string.Empty;
            this.txbApellido.Text = string.Empty;
            this.txbNombre.Text = string.Empty;
            this.txbDireccion.Text = string.Empty;
            this.txbTelefono.Text = string.Empty;
            this.lblEstado.Text = string.Empty;
        }
        public bool ExisteDNI(string dni)
        {
            bool existe = false;
            DataTable dt = new DataTable();
            NUsuario obj = new NUsuario();
            dt = obj.BuscarPorDNI(dni);
            if (dt == null)
            {
                lblEstado.Text = "El DNI ingresado no esta en la base de datos";
            }
            else
            {
                if (dt.Rows.Count == 1 && dni.Length > 0)
                {
                    existe = true;
                    lblEstado.Text = "El DNI ingresado ya esta en la base de datos";
                }
            }

            return existe;
        }
        public void CargarDDL_Localidad()
        {
            NLocalidad ObjLocalidad = new NLocalidad();

            ddlLocalidad.DataSource = ObjLocalidad.MostrarPorIdProvincia(Convert.ToInt32(ddlProvincia.SelectedValue));
            ddlLocalidad.DataTextField = "Localidad";
            ddlLocalidad.DataValueField = "Id";
            ddlLocalidad.DataBind();
        }

        public void CargarDDL_Provincia()
        {
            NProvincia ObjProvincia = new NProvincia();
            ddlProvincia.DataSource = ObjProvincia.Mostrar();
            ddlProvincia.DataTextField = "Provincia";
            ddlProvincia.DataValueField = "Id";
            ddlProvincia.DataBind();
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                CargarDDL_Provincia();
                CargarDDL_Localidad();
                limpiarTxt();
            }

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            limpiarTxt();
            Response.Redirect("/Cliente/InicioCliente.aspx");
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {

            NUsuario Obj = new NUsuario();
            if (Obj.Insertar(txbDNI.Text, txbNombre.Text, txbApellido.Text, txbTelefono.Text, Convert.ToInt32(ddlProvincia.SelectedItem.Value), Convert.ToInt32(ddlLocalidad.SelectedItem.Value), txbDireccion.Text, txbClave.Text, 'C'))
            {
                limpiarTxt();
                lblEstado.Text = "El registro se insertó con exito";
                Response.Redirect("/Cliente/EditarPerfilCliente.aspx");
            }
            else
            {
                lblEstado.Text = "El registro no se pudo insertar";
            }

        }
        protected void txbDNI_TextChanged(object sender, EventArgs e)
        {
            lblEstado.Text = "txtDNI se modifico";
            if (txbDNI.Text.Trim().Length == 0)
            {
                btnAceptar.Enabled = false;
                btnCancelar.Enabled = false;
                lblEstado.Text = "txtID esta vacio";
            }
            else
            {
                if (ExisteDNI(txbDNI.Text.ToString()))
                {
                    btnAceptar.Enabled = false;
                    btnCancelar.Enabled = false;
                    //lblEstado.Text = "El DNI ingresado ya fue registrado";
                }
                else
                {
                    btnAceptar.Enabled = true;
                    btnCancelar.Enabled = true;
                    lblEstado.Text = "El DNI ingresado no esta registrado como usuario";
                }
            }
        }

        protected void ddlFProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarDDL_Localidad();
        }
    }
}
