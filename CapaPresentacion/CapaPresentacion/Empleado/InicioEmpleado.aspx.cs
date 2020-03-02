using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using CapaOperaciones;
using ENTIDADES;
namespace CapaPresentacion.Empleado
{
    public partial class InicioEmpleado : System.Web.UI.Page
    {
        private void cargarDgv(DataTable Ventas)
        {
            gvwVenta.DataSource = Ventas;
            gvwVenta.DataBind();
            lblTotalRegistros.Text = "Registros encontrados: " + gvwVenta.Rows.Count;

        }

        private void cargarGvwDetalle(DataTable Detalle)
        {
            lblTotal.Visible = true;
            gvwDetalle.DataSource = Detalle;
            gvwDetalle.DataBind();
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                if(this.Session["Usuario"]!=null)
                {
                    cargarDgv(new NVenta().MostrarPorVendedor(this.Session["Usuario"].ToString()));
                    lblTotal.Text = "Seleccione una venta para ver su Detalle ";
                    cargarGvwDetalle(null);
                }
                
            }
        }

        protected void gvwVenta_SelectedIndexChanged(object sender, EventArgs e)
        {
            NVenta Obj = new NVenta();
            string id = gvwVenta.SelectedRow.Cells[1].Text;
            lblTotal.Text = "Detalle de venta: " + id;
            int idvta = Convert.ToInt32(id);
            cargarGvwDetalle(Obj.MostrarDetalle(idvta));
        }
    }
}