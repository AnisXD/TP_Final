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
            if(!IsPostBack)
            {
                if(this.Session["Modelo"]!=null)
                {
                    lblRespuesta.Text = "Atencion: Para poder realizar la compra primero debe loguerse con su cuenta o registrarse como usuario.";
                }
            }
            
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            NUsuario ObjNUsuario = new NUsuario();

            bool Ingreso;
            string PermisoUsuario;

            string Usuario = txtUsuario.Text.ToString();
            string Contraseña = txtClave.Text.ToString();

            Ingreso = ObjNUsuario.ExisteUsuario(Usuario, Contraseña);

            if (Ingreso == true)
            {
                DataTable dt = ObjNUsuario.RolUsuario(Usuario);
                DataRow dr = dt.Rows[0];
                PermisoUsuario = dr["ID_ROL"].ToString();

                switch (PermisoUsuario)
                {
                    case "C":
                        txtUsuario.Text = ""; txtClave.Text = "";
                        this.Session["Usuario"] = Usuario;
                        if (this.Session["Modelo"] != null)
                        {
                            Response.Redirect("~/Cliente/CarritoCliente.aspx");
                        }
                        Response.Redirect("~/Cliente/InicioCliente.aspx");
                    break;
                    case "E":
                        txtUsuario.Text = ""; txtClave.Text = "";
                        this.Session["Usuario"] = Usuario;
                        Response.Redirect("~/Empleado/InicioEmpleado.aspx");

                        break;
                    case "A":
                        txtUsuario.Text = ""; txtClave.Text = "";
                        this.Session["Usuario"] = Usuario;
                        Response.Redirect("~/Empleado/InicioEmpleado.aspx");
                        break;
                }
            }
            else
            {
                txtUsuario.Text = ""; txtClave.Text = "";
                lblRespuesta.Text = "Usuario Inexistente o Contraseña Incorrecta." +
                    " En caso de no recordar algun dato, por favor pongase en contacto con nuestra area de soporte soporte@movicenter.com.ar";
            }
        }
    }
}