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
    public partial class Ventas : System.Web.UI.Page
    {

            private void cargarDgv(DataTable Ventas)
            {
                lblTotal.Visible = true;
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
                    lblTotal.Visible = true;
                    cargarDgv(new NVenta().Mostrar());
                    tbId.Visible = false;
                }
            }

            protected void ddlId_SelectedIndexChanged(object sender, EventArgs e)
            {
                {
                    if (cbId.Checked)
                    {
                        string id = ddlId.Text;
                        if (id.Equals("Vendedor") || id.Equals("Cliente"))
                        {
                            tbId.Visible = true;
                        }

                        if (id.Equals("Todas"))
                        {
                            tbId.Visible = false;
                        }
                    }
                }
            }


            protected void bttnAceptar_Click(object sender, EventArgs e)
            {
                NVenta Obj = new NVenta();

                lblTotalRegistros.Text = "";
                lblTotal.Text = "Seleccione una venta para ver su Detalle ";
                cargarGvwDetalle(null);

                if (cbId.Checked == true && cbFecha.Checked == false)
                {
                    string DNI;
                    string id = ddlId.Text;

                    if (id.Equals("Cliente"))
                    {
                        DNI = tbId.Text;
                        cargarDgv(Obj.MostrarPorCliente(DNI));
                    }
                    if (id.Equals("Vendedor"))
                    {
                        DNI = tbId.Text;
                        cargarDgv(Obj.MostrarPorVendedor(DNI));
                    }
                    if (id.Equals("Mis Ventas"))
                    {
                         cargarDgv(Obj.MostrarPorVendedor(this.Session["Usuario"].ToString()));
                    }
                    if (id.Equals("Todas"))
                    {
                        cargarDgv(Obj.Mostrar());
                    }
                }
                else if (cbId.Checked == false)
                {
                    lblTotalRegistros.Text = "Seleccione como minimo un ID.";
                    lblTotal.Visible = false;
                }

                if (cbId.Checked == true && cbFecha.Checked == true)
                {
                    string DNI;
                    string id = ddlId.Text;
                    string fecha_inicio = TxtFechaInicio.Text;
                    string fecha_fin = TxtFechaFin.Text;

                    if (id.Equals("Vendedor"))
                    {
                        DNI = tbId.Text;
                        cargarDgv(Obj.MostrarPorVendedorEntreFechas(DNI, fecha_inicio, fecha_fin));
                        
                    }
                    if (id.Equals("Cliente"))
                    {
                        DNI = tbId.Text;
                        cargarDgv(Obj.MostrarPorClienteEntreFechas(DNI, fecha_inicio, fecha_fin));
                    }
                    if (id.Equals("Mis Ventas"))
                    {
                        cargarDgv(Obj.MostrarPorVendedorEntreFechas(this.Session["Usuario"].ToString(), fecha_inicio, fecha_fin));
                    }
                    if (id.Equals("Todas"))
                    {
                        cargarDgv(Obj.MostrarVentasEntreFechas(fecha_inicio, fecha_fin));
                    }
                }
            }

            protected void bttnCancelar_Click(object sender, EventArgs e)
            {
                Response.Redirect("/Empleado/Ventas.aspx");
            }

            protected void cbFecha_CheckedChanged(object sender, EventArgs e)
            {
                if (cbId.Checked == false)
                {
                    cbId.Checked = true;
                }
                else if (cbId.Checked == true)
                {
                    cbId.Checked = true;
                }
                else
                {
                    cbId.Checked = false;
                }
            }

            protected void cbId_CheckedChanged(object sender, EventArgs e)
            {
                if (cbFecha.Checked == false)
                {
                    cbFecha.Checked = false;
                }
                else if (cbFecha.Checked == true)
                {
                    cbFecha.Checked = false;
                }
                else
                {
                    cbFecha.Checked = false;
                }
            }

        protected void gvwVenta_SelectedIndexChanged(object sender, EventArgs e)
        {
            NVenta Obj = new NVenta();
            string id= gvwVenta.SelectedRow.Cells[1].Text;
            lblTotal.Text = "Detalle de venta: " + id;
            int idvta = Convert.ToInt32(id);
            cargarGvwDetalle(Obj.MostrarDetalle(idvta));
        }
    }
}