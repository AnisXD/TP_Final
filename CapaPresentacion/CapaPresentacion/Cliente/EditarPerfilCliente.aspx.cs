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
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void CargarDDL_Localidad()
        {
            NLocalidad ObjLocalidad = new NLocalidad();

            ddlLocalidad.DataSource = ObjLocalidad.MostrarPorIdProvincia(Convert.ToInt32(ddlProvincia.SelectedValue));
            ddlLocalidad.DataTextField = "Localidad";
            ddlLocalidad.DataValueField = "Id";
            ddlLocalidad.DataBind();
        }

        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarDDL_Localidad();
        }
    }
}