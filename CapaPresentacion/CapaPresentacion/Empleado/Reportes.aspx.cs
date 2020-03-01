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
    public partial class Reportes : System.Web.UI.Page
    {
        private void cargarDgv(DataTable Ventas)
        {
            lblTotal.Visible = true;
            gvwReporte.DataSource = Ventas;
            gvwReporte.DataBind();
            lblTotalRegistros.Text = "Registros encontrados: " + gvwReporte.Rows.Count;
            float sumatoria = Sumatotal(Ventas, "Total");
            lblTotal.Text = "Total Recaudado: $ " + Convert.ToString(sumatoria);

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                lblTotal.Visible = true;
                cargarDgv(new NVenta().Mostrar());
                tbId.Visible = false;
                ddlMM.Visible = false;
                CargarDDL_Modelo();
                CargarDDL_Marcas();
            }
        }
        private void CargarDDL_Marcas()
        {
            NMarca Obj = new NMarca();
            ddlMM.Items.Clear();
            ddlMM.DataSource = Obj.Mostrar();
            ddlMM.DataTextField = "Marca";
            ddlMM.DataValueField = "Id";
            ddlMM.DataBind();
        }
        private void CargarDDL_Modelo()
        {
            NCelular Obj = new NCelular();
            ddlMM.Items.Clear();
            ddlMM.DataSource = Obj.Mostrar();
            ddlMM.DataTextField = "Modelo";
            ddlMM.DataValueField = "Modelo";
            ddlMM.DataBind();
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
                        ddlMM.Visible = false;
                    }

                    if (id.Equals("Marca")) 
                    {
                        tbId.Text = "";
                        tbId.Visible = false;
                        ddlMM.Visible = true;
                        CargarDDL_Marcas();
                    }

                    if (id.Equals("Modelo"))
                    {
                        tbId.Text = "";
                        tbId.Visible = false;
                        ddlMM.Visible = true;
                        CargarDDL_Modelo();
                    }

                    if (id.Equals("Total Ventas"))
                    {
                        tbId.Visible = false;
                        ddlMM.Visible = false;
                    }
                }
            }
        }


        protected void bttnAceptar_Click(object sender, EventArgs e)
        {
            NVenta Obj = new NVenta();

            lblTotalRegistros.Text = "";
            float sumatoria;
            lblTotal.Visible = true;
            lblTotal.Text = "";

            if (cbId.Checked == true && cbFecha.Checked == false)
            {
                string DNI;
                string id = ddlId.Text;

                if (id.Equals("Vendedor"))
                {
                    DNI = tbId.Text;
                    cargarDgv( Obj.MostrarPorVendedor(DNI));
                    gvwReporte.DataBind();
                    lblTotalRegistros.Text = "Registros encontrados: " + gvwReporte.Rows.Count;
                    sumatoria = Sumatotal(Obj.MostrarPorVendedor(DNI), "Total");
                    lblTotal.Text = "Total Recaudado: $" + Convert.ToString(sumatoria);
                }

                if (id.Equals("Cliente")) 
                { 
                    DNI = tbId.Text;
                    cargarDgv(Obj.MostrarPorCliente(DNI));
                    lblTotalRegistros.Text = "Registros encontrados: " + gvwReporte.Rows.Count;
                    sumatoria = Sumatotal(Obj.MostrarPorCliente(DNI), "Total");
                    lblTotal.Text = "Total Recaudado: $" + Convert.ToString(sumatoria);
                }
                if (id.Equals("Modelo"))
                {
                    cargarDgv(Obj.MostrarPorModelo(ddlMM.SelectedValue));
                    lblTotalRegistros.Text = "Registros encontrados: " + gvwReporte.Rows.Count;
                    sumatoria = Sumatotal(Obj.MostrarPorModelo(ddlMM.SelectedValue), "Total");
                    lblTotal.Text = "Total Recaudado: $" + Convert.ToString(sumatoria);
                    //  CargarDDL_Modelo();
                }

                if (id.Equals("Marca"))
                {
                    cargarDgv(Obj.MostrarPorMarca(ddlMM.SelectedValue));
                    lblTotalRegistros.Text = "Registros encontrados: " + gvwReporte.Rows.Count;
                    sumatoria = Sumatotal(Obj.MostrarPorMarca(ddlMM.SelectedValue), "Total");
                    lblTotal.Text = "Total Recaudado: $" + Convert.ToString(sumatoria);
                    // CargarDDL_Marcas();
                }

                if (id.Equals("Total Ventas"))
                {
                    cargarDgv(Obj.Mostrar());
                    lblTotalRegistros.Text = "Registros encontrados: " + gvwReporte.Rows.Count;
                    sumatoria = Sumatotal(Obj.Mostrar(), "Total");
                    lblTotal.Text = "Total Recaudado: $" + Convert.ToString(sumatoria);
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
                    lblTotalRegistros.Text = "Registros encontrados: " + gvwReporte.Rows.Count;
                    sumatoria = Sumatotal(Obj.MostrarPorVendedorEntreFechas(DNI, fecha_inicio, fecha_fin), "Total");
                    lblTotal.Text = "Total Recaudado: $" + Convert.ToString(sumatoria);
                }
                if (id.Equals("Cliente"))
                {
                    DNI = tbId.Text;
                    cargarDgv(Obj.MostrarPorClienteEntreFechas(DNI, fecha_inicio, fecha_fin));
                    lblTotalRegistros.Text = "Registros encontrados: " + gvwReporte.Rows.Count;
                    sumatoria = Sumatotal(Obj.MostrarPorClienteEntreFechas(DNI, fecha_inicio, fecha_fin), "Total");
                    lblTotal.Text = "Total Recaudado: $" + Convert.ToString(sumatoria);
                }

                if (id.Equals("Modelo"))
                {
                    cargarDgv(Obj.MostrarPorModeloEntreFechas(ddlMM.SelectedValue, fecha_inicio, fecha_fin));
                    lblTotalRegistros.Text = "Registros encontrados: " + gvwReporte.Rows.Count;
                    sumatoria = Sumatotal(Obj.MostrarPorModeloEntreFechas(ddlMM.SelectedValue, fecha_inicio, fecha_fin), "Total");
                    lblTotal.Text = "Total Recaudado: $" + Convert.ToString(sumatoria);
                    
                }

                if (id.Equals("Marca"))
                {
                    cargarDgv(Obj.MostrarPorMarcaEntreFechas(ddlMM.SelectedValue, fecha_inicio, fecha_fin));
                    lblTotalRegistros.Text = "Registros encontrados: " + gvwReporte.Rows.Count;
                    sumatoria = Sumatotal(Obj.MostrarPorMarcaEntreFechas(ddlMM.SelectedValue, fecha_inicio, fecha_fin), "Total");
                    lblTotal.Text = "Total Recaudado: $" + Convert.ToString(sumatoria);
                    
                }

                if (id.Equals("Total Ventas"))
                {
                    cargarDgv(Obj.MostrarVentasEntreFechas(fecha_inicio, fecha_fin));
                    lblTotalRegistros.Text = "Registros encontrados: " + gvwReporte.Rows.Count;
                    sumatoria = Sumatotal(Obj.MostrarVentasEntreFechas(fecha_inicio, fecha_fin), "Total");
                    lblTotal.Text = "Total Recaudado: $" + Convert.ToString(sumatoria);
                }
            }
        }
        private float Sumatotal(DataTable table, string NombreColumna)
        {
            float sumatoria = 0;

            foreach (DataRow row in table.Rows)
            {
                sumatoria += float.Parse(row[NombreColumna].ToString());
            }
            return sumatoria;
        }

        protected void bttnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Empleado/Reportes.aspx");
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