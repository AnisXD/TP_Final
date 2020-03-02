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

namespace CapaPresentacion.Cliente
{

    public partial class MisCompras : System.Web.UI.Page
    {
        private void cargarDgv(DataTable Ventas)
        {
            gvwCompra.DataSource = Ventas;
            gvwCompra.DataBind();
            lblTotalRegistros.Text = "Registros encontrados: " + gvwCompra.Rows.Count;

        }

        private void cargarGvwDetalle(DataTable Detalle)
        {
            lblDetalle.Visible = true;
            gvwDetalle.DataSource = Detalle;
            gvwDetalle.DataBind();
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                if (this.Session["Usuario"] != null)
                {
                    cargarDgv(new NVenta().MostrarPorCliente(this.Session["Usuario"].ToString()));
                    lblDetalle.Text = "Seleccione una compra para ver su Detalle ";
                    cargarGvwDetalle(null);
                }

            }
        }

        protected void gvwCompra_SelectedIndexChanged(object sender, EventArgs e)
        {
            NVenta Obj = new NVenta();
            string id = gvwCompra.SelectedRow.Cells[1].Text;
            lblDetalle.Text = "Detalle de compra: " + id;
            int idvta = Convert.ToInt32(id);
            cargarGvwDetalle(Obj.MostrarDetalle(idvta));
        }
    }
}