﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Empleado/PaginaMaestraEmpleado.master" AutoEventWireup="true" CodeBehind="Marca.aspx.cs" Inherits="CapaPresentacion.Empleado.Marca" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadEmpleado" runat="server">
    <style type="text/css">
        .auto-style4 {
            display: block;
            padding: 5px;
            margin: 5px 28px 5px 0;
            font-size: 20px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoColIzEmpleado" runat="server">
    <p>&nbsp;</p>
    <h2>Filtrar por:</h2>

    <div id="Filtro" style="text-align: left;">

        <asp:CheckBox ID="cbMarca" runat="server" AutoPostBack="True" Text="Marca" OnCheckedChanged="cbMarca_CheckedChanged" CssClass="ControlesASP" />
        <asp:DropDownList ID="ddlMarca" runat="server" AutoPostBack="True" CssClass="Ddl"></asp:DropDownList>
        <asp:CheckBox ID="cbIdMarca" runat="server" AutoPostBack="True" Text="Id Marca" OnCheckedChanged="cbIdMarca_CheckedChanged" CssClass="ControlesASP" />
        <asp:DropDownList ID="ddlIdMarca" runat="server" AutoPostBack="True" CssClass="Ddl"></asp:DropDownList>
        <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" CssClass="Boton" OnClick="btnFiltrar_Click" />
        <asp:Button ID="btnQuitarFiltro" runat="server" Text="Quitar Filtros" CssClass="Boton" OnClick="btnQuitarFiltro_Click" />

    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoColPpalEmpleado" runat="server">

    <div id="FormMarca" class="Form">

        <h2>Administrar Marcas</h2>

        <asp:GridView ID="gdvMarcas" runat="server" AllowPaging="True" AllowSorting="False" HorizontalAlign="Center" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" OnSelectedIndexChanged="gdvMarcas_SelectedIndexChanged" AutoGenerateSelectButton="True" Font-Size="Large" Width="100%">
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

        <asp:Label ID="lblTotalRegistros" runat="server" CssClass="ControlesASP" Text="Registros Encontrados: "></asp:Label>

        <br />

        <table style="width: 100%; font-size: 20px; color: black;">
            <tr>
                <td style="width: 30%; height: 26px;">
                    <asp:Label ID="lblIdMarca" runat="server" Text="Id: " CssClass="LabelNegritaLarga"></asp:Label></td>

                <td style="text-align: left; height: 26px;">
                    <asp:TextBox ID="txtIdMarca" runat="server" OnTextChanged="txtIdMarca_TextChanged" AutoPostBack="True" CssClass="ControlesASP" CausesValidation="True" MaxLength="15" Style="text-transform: uppercase"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 30%; height: 26px;">
                    <asp:Label ID="lblNombreMarca" runat="server" Text="Nombre: " CssClass="LabelNegritaLarga"></asp:Label></td>

                <td style="text-align: left; height: 26px;">
                    <asp:TextBox ID="txtNombreMarca" runat="server" MaxLength="20" CssClass="ControlesASP" Style="text-transform: uppercase"></asp:TextBox></td>
            </tr>
        </table>

        <br />

        <asp:Label ID="lblEstado" runat="server" Text=" " CssClass="ControlesASP"></asp:Label>

        <asp:Button ID="btnAgregar" runat="server" Text="Agregar" CssClass="Boton" OnClick="btnAgregar_Click" />
        <asp:Button ID="btnEditar" runat="server" Text="Editar" CssClass="Boton" OnClick="btnEditar_Click" />
        <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="Boton" OnClick="btnEliminar_Click" />

        <br />

    </div>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContenidoColDerEmpleado" runat="server">
</asp:Content>
