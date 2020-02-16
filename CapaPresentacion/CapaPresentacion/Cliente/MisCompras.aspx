<%@ Page Title="" Language="C#" MasterPageFile="~/Cliente/PaginaMaestraCliente.master" AutoEventWireup="true" CodeBehind="MisCompras.aspx.cs" Inherits="CapaPresentacion.Cliente.MisCompras" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadCliente" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoColIzCliente" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoColPpalCliente" runat="server">
     <div ID="FormLogIn" class="Form">
     <h2>Mis Compras</h2>

    <asp:ListView ID="LvwCompras" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSource1" >



        <AlternatingItemTemplate>
            <li style="background-color: #FFFFFF;color: #284775;">Id:
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
            </li>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <li style="background-color: #999999;">Id:
                <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                <br />
                Vendedor:
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
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
            </li>
        </EditItemTemplate>



        <EmptyDataTemplate>
            No se regisraron compras con este usuario.
        </EmptyDataTemplate>

        <InsertItemTemplate>
            <li style="">Vendedor:
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
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
            </li>
        </InsertItemTemplate>
        <ItemSeparatorTemplate>
            <br />
        </ItemSeparatorTemplate>

        <ItemTemplate>
            <li style="background-color: #E0FFFF;color: #333333;">Id:
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
            </li>
        </ItemTemplate>
        <LayoutTemplate>
            <ul id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                <li runat="server" id="itemPlaceholder" />
            </ul>
            <div style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF;">
            </div>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <li style="background-color: #E2DED6;font-weight: bold;color: #333333;">Id:
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
            </li>
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
