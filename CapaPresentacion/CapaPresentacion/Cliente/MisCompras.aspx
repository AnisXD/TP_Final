<%@ Page Title="" Language="C#" MasterPageFile="~/Cliente/PaginaMaestraCliente.master" AutoEventWireup="true" CodeBehind="MisCompras.aspx.cs" Inherits="CapaPresentacion.Cliente.MisCompras" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadCliente" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoColIzCliente" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoColPpalCliente" runat="server">
    <div ID="FormLogIn" class="Form">
     <h2>Mis Compras</h2>
    
    <asp:ListView ID="ListView3" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSource1" GroupItemCount="2"  OnSelectedIndexChanged="ListView3_SelectedIndexChanged">
        
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
            <td runat="server" style="">Vendedor:
                <asp:TextBox ID="VendedorTextBox" runat="server" Text='<%# Bind("Vendedor") %>' />
                <br />
                Cliente:
                <asp:TextBox ID="ClienteTextBox" runat="server" Text='<%# Bind("Cliente") %>' />
                <br />
                Nombre:
                <asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>' />
                <br />
                Apellido:
                <asp:TextBox ID="ApellidoTextBox" runat="server" Text='<%# Bind("Apellido") %>' />
                <br />
                Fecha:
                <asp:TextBox ID="FechaTextBox" runat="server" Text='<%# Bind("Fecha") %>' />
                <br />
                FormaDeEnvio:
                <asp:TextBox ID="FormaDeEnvioTextBox" runat="server" Text='<%# Bind("FormaDeEnvio") %>' />
                <br />
                FormaDePago:
                <asp:TextBox ID="FormaDePagoTextBox" runat="server" Text='<%# Bind("FormaDePago") %>' />
                <br />
                Total:
                <asp:TextBox ID="TotalTextBox" runat="server" Text='<%# Bind("Total") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                <br />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
                <br />
            </td>
        </InsertItemTemplate>
        
        <ItemTemplate>
            <td runat="server" style="background-color: #E0FFFF;color: #333333;">Id:
                <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                <br />
                Vendedor:
                <asp:Label ID="VendedorLabel" runat="server" Text='<%# Eval("Vendedor") %>' />
                <br />
                Cliente:
                <asp:Label ID="ClienteLabel" runat="server" Text='<%# Eval("Cliente") %>' />
                <br />
                Nombre:
                <asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' />
                <br />
                Apellido:
                <asp:Label ID="ApellidoLabel" runat="server" Text='<%# Eval("Apellido") %>' />
                <br />
                Fecha:
                <asp:Label ID="FechaLabel" runat="server" Text='<%# Eval("Fecha") %>' />
                <br />
                FormaDeEnvio:
                <asp:Label ID="FormaDeEnvioLabel" runat="server" Text='<%# Eval("FormaDeEnvio") %>' />
                <br />
                FormaDePago:
                <asp:Label ID="FormaDePagoLabel" runat="server" Text='<%# Eval("FormaDePago") %>' />
                <br />
                Total:
                <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total") %>' />
                <br />
            </td>
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
            <td runat="server" style="background-color: #E2DED6;font-weight: bold;color: #333333;">Id:
                <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                <br />
                Vendedor:
                <asp:Label ID="VendedorLabel" runat="server" Text='<%# Eval("Vendedor") %>' />
                <br />
                Cliente:
                <asp:Label ID="ClienteLabel" runat="server" Text='<%# Eval("Cliente") %>' />
                <br />
                Nombre:
                <asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' />
                <br />
                Apellido:
                <asp:Label ID="ApellidoLabel" runat="server" Text='<%# Eval("Apellido") %>' />
                <br />
                Fecha:
                <asp:Label ID="FechaLabel" runat="server" Text='<%# Eval("Fecha") %>' />
                <br />
                FormaDeEnvio:
                <asp:Label ID="FormaDeEnvioLabel" runat="server" Text='<%# Eval("FormaDeEnvio") %>' />
                <br />
                FormaDePago:
                <asp:Label ID="FormaDePagoLabel" runat="server" Text='<%# Eval("FormaDePago") %>' />
                <br />
                Total:
                <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total") %>' />
                <br />
            </td>
        </SelectedItemTemplate>
        
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FINALPROG_ConnectionString %>" SelectCommand="MostrarVentasPorCliente" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="DNIUSU" SessionField="Usuario" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

        </div>

    </asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContenidoColDerCliente" runat="server">
</asp:Content>
