<%@ Page Title="" Language="C#" MasterPageFile="~/Usuario/PaginaMaestraUsuarios.master" AutoEventWireup="true" CodeBehind="InicioUsuario.aspx.cs" Inherits="CapaPresentacion.Usuario.InicioUsuario" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContenidoHead" runat="server">
    <title>-Inicio</title>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoColIzUsuario" runat="server">

</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoColPpalUsuarios" runat="server">
    <h3>Bienvenido Usuario...</h3>
    <p>Primero debe registrarse o loguearse antes de comprar</p>
    <p>&nbsp;</p>
    <p>
        <asp:Label ID="lblFiltrarpor" runat="server" Text="Filtrar por: "></asp:Label>
    </p>
    <p>&nbsp;</p>
    <p>
        <asp:Label ID="lblMarca" runat="server" Text="Marca: "></asp:Label>
        <asp:TextBox ID="tbMarca" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblModelo" runat="server" Text="Modelo: "></asp:Label>
        <asp:TextBox ID="tbModelo" runat="server"></asp:TextBox>
    </p>
    <p>&nbsp;</p>
    <asp:Panel ID="Panel1" runat="server" Height="35px">
        Precio:&nbsp;&nbsp;&nbsp;
        <asp:RadioButton ID="rbmayor" runat="server" Text="Mayor a: " />
        <asp:RadioButton ID="rbmenor" runat="server" Text="Menor a: " />
        <asp:RadioButton ID="rbigual" runat="server" Text="Igual a: " />
        &nbsp;&nbsp;
        <asp:TextBox ID="tbdesigualdades" runat="server"></asp:TextBox>
    </asp:Panel>
    <p>
        &nbsp;</p>
    <p>
        <asp:Button ID="bttnFiltrar" runat="server" Text="Filtrar" />
        <asp:Button ID="bttnQuitarFiltro" runat="server" Text="QuitarFiltro" />
    </p>
    <p>&nbsp;</p>
    <p>
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID_MODELO" DataSourceID="SqlDataSource1" GroupItemCount="3">
            <AlternatingItemTemplate>
                <td runat="server" style="background-color:#FFF8DC;">IMAGEN_CEL:
                    <asp:Label ID="IMAGEN_CELLabel" runat="server" Text='<%# Eval("IMAGEN_CEL") %>' />
                    <br />PRECIO_UNITARIO_CEL:
                    <asp:Label ID="PRECIO_UNITARIO_CELLabel" runat="server" Text='<%# Eval("PRECIO_UNITARIO_CEL") %>' />
                    <br />DESCRIPCION_CEL:
                    <asp:Label ID="DESCRIPCION_CELLabel" runat="server" Text='<%# Eval("DESCRIPCION_CEL") %>' />
                    <br />ID_MARCA_CEL:
                    <asp:Label ID="ID_MARCA_CELLabel" runat="server" Text='<%# Eval("ID_MARCA_CEL") %>' />
                    <br />ID_MODELO:
                    <asp:Label ID="ID_MODELOLabel" runat="server" Text='<%# Eval("ID_MODELO") %>' />
                    <br /></td>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <td runat="server" style="background-color:#008A8C;color: #FFFFFF;">IMAGEN_CEL:
                    <asp:TextBox ID="IMAGEN_CELTextBox" runat="server" Text='<%# Bind("IMAGEN_CEL") %>' />
                    <br />
                    PRECIO_UNITARIO_CEL:
                    <asp:TextBox ID="PRECIO_UNITARIO_CELTextBox" runat="server" Text='<%# Bind("PRECIO_UNITARIO_CEL") %>' />
                    <br />
                    DESCRIPCION_CEL:
                    <asp:TextBox ID="DESCRIPCION_CELTextBox" runat="server" Text='<%# Bind("DESCRIPCION_CEL") %>' />
                    <br />
                    ID_MARCA_CEL:
                    <asp:TextBox ID="ID_MARCA_CELTextBox" runat="server" Text='<%# Bind("ID_MARCA_CEL") %>' />
                    <br />
                    ID_MODELO:
                    <asp:Label ID="ID_MODELOLabel1" runat="server" Text='<%# Eval("ID_MODELO") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                    <br /></td>
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
                <td runat="server" style="">IMAGEN_CEL:
                    <asp:TextBox ID="IMAGEN_CELTextBox" runat="server" Text='<%# Bind("IMAGEN_CEL") %>' />
                    <br />PRECIO_UNITARIO_CEL:
                    <asp:TextBox ID="PRECIO_UNITARIO_CELTextBox" runat="server" Text='<%# Bind("PRECIO_UNITARIO_CEL") %>' />
                    <br />DESCRIPCION_CEL:
                    <asp:TextBox ID="DESCRIPCION_CELTextBox" runat="server" Text='<%# Bind("DESCRIPCION_CEL") %>' />
                    <br />ID_MARCA_CEL:
                    <asp:TextBox ID="ID_MARCA_CELTextBox" runat="server" Text='<%# Bind("ID_MARCA_CEL") %>' />
                    <br />ID_MODELO:
                    <asp:TextBox ID="ID_MODELOTextBox" runat="server" Text='<%# Bind("ID_MODELO") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
                    <br /></td>
            </InsertItemTemplate>
            <ItemTemplate>
                <td runat="server" style="background-color:#DCDCDC;color: #000000;">IMAGEN_CEL:
                    <asp:Label ID="IMAGEN_CELLabel" runat="server" Text='<%# Eval("IMAGEN_CEL") %>' />
                    <br />PRECIO_UNITARIO_CEL:
                    <asp:Label ID="PRECIO_UNITARIO_CELLabel" runat="server" Text='<%# Eval("PRECIO_UNITARIO_CEL") %>' />
                    <br />DESCRIPCION_CEL:
                    <asp:Label ID="DESCRIPCION_CELLabel" runat="server" Text='<%# Eval("DESCRIPCION_CEL") %>' />
                    <br />ID_MARCA_CEL:
                    <asp:Label ID="ID_MARCA_CELLabel" runat="server" Text='<%# Eval("ID_MARCA_CEL") %>' />
                    <br />ID_MODELO:
                    <asp:Label ID="ID_MODELOLabel" runat="server" Text='<%# Eval("ID_MODELO") %>' />
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
                        <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
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
                <td runat="server" style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">IMAGEN_CEL:
                    <asp:Label ID="IMAGEN_CELLabel" runat="server" Text='<%# Eval("IMAGEN_CEL") %>' />
                    <br />PRECIO_UNITARIO_CEL:
                    <asp:Label ID="PRECIO_UNITARIO_CELLabel" runat="server" Text='<%# Eval("PRECIO_UNITARIO_CEL") %>' />
                    <br />DESCRIPCION_CEL:
                    <asp:Label ID="DESCRIPCION_CELLabel" runat="server" Text='<%# Eval("DESCRIPCION_CEL") %>' />
                    <br />ID_MARCA_CEL:
                    <asp:Label ID="ID_MARCA_CELLabel" runat="server" Text='<%# Eval("ID_MARCA_CEL") %>' />
                    <br />ID_MODELO:
                    <asp:Label ID="ID_MODELOLabel" runat="server" Text='<%# Eval("ID_MODELO") %>' />
                    <br /></td>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FINAL_LABConnectionString %>" SelectCommand="SELECT [IMAGEN_CEL], [PRECIO_UNITARIO_CEL], [DESCRIPCION_CEL], [ID_MARCA_CEL], [ID_MODELO] FROM [CELULARES]"></asp:SqlDataSource>
    </p>

</asp:Content>


<asp:Content ID="Content4" ContentPlaceHolderID="ContenidoColDerUsuario" runat="server">

</asp:Content>
