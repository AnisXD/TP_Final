<%@ Page Title="" Language="C#" MasterPageFile="~/Empleado/PaginaMaestraEmpleado.master" AutoEventWireup="true" CodeBehind="NuevaVenta.aspx.cs" Inherits="CapaPresentacion.Empleado.NuevaVenta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadEmpleado" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoColIzEmpleado" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoColPpalEmpleado" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Ingrese los datos de la venta:"></asp:Label>
    <br />
    <br />
    <asp:Label ID="lblVenta" runat="server" Text="Venta: "></asp:Label>
    <asp:TextBox ID="tbVenta" runat="server" ReadOnly="True"></asp:TextBox>
    <br />
    <asp:Label ID="lblDNICliente" runat="server" Text="DNI Cliente: "></asp:Label>
    <asp:TextBox ID="tbdnicliente" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="lblLegajo" runat="server" Text="Legajo: "></asp:Label>
    <asp:TextBox ID="tblegajo" runat="server" ReadOnly="True"></asp:TextBox>
    <br />
    <asp:Label ID="lblFecha" runat="server" Text="Fecha: "></asp:Label>
    <asp:TextBox ID="tbfecha" runat="server" ReadOnly="True"></asp:TextBox>
    <br />
    <asp:Label ID="lblFormaPago" runat="server" Text="Forma de pago: "></asp:Label>
    <asp:TextBox ID="tbpago" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="lblFormaEnvio" runat="server" Text="Forma de envio: "></asp:Label>
    <asp:TextBox ID="tbenvio" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="lblImporte" runat="server" Text="Importe:"></asp:Label>
    <asp:TextBox ID="tbimporte" runat="server" ReadOnly="True"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="bttnAgregarItem" runat="server" Text="Agregar item" />
    <br />
    <br />
    <asp:Button ID="bttnFinalizarcompra" runat="server" Text="Finalizar compra" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContenidoColDerEmpleado" runat="server">
</asp:Content>
