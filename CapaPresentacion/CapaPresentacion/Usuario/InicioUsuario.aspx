<%@ Page Title="" Language="C#" MasterPageFile="~/Usuario/PaginaMaestraUsuarios.master" AutoEventWireup="true" CodeBehind="InicioUsuario.aspx.cs" Inherits="CapaPresentacion.Usuario.InicioUsuario" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContenidoHead" runat="server">
    <title>-Inicio</title>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoColIzUsuario" runat="server">
     
    <div id="Filtros">
    
    <h2>Filtrar por:</h2>
    
        <asp:CheckBox ID="CbxMarca" runat="server" Text="Marca" CssClass="ControlesASP"/>
        <asp:DropDownList ID="ddlMarca" runat="server"  CssClass="ControlesASP" OnSelectedIndexChanged="ddlMarca_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
    
        <asp:CheckBox ID="CbxModelo" runat="server" Text="Modelo" CssClass="ControlesASP" AutoPostBack="True" OnCheckedChanged="CbxModelo_CheckedChanged" />
        <asp:DropDownList ID="ddlModelo" runat="server" CssClass="ControlesASP"></asp:DropDownList>
      
        <asp:CheckBox ID="CbxPrecio" runat="server" Text="Precio" CssClass="ControlesASP" />
        <asp:DropDownList ID="ddlPrecio" runat="server"> </asp:DropDownList>
        <asp:TextBox ID="txtPrecio" runat="server" CssClass="ControlesASP"></asp:TextBox>
    
    <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" CssClass="Boton" OnClick="btnFiltrar_Click"/>
    <asp:Button ID="btnQuitarFiltro" runat="server" Text="Quitar Filtro" CssClass="Boton" OnClick="btnQuitarFiltro_Click"/>
        <asp:Label ID="lblFiltro" runat="server" Text="Estado Filtro"></asp:Label>
        </div>
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoColPpalUsuarios" runat="server">
    <h3>Celulares:</h3>
    <div id="InicioUsuario" class="Form">
    
        <asp:ListView ID="lvwCelulares" runat="server" GroupItemCount="2">
        <AlternatingItemTemplate>
            <td runat="server" style="background-color: #FFFFFF;color: #284775;">Modelo:
                <asp:Label ID="ID_MODELOLabel" runat="server" Text='<%# Eval("Modelo") %>' />
                <br />ID_MARCA_CEL:
                <asp:Label ID="ID_MARCA_CELLabel" runat="server" Text='<%# Eval("Marca") %>' />
                <br />DESCRIPCION_CEL:
                <asp:Label ID="DESCRIPCION_CELLabel" runat="server" Text='<%# Eval("Descripcion") %>' />
                <br />PRECIO_UNITARIO_CEL:
                <asp:Label ID="PRECIO_UNITARIO_CELLabel" runat="server" Text='<%# Eval("Precio") %>' />
                <br /></td>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <td runat="server" style="background-color: #999999;">Modelo:
                <asp:Label ID="ID_MODELOLabel1" runat="server" Text='<%# Eval("Modelo") %>' />
                <br />ID_MARCA_CEL:
                <asp:TextBox ID="ID_MARCA_CELTextBox" runat="server" Text='<%# Bind("Marca") %>' />
                <br />DESCRIPCION_CEL:
                <asp:TextBox ID="DESCRIPCION_CELTextBox" runat="server" Text='<%# Bind("Descripcion") %>' />
                <br />PRECIO_UNITARIO_CEL:
                <asp:TextBox ID="PRECIO_UNITARIO_CELTextBox" runat="server" Text='<%# Bind("Precio") %>' />
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
            <td runat="server" style="">Modelo:
                <asp:TextBox ID="ID_MODELOTextBox" runat="server" Text='<%# Bind("Modelo") %>' />
                <br />ID_MARCA_CEL:
                <asp:TextBox ID="ID_MARCA_CELTextBox" runat="server" Text='<%# Bind("Marca") %>' />
                <br />DESCRIPCION_CEL:
                <asp:TextBox ID="DESCRIPCION_CELTextBox" runat="server" Text='<%# Bind("Descripcion") %>' />
                <br />PRECIO_UNITARIO_CEL:
                <asp:TextBox ID="PRECIO_UNITARIO_CELTextBox" runat="server" Text='<%# Bind("Precio") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                <br />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
                <br />
                </td>
        </InsertItemTemplate>
        <ItemTemplate>
            <td runat="server" style="background-color: #E0FFFF;color: #333333;">Modelo:
                <asp:Label ID="ID_MODELOLabel" runat="server" Text='<%# Eval("Modelo") %>' />
                <br />ID_MARCA_CEL:
                <asp:Label ID="ID_MARCA_CELLabel" runat="server" Text='<%# Eval("Marca") %>' />
                <br />DESCRIPCION_CEL:
                <asp:Label ID="DESCRIPCION_CELLabel" runat="server" Text='<%# Eval("Descripcion") %>' />
                <br />PRECIO_UNITARIO_CEL:
                <asp:Label ID="PRECIO_UNITARIO_CELLabel" runat="server" Text='<%# Eval("Precio") %>' />
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
            <td runat="server" style="background-color: #E2DED6;font-weight: bold;color: #333333;">Modelo:
                <asp:Label ID="ID_MODELOLabel" runat="server" Text='<%# Eval("Modelo") %>' />
                <br />ID_MARCA_CEL:
                <asp:Label ID="ID_MARCA_CELLabel" runat="server" Text='<%# Eval("Marca") %>' />
                <br />DESCRIPCION_CEL:
                <asp:Label ID="DESCRIPCION_CELLabel" runat="server" Text='<%# Eval("Descripcion") %>' />
                <br />PRECIO_UNITARIO_CEL:
                <asp:Label ID="PRECIO_UNITARIO_CELLabel" runat="server" Text='<%# Eval("Precio") %>' />
                <br /></td>
        </SelectedItemTemplate>
        </asp:ListView>
        
    </div>
</asp:Content>


<asp:Content ID="Content4" ContentPlaceHolderID="ContenidoColDerUsuario" runat="server">

</asp:Content>
