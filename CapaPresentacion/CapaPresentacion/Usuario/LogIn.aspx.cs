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
    public partial class LogIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            NUsuario ObjNUsuario = new NUsuario();

            bool Ingreso = false;
            string PermisoUsuario;
            //bool CuentaActiva = false;

            string Usuario = txtUsuario.Text.ToString();
            string Contraseña = txtClave.Text.ToString();

            Ingreso = ObjNUsuario.ExisteUsuario(Usuario,Contraseña);
            //CuentaActiva = ObjNUsuario.CuentaActivada(Usuario);

            if (Ingreso == true /*&& CuentaActiva == true*/)
            {
                DataTable dt = ObjNUsuario.RolUsuario(Usuario);
                DataRow dr = dt.Rows[1];
                PermisoUsuario = dr["ID_ROL"].ToString();

                //if (PermisoUsuario == false)
                //{
                //    DataTable dt = gusuario.ObtenerNombreUsuario(usu);
                //    DataRow dr = dt.Rows[0];
                //    txbDNI.Text = dr["Nombre"].ToString();

                //    this.Session["Usuario"] = usu.DNI;
                //    Response.Redirect(Request.RawUrl);
                //}
                //else
                //{
                //    DataTable dt = gusuario.ObtenerNombreUsuario(usu);
                //    DataRow dr = dt.Rows[0];
                //    txbDNI.Text = dr["Nombre"].ToString();

                //    this.Session["Usuario"] = usu.DNI;
                //    Response.Redirect("/Administrador.aspx");
                //}

                switch(PermisoUsuario)
                {
                    case "C":
                        txtUsuario.Text = ""; txtClave.Text = "";
                        lblRespuesta.Text = dr["ROL"].ToString();
                        break;
                    case "E":
                        txtUsuario.Text = ""; txtClave.Text = "";
                        lblRespuesta.Text = dr["ROL"].ToString();
                        break;
                    case "A":
                        txtUsuario.Text = ""; txtClave.Text = "";
                        lblRespuesta.Text = dr["ROL"].ToString();
                        break;
                }
            }
            else
            {
                txtUsuario.Text = ""; txtClave.Text = "";
                //lblRespuesta.Text = "Usuario Inexistente o Contraseña Incorrecta.";
                //lblRespuesta.Text = Ingreso.ToString();
            }

            /*ORIGINALMENTE ESTABA ESTO SOLO*/
            //Response.Redirect("/Usuario/InicioUsuario.aspx");
        }

        protected void txtUsuario_TextChanged(object sender, EventArgs e)
        {
           

        }
    }
}