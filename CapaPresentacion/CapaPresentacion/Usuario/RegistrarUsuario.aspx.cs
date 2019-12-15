using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace CapaPresentacion.Usuario
{
    public partial class RegristrarUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            Usuario usu = new Usuario();
            GestionUsuario gusuario = new GestionUsuario();

            bool Ingreso = false;

            usu.DNI = txbDNI.Text.ToString();

            Ingreso = gusuario.DNIRegistrado(usu);

            if (Ingreso == false)
            {
                usu.Apellido = txbApellido.Text;
                usu.Nombre = txbNombre.Text;
                usu.Telefono = txbTelefono.Text;
                usu.Email = txbEmail.Text;
                usu.Contraseña = txbContraseña.Text;
                usu.ID_ROL = '1';
                usu.Estado = true;

                gusuario.InsertarUsuario(usu);

                txbDNI.Text = "";
                txbApellido.Text = "";
                txbNombre.Text = "";
                txbTelefono.Text = "";
                txbEmail.Text = "";
                txbClave.Text = "";
                txbClaveAgain.Text = "";

                lblRespuesta.Text = "Se registro correctamente. Recuerde su DNI y Contraseña para poder loguearse.";
            }
            else
            {
                lblRespuesta.Text = "El Usuario ya se encuentra registrado.";
            }
        }
    }
}