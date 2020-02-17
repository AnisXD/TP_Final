using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ENTIDADES;
using CapaOperaciones;

namespace CapaPresentacion.Cliente
{
    public partial class CarritoCliente : System.Web.UI.Page
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
            txtLegajo.Text = "MoviCenter"; // al ser una compra online que hace el cliente no se carga vendedor
            txtDNICliente.Text = this.Session["Usuario"].ToString();//TENGO QUE BUSCAR EN EL SESSION EL DNI 
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

        protected void bttnFinalizarcompra_Click(object sender, EventArgs e)
        {
            if (this.Session["Carrito"] != null)
            {
                NVenta nVenta = new NVenta();

                List<DetallesVentas> ListDetalles = new List<DetallesVentas>();

                DataTable Carrito = (DataTable)this.Session["Carrito"];

                foreach (DataRow row in Carrito.Rows)
                {
                    string Modelo = row["MODELO"].ToString();
                    int Cantidad = int.Parse(row["CANTIDAD"].ToString());
                    float Precio_Unitario = float.Parse(row["PRECIO_UNITARIO"].ToString());
                    ListDetalles.Add(nVenta.CargarDetalle(Modelo, Cantidad, Precio_Unitario));
                }

                if (nVenta.Confirmar(txtLegajo.Text, txtDNICliente.Text, char.Parse(ddlFEnvio.SelectedItem.Value), char.Parse(ddlFPago.SelectedItem.Value), float.Parse(lblImporte.Text), ListDetalles))
                {
                    lblRespuesta.Text = "Su compra fue confirmada, puede ver el Detalle de su compra en la seccion 'MIS COMPRAS'.";
                    this.Session["Carrito"] = null;
                    ActualizarTabla();
                    ActualizarTotal();
                    txtIdVenta.Text = new NVenta().ObtenerIdVenta().ToString();
                }
                else
                {
                    lblRespuesta.Text = "Hubo un error al ingresar la venta";
                }
            }
            else
            {
                lblRespuesta.Text = "Debe ingresar Celulares al carrito para confirmar la comppra.";
            }
        }

        protected void btnAnadir_Click(object sender, EventArgs e)
        {
            if (this.Session["Carrito"] == null)//chequemos si carrito tiene datos
            {
                this.Session["Carrito"] = crearTabla();//Si esta vacio creo una tabla
            }
            //si carrito ya tiene la tabla le agrego modelo, cantidad y precio
            AgregarFila((DataTable)(this.Session["Carrito"]));
            //actulizo lbl total 
            ActualizarTotal();
            //
            ActualizarTabla();

            if (this.Session["Modelo"] != null)
            {
                this.Session["Modelo"] = null;
            }
        }

        protected void ddlModelo_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Cargar lblPrecio
            lblPrecio.Text = ddlModelo.SelectedItem.Value;
            //cargar ddlCantidad
            int stock = new NCelular().ObtenerStock(ddlModelo.SelectedItem.Text);
            CargarDdlCantidad(stock);
        }

        protected void grdLista_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (this.Session["Carrito"] == null)
            {
                this.Session["Carrito"] = crearTabla();
            }

            if (e.CommandName == "Select")
            {
                DataTable Carrito = (DataTable)this.Session["Carrito"];

                int pos = int.Parse(e.CommandArgument.ToString());

                Carrito.Rows.RemoveAt(pos);

                if (Carrito.Rows.Count == 0)
                    Carrito = null;

                ActualizarTotal();

                ActualizarTabla();
            }
        }

        protected void grdLista_SelectedIndexChanged(object sender, EventArgs e)
        {
            //nada
        }

        protected void grdLista_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            //nada
        }

        protected void grdLista_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdLista.PageIndex = e.NewPageIndex;

            ActualizarTabla();
        }

        protected void bttnCancelarCompra_Click(object sender, EventArgs e)
        {
            this.Session["Carrito"] = null;

            ActualizarTotal();

            ActualizarTabla();

            lblRespuesta.Text = " ";

            lblImporte.Text = "0,00";
        }
        #endregion
    }
}