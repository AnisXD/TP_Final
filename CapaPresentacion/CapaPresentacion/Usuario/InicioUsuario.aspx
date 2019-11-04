<%@ Page Title="" Language="C#" MasterPageFile="~/Usuario/PaginaMaestraUsuarios.master" AutoEventWireup="true" CodeBehind="InicioUsuario.aspx.cs" Inherits="CapaPresentacion.Usuario.InicioUsuario" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContenidoHead" runat="server">
    <title>-Inicio</title>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoColIzUsuario" runat="server">
    <div id="Filtros">
    <br />
    <h2>Filtrar por:</h2>
    <asp:Label ID="lblMarca" runat="server" Text="Marca: " CssClass="ControlesASP"></asp:Label>
    <asp:DropDownList ID="ddlMarca" runat="server"  CssClass="ControlesASP" DataSourceID="marca" DataTextField="NOMBRE_MARCA" DataValueField="ID_MARCA"></asp:DropDownList>
    <asp:SqlDataSource ID="marca" runat="server" ConnectionString="<%$ ConnectionStrings:FINAL_LABConnectionString2 %>" SelectCommand="SELECT [ID_MARCA], [NOMBRE_MARCA] FROM [MARCAS]"></asp:SqlDataSource>
    <asp:Label ID="lblModelo" runat="server" Text="Modelo: " CssClass="ControlesASP"></asp:Label>
    <asp:DropDownList ID="ddlModelo" runat="server" CssClass="ControlesASP" DataSourceID="modelos" DataTextField="ID_MODELO" DataValueField="ID_MARCA_CEL"></asp:DropDownList>
    <asp:SqlDataSource ID="modelos" runat="server" ConnectionString="<%$ ConnectionStrings:FINAL_LABConnectionString2 %>" SelectCommand="SELECT [ID_MODELO], [ID_MARCA_CEL] FROM [CELULARES]"></asp:SqlDataSource>
    <asp:Label ID="lblProveedor" runat="server" Text="Proveedor:" CssClass="ControlesASP"></asp:Label>
    <asp:DropDownList ID="ddlProveedor" runat="server" CssClass="ControlesASP" DataSourceID="proveedores" DataTextField="RAZON_SOCIAL_PROV" DataValueField="ID_PROV"></asp:DropDownList>
    <asp:SqlDataSource ID="proveedores" runat="server" ConnectionString="<%$ ConnectionStrings:FINAL_LABConnectionString2 %>" SelectCommand="SELECT [ID_PROV], [RAZON_SOCIAL_PROV] FROM [PROVEEDORES]"></asp:SqlDataSource>
    <asp:Panel ID="pnlFiltrarPrecio" runat="server">
        <asp:Label ID="lblPrecio" runat="server" Text="Precio: " CssClass="ControlesASP"></asp:Label>
        <asp:RadioButton ID="Mayor" runat="server" Text="Mayor a:" CssClass="ControlesASP"/>
        <asp:RadioButton ID="Menor" runat="server" Text="Menor a:" CssClass="ControlesASP"/>
        <asp:RadioButton ID="Igual" runat="server" Text="Igual a:" CssClass="ControlesASP"/>
        <asp:TextBox ID="txtPrecio" runat="server" CssClass="ControlesASP"></asp:TextBox>
    </asp:Panel>
    <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" CssClass="Boton"/>
    <asp:Button ID="btnQuitarFiltro" runat="server" Text="Quitar Filtro" CssClass="Boton"/>
    <br />
    </div>
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoColPpalUsuarios" runat="server">
  <h3>Celulares:</h3>
    <div id="InicioUsuario" class="Form">
    
        <asp:ListView ID="lvwCelulares" runat="server" DataKeyNames="ID_MODELO" DataSourceID="celulares" GroupItemCount="2">
        <AlternatingItemTemplate>
            <td runat="server" style="background-color: #FFFFFF;color: #284775;">ID_MODELO:
                <asp:Label ID="ID_MODELOLabel" runat="server" Text='<%# Eval("ID_MODELO") %>' />
                <br />ID_MARCA_CEL:
                <asp:Label ID="ID_MARCA_CELLabel" runat="server" Text='<%# Eval("ID_MARCA_CEL") %>' />
                <br />DESCRIPCION_CEL:
                <asp:Label ID="DESCRIPCION_CELLabel" runat="server" Text='<%# Eval("DESCRIPCION_CEL") %>' />
                <br />PRECIO_UNITARIO_CEL:
                <asp:Label ID="PRECIO_UNITARIO_CELLabel" runat="server" Text='<%# Eval("PRECIO_UNITARIO_CEL") %>' />
                <br /></td>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <td runat="server" style="background-color: #999999;">ID_MODELO:
                <asp:Label ID="ID_MODELOLabel1" runat="server" Text='<%# Eval("ID_MODELO") %>' />
                <br />ID_MARCA_CEL:
                <asp:TextBox ID="ID_MARCA_CELTextBox" runat="server" Text='<%# Bind("ID_MARCA_CEL") %>' />
                <br />DESCRIPCION_CEL:
                <asp:TextBox ID="DESCRIPCION_CELTextBox" runat="server" Text='<%# Bind("DESCRIPCION_CEL") %>' />
                <br />PRECIO_UNITARIO_CEL:
                <asp:TextBox ID="PRECIO_UNITARIO_CELTextBox" runat="server" Text='<%# Bind("PRECIO_UNITARIO_CEL") %>' />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                <br />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                <br />
                </td>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td>No se han devuelto datos.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <EmptyItemTemplate>
<td runat="server" />
        </EmptyItemTemplate>
        <GroupTemplate>
            <tr id="itemPlaceholderContainer" runat="server">
                <td id="itemPlaceholder" runat="server"></td>
            </tr>
        </GroupTemplate>
        <InsertItemTemplate>
            <td runat="server" style="">ID_MODELO:
                <asp:TextBox ID="ID_MODELOTextBox" runat="server" Text='<%# Bind("ID_MODELO") %>' />
                <br />ID_MARCA_CEL:
                <asp:TextBox ID="ID_MARCA_CELTextBox" runat="server" Text='<%# Bind("ID_MARCA_CEL") %>' />
                <br />DESCRIPCION_CEL:
                <asp:TextBox ID="DESCRIPCION_CELTextBox" runat="server" Text='<%# Bind("DESCRIPCION_CEL") %>' />
                <br />PRECIO_UNITARIO_CEL:
                <asp:TextBox ID="PRECIO_UNITARIO_CELTextBox" runat="server" Text='<%# Bind("PRECIO_UNITARIO_CEL") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                <br />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
                <br />
                </td>
        </InsertItemTemplate>
        <ItemTemplate>
            <td runat="server" style="background-color: #E0FFFF;color: #333333;">ID_MODELO:
                <asp:Label ID="ID_MODELOLabel" runat="server" Text='<%# Eval("ID_MODELO") %>' />
                <br />ID_MARCA_CEL:
                <asp:Label ID="ID_MARCA_CELLabel" runat="server" Text='<%# Eval("ID_MARCA_CEL") %>' />
                <br />DESCRIPCION_CEL:
                <asp:Label ID="DESCRIPCION_CELLabel" runat="server" Text='<%# Eval("DESCRIPCION_CEL") %>' />
                <br />PRECIO_UNITARIO_CEL:
                <asp:Label ID="PRECIO_UNITARIO_CELLabel" runat="server" Text='<%# Eval("PRECIO_UNITARIO_CEL") %>' />
                <br /></td>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr id="groupPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <td runat="server" style="background-color: #E2DED6;font-weight: bold;color: #333333;">ID_MODELO:
                <asp:Label ID="ID_MODELOLabel" runat="server" Text='<%# Eval("ID_MODELO") %>' />
                <br />ID_MARCA_CEL:
                <asp:Label ID="ID_MARCA_CELLabel" runat="server" Text='<%# Eval("ID_MARCA_CEL") %>' />
                <br />DESCRIPCION_CEL:
                <asp:Label ID="DESCRIPCION_CELLabel" runat="server" Text='<%# Eval("DESCRIPCION_CEL") %>' />
                <br />PRECIO_UNITARIO_CEL:
                <asp:Label ID="PRECIO_UNITARIO_CELLabel" runat="server" Text='<%# Eval("PRECIO_UNITARIO_CEL") %>' />
                <br /></td>
        </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="celulares" runat="server" ConnectionString="<%$ ConnectionStrings:FINAL_LABConnectionString %>" SelectCommand="SELECT [ID_MODELO], [ID_MARCA_CEL], [DESCRIPCION_CEL], [PRECIO_UNITARIO_CEL] FROM [CELULARES]"></asp:SqlDataSource>
        
    </div>
</asp:Content>


<asp:Content ID="Content4" ContentPlaceHolderID="ContenidoColDerUsuario" runat="server">

</asp:Content>
