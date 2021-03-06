﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using CapaOperaciones;
using ENTIDADES;

namespace CapaPresentacion.Cliente
{
    public partial class InicioCliente : System.Web.UI.Page
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

        private void MostrarCbxPrecio()
        {
            CbxPrecio.Visible = true;
            ddlPrecio.Visible = true;
            txtPrecio.Visible = true;
            
            CbxPrecio.Checked = false;
            txtPrecio.Text = string.Empty;
        }

        private void OcultarCbxPrecio()
        {
            CbxPrecio.Visible = false;
            ddlPrecio.Visible = false;
            txtPrecio.Visible = false;
            
            CbxPrecio.Checked = false;
            txtPrecio.Text = string.Empty;
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
                CargarComboNumerico(ref ddlPrecio);
                MostrarCbxPrecio();
                limpiarTxt();
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
                OcultarCbxPrecio();
            }
            else
            {
                MostrarCbxPrecio();
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
                        lblFiltro.Text = "Ponga un precio";
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
                        cargarListView(Obj.BuscarPorFiltro(Filtro));
                    }
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
                            if (txtPrecio.Text == string.Empty)
                            {
                                lblFiltro.Text = "Ponga un precio";
                            }
                            else { 
                            Obj.AgregarFiltro("PRECIO_UNITARIO_CEL",
                                      ddlPrecio.SelectedItem.Text,
                                      txtPrecio.Text,
                                      ref Filtro);
                            }
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
            MostrarCbxPrecio();
            Response.Redirect("~/Usuario/InicioCliente.aspx");
        }

        protected void BtnAgregarAlCarrito_Command(object sender, CommandEventArgs e)
        {
            this.Session["Modelo"] = e.CommandArgument;
            Response.Redirect("~/Cliente/InicioCliente.aspx");
        }
        #endregion
    }
}