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
    public partial class PaginaMaestraCliente : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Session["Usuario"] != null)
            {
                NUsuario ObjNUsuario = new NUsuario();
                string NombreUsuario;
                string ApellidoUsuario;
                string Usuario = this.Session["Usuario"].ToString();

                DataTable dt = ObjNUsuario.NombreUsuario(Usuario);
                DataRow dr = dt.Rows[0];
                NombreUsuario = dr["Nombre"].ToString();
                ApellidoUsuario = dr["Apellido"].ToString();

                lblUsuario.Text = NombreUsuario + ", " + ApellidoUsuario;
            }
        }

        protected void btCerrarSesion_Click(object sender, EventArgs e)
        {
            this.Session["Usuario"] = null;

            if (Request.RawUrl != "/InicioUsuario.aspx")
            {
                Response.Redirect("~/Usuario/InicioUsuario.aspx");
            }
        }
    }
}