<%@ Page Title="" Language="C#" MasterPageFile="~/Cliente/PaginaMaestraCliente.master" AutoEventWireup="true" CodeBehind="MisCompras.aspx.cs" Inherits="CapaPresentacion.Cliente.MisCompras" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadCliente" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoColIzCliente" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoColPpalCliente" runat="server">
    <div ID="FormLogIn" class="Form">
     <h2>Mis Compras</h2>
    
    <asp:ListView ID="LvwCompras" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSource1"  OnSelectedIndexChanged="ListView3_SelectedIndexChanged">
        
        
        
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td>No se han regisrado compras con su usuario.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
       
        <ItemTemplate>
            <tr style="background-color: #E0FFFF;color: #333333;">
                <td>
                    <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                </td>
                <td>
                    <asp:Label ID="VendedorLabel" runat="server" Text='<%# Eval("Vendedor") %>' />
                </td>
                <td>
                    <asp:Label ID="FechaLabel" runat="server" Text='<%# Eval("Fecha") %>' />
                </td>
                <td>
                    <asp:Label ID="FormaDeEnvioLabel" runat="server" Text='<%# Eval("FormaDeEnvio") %>' />
                </td>
                <td>
                    <asp:Label ID="FormaDePagoLabel" runat="server" Text='<%# Eval("FormaDePago") %>' />
                </td>
                <td>
                    <asp:Label ID="TotalLabel" runat="server" Text='<%# Eval("Total") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                <th runat="server">Id</th>
                                <th runat="server">Vendedor</th>
                                <th runat="server">Cliente</th>
                                <th runat="server">Nombre</th>
                                <th runat="server">Apellido</th>
                                <th runat="server">Fecha</th>
                                <th runat="server">FormaDeEnvio</th>
                                <th runat="server">FormaDePago</th>
                                <th runat="server">Total</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                <td>
                    <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                </td>
                
            </tr>
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
