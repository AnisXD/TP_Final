<%@ Page Title="" Language="C#" MasterPageFile="~/Empleado/PaginaMaestraEmpleado.master" AutoEventWireup="true" CodeBehind="Celulares.aspx.cs" Inherits="CapaPresentacion.Empleado.Celulares" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadEmpleado" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoColIzEmpleado" runat="server">
     <br />
    <h2>Filtrar por:</h2>
    <asp:Label ID="lblMarca" runat="server" Text="Marca: " CssClass="ControlesASP"></asp:Label>
    <asp:DropDownList ID="ddlMarca" runat="server"  CssClass="ControlesASP"></asp:DropDownList>
    <asp:Label ID="lblModelo" runat="server" Text="Modelo: " CssClass="ControlesASP"></asp:Label>
    <asp:DropDownList ID="ddlModelo" runat="server" CssClass="ControlesASP"></asp:DropDownList>
    <asp:Label ID="lblProveedor" runat="server" Text="Proveedor:" CssClass="ControlesASP"></asp:Label>
    <asp:DropDownList ID="ddlProveedor" runat="server" CssClass="ControlesASP"></asp:DropDownList>
    <asp:Panel ID="Panel1" runat="server">
        <asp:Label ID="lblPrecio" runat="server" Text="Precio: " CssClass="ControlesASP"></asp:Label>
        <asp:RadioButton ID="Mayor" runat="server" Text="Mayor a:" CssClass="ControlesASP"/>
        <asp:RadioButton ID="Menor" runat="server" Text="Menor a:" CssClass="ControlesASP"/>
        <asp:RadioButton ID="Igual" runat="server" Text="Igual a:" CssClass="ControlesASP"/>
        <asp:TextBox ID="TextBox4" runat="server" CssClass="ControlesASP"></asp:TextBox>
    </asp:Panel>
    <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" CssClass="Boton"/>
    <asp:Button ID="btnQuitarFiltro" runat="server" Text="Quitar Filtro" CssClass="Boton"/>
    <br />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoColPpalEmpleado" runat="server">
    <h1>Celulares</h1>
    <div id="FormCelulares" class="Form">
    
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ID_MODELO" DataSourceID="SqlDataSource1" Font-Size="10pt">
                <Columns>
                    <asp:BoundField DataField="ID_MODELO" HeaderText="MODELO" ReadOnly="True" SortExpression="ID_MODELO" />
                    <asp:BoundField DataField="ID_MARCA_CEL" HeaderText="MARCA" SortExpression="ID_MARCA_CEL" />
                    <asp:BoundField DataField="ID_PROVEEDOR_CEL" HeaderText="PROVEEDOR" SortExpression="ID_PROVEEDOR_CEL" />
                    <asp:BoundField DataField="DESCRIPCION_CEL" HeaderText="DESCRIPCION" SortExpression="DESCRIPCION_CEL" />
                    <asp:BoundField DataField="PRECIO_UNITARIO_CEL" HeaderText="PRECIO" SortExpression="PRECIO_UNITARIO_CEL" />
                    <asp:BoundField DataField="UBICACION_IMAGEN_CEL" HeaderText="IMAGEN" SortExpression="UBICACION_IMAGEN_CEL" />
                </Columns>

            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FINAL_LABConnectionString2 %>" SelectCommand="SELECT [ID_MODELO], [ID_MARCA_CEL], [ID_PROVEEDOR_CEL], [DESCRIPCION_CEL], [PRECIO_UNITARIO_CEL], [UBICACION_IMAGEN_CEL] FROM [CELULARES]"></asp:SqlDataSource>

        <div id="AdministrarCelulares" title="Administrar">
            
            <asp:Label ID="lblModelo2" runat="server" Text="Modelo: " CssClass="ControlesASP"></asp:Label>
            <asp:TextBox ID="txtModelo2" runat="server" CssClass="ControlesASP"></asp:TextBox>
            <asp:Label ID="lblMarca2" runat="server" Text="Marca: " CssClass="ControlesASP"></asp:Label>
            <asp:DropDownList ID="ddlMarca2" runat="server" CssClass="ControlesASP">
            </asp:DropDownList>
            <asp:Label ID="lblProveedor2" runat="server" Text="Proveedor: " CssClass="ControlesASP"></asp:Label>
            <asp:DropDownList ID="ddlProveedor2" runat="server" CssClass="ControlesASP">
            </asp:DropDownList>
            <asp:Label ID="lblDescripcion" runat="server" Text="Descripcion: " CssClass="ControlesASP"></asp:Label>
            <asp:TextBox ID="txtDescripcion" runat="server" CssClass="ControlesASP"></asp:TextBox>
            <asp:Label ID="lblPrecio2" runat="server" Text="Precio:" CssClass="ControlesASP"></asp:Label>
            <asp:TextBox ID="txtPrecio2" runat="server" CssClass="ControlesASP"></asp:TextBox>
            <asp:Label ID="lblImagen" runat="server" Text="Imagen:" CssClass="ControlesASP"></asp:Label>
            <asp:FileUpload ID="fupImagen" runat="server" CssClass="ControlesASP" />
            <asp:Button ID="btnAgregar" runat="server" Text="Agregar" CssClass="Boton"/>
            <asp:Button ID="btnEditar" runat="server" Text="Editar" CssClass="Boton"/>
            <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="Boton"/>


        </div>

       

        </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContenidoColDerEmpleado" runat="server">
</asp:Content>
