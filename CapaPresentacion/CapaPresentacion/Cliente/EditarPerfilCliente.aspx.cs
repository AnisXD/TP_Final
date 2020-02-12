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
    public partial class PerfilCliente : System.Web.UI.Page
    {
        public void limpiarTxt()
        {
            this.txbDNI.Text = string.Empty;
            this.txbApellido.Text = string.Empty;
            this.txbNombre.Text = string.Empty;
            this.txbDireccion.Text = string.Empty;
            this.txbTelefono.Text = string.Empty;
            this.lblEstado.Text = string.Empty;
        }
        public bool ExisteDNI(string dni)
        {
            bool existe = false;
            DataTable dt = new DataTable();
            NUsuario obj = new NUsuario();
            dt = obj.BuscarPorDNI(dni);
            if (dt == null)
            {
                lblEstado.Text = "El DNI ingresado no esta en la base de datos";
            }
            else
            {
                if (dt.Rows.Count == 1 && dni.Length > 0)
                {
                    existe = true;
                    lblEstado.Text = "El DNI ingresado ya esta en la base de datos";
                }
            }

            return existe;
        }
        public void CargarDDL_Localidad(DropDownList lista, int id_prov)
        {
            NLocalidad ObjLocalidad = new NLocalidad();

            lista.DataSource = ObjLocalidad.MostrarPorIdProvincia(id_prov);
            lista.DataTextField = "Localidad";
            lista.DataValueField = "Id";
            lista.DataBind();
        }

        public void CargarDDL_Provincia(DropDownList lista)
        {
            NProvincia ObjProvincia = new NProvincia();
            lista.DataSource = ObjProvincia.Mostrar();
            lista.DataTextField = "Provincia";
            lista.DataValueField = "Id";
            lista.DataBind();
        }

        private void BuscarProvincia(string provincia)
        {
            foreach (ListItem Item in ddlProvincia.Items)
            {
                if (Item.Text == provincia)
                    ddlProvincia.SelectedIndex = ddlProvincia.Items.IndexOf(Item);
            }
        }
        private void BuscarLocalidad(string localidad)
        {
            foreach (ListItem Item in ddlLocalidad.Items)
            {
                if (Item.Text == localidad)
                    ddlLocalidad.SelectedIndex = ddlLocalidad.Items.IndexOf(Item);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;

            //if (!IsPostBack)
            //{
            //    CargarDDL_Provincia(ddlProvincia);
            //    CargarDDL_Localidad(ddlLocalidad, Convert.ToInt32(ddlProvincia.SelectedValue));
            //    limpiarTxt();
            //}

            if ((!IsPostBack) && this.Session["Usuario"] != null)
            {
                NUsuario ObjNUsuario = new NUsuario();
                string Usuario = this.Session["Usuario"].ToString();

                DataTable dt = ObjNUsuario.DatosUsuario(Usuario);
                DataRow dr = dt.Rows[0];

                txbDNI.Text = dr["DNI"].ToString();
                txbNombre.Text = dr["NOMBRE"].ToString();
                txbApellido.Text = dr["APELLIDO"].ToString();
                txbTelefono.Text = dr["TELEFONO"].ToString();
                CargarDDL_Provincia(ddlProvincia);
                BuscarProvincia(dr["PROVINCIA"].ToString());
                CargarDDL_Localidad(ddlLocalidad, Convert.ToInt32(ddlProvincia.SelectedValue));
                BuscarLocalidad(dr["LOCALIDAD"].ToString());
                txbDireccion.Text = dr["DIRECCION"].ToString();
                txbClave.Text = dr["CONTRASENA"].ToString();
                txbRepitaClave.Text = dr["CONTRASENA"].ToString();
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Cliente/InicioCliente.aspx");
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            if ((txbDNI.Text == string.Empty) || (txbNombre.Text == string.Empty) || (txbTelefono.Text == string.Empty) || (txbApellido.Text == string.Empty) || (txbDireccion.Text == string.Empty))
            {
                lblEstado.Text = "Atencion! Para editar un registro debe completar todos los campos de datos";
            }
            else
            {
                NUsuario Obj = new NUsuario();
                if (Obj.EditarC(txbDNI.Text, txbNombre.Text, txbApellido.Text, txbTelefono.Text, Convert.ToInt32(ddlProvincia.SelectedItem.Value), Convert.ToInt32(ddlLocalidad.SelectedItem.Value), txbDireccion.Text, txbClave.Text, 'C'))
                {
                    Response.Redirect("/Cliente/EditarPerfilCLiente.aspx");
                    lblEstado.Text = "El registro se insertó con exito";
                }
                else
                {
                    lblEstado.Text = "El registro no se pudo insertar";
                }
            }
        }
        protected void txbDNI_TextChanged(object sender, EventArgs e)
        {
            lblEstado.Text = "txtDNI se modifico";
            if (txbDNI.Text.Trim().Length == 0)
            {
                btnAceptar.Enabled = false;
                btnCancelar.Enabled = false;
                lblEstado.Text = "txtID esta vacio";
            }
            else
            {
                if (ExisteDNI(txbDNI.Text.ToString()))
                {
                    btnAceptar.Enabled = false;
                    btnCancelar.Enabled = false;
                    //lblEstado.Text = "El DNI ingresado ya fue registrado";
                }
                else
                {
                    btnAceptar.Enabled = true;
                    btnCancelar.Enabled = true;
                    lblEstado.Text = "El DNI ingresado no esta registrado como usuario";
                }
            }
        }

        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarDDL_Localidad(ddlLocalidad, Convert.ToInt32(ddlProvincia.SelectedValue));
        }
    }
}
