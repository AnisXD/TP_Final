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
            //limpia los txt, carga ddl provincias y solo deja ingresar dni
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            //limpia los txt y vuelve a la pagina anterior
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            //cargar en un objeto usuario los datos de los txt y ddl y enviarlo a NUsuario
        }

        protected void txtDNI_TextChanged(object sender, EventArgs e)
        {
            //validar que solo se ingresen numeros
            //buscar si el dni ingresado esta en la base de datos, 
            //de estar avisar al usuario que ese dni ya esta registrado, 
            //si no esta habilitar los controles para ingresar los datos del nuevo usuario
        }

        protected void ddlFProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            //aca debe cargar el ddl localidades que pertenezcan a la provincia seleccionada
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