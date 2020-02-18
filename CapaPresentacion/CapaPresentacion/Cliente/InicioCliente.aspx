<%@ Page Title="" Language="C#" MasterPageFile="~/Cliente/PaginaMaestraCliente.master" AutoEventWireup="true" CodeBehind="InicioCliente.aspx.cs" Inherits="CapaPresentacion.Cliente.InicioCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadCliente" runat="server">
    <title>- Inicio </title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoColIzCliente" runat="server">
    <p>&nbsp;</p>
    <h2>Filtrar por:</h2>

    <div id="Filtro" style="text-align: left;">

        <asp:CheckBox ID="CbxMarca" runat="server" Text="Marca" CssClass="ControlesASP" />
        <asp:DropDownList ID="ddlMarca" runat="server" CssClass="ControlesASP" OnSelectedIndexChanged="ddlMarca_SelectedIndexChanged" AutoPostBack="True" Width="100%"></asp:DropDownList>
        <asp:CheckBox ID="CbxModelo" runat="server" Text="Modelo" CssClass="ControlesASP" AutoPostBack="True" OnCheckedChanged="CbxModelo_CheckedChanged" />
        <asp:DropDownList ID="ddlModelo" runat="server" CssClass="ControlesASP" Width="100%"></asp:DropDownList>
        <asp:CheckBox ID="CbxPrecio" runat="server" Text="Precio" CssClass="ControlesASP" />
        <asp:DropDownList ID="ddlPrecio" runat="server" CssClass="ControlesASP" Width="100%"></asp:DropDownList>
        <asp:TextBox ID="txtPrecio" runat="server" CssClass="ControlesASP" Width="100%" TextMode="Number"></asp:TextBox>
        <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" CssClass="Boton" OnClick="btnFiltrar_Click" />
        <asp:Button ID="btnQuitarFiltro" runat="server" Text="Quitar Filtro" CssClass="Boton" OnClick="btnQuitarFiltro_Click" />
        <asp:Label ID="lblFiltro" runat="server"></asp:Label>

    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoColPpalCliente" runat="server">

    <div id="InicioCliente" class="Form">
        <h2>Celulares</h2>

        <asp:Label ID="lblTotalRegistros" runat="server" Text="Celulares disponibles: " CssClass="LabelLarga"></asp:Label>
        <asp:ListView ID="lvwCelulares" runat="server" GroupItemCount="2">
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
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

            <ItemTemplate>
                <td runat="server" style="background-color: #E0FFFF; color: #333333;">
                    <asp:Label ID="MarcaLabel" runat="server" Text='<%# Eval("Marca") %>' /><br />
                    <asp:Label ID="ModeloLabel" runat="server" Text='<%# Eval("Modelo") %>'></asp:Label><br />
                    <asp:ImageButton ID="ImgBtnCelular" runat="server" Height="200px" ImageUrl='<%# Eval("Imagen") %>' /><br />
                    Descripcion:
                    <asp:Label ID="DescripcionLabel" runat="server" Text='<%# Eval("Descripcion") %>'></asp:Label><br />
                    Stock:
                    <asp:Label ID="StockLabel" runat="server" Text='<%# Eval("Stock") %>'></asp:Label><br />
                    Precio: $
                    <asp:Label ID="PrecioLabel" runat="server" Text='<%# Eval("Precio") %>'></asp:Label><br />
                    <asp:Button ID="BtnAgregarAlCarrito" runat="server" Text="Agregar al carrito" CssClass="Boton" CommandArgument='<%# Eval("Modelo") %>' CommandName="EventoAgregarAlCarrito" OnCommand="BtnAgregarAlCarrito_Command" /><br />
                </td>
            </ItemTemplate>

            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr id="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center; background-color: #5D7B9D; font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    <asp:NumericPagerField />
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>

            <SelectedItemTemplate>
                <td runat="server" style="background-color: #E2DED6; font-weight: bold; color: #333333;">Modelo:
                    <asp:Label ID="ModeloLabel" runat="server" Text='<%# Eval("Modelo") %>' /><br />
                    Marca:
                    <asp:Label ID="MarcaLabel" runat="server" Text='<%# Eval("Marca") %>' /><br />
                    Descripcion:
                    <asp:Label ID="DescripcionLabel" runat="server" Text='<%# Eval("Descripcion") %>' /><br />
                    Stock:
                    <asp:Label ID="StockLabel" runat="server" Text='<%# Eval("Stock") %>' /><br />
                    Precio: $
                    <asp:Label ID="PrecioLabel" runat="server" Text='<%# Eval("Precio") %>' /><br />
                    Imagen:
                    <asp:Label ID="ImagenLabel" runat="server" Text='<%# Eval("Imagen") %>' /><br />
                </td>
            </SelectedItemTemplate>

        </asp:ListView>



    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContenidoColDerCliente" runat="server">
    <%--  //aca van los datos del usuario registrado--%>
</asp:Content>
