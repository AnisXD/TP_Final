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
                gvwReporte.DataSource = Ventas;
                gvwReporte.DataBind();
                lblTotalRegistros.Text = "Registros encontrados: " + gvwReporte.Rows.Count;

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

                        if (id.Equals("Total Ventas"))
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

                if (cbId.Checked == true && cbFecha.Checked == false)
                {
                    string DNI;
                    string id = ddlId.Text;

                    if (id.Equals("Vendedor"))
                    {
                        DNI = tbId.Text;
                        gvwReporte.DataSource = Obj.MostrarPorVendedor(DNI);
                        gvwReporte.DataBind();
                        lblTotalRegistros.Text = "Registros encontrados: " + gvwReporte.Rows.Count;
                    }

                    if (id.Equals("Cliente"))
                    {
                        DNI = tbId.Text;
                        gvwReporte.DataSource = Obj.MostrarPorCliente(DNI);
                        gvwReporte.DataBind();
                        lblTotalRegistros.Text = "Registros encontrados: " + gvwReporte.Rows.Count;
                    }

                    if (id.Equals("Total Ventas"))
                    {
                        cargarDgv(Obj.Mostrar());
                        lblTotalRegistros.Text = "Registros encontrados: " + gvwReporte.Rows.Count;
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
                    string fecha_inicio = FechaInicio.SelectedDate.ToString("yyyy-MM-dd");
                    string fecha_fin = FechaFin.SelectedDate.ToString("yyyy-MM-dd");

                    if (id.Equals("Vendedor"))
                    {
                        DNI = tbId.Text;
                        gvwReporte.DataSource = Obj.MostrarPorVendedorEntreFechas(DNI, fecha_inicio, fecha_fin);
                        gvwReporte.DataBind();
                        lblTotalRegistros.Text = "Registros encontrados: " + gvwReporte.Rows.Count;
                    }
                    if (id.Equals("Cliente"))
                    {
                        DNI = tbId.Text;
                        gvwReporte.DataSource = Obj.MostrarPorClienteEntreFechas(DNI, fecha_inicio, fecha_fin);
                        gvwReporte.DataBind();
                        lblTotalRegistros.Text = "Registros encontrados: " + gvwReporte.Rows.Count;
                    }

                    if (id.Equals("Total Ventas"))
                    {
                        cargarDgv(Obj.MostrarVentasEntreFechas(fecha_inicio, fecha_fin));
                        lblTotalRegistros.Text = "Registros encontrados: " + gvwReporte.Rows.Count;
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
        
    }
}