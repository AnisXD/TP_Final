using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NMarca;

namespace CapaPresentacion.Empleado
{
    public partial class Marca : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        void limpiarTXT()
        {
            this.txtIdMarca.text = string.Empty;
            this.txtNombre.text = string.Empty;
        }



    }
}