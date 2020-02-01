<%@ Page Title="" Language="C#" MasterPageFile="~/Cliente/PaginaMaestraCliente.master" AutoEventWireup="true" CodeBehind="InicioCliente.aspx.cs" Inherits="CapaPresentacion.Cliente.InicioCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadCliente" runat="server">
    <title>- Inicio </title> 
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoColIzCliente" runat="server">
     <div id="Filtros">
    <br />
    <h2>Filtrar por:</h2>
    
        <asp:CheckBox ID="CbxMarca" runat="server" Text="Marca" CssClass="ControlesASP" OnCheckedChanged="CbxMarca_CheckedChanged"/>
    <asp:DropDownList ID="ddlMarca" runat="server"  CssClass="ControlesASP" DataSourceID="marca" DataTextField="NOMBRE_MARCA" DataValueField="ID_MARCA"></asp:DropDownList>
    <asp:SqlDataSource ID="marca" runat="server" ConnectionString="<%$ ConnectionStrings:FINAL_LABConnectionString2 %>" SelectCommand="SELECT [ID_MARCA], [NOMBRE_MARCA] FROM [MARCAS]"></asp:SqlDataSource>
    
        <asp:CheckBox ID="CbxModelo" runat="server" Text="Modelo" CssClass="ControlesASP" AutoPostBack="True" OnCheckedChanged="CbxModelo_CheckedChanged" />
    <asp:DropDownList ID="ddlModelo" runat="server" CssClass="ControlesASP" DataSourceID="modelos" DataTextField="ID_MODELO" DataValueField="ID_MARCA_CEL"></asp:DropDownList>
    <asp:SqlDataSource ID="modelos" runat="server" ConnectionString="<%$ ConnectionStrings:FINAL_LABConnectionString2 %>" SelectCommand="SELECT [ID_MODELO], [ID_MARCA_CEL] FROM [CELULARES]"></asp:SqlDataSource>
    <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" CssClass="Boton"/>
    <asp:Button ID="btnQuitarFiltro" runat="server" Text="Quitar Filtro" CssClass="Boton"/>
    <br />
    </div>
    

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoColPpalCliente" runat="server">
    <h3>Celulares:</h3>
    <div id="InicioCliente" class="Form">
    
       <asp:ListView ID="ListView1" runat="server" DataKeyNames="Modelo" DataSourceID="SqlDataSource1" GroupItemCount="2">
          
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
          
           <ItemTemplate>
               <td runat="server" style="background-color: #E0FFFF;color: #333333;">
                   <asp:Label ID="MarcaLabel" runat="server" Text='<%# Eval("Marca") %>' />
                   <br />
                   <asp:Label ID="ModeloLabel" runat="server" Text='<%# Eval("Modelo") %>'></asp:Label>
                   <br />
                   <asp:ImageButton ID="ImgBtnCelular" runat="server" Height="200px" ImageUrl='<%# Eval("Imagen") %>' />
                   <br />
                   Descripcion:
                   <asp:Label ID="DescripcionLabel" runat="server" Text='<%# Eval("Descripcion") %>'></asp:Label>
                   <br />
                   Stock:
                   <asp:Label ID="StockLabel" runat="server" Text='<%# Eval("Stock") %>'></asp:Label>
                   <br />
                   Precio: $
                   <asp:Label ID="PrecioLabel" runat="server" Text='<%# Eval("Precio") %>'></asp:Label>
                   <br />
                   <asp:Button ID="BtnAgregarAlCarrito" runat="server" Text="Agregar al carrito" CommandArgument='<%# Eval("Modelo") %>' CommandName="EventoAgregarAlCarrito" OnCommand="BtnAgregarAlCarrito_Command" />
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
               <td runat="server" style="background-color: #E2DED6;font-weight: bold;color: #333333;">Modelo:
                   <asp:Label ID="ModeloLabel" runat="server" Text='<%# Eval("Modelo") %>' />
                   <br />Marca:
                   <asp:Label ID="MarcaLabel" runat="server" Text='<%# Eval("Marca") %>' />
                   <br />Descripcion:
                   <asp:Label ID="DescripcionLabel" runat="server" Text='<%# Eval("Descripcion") %>' />
                   <br />Stock:
                   <asp:Label ID="StockLabel" runat="server" Text='<%# Eval("Stock") %>' />
                   <br />Precio: $
                   <asp:Label ID="PrecioLabel" runat="server" Text='<%# Eval("Precio") %>' />
                   <br />Imagen:
                   <asp:Label ID="ImagenLabel" runat="server" Text='<%# Eval("Imagen") %>' />
                   <br /></td>
           </SelectedItemTemplate>

       </asp:ListView>

       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FINALPROG_ConnectionString %>" SelectCommand="MostrarCelulares" SelectCommandType="StoredProcedure" UpdateCommand="MostrarCelularesPorIdMarca" UpdateCommandType="StoredProcedure">
           <UpdateParameters>
               <asp:Parameter Name="IDMARCA" Type="String" />
           </UpdateParameters>
       </asp:SqlDataSource>

    </div></asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContenidoColDerCliente" runat="server">

</asp:Content>
