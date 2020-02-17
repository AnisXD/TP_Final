using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ENTIDADES;
using CapaOperaciones;

namespace CapaPresentacion.Empleado
{
    public partial class NuevaVenta : System.Web.UI.Page
    {
        #region Funciones

        public void ActualizarTabla()
        {
            if (this.Session["Carrito"] == null)
            {
                grdLista.DataSource = null;
                grdLista.DataBind();
            }
            //Asocio el gridview al DataTable
            grdLista.DataSource = (DataTable)this.Session["Carrito"];
            grdLista.DataBind();
        }

        public DataTable crearTabla()
        {
            //Creo una tabla que voy a asociar a una variable Session
            DataTable tabla = new DataTable();
            DataColumn columna;

            columna = new DataColumn("MODELO", System.Type.GetType("System.String"));
            tabla.Columns.Add(columna);
            columna = new DataColumn("PRECIO_UNITARIO", System.Type.GetType("System.String"));
            tabla.Columns.Add(columna);
            columna = new DataColumn("CANTIDAD", System.Type.GetType("System.String"));
            tabla.Columns.Add(columna);

            return tabla;
        }

        public void AgregarFila(DataTable Carrito)
        {
            int band = 0;

            DataRow dr = Carrito.NewRow();

            String MODELO = ddlModelo.SelectedItem.Text;
            String PRECIO_UNITARIO = lblPrecio.Text;// el lbl precio se carga a seeccionar un modelo en el ddl

            foreach (DataRow row in Carrito.Rows)
            {
                if (row["MODELO"].ToString() == MODELO)
                {
                    row.SetField("CANTIDAD", Convert.ToInt32(row["CANTIDAD"]) + Convert.ToInt32(ddlCantidad.Text));
                    band = 1;
                }
            }
            //AGREGA FILA
            if (band == 0)
            {
                dr["MODELO"] = MODELO;
                dr["PRECIO_UNITARIO"] = PRECIO_UNITARIO;
                dr["CANTIDAD"] = ddlCantidad.Text;

                Carrito.Rows.Add(dr);
            }

        }

        public void ActualizarTotal()
        {
            if (this.Session["Carrito"] != null)
            {
                DataTable Carrito = (DataTable)this.Session["Carrito"];

                float Monto_Total = 0;

                foreach (DataRow row in Carrito.Rows)
                {
                    int Cantidad = int.Parse(row["CANTIDAD"].ToString());
                    float Precio_Unitario = float.Parse(row["PRECIO_UNITARIO"].ToString());

                    Monto_Total += Cantidad * Precio_Unitario;
                }

                lblImporte.Text = Monto_Total.ToString();
            }
        }

        public void CargarLbl()
        {
            txtIdVenta.Text = new NVenta().ObtenerIdVenta().ToString();
            txtFecha.Text = System.DateTime.Today.ToShortDateString();
            txtLegajo.Text = this.Session["Usuario"].ToString();//TENGO QUE BUSCAR EN EL SESSION EL DNI del vendedor
            txtDniCliente.Text = " "; //
            lblImporte.Text = "0";//BUSCAR SI HAY CELULARES CARGADOS Y CALCULAR TOTAL
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
        public void CargarDDL_Modelo()
        {
            NCelular Obj = new NCelular();
            ddlModelo.DataSource = Obj.Mostrar();
            ddlModelo.DataTextField = "Modelo";
            ddlModelo.DataValueField = "Precio";
            ddlModelo.DataBind();
        }
        private void CargarDdlCantidad(int Max)
        {
            int i;
            ddlCantidad.Items.Clear();
            for (i = 1; i <= Max; i++)
            {
                ddlCantidad.Items.Add(i.ToString());
            }
        }
        private void BuscarModeloEnDdl(string modelo)
        {
            foreach (ListItem Item in ddlModelo.Items)
            {
                if (Item.Text == modelo)
                    ddlModelo.SelectedIndex = ddlModelo.Items.IndexOf(Item);
            }
        }
        public bool ExisteDNI(string dni)
        {
            bool existe = false;
            DataTable dt = new DataTable();
            NUsuario obj = new NUsuario();
            dt = obj.BuscarUsuarioPorDNI(dni, 'C');
            if (dt == null)
            {
                lblRespuesta.Text = "El DNI ingresado no esta registrado como cliente";
            }
            else
            {
                if (dt.Rows.Count == 1 && dni.Length > 0)
                {
                    existe = true;
                    lblRespuesta.Text = "El DNI ingresado ya es cliente";
                }
            }

            return existe;
        }

        #endregion

        #region Eventos

        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Session["Usuario"] == null)
            {// si no esta registrdo como usuario va al login
                Response.Redirect("~/Usuario/LogIn.aspx");
            }
            else
            {
                if (!this.IsPostBack)
                {
                    CargarDDL_FormaEnvio();
                    CargarDDL_FormaPago();
                    CargarDDL_Modelo();
                    CargarLbl();
                    if (this.Session["Modelo"] != null)
                    {
                        BuscarModeloEnDdl(this.Session["Modelo"].ToString());
                        lblPrecio.Text = ddlModelo.SelectedItem.Value;
                        int stock = new NCelular().ObtenerStock(ddlModelo.SelectedItem.Text);
                        CargarDdlCantidad(stock);
                    }
                }

                ActualizarTotal();
                ActualizarTabla();
            }

        }

        protected void txtDniCliente_TextChanged(object sender, EventArgs e)
        {
            NUsuario Obj = new NUsuario();
            DataTable table = Obj.BuscarPorDNI(txtDniCliente.Text);
            
            if(ExisteDNI(txtDniCliente.Text))
            {

            }
        }

        protected void btnAgregarCliente_Click(object sender, EventArgs e)
        {

        }

        protected void ddlModelo_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnAnadir_Click(object sender, EventArgs e)
        {

        }

        protected void grdLista_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void grdLista_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {

        }

        protected void bttnFinalizarcompra_Click(object sender, EventArgs e)
        {

        }

        protected void bttnCancelarCompra_Click(object sender, EventArgs e)
        {

        }

        protected void grdLista_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void grdLista_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void grdLista_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void grdLista_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

        }


        #endregion
    }
}