using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CapaOperaciones;
using ENTIDADES;

namespace CapaPresentacion.Usuario
{
    public partial class RegristrarUsuario : System.Web.UI.Page
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
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;

            NLocalidad ObjLocalidad = new NLocalidad();

            ddlFLocalidad.DataTextField = "desc_localidad";
            ddlFLocalidad.DataValueField = "cod_postal";
            ddlFLocalidad.DataSource = ObjLocalidad.Mostrar();
            ddlFLocalidad.DataBind();
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            txbApellido.Text = string.Empty;
            txbClave.Text = string.Empty;
            txbNombre.Text = string.Empty;
            txbDireccion.Text = string.Empty;
            txbDNI.Text = string.Empty;
            txbRepitaClave.Text = string.Empty;
            txbTelefono.Text = string.Empty;
            Response.Redirect("/Usuario/InicioUsuario.aspx");
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {

            NUsuario Obj = new NUsuario();
            if (Obj.Insertar(txbDNI.Text, txbApellido.Text, txbNombre.Text, Convert.ToInt32(ddlFProvincia.SelectedValue), Convert.ToInt32(ddlFLocalidad.SelectedValue), txbDireccion.Text, txbTelefono.Text, txbClave.Text))
            {
                limpiarTxt();
                lblEstado.Text = "El registro se insertó con exito";
            }
            else
            {
                lblEstado.Text = "El registro no se pudo insertar";
            }

        }
    }
}