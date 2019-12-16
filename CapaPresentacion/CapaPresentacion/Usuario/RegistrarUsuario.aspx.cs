using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CapaOperaciones;
using ENTIDADES;

namespace CapaPresentacion.Usuario
{
    public partial class RegristrarUsuario : System.Web.UI.Page
    {
        public void limpiarTxt()
        {
            this.txbDNI.Text = string.Empty;
            this.txbApellido.Text = string.Empty;
            this.txbNombre.Text = string.Empty;
            this.txbDireccion.Text = string.Empty;
            this.txbTelefono.Text = string.Empty;
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            //limpia los txt, carga ddl provincias y solo deja ingresar dni

            //GestionPizza gpizza = new GestionPizza();
            //ddlPizzas.DataTextField = "Nombre";
            //ddlPizzas.DataValueField = "Cod_Pizza";
            //ddlPizzas.DataSource = gpizza.ObtenerTodosLasPizzas();
            //ddlPizzas.DataBind();

            //NProvincia ObjProvincia = new NProvincia();

            //ddlFProvincia.DataTextField = "DESC_PROVINCIA";
            //ddlFProvincia.DataValueField = "ID_PROVINCIA";
            //ddlFProvincia.DataSource = ObjProvincia.Mostrar();
            //ddlFProvincia.DataBind();

            NLocalidad ObjLocalidad = new NLocalidad();


            ddlFLocalidad.DataTextField = "DESC_LOCALIDAD";
            ddlFLocalidad.DataValueField = "ID_LOCALIDAD";
            ddlFLocalidad.DataSource = ObjLocalidad.Mostrar();
            ddlFLocalidad.DataBind();
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            //limpia los txt y vuelve a la pagina anterior
        }

        //public bool txtCompletos()
        //{
        //    if ((txtIdMarca.Text == string.Empty) || (txtNombreMarca.Text == string.Empty) || txtIdMarca.Text.Trim().Length < 1)
        //    {
        //        lblEstado.Text = "Atención!! Hay campos incompletos txt id= " + txtIdMarca.Text.Length + " txt nombre= " + txtNombreMarca.Text.Length;
        //        return false;
        //    }
        //    else
        //    {
        //        return true;
        //    }
        //}

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            //if (!txtCompletos())
            //{
            //    lblEstado.Text += "Atencion!! Para agregar un registro a la tabla debe completar todos los campos de datos";
            //}
            //else
            //{
                Domicilio ObjDomicilio = new Domicilio();

                ObjDomicilio.IdProvincia = Convert.ToInt32(ddlFProvincia.SelectedValue);
                ObjDomicilio.IdLocalidad = Convert.ToInt32(ddlFLocalidad.SelectedValue);
                ObjDomicilio.Calle_y_Altura = txbDireccion.Text;

                NUsuario Obj = new NUsuario();
                if (Obj.Insertar(txbDNI.Text, txbApellido.Text, txbNombre.Text, ObjDomicilio, txbTelefono.Text))
                {
                    lblEstado.Text = "El registro se insertó con exito";
                }
                else
                {
                    lblEstado.Text = "El registro no se pudo insertar";
                }

            //}
            limpiarTxt();
        }

        protected void txtDNI_TextChanged(object sender, EventArgs e)
        {
            //validar que solo se ingresen numeros
            //buscar si el dni ingresado esta en la base de datos, 
            //de estar avisar al usuario que ese dni ya esta registrado, 
            //si no esta habilitar los controles para ingresar los datos del nuevo usuario
        }

        protected void ddlFProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            //aca debe cargar el ddl localidades que pertenezcan a la provincia seleccionada
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            
        }
    }
}