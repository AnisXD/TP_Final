<%@ Page Title="" Language="C#" MasterPageFile="~/Empleado/PaginaMaestraEmpleado.master" AutoEventWireup="true" CodeBehind="Ventas.aspx.cs" Inherits="CapaPresentacion.Empleado.Ventas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadEmpleado" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoColIzEmpleado" runat="server">
    <asp:Label ID="lblFiltrar" runat="server" Text="Filtrar por: " CssClass="ControlesASP"></asp:Label>
    <asp:Label ID="lblVendedor" runat="server" Text="Vendedor: " CssClass="ControlesASP"></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server" CssClass="ControlesASP"></asp:TextBox>
    <asp:Label ID="lblCliente" runat="server" Text="Cliente: " CssClass="ControlesASP"></asp:Label>
    <asp:TextBox ID="TextBox2" runat="server" CssClass="ControlesASP"></asp:TextBox>
    <asp:Label ID="lblAño" runat="server" Text="Año: " CssClass="ControlesASP"></asp:Label>
    <asp:TextBox ID="txtAño" runat="server" CssClass="ControlesASP"></asp:TextBox>
    <asp:Label ID="lblMes" runat="server" Text="Mes: " CssClass="ControlesASP"></asp:Label>
    <asp:DropDownList ID="ddlMes" runat="server" CssClass="ControlesASP">
        <asp:ListItem>Enero</asp:ListItem>
        <asp:ListItem>Febrero</asp:ListItem>
        <asp:ListItem>Marzo</asp:ListItem>
        <asp:ListItem>Abril</asp:ListItem>
        <asp:ListItem>Mayo</asp:ListItem>
        <asp:ListItem>Junio</asp:ListItem>
        <asp:ListItem>Julio</asp:ListItem>
        <asp:ListItem>Agosto</asp:ListItem>
        <asp:ListItem>Septiembre</asp:ListItem>
        <asp:ListItem>Octubre</asp:ListItem>
        <asp:ListItem>Noviembre</asp:ListItem>
        <asp:ListItem>Diciembre</asp:ListItem>
    </asp:DropDownList>
    <asp:Button ID="bttnFiltrar" runat="server" Text="Filtrar" CssClass="Boton"/>
    <asp:Button ID="bttnQuitarFiltro" runat="server" Text="Quitar filtro" CssClass="Boton"/>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoColPpalEmpleado" runat="server">
   

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_VTA" DataSourceID="venta">
        <Columns>
            <asp:BoundField DataField="ID_VTA" HeaderText="ID" ReadOnly="True" SortExpression="ID_VTA" />
            <asp:BoundField DataField="ID_CLI_VTA" HeaderText="CLIENTE" SortExpression="ID_CLI_VTA" />
            <asp:BoundField DataField="ID_EMPLE_VTA" HeaderText="EMPLEADO" SortExpression="ID_EMPLE_VTA" />
            <asp:BoundField DataField="FECHA_VTA" HeaderText="FECHA" SortExpression="FECHA_VTA" />
            <asp:BoundField DataField="ID_FORMAENVIO_VTA" HeaderText="FORMA ENVIO" SortExpression="ID_FORMAENVIO_VTA" />
            <asp:BoundField DataField="ID_FORMAPAGO_VTA" HeaderText="FORMA PAGO" SortExpression="ID_FORMAPAGO_VTA" />
            <asp:BoundField DataField="IMPORTE" HeaderText="IMPORTE" SortExpression="IMPORTE" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="venta" runat="server" ConnectionString="<%$ ConnectionStrings:FINAL_LABConnectionString %>" SelectCommand="SELECT [ID_VTA], [ID_CLI_VTA], [ID_EMPLE_VTA], [FECHA_VTA], [ID_FORMAENVIO_VTA], [ID_FORMAPAGO_VTA], [IMPORTE] FROM [VENTAS]"></asp:SqlDataSource>
    <asp:Button ID="bttnNuevaVenta" runat="server" Text="Nueva Venta" CssClass="Boton" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContenidoColDerEmpleado" runat="server">
</asp:Content>
