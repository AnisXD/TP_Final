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
            gvwReporte.DataSource = Ventas;
            gvwReporte.DataBind();
            lblTotalRegistros.Text = "Registros encontrados: " + gvwReporte.Rows.Count;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                cargarDgv(new NVenta().Mostrar());
                tbId.Visible = false;
                ddlMM.Visible = false;
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

                    if (id.Equals("Total Venta"))
                    {
                        Response.Redirect("/Empleado/Reportes.aspx");
                        tbId.Text = "";
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
                if (id.Equals("Modelo"))
                {
                    cargarDgv(Obj.MostrarPorModelo(ddlMM.SelectedValue));
                    CargarDDL_Modelo();
                }

                if (id.Equals("Marca"))
                {
                    cargarDgv(Obj.MostrarPorMarca(ddlMM.SelectedValue));
                    CargarDDL_Marcas();
                }
            }
            else if (cbId.Checked == false)
            {
                lblTotalRegistros.Text = "SELECCIONE COMO MINIMO UN FILTRO DE ID.";
            }
            else
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
                if (id.Equals("Modelo"))
                {
                    cargarDgv(Obj.MostrarPorModeloEntreFechas(ddlMM.SelectedValue, fecha_inicio, fecha_fin));
                    CargarDDL_Modelo();
                }
                if (id.Equals("Marca"))
                {
                    cargarDgv(Obj.MostrarPorMarcaEntreFechas(ddlMM.SelectedValue, fecha_inicio, fecha_fin));
                    CargarDDL_Marcas();
                }
            }
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