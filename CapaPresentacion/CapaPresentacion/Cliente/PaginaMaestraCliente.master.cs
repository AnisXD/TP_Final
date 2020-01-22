using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CapaPresentacion.Cliente
{
    public partial class PaginaMaestraCliente : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btCerrarSesion_Click(object sender, EventArgs e)
        {
            this.Session["Usuario"] = null;

            if (Request.RawUrl != "/InicioUsuario.aspx")
            {
                Response.Redirect("/InicioUsuario.aspx");
            }
        }
    }
}