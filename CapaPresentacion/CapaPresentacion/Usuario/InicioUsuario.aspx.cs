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

namespace CapaPresentacion.Usuario
{
    public partial class InicioUsuario : System.Web.UI.Page
    {
        #region Funciones auxiliares
        private void limpiarTxt()
        {
            this.txtPrecio.Text = string.Empty;
        }

        private void cargarListView(DataTable Celulares)
        {
            lvwCelulares.DataSource = Celulares;
            lvwCelulares.DataMember = "Modelo";
            lvwCelulares.DataBind();
            lblTotalRegistros.Text = "Celulares disponibles: " + lvwCelulares.Items.Count;
        }
        private void CargarDDL_Marcas()
        {
            NMarca Obj = new NMarca();
            ddlMarca.Items.Clear();
            ddlMarca.DataSource = Obj.Mostrar();
            ddlMarca.DataTextField = "Marca";
            ddlMarca.DataValueField = "Id";
            ddlMarca.DataBind();
        }

        private void CargarDDL_Modelo()
        {
            NCelular Obj = new NCelular();
            ddlModelo.Items.Clear();
            ddlModelo.DataSource = Obj.Mostrar();
            ddlModelo.DataTextField = "Modelo";
            ddlModelo.DataValueField = "Modelo";
            ddlModelo.DataBind();
        }
        private void CargarDDL_ModeloPorMarca()
        {
            NCelular Obj = new NCelular();
            ddlModelo.Items.Clear();
            ddlModelo.DataSource = Obj.BuscarPorMarca(ddlMarca.SelectedItem.Value);
            ddlModelo.DataTextField = "Modelo";
            ddlModelo.DataValueField = "Modelo";
            ddlModelo.DataBind();
        }
        private void CargarComboNumerico(ref DropDownList NombreCombo)
        {
            NombreCombo.Items.Add("Igual a:");
            NombreCombo.Items.Add("Mayor a:");
            NombreCombo.Items.Add("Menor a:");
        }
        #endregion

        #region Eventos
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarListView(new NCelular().Mostrar());
                CargarDDL_Marcas();
                CargarDDL_Modelo();
                limpiarTxt();
                CargarComboNumerico(ref ddlPrecio);
            }

            
        }

        protected void ddlMarca_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarDDL_ModeloPorMarca();
        }

        protected void CbxModelo_CheckedChanged(object sender, EventArgs e)
        {
            if (CbxModelo.Checked)
            {
                CbxPrecio.Visible = false;
                ddlPrecio.Visible = false;
                txtPrecio.Visible = false;
                CbxPrecio.Checked = false;
            }
            else
            {
                CbxPrecio.Visible = true;
                ddlPrecio.Visible = true;
                txtPrecio.Visible = true;
            }
        }
        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            string Filtro = "";
            NCelular Obj = new NCelular();
            if (CbxModelo.Checked)//si modelo esta seleccionado solo busca por modelo
            {
                lblFiltro.Text = "Filtrar por Modelo: " + ddlModelo.SelectedItem.Text + " - value: " + ddlModelo.SelectedValue;
                cargarListView(Obj.BuscarPorModelo(ddlModelo.SelectedValue));
            }
            else //si modelo no esta seleccionado se fija si esta seleccionado marca Y precio
            {
                if (CbxMarca.Checked && CbxPrecio.Checked)
                {//como marca Y precio estan seleccionados arma un filtro
                    Obj.AgregarFiltro("ID_MARCA_CEL",
                                      "Es igual a:",
                                      ddlMarca.SelectedItem.Value,
                                      ref Filtro);
                    Obj.AgregarFiltro("PRECIO_UNITARIO_CEL",
                                      ddlPrecio.SelectedItem.Text,
                                      txtPrecio.Text,
                                      ref Filtro);
                    lblFiltro.Text = "Filtrar por marca: " + ddlMarca.SelectedItem.Text + " - value: " + ddlMarca.SelectedValue + " y por Precio: " + ddlPrecio.SelectedItem.Text + txtPrecio.Text;
                    //Ahora carga el gridview segun el filtro armado
                    cargarListView(Obj.BuscarPorFiltro(Filtro));
                }
                else// Ahora tengo que buscar si marca O precio estan seleccionados
                {
                    if (CbxMarca.Checked)//En este punto solo el Rbtn Marca esta seleccionado
                    {
                        lblFiltro.Text = "Filtrar por marca: " + ddlMarca.SelectedItem.Text + " - value: " + ddlMarca.SelectedValue;
                        cargarListView(Obj.BuscarPorMarca(ddlMarca.SelectedItem.Value));
                    }
                    else
                    {
                        if (CbxPrecio.Checked)//En este punto solo el Rbtn Precio esta seleccionado
                        {
                            Obj.AgregarFiltro("PRECIO_UNITARIO_CEL",
                                      ddlPrecio.SelectedItem.Text,
                                      txtPrecio.Text,
                                      ref Filtro);
                            lblFiltro.Text = "Filtrar por Precio: " + ddlPrecio.SelectedItem.Text + txtPrecio.Text;
                            //Ahora carga el gridview segun el filtro armado
                            cargarListView(Obj.BuscarPorFiltro(Filtro));
                        }
                        else//si llega hasta aca ninguno de los Rbtn esta seleccionado
                        {
                            lblFiltro.Text = "Para filtrar los celulares debe seleccionar algun criterio";
                        }
                    }
                }
            }
        }

        protected void btnQuitarFiltro_Click(object sender, EventArgs e)
        {
            cargarListView(new NCelular().Mostrar());
            CargarDDL_Marcas();
            CargarDDL_Modelo();
            txtPrecio.Text = string.Empty;
            CbxMarca.Checked = false;
            CbxModelo.Checked = false;
            CbxPrecio.Checked = false;
            limpiarTxt();

        }
        protected void BtnAgregarAlCarrito_Command(object sender, CommandEventArgs e)
        {
            lblFiltro.Text = "Primero debe ingresar como usuario para poder agregar al carrito el celular: " + e.CommandArgument;
            
            Response.Redirect("/Usuario/LogIn.aspx");
        }
        #endregion
    }

}