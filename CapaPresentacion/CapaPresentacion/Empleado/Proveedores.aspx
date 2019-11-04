<%@ Page Title="" Language="C#" MasterPageFile="~/Empleado/PaginaMaestraEmpleado.master" AutoEventWireup="true" CodeBehind="Proveedores.aspx.cs" Inherits="CapaPresentacion.Empleado.Proveedores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadEmpleado" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoColIzEmpleado" runat="server">
    <h2>Filtrar por:</h2>
    <div id="Filtros">
    
        <asp:Label ID="lblFID" runat="server" Text="ID Proveedor: " CssClass="ControlesASP"></asp:Label>
        <asp:TextBox ID="txtFID" runat="server" CssClass="ControlesASP"></asp:TextBox>
        <asp:Label ID="lblFRazonSocial" runat="server" Text="Razon Social: " CssClass="ControlesASP"></asp:Label>
        <asp:TextBox ID="txtFRazonSocial" runat="server" CssClass="ControlesASP"></asp:TextBox>
        <asp:Label ID="lblFProvincia" runat="server" Text="Provincia: " CssClass="ControlesASP"></asp:Label>
        <asp:DropDownList ID="ddlFProvincia" runat="server" CssClass="ControlesASP" >
        </asp:DropDownList>
        <asp:Label ID="lblFLocalidad" runat="server" Text="Localidad: " CssClass="ControlesASP"></asp:Label>
        <asp:DropDownList ID="ddlFLocalidad" runat="server" CssClass="ControlesASP">
        </asp:DropDownList>
        <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" CssClass="Boton" />
        <asp:Button ID="btnQuitarFiltro" runat="server" Text="Quitar Filtros" CssClass="Boton" />
    
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoColPpalEmpleado" runat="server">
    <h1>Administrar Proveedores</h1>
    <div id="FormProveedores" class="Form">

    <div id="Administrar" title="Administrar">
           
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID_PROV" DataSourceID="proveedor" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ID_PROV" HeaderText="ID" ReadOnly="True" SortExpression="ID_PROV" />
                    <asp:BoundField DataField="RAZON_SOCIAL_PROV" HeaderText="RAZON_SOCIAL" SortExpression="RAZON_SOCIAL_PROV" />
                    <asp:BoundField DataField="DIRECCION_PROV" HeaderText="DIRECCION" SortExpression="DIRECCION_PROV" />
                    <asp:BoundField DataField="TELEFONO_PROV" HeaderText="TELEFONO" SortExpression="TELEFONO_PROV" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:SqlDataSource ID="proveedor" runat="server" ConnectionString="<%$ ConnectionStrings:FINAL_LABConnectionString %>" SelectCommand="SELECT [ID_PROV], [RAZON_SOCIAL_PROV], [DIRECCION_PROV], [TELEFONO_PROV] FROM [PROVEEDORES]"></asp:SqlDataSource>
           
            <asp:Label ID="lblID" runat="server" Text="ID: " CssClass="ControlesASP"></asp:Label>
            <asp:TextBox ID="txtID" runat="server" CssClass="ControlesASP"></asp:TextBox>
            <asp:Label ID="lblRazonSocial" runat="server" Text="Razon Social: " CssClass="ControlesASP"></asp:Label>
            <asp:TextBox ID="txtRazonSocial" runat="server" CssClass="ControlesASP"></asp:TextBox>
            <asp:Label ID="lblProvincia" runat="server" Text="Provincia: " CssClass="ControlesASP"></asp:Label>
            <asp:DropDownList ID="ddlProvincia" runat="server" CssClass="ControlesASP" >
            </asp:DropDownList>
            <asp:Label ID="lblLocalidad" runat="server" Text="Localidad: " CssClass="ControlesASP"></asp:Label>
            <asp:DropDownList ID="ddlLocalidad" runat="server" CssClass="ControlesASP">
            </asp:DropDownList>
            <asp:Label ID="lblDireccion" runat="server" Text="Direccion: " CssClass="ControlesASP"></asp:Label>
            <asp:TextBox ID="txtDireccion" runat="server" CssClass="ControlesASP"></asp:TextBox>
            <asp:Label ID="lblTelefono" runat="server" Text="Telefono:" CssClass="ControlesASP"></asp:Label>
            <asp:TextBox ID="txtTelefono" runat="server" CssClass="ControlesASP"></asp:TextBox>
            <asp:Button ID="btnAgregar" runat="server" Text="Agregar" CssClass="Boton"/>
            <asp:Button ID="btnEditar" runat="server" Text="Editar" CssClass="Boton"/>
            <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="Boton"/>
    </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContenidoColDerEmpleado" runat="server">
</asp:Content>
