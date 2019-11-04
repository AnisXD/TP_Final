<%@ Page Title="" Language="C#" MasterPageFile="~/Empleado/PaginaMaestraEmpleado.master" AutoEventWireup="true" CodeBehind="Reportes.aspx.cs" Inherits="CapaPresentacion.Empleado.Reportes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadEmpleado" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoColIzEmpleado" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoColPpalEmpleado" runat="server">
    <h2>Reportes: </h2>
    <div id="FormReportes" class="Form">

    <asp:RadioButton ID="Fecha" runat="server" Text="Fecha" />
            &nbsp;
            <asp:DropDownList ID="DropDownList4" runat="server">
        </asp:DropDownList>
            <asp:DropDownList ID="DropDownList1" runat="server">
        </asp:DropDownList>
        <asp:DropDownList ID="DropDownList5" runat="server">
        </asp:DropDownList>
        <br />
        <asp:RadioButton ID="RadioButton2" runat="server" Text="Id" />
        &nbsp;
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="ControlesASP">Total recaudado de ventas</asp:LinkButton>
        <br />
        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="ControlesASP">Total recaudado por Cliente</asp:LinkButton>
        <br />
        <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click" CssClass="ControlesASP">Total vendido por Vendedor</asp:LinkButton>
        <br />
        <asp:LinkButton ID="LinkButton4" runat="server" CssClass="ControlesASP">Total recaudado por marca</asp:LinkButton>
        <br />
        <asp:LinkButton ID="LinkButton5" runat="server" CssClass="ControlesASP">Total recaudado por modelo</asp:LinkButton>
        <br />
    </div>
    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContenidoColDerEmpleado" runat="server">
</asp:Content>
