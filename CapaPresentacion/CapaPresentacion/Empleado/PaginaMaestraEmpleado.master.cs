using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CapaOperaciones;
using ENTIDADES;

namespace CapaPresentacion.Empleado
{
    public partial class PaginaMaestraEmpleado : System.Web.UI.MasterPage
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

                lblUsuario.Text = NombreUsuario + " " + ApellidoUsuario;

                string PermisoUsuario;

                    DataTable dtt = ObjNUsuario.RolUsuario(Usuario);
                    DataRow drr = dtt.Rows[0];
                    PermisoUsuario = drr["ID_ROL"].ToString();

                    switch (PermisoUsuario)
                    {
                            case "E":
                            Empleados.Visible = false;
                            Reportes.Visible = false;
                            Ventas.Visible = false;

                            break;
                            case "A":
                            Empleados.Visible = true;
                            Reportes.Visible = true;
                            Ventas.Visible = true;
                            break;
                    }
            }
            else
            {
                Response.Redirect("~/Usuario/LogIn.aspx");
            }

            LinkButton ctrl = this.Master.FindControl("LiEmpleado") as LinkButton;

            if (ctrl != null)
            {
                ctrl.Enabled = false;
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

        protected void Inicio_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Empleado/InicioEmpleado.aspx");
        }

        protected void Ventas_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Empleado/Ventas.aspx");
        }

        protected void Celulares_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Empleado/Celulares.aspx");
        }

        protected void Marcas_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Empleado/Marca.aspx");
        }

        protected void Clientes_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Empleado/Clientes.aspx");
        }

        protected void Empleados_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Empleado/Empleados.aspx");
        }

        protected void Carrito_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Empleado/CarritoEmpleado.aspx");
        }

        protected void Reportes_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Empleado/Reportes.aspx");
        }
    }
}