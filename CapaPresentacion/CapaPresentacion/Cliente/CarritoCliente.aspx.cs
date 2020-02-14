using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CapaOperaciones;
using ENTIDADES;

namespace CapaPresentacion.Cliente
{
    public partial class CarritoCliente : System.Web.UI.Page
    {
        public void CargarLbl()
        {
            txtIdVenta.Text = new NVenta().ObtenerIdVenta().ToString();
            txtFecha.Text = System.DateTime.Today.ToString();
            txtLegajo.Text = "MoviCenter";
            //txtDNICliente.Text = this.Session["Usuario"].ToString();//TENGO QUE BUSCAR EN EL SESSION EL DNI 
            lblImporte.Text = "Importe a pagar: $" + "0";//BUSCAR SI HAY CELULARES CARGADOS Y CALCULAR TOTAL
        }
        public void CargarDDL_FormaEnvio()
        {
            NFormaDeEnvio Obj = new NFormaDeEnvio();
            ddlFEnvio.DataSource = Obj.Mostrar();
            ddlFEnvio.DataTextField = "FormadePago";//por un error en a base de datos o devueve asi... no cambiar
            ddlFEnvio.DataValueField = "Id";
            ddlFEnvio.DataBind();
        }

        public void CargarDDL_FormaPago()
        {
            NFormaDePago Obj = new NFormaDePago();
            ddlFPago.DataSource = Obj.Mostrar();
            ddlFPago.DataTextField = "FormadePago";
            ddlFPago.DataValueField = "Id";
            ddlFPago.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            CargarDDL_FormaEnvio();
            CargarDDL_FormaPago();
            CargarLbl();

        }

        protected void bttnAgregarItem_Click(object sender, EventArgs e)
        {

        }

        protected void bttnFinalizarcompra_Click(object sender, EventArgs e)
        {

        }
    }
}