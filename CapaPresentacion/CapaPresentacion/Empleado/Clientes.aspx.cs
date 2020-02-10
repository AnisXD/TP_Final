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
    public partial class Clientes1 : System.Web.UI.Page
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

        public void CargarDgv()
        {
            string IdRol = "C";// C = Cliente , A = Administrador, E = Empleado, V = Vendedor
            NUsuario Obj = new NUsuario();
            gvwClientes.DataSource = Obj.BuscarPorRol(IdRol);
            gvwClientes.DataBind();
            lblTotalRegistros.Text = "Registros encontrados: " + gvwClientes.Rows.Count;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                CargarDgv();
                CargarDDL_Provincia(ddlProvincia);
                CargarDDL_Localidad(ddlLocalidad, Convert.ToInt32(ddlProvincia.SelectedValue));
                limpiarTxt();
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {

            NUsuario Obj = new NUsuario();
            if (Obj.Insertar(txbDNI.Text, txbNombre.Text, txbApellido.Text, txbTelefono.Text, Convert.ToInt32(ddlProvincia.SelectedItem.Value), Convert.ToInt32(ddlLocalidad.SelectedItem.Value), txbDireccion.Text, txbClave.Text, 'C'))
            {
                Response.Redirect("/Empleado/Clientes.aspx");
                lblEstado.Text = "El registro se insertó con exito";
            }

            else
            {
                lblEstado.Text = "El registro no se pudo insertar";
            }
        }

        protected void txbDNI_TextChanged(object sender, EventArgs e)
        {
            //lblEstado.Text = "txtDNI se modifico";
            if (txbDNI.Text.Trim().Length == 0)
            {
                btnAgregar.Enabled = false;
                btnEliminar.Enabled = false;
                btnEditar.Enabled = false;
                lblEstado.Text = "txtID esta vacio";
            }
            else
            {
                if (ExisteDNI(txbDNI.Text.ToString()))
                {
                    btnAgregar.Enabled = false;
                    btnEliminar.Enabled = true;
                    btnEditar.Enabled = true;
                    txbClave.Enabled = false;
                    txbRepitaClave.Enabled = false;

                    // lblEstado.Text = "El DNI ingresado ya existe";
                }
                else
                {
                    btnAgregar.Enabled = true;
                    btnEliminar.Enabled = false;
                    btnEditar.Enabled = false;
                    txbClave.Enabled = true;
                    txbRepitaClave.Enabled = true;
                    lblEstado.Text = "El DNI ingresado no esta registrado como usuario";
                }
            }
        }

        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarDDL_Localidad(ddlLocalidad, Convert.ToInt32(ddlProvincia.SelectedValue));
        }

        protected void ddlFProvincia_SelectedIndexChanged1(object sender, EventArgs e)
        {
            CargarDDL_Localidad(ddlLocalidad, Convert.ToInt32(ddlProvincia.SelectedValue));
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            char IdRol = 'C'; // C = Cliente , A = Administrador, E = Empleado
            string DNI;
            string APELLIDO;

            if (cbDNI.Checked == true)
            {
                DNI = txtDNIF.Text;

                NUsuario Obj = new NUsuario();
                gvwClientes.DataSource = Obj.BuscarUsuarioPorDNI(DNI, IdRol);
                gvwClientes.DataBind();
                lblTotalRegistros.Text = "Registros encontrados: " + gvwClientes.Rows.Count;
            }

            if (CheckBox1.Checked == true)
            {
                APELLIDO = txtApellidos.Text;
                NUsuario Obj = new NUsuario();
                gvwClientes.DataSource = Obj.BuscarUsuarioPorApellido(APELLIDO, IdRol);
                gvwClientes.DataBind();
                lblTotalRegistros.Text = "Registros encontrados: " + gvwClientes.Rows.Count;
            }
        }

        protected void btnQuitarFiltro_Click(object sender, EventArgs e)
        {
             Response.Redirect("/Empleado/Clientes.aspx");
        }

        protected void cbDNI_CheckedChanged(object sender, EventArgs e)
        {
            if (cbDNI.Checked)
            {
                CheckBox1.Visible = false;
                txtApellidos.Visible = false;
            }
            else
            {
                CheckBox1.Visible = true;
                txtApellidos.Visible = true;
            }
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox1.Checked)
            {
                cbDNI.Visible = false;
                txtDNIF.Visible = false;
            }
            else
            {
                cbDNI.Visible = true;
                txtDNIF.Visible = true;
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            if (txbDNI.Text != string.Empty)
            {
                NUsuario obj = new NUsuario();
                if (obj.Eliminar(txbDNI.Text, 'C'))
                {
                    Response.Redirect("/Empleado/Clientes.aspx");
                    lblEstado.Text = "El registro se eliminó con exito";
                }
                else
                {
                    lblEstado.Text = "El registro no se pudo eliminar";
                }
                
            }
            else
            {
                lblEstado.Text = "Atencion! Para eliminar un registro debe ingresar el dni o seleccionarlo de la tabla";
            }
        }
        public bool txtCompletos()
        {
            if ((txbDNI.Text == string.Empty) || (txbNombre.Text == string.Empty) || (txbTelefono.Text == string.Empty) || (txbRepitaClave.Text == string.Empty) ||  (txbApellido.Text == string.Empty) || (txbDireccion.Text == string.Empty) || (txbClave.Text == string.Empty))
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            if ((txbDNI.Text == string.Empty) || (txbNombre.Text == string.Empty) || (txbTelefono.Text == string.Empty) || (txbApellido.Text == string.Empty) || (txbDireccion.Text == string.Empty))
            {
                lblEstado.Text = "Atencion! Para editar un registro debe completar todos los campos de datos";
            }
            else
            {
                NUsuario obj = new NUsuario();

                if (obj.Editar(txbDNI.Text, txbNombre.Text, txbApellido.Text, txbTelefono.Text, Convert.ToInt32(ddlProvincia.SelectedItem.Value), Convert.ToInt32(ddlLocalidad.SelectedItem.Value), txbDireccion.Text, 'C'))
                {
                    Response.Redirect("/Empleado/Clientes.aspx");
                    lblEstado.Text = "El registro se editó con exito";
                }
                else
                {
                    lblEstado.Text = "El registro no se pudo editar";
                }
                
            }
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

        protected void gvwClientes_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.txbDNI.Text = gvwClientes.SelectedRow.Cells[1].Text;
            this.txbNombre.Text = gvwClientes.SelectedRow.Cells[2].Text;
            this.txbApellido.Text = gvwClientes.SelectedRow.Cells[3].Text;
            this.txbTelefono.Text = gvwClientes.SelectedRow.Cells[4].Text;
            BuscarProvincia(gvwClientes.SelectedRow.Cells[5].Text);
            CargarDDL_Localidad(ddlLocalidad, Convert.ToInt32(ddlProvincia.SelectedValue));
            BuscarLocalidad(gvwClientes.SelectedRow.Cells[6].Text);
            this.txbDireccion.Text = gvwClientes.SelectedRow.Cells[7].Text;
            btnAgregar.Enabled = false;
            btnEditar.Enabled = true;
            btnEliminar.Enabled = true;
            txbClave.Enabled = false;
            txbRepitaClave.Enabled = false;
            lblEstado.Text = "Puede editar o eliminar el registro seleccionado";
        }
    }
}
