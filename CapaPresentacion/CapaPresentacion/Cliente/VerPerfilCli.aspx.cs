using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CapaPresentacion.Cliente
{
    public partial class VerPerfilCli : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lbVerdatos_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Cliente/EditarPerfilCliente.aspx");
        }

        protected void lbCambiarcontra_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Usuario/CambioDeClave.aspx");
        }
    }
}