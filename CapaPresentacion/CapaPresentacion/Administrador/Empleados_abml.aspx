<%@ Page Title="" Language="C#" MasterPageFile="~/Empleado/PaginaMaestraEmpleado.master" AutoEventWireup="true" CodeBehind="Empleados_abml.aspx.cs" Inherits="CapaPresentacion.Empleado.Empleados" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadEmpleado" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoColIzEmpleado" runat="server">
     <h2>Filtrar por:</h2>
    <div id="Filtros">
    
        <asp:Label ID="lblDNIF" runat="server" Text="DNI: " CssClass="ControlesASP"></asp:Label>
        <asp:TextBox ID="txtDNIF" runat="server" CssClass="ControlesASP"></asp:TextBox>
        <asp:Label ID="lblApellidos" runat="server" Text="Apellido: " CssClass="ControlesASP"></asp:Label>
        <asp:TextBox ID="txtApellidos" runat="server" CssClass="ControlesASP"></asp:TextBox>
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
     <h1>Administrar Empleados</h1>
   <div id="FormEmpleado" class="Form">

    <asp:GridView ID="gvwEmpleado" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID_EMPLE" DataSourceID="empleado" ForeColor="#333333" GridLines="None" AllowPaging="True">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="ID_EMPLE" HeaderText="ID" ReadOnly="True" SortExpression="ID_EMPLE" />
            <asp:BoundField DataField="NOMBRE_EMPLE" HeaderText="NOMBRE" SortExpression="NOMBRE_EMPLE" />
            <asp:BoundField DataField="APELLIDO_EMPLE" HeaderText="APELLIDO" SortExpression="APELLIDO_EMPLE" />
            <asp:BoundField DataField="DNI_EMPLE" HeaderText="DNI" SortExpression="DNI_EMPLE" />
            <asp:BoundField DataField="LEGAJO_EMPLE" HeaderText="LEGAJO" SortExpression="LEGAJO_EMPLE" />
            <asp:BoundField DataField="TELEFONO_EMPLE" HeaderText="TELEFONO" SortExpression="TELEFONO_EMPLE" />
            <asp:BoundField DataField="DIRECCION_EMPLE" HeaderText="DIRECCION" SortExpression="DIRECCION_EMPLE" />
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
    
       <asp:SqlDataSource ID="empleado" runat="server" ConnectionString="<%$ ConnectionStrings:FINAL_LABConnectionString %>" SelectCommand="SELECT [ID_EMPLE], [NOMBRE_EMPLE], [APELLIDO_EMPLE], [DNI_EMPLE], [LEGAJO_EMPLE], [TELEFONO_EMPLE], [DIRECCION_EMPLE] FROM [EMPLEADOS]"></asp:SqlDataSource>
    
    <div id="Administrar" title="Administrar">
            <asp:Label ID="lblDNI" runat="server" Text="DNI: " CssClass="ControlesASP"></asp:Label>
            <asp:TextBox ID="txtDNI" runat="server" CssClass="ControlesASP"></asp:TextBox>
            <asp:Label ID="lblID" runat="server" Text="ID: " CssClass="ControlesASP"></asp:Label>
            <asp:TextBox ID="txtID" runat="server" CssClass="ControlesASP"></asp:TextBox>
            <asp:Label ID="lblLegajo" runat="server" Text="Legajo: " CssClass="ControlesASP"></asp:Label>
            <asp:TextBox ID="txtLegajo" runat="server" CssClass="ControlesASP"></asp:TextBox>
            <asp:Label ID="lblNombre" runat="server" Text="Nombre:" CssClass="ControlesASP"></asp:Label>
            <asp:TextBox ID="txtNombre" runat="server" CssClass="ControlesASP"></asp:TextBox>
            <asp:Label ID="lblApellido" runat="server" Text="Apellido:" CssClass="ControlesASP"></asp:Label>
            <asp:TextBox ID="txtApellido" runat="server" CssClass="ControlesASP"></asp:TextBox>
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
