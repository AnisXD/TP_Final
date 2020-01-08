<%@ Page Title="" Language="C#" MasterPageFile="~/Empleado/PaginaMaestraEmpleado.master" AutoEventWireup="true" CodeBehind="Celulares.aspx.cs" Inherits="CapaPresentacion.Empleado.Celulares" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadEmpleado" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoColIzEmpleado" runat="server">
    
    <div id="Filtros">
    
    <h2>Filtrar por:</h2>
    <asp:Label ID="lblMarca" runat="server" Text="Marca: " CssClass="ControlesASP"></asp:Label>
    <asp:DropDownList ID="ddlMarca" runat="server"  CssClass="ControlesASP" DataSourceID="marca" DataTextField="NOMBRE_MARCA" DataValueField="ID_MARCA"></asp:DropDownList>
    <asp:SqlDataSource ID="marca" runat="server" ConnectionString="<%$ ConnectionStrings:FINAL_LABConnectionString2 %>" SelectCommand="SELECT [ID_MARCA], [NOMBRE_MARCA] FROM [MARCAS]"></asp:SqlDataSource>
    <asp:Label ID="lblModelo" runat="server" Text="Modelo: " CssClass="ControlesASP"></asp:Label>
    <asp:DropDownList ID="ddlModelo" runat="server" CssClass="ControlesASP" DataSourceID="modelos" DataTextField="ID_MODELO" DataValueField="ID_MARCA_CEL"></asp:DropDownList>
    <asp:SqlDataSource ID="modelos" runat="server" ConnectionString="<%$ ConnectionStrings:FINAL_LABConnectionString2 %>" SelectCommand="SELECT [ID_MODELO], [ID_MARCA_CEL] FROM [CELULARES]"></asp:SqlDataSource>
    <asp:Panel ID="pnlFiltrarPrecio" runat="server">
        <asp:Label ID="lblPrecio" runat="server" Text="Precio: " CssClass="ControlesASP"></asp:Label>
        <asp:RadioButton ID="Mayor" runat="server" Text="Mayor a:" CssClass="ControlesASP"/>
        <asp:RadioButton ID="Menor" runat="server" Text="Menor a:" CssClass="ControlesASP"/>
        <asp:RadioButton ID="Igual" runat="server" Text="Igual a:" CssClass="ControlesASP"/>
        <asp:TextBox ID="txtPrecio" runat="server" CssClass="ControlesASP"></asp:TextBox>
    </asp:Panel>
    <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" CssClass="Boton"/>
    <asp:Button ID="btnQuitarFiltro" runat="server" Text="Quitar Filtro" CssClass="Boton"/>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoColPpalEmpleado" runat="server">
    
    <h1>Celulares</h1>
    <div id="FormCelulares" class="Form">
    
            <asp:GridView ID="gvwCelulares" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ID_MODELO" DataSourceID="SqlDataSource1" Font-Size="10pt" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ID_MODELO" HeaderText="MODELO" ReadOnly="True" SortExpression="ID_MODELO" />
                    <asp:BoundField DataField="ID_MARCA_CEL" HeaderText="MARCA" SortExpression="ID_MARCA_CEL" />
                    <asp:BoundField DataField="ID_PROVEEDOR_CEL" HeaderText="PROVEEDOR" SortExpression="ID_PROVEEDOR_CEL" />
                    <asp:BoundField DataField="DESCRIPCION_CEL" HeaderText="DESCRIPCION" SortExpression="DESCRIPCION_CEL" />
                    <asp:BoundField DataField="PRECIO_UNITARIO_CEL" HeaderText="PRECIO" SortExpression="PRECIO_UNITARIO_CEL" />
                    <asp:BoundField DataField="UBICACION_IMAGEN_CEL" HeaderText="IMAGEN" SortExpression="UBICACION_IMAGEN_CEL" />
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

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FINAL_LABConnectionString2 %>" SelectCommand="SELECT [ID_MODELO], [ID_MARCA_CEL], [ID_PROVEEDOR_CEL], [DESCRIPCION_CEL], [PRECIO_UNITARIO_CEL], [UBICACION_IMAGEN_CEL] FROM [CELULARES]"></asp:SqlDataSource>

        <div id="Administrar" title="Administrar">
            
            <asp:Label ID="lblTotalRegistros" runat="server"></asp:Label>
            
            <asp:Label ID="lblModelo2" runat="server" Text="Modelo: " CssClass="ControlesASP"></asp:Label>
            <asp:TextBox ID="txtModelo2" runat="server" CssClass="ControlesASP"></asp:TextBox>
            <asp:Label ID="lblMarca2" runat="server" Text="Marca: " CssClass="ControlesASP"></asp:Label>
            <asp:DropDownList ID="ddlMarca2" runat="server" CssClass="ControlesASP" DataSourceID="marcas" DataTextField="NOMBRE_MARCA" DataValueField="ID_MARCA">
            </asp:DropDownList>
            <asp:SqlDataSource ID="marcas" runat="server" ConnectionString="<%$ ConnectionStrings:FINAL_LABConnectionString2 %>" SelectCommand="SELECT [ID_MARCA], [NOMBRE_MARCA] FROM [MARCAS]"></asp:SqlDataSource>
            <asp:Label ID="lblProveedor2" runat="server" Text="Proveedor: " CssClass="ControlesASP"></asp:Label>
            <asp:DropDownList ID="ddlProveedor2" runat="server" CssClass="ControlesASP" DataSourceID="proveedor" DataTextField="RAZON_SOCIAL_PROV" DataValueField="ID_PROV">
            </asp:DropDownList>
            <asp:SqlDataSource ID="proveedor" runat="server" ConnectionString="<%$ ConnectionStrings:FINAL_LABConnectionString2 %>" SelectCommand="SELECT [RAZON_SOCIAL_PROV], [ID_PROV] FROM [PROVEEDORES]"></asp:SqlDataSource>
            <asp:Label ID="lblDescripcion" runat="server" Text="Descripcion: " CssClass="ControlesASP"></asp:Label>
            <asp:TextBox ID="txtDescripcion" runat="server" CssClass="ControlesASP"></asp:TextBox>
            <asp:Label ID="lblPrecio2" runat="server" Text="Precio:" CssClass="ControlesASP"></asp:Label>
            <asp:TextBox ID="txtPrecio2" runat="server" CssClass="ControlesASP"></asp:TextBox>
            <asp:Label ID="lblImagen" runat="server" Text="Imagen:" CssClass="ControlesASP"></asp:Label>
            <asp:FileUpload ID="fupImagen" runat="server" CssClass="ControlesASP" />
            <br />
            <asp:Label ID="lblEstado" runat="server"></asp:Label>
            <asp:Button ID="btnAgregar" runat="server" Text="Agregar" CssClass="Boton"/>
            <asp:Button ID="btnEditar" runat="server" Text="Editar" CssClass="Boton"/>
            <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="Boton"/>

        </div>

        </div>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContenidoColDerEmpleado" runat="server">
</asp:Content>
