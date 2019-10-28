<%@ Page Title="" Language="C#" MasterPageFile="~/Usuario/PaginaMaestraUsuarios.master" AutoEventWireup="true" CodeBehind="InicioUsuario.aspx.cs" Inherits="CapaPresentacion.Usuario.InicioUsuario" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContenidoHead" runat="server">
    <title>-Inicio</title>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoColIzUsuario" runat="server">

</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoColPpalUsuarios" runat="server">
    <div id="InicioUsuario" class="Form">
    <h3>Bienvenido...</h3>
    <p>&nbsp;</p>
    <p>
        <asp:Label ID="lblFiltrarpor" runat="server" Text="Filtrar por: "></asp:Label>
    </p>
    <p>&nbsp;</p>
    <p>
        <asp:Label ID="lblMarca" runat="server" Text="Marca: "></asp:Label>
        <asp:TextBox ID="tbMarca" runat="server"></asp:TextBox>
    </p>
        <p>
        <asp:Label ID="lblModelo" runat="server" Text="Modelo: "></asp:Label>
        <asp:TextBox ID="tbModelo" runat="server"></asp:TextBox>
    </p>
    <p>&nbsp;</p>
    <asp:Panel ID="Panel1" runat="server" Height="35px">
        Precio:
        <asp:RadioButton ID="rbmayor" runat="server" Text="Mayor a: " />
        <asp:RadioButton ID="rbmenor" runat="server" Text="Menor a: " />
        <asp:RadioButton ID="rbigual" runat="server" Text="Igual a: " />
        <asp:TextBox ID="tbdesigualdades" runat="server"></asp:TextBox>
    </asp:Panel>
    <p>&nbsp;</p>
    <p>
        <asp:Button ID="bttnFiltrar" runat="server" Text="Filtrar" />
        <asp:Button ID="bttnQuitarFiltro" runat="server" Text="QuitarFiltro" />
    </p>
    <p>&nbsp;</p>
    <p>
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID_MODELO" DataSourceID="SqlDataSource2">
            <AlternatingItemTemplate>
                <td runat="server" style="background-color: #FFFFFF;color: #284775;">ID_MODELO:
                    <asp:Label ID="ID_MODELOLabel" runat="server" Text='<%# Eval("ID_MODELO") %>' />
                    <br />
                    DESCRIPCION_CEL:
                    <asp:Label ID="DESCRIPCION_CELLabel" runat="server" Text='<%# Eval("DESCRIPCION_CEL") %>' />
                    <br />
                    PRECIO_UNITARIO_CEL:
                    <asp:Label ID="PRECIO_UNITARIO_CELLabel" runat="server" Text='<%# Eval("PRECIO_UNITARIO_CEL") %>' />
                    <br />
                </td>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <td runat="server" style="background-color: #999999;">ID_MODELO:
                    <asp:Label ID="ID_MODELOLabel1" runat="server" Text='<%# Eval("ID_MODELO") %>' />
                    <br />
                    DESCRIPCION_CEL:
                    <asp:TextBox ID="DESCRIPCION_CELTextBox" runat="server" Text='<%# Bind("DESCRIPCION_CEL") %>' />
                    <br />
                    PRECIO_UNITARIO_CEL:
                    <asp:TextBox ID="PRECIO_UNITARIO_CELTextBox" runat="server" Text='<%# Bind("PRECIO_UNITARIO_CEL") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                </td>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>No se han devuelto datos.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <td runat="server" style="">ID_MODELO:
                    <asp:TextBox ID="ID_MODELOTextBox" runat="server" Text='<%# Bind("ID_MODELO") %>' />
                    <br />
                    DESCRIPCION_CEL:
                    <asp:TextBox ID="DESCRIPCION_CELTextBox" runat="server" Text='<%# Bind("DESCRIPCION_CEL") %>' />
                    <br />
                    PRECIO_UNITARIO_CEL:
                    <asp:TextBox ID="PRECIO_UNITARIO_CELTextBox" runat="server" Text='<%# Bind("PRECIO_UNITARIO_CEL") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
                </td>
            </InsertItemTemplate>
            <ItemTemplate>
                <td runat="server" style="background-color: #E0FFFF;color: #333333;">ID_MODELO:
                    <asp:Label ID="ID_MODELOLabel" runat="server" Text='<%# Eval("ID_MODELO") %>' />
                    <br />
                    DESCRIPCION_CEL:
                    <asp:Label ID="DESCRIPCION_CELLabel" runat="server" Text='<%# Eval("DESCRIPCION_CEL") %>' />
                    <br />
                    PRECIO_UNITARIO_CEL:
                    <asp:Label ID="PRECIO_UNITARIO_CELLabel" runat="server" Text='<%# Eval("PRECIO_UNITARIO_CEL") %>' />
                    <br />
                </td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                    <tr runat="server" id="itemPlaceholderContainer">
                        <td runat="server" id="itemPlaceholder">
                        </td>
                    </tr>
                </table>
                <div style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                </div>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <td runat="server" style="background-color: #E2DED6;font-weight: bold;color: #333333;">ID_MODELO:
                    <asp:Label ID="ID_MODELOLabel" runat="server" Text='<%# Eval("ID_MODELO") %>' />
                    <br />
                    DESCRIPCION_CEL:
                    <asp:Label ID="DESCRIPCION_CELLabel" runat="server" Text='<%# Eval("DESCRIPCION_CEL") %>' />
                    <br />
                    PRECIO_UNITARIO_CEL:
                    <asp:Label ID="PRECIO_UNITARIO_CELLabel" runat="server" Text='<%# Eval("PRECIO_UNITARIO_CEL") %>' />
                    <br />
                </td>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:FINAL_LABConnectionString %>" SelectCommand="SELECT [ID_MODELO], [DESCRIPCION_CEL], [PRECIO_UNITARIO_CEL] FROM [CELULARES]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FINAL_LABConnectionString %>" SelectCommand="SELECT [IMAGEN_CEL], [PRECIO_UNITARIO_CEL], [DESCRIPCION_CEL], [ID_MARCA_CEL], [ID_MODELO] FROM [CELULARES]"></asp:SqlDataSource>
    </p>
        </div>
</asp:Content>


<asp:Content ID="Content4" ContentPlaceHolderID="ContenidoColDerUsuario" runat="server">

</asp:Content>
