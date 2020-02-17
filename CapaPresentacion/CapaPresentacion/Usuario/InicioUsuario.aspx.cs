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
                txtPrecio.Text = "";
                CbxPrecio.Checked = false;
            }
            else
            {
                CbxPrecio.Visible = true;
                txtPrecio.Text = "";
                ddlPrecio.Visible = true;
                txtPrecio.Visible = true;
            }
        }
        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            string Filtro = "";
            lblFiltro.Text = "";
            NCelular Obj = new NCelular();
            if (CbxModelo.Checked)
            { 
                cargarListView(Obj.BuscarPorModelo(ddlModelo.SelectedValue));
            }
            else 
            {
                if (CbxMarca.Checked && CbxPrecio.Checked)
                {
                    if (txtPrecio.Text == string.Empty)
                    {
                        lblFiltro.Text = "Debe completar el precio";
                    }
                    else
                    {
                        Obj.AgregarFiltro("ID_MARCA_CEL",
                                          "Es igual a:",
                                          ddlMarca.SelectedItem.Value,
                                          ref Filtro);
                        Obj.AgregarFiltro("PRECIO_UNITARIO_CEL",
                                          ddlPrecio.SelectedItem.Text,
                                          txtPrecio.Text,
                                          ref Filtro);
                    }
                    cargarListView(Obj.BuscarPorFiltro(Filtro));
                }
                else
                {
                    if (CbxMarca.Checked)
                    {
                        cargarListView(Obj.BuscarPorMarca(ddlMarca.SelectedItem.Value));
                    }
                    else
                    {
                        if (CbxPrecio.Checked)
                        {
                            Obj.AgregarFiltro("PRECIO_UNITARIO_CEL",
                                      ddlPrecio.SelectedItem.Text,
                                      txtPrecio.Text,
                                      ref Filtro);                           
                            cargarListView(Obj.BuscarPorFiltro(Filtro));
                        }
                        else
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
            lblFiltro.Text = "";

        }
        protected void BtnAgregarAlCarrito_Command(object sender, CommandEventArgs e)
        {
            this.Session["Modelo"] = e.CommandArgument;
            Response.Redirect("/Usuario/LogIn.aspx");
        }
        #endregion
    }

}