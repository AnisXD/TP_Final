using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text.RegularExpressions;
using CapaOperaciones;
using ENTIDADES;

namespace CapaPresentacion.Usuario
{
    public partial class RegristrarUsuario : System.Web.UI.Page
    {
        #region Funciones
        public void limpiarTxt()
        {
            this.txbDNI.Text = string.Empty;
            this.txbApellido.Text = string.Empty;
            this.txbNombre.Text = string.Empty;
            this.txbDireccion.Text = string.Empty;
            this.txbTelefono.Text = string.Empty;
            this.lblEstado2.Text = string.Empty;
        }

        private void OcultarLbls()
        {
            //lblApellido.Visible=false;
            //lblContraseñaCorta.Visible = false;
            lblContraseñaSegura.Visible = false;
            //lblDireccion.Visible = false;
            //lblDNI.Visible = false;
            lblEstado2.Visible = false;
            lblLocalidad.Visible = false;
            //lblNombre.Visible = false;
            lblProvincia.Visible = false;
            //lblRepetirClaveCorta.Visible = false;
            //lblTelefono.Visible = false;
        }

        private int DdlCompleto(DropDownList Ddl, ref Label LblMensaje)
        {
            int Completo=1;
            if(Ddl.SelectedIndex==0)
            {
                Completo = 0;
                LblMensaje.Visible = true;
            }
            else
            {
                LblMensaje.Visible = false;
            }
            return Completo;
        }

        private int TxtCompleto(string txt, ref Label lblMensaje, int MinChar)
        {
            int completo = 1;
            if(txt.Length < MinChar)
            {
                lblMensaje.Visible = true;
                completo = 0;
            }
            else
            {
                lblMensaje.Visible = false;
            }
            return completo;
        }

        private int ClaveSegura(string contraseñaSinVerificar,ref Label lblMensaje)
        {
            //letras de la A a la Z, mayusculas y minusculas
            Regex letras = new Regex(@"[a-zA-z]");
            //digitos del 0 al 9
            Regex numeros = new Regex(@"[0-9]");
            //cualquier caracter del conjunto
            Regex caracEsp = new Regex("[!\"#\\$%&'()*+,-./:;=?@\\[\\]^_`{|}~]");
            lblMensaje.Text = "La contraseña debe contener: letras, números y carácteres especiales";
            //si no contiene las letras, regresa false
            if (!letras.IsMatch(contraseñaSinVerificar))
            {
                
                return 0;
            }
            //si no contiene los numeros, regresa false
            if (!numeros.IsMatch(contraseñaSinVerificar))
            {
                return 0;
            }

            //si no contiene los caracteres especiales, regresa false
            if (!caracEsp.IsMatch(contraseñaSinVerificar))
            {
                return 0;
            }

            //si cumple con todo, regresa true
            lblMensaje.Text = "La contraseña es segura";
            return 1;
        }

        private bool RegistroCompleto()
        {
            bool Completo=false;
            int Cant=0;
            Cant += DdlCompleto(ddlProvincia, ref lblProvincia);
            Cant += DdlCompleto(ddlLocalidad, ref lblLocalidad);
            //Cant += TxtCompleto(txbDNI.Text, ref lblDNI, 8);
            //Cant += TxtCompleto(txbNombre.Text, ref lblNombre, 2);
            //Cant += TxtCompleto(txbApellido.Text, ref lblApellido, 2);
            //Cant += TxtCompleto(txbTelefono.Text, ref lblTelefono, 10);
            //Cant += TxtCompleto(txbDireccion.Text, ref lblDireccion, 8);
            //Cant += TxtCompleto(txbClave.Text, ref lblContraseñaCorta, 8);
            //Cant += TxtCompleto(txbRepitaClave.Text, ref lblRepetirClaveCorta, 8);
            Cant += ClaveSegura(txbClave.Text, ref lblContraseñaSegura);
            if (Cant==10)
            {
                Completo = true;
            }

            return Completo;
        }
        public bool ExisteDNI(string dni)
        {
            bool existe = false;
            DataTable dt = new DataTable();
            NUsuario obj = new NUsuario();
            dt = obj.BuscarPorDNI(dni);
            if(dt == null)
            {
                lblEstado2.Text = "El DNI ingresado no esta en la base de datos.";
            }
            else
            {
                if (dt.Rows.Count == 1 && dni.Length > 0)
                {
                    existe = true;
                    lblEstado2.Text = "El DNI ingresado ya esta registrado.";
                }
            }
           
            return existe;
        }
        public void CargarDDL_Localidad()
        {
            NLocalidad ObjLocalidad = new NLocalidad();

            ddlLocalidad.DataSource = ObjLocalidad.MostrarPorIdProvincia(Convert.ToInt32(ddlProvincia.SelectedValue));
            ddlLocalidad.DataTextField = "Localidad";
            ddlLocalidad.DataValueField = "Id";
            ddlLocalidad.DataBind();
        }

        public void CargarDDL_Provincia()
        {
            NProvincia ObjProvincia = new NProvincia();
            ddlProvincia.DataSource = ObjProvincia.Mostrar();
            ddlProvincia.DataTextField = "Provincia";
            ddlProvincia.DataValueField = "Id";
            ddlProvincia.DataBind();
        }
        #endregion
        #region Eventos
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                CargarDDL_Provincia();
                CargarDDL_Localidad();
                limpiarTxt();
                OcultarLbls();
            }
            if(RegistroCompleto())
            {
                btnAceptar.Enabled = true;
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            limpiarTxt();
            Response.Redirect("/Usuario/InicioUsuario.aspx");
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            if(RegistroCompleto())
            {
                NUsuario Obj = new NUsuario();
                if (Obj.Insertar(txbDNI.Text, txbNombre.Text, txbApellido.Text, txbTelefono.Text, Convert.ToInt32(ddlProvincia.SelectedItem.Value), Convert.ToInt32(ddlLocalidad.SelectedItem.Value), txbDireccion.Text, txbClave.Text, 'C'))
                {
                    limpiarTxt();
                    lblEstado2.Text = "El registro se insertó con exito";
                    Response.Redirect("/Usuario/LogIn.aspx");
                }
                else
                {
                    lblEstado2.Text = "El registro no se pudo insertar";
                }
            }
            else
            {
                lblEstado2.Text = "Datos invalidos, revise los requisitos para cada campo.";
            }

        }
        protected void txbDNI_TextChanged(object sender, EventArgs e)
        {
            if (txbDNI.Text.Trim().Length == 0)
            {
                btnAceptar.Enabled = false;
                btnCancelar.Enabled = false;
                lblEstado2.Text = "txtID esta vacio";
            }
            else
            {
                if (ExisteDNI(txbDNI.Text.ToString()))
                {
                    btnAceptar.Enabled = false;
                    btnCancelar.Enabled = false;
                    lblEstado2.Text = "El DNI ingresado ya se encuentra registrado";
                }
                else
                {
                    btnAceptar.Enabled = true;
                    btnCancelar.Enabled = true;
                    lblEstado2.Text = "El DNI ingresado no esta registrado como usuario";
                }
            }
        }

        protected void ddlFProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarDDL_Localidad();
        }
        #endregion
    }
}