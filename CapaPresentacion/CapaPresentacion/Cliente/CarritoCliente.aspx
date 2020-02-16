﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Cliente/PaginaMaestraCliente.master" AutoEventWireup="true" CodeBehind="CarritoCliente.aspx.cs" Inherits="CapaPresentacion.Cliente.CarritoCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadCliente" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoColIzCliente" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoColPpalCliente" runat="server">
    
    <div id="Carrito" class="Form">
        <h2>Mi Carrito</h2>
       
        <asp:Label ID="lblIdVenta" runat="server" Text="Venta N°: " CssClass="LabelNegrita" ></asp:Label>
        <asp:Label ID="txtIdVenta" runat="server" Text="xxx-0001" CssClass="Label" ></asp:Label>
        <asp:Label ID="lblFecha" runat="server" Text="Fecha: "  CssClass="LabelNegrita" ></asp:Label>
        <asp:Label ID="txtFecha" runat="server" Text="04/11/2019"  CssClass="Label" ></asp:Label>
        <asp:Label ID="lblLegajo" runat="server" Text="Vendedor: "  CssClass="LabelNegrita" ></asp:Label>
        <asp:Label ID="txtLegajo" runat="server" Text="E-99999999"  CssClass="Label" ></asp:Label>       
        <asp:Label ID="lblDNICliente" runat="server" Text="Cliente: "  CssClass="LabelNegrita" ></asp:Label>
        <asp:Label ID="txtDNICliente" runat="server" Text="35767657"  CssClass="Label" ></asp:Label>       
        
           <br />

        <div style="width:100%; height: 190px; border-bottom-style:solid; border-bottom-color:black; border-top-style:solid; border-top-color:black;">
          <table style=" width: 100%; height: 185px; font-size:20px; color:black;">
            <tr>
                <td style=" width: 50%; height: 26px;">
                    <asp:Label ID="lblFormaPago" runat="server" Text="Forma de pago: "  CssClass="LabelNegritaLarga" ></asp:Label></td>
                <td style="text-align:left; height: 26px;">
                    <asp:DropDownList ID="ddlFPago" runat="server" CssClass="DropDownListFull" ></asp:DropDownList>
             </tr>
            <tr>
                <td style=" width: 50%; height: 26px;">
                    <asp:Label ID="lblFormaEnvio" runat="server" Text="Forma de envio: "  CssClass="LabelNegritaLarga" ></asp:Label></td>
                <td style="text-align:left; height: 26px;">
                    <asp:DropDownList ID="ddlFEnvio" runat="server" CssClass="DropDownListFull"></asp:DropDownList></td>
            </tr>
            <tr>
                <td style=" width: 50%; height: 26px;">
                    <asp:Label ID="lblImporte_Total" runat="server" Text="Importe a pagar: $ "  CssClass="LabelNegritaLarga" ></asp:Label></td>
                <td style="text-align:left; height: 26px;">
                    <asp:Label ID="lblImporte" runat="server" Text="0"  CssClass="LabelNegrita" ></asp:Label></td>
              </tr>
          </table>
        </div>
        <div style="width:100%; height: 190px; border-bottom-style:solid; border-bottom-color:black;"> 

        <table style=" width: 100%; height: 185px; font-size:20px; color:black;">
            <tr>
               <td style=" width: 50%; height: 26px;">
                     <asp:Label ID="lblModelo" runat="server" Text="Modelo: "  CssClass="LabelNegritaLarga" ></asp:Label></td>
                <td style="text-align:left; height: 26px;">
                    <asp:DropDownList ID="ddlModelo" runat="server" AutoPostBack="True" CssClass="DropDownListFull" OnSelectedIndexChanged="ddlModelo_SelectedIndexChanged"></asp:DropDownList></td>
            </tr>
            <tr>
                 <td style=" width: 50%; height: 21px;">
                <asp:Label ID="LblPrecioUnitario" runat="server" Text="Precio: $ "  CssClass="LabelNegritaLarga" ></asp:Label></td>
                <td style="text-align:left; height: 21px;">
                    <asp:Label ID="lblPrecio" runat="server" Text="000,00" CssClass="Label"></asp:Label></td>
             </tr>
            <tr>
                 <td style=" width: 50%; height: 26px;">
                <asp:Label ID="LblCantidad" runat="server" Text="Cantidad: "  CssClass="LabelNegritaLarga" ></asp:Label></td>
                <td style="text-align:left; height: 26px;">
                    <asp:DropDownList ID="ddlCantidad" runat="server" AutoPostBack="True" CssClass="DropDownListFull" Visible="True">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                 <td style="text-align:left; width: 50%;"></td>
                 <td style="text-align:center; height: 25px;">
                    <asp:Button ID="btnAnadir" runat="server" Text="Añadir" CssClass="Boton" OnClick="btnAnadir_Click" />
                </td>
            </tr>
            </table>
            <br />
        </div>
         <asp:GridView ID="grdLista" runat="server" AllowPaging="True" AutoGenerateDeleteButton="True" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" HorizontalAlign="Center" OnPageIndexChanging="grdLista_PageIndexChanging" OnRowCommand="grdLista_RowCommand" OnSelectedIndexChanged="grdLista_SelectedIndexChanged" OnSelectedIndexChanging="grdLista_SelectedIndexChanging" Width="100%">
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#003399" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />
        </asp:GridView>
        <table style=" width: 100%; font-size:20px">
            <tr>
                <td style="text-align:center; width: 40%; height: 26px;">
                    <asp:Button ID="bttnFinalizarcompra" runat="server" Text="Confirmar compra" CssClass="Boton" OnClick="bttnFinalizarcompra_Click" />
                </td>

                <td style="text-align:center; width: 40%; height: 26px;">
                    <asp:Button ID="bttnCancelarCompra" runat="server" Text="Cancelar compra" CssClass="Boton" OnClick="bttnCancelarCompra_Click" />
                </td>
                
            </tr>

           </table>
        <asp:Label ID="lblRespuesta" runat="server" Text=""></asp:Label>

   
    </div>
  
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContenidoColDerCliente" runat="server">
</asp:Content>
