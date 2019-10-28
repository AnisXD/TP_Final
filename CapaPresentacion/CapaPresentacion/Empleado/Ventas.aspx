<%@ Page Title="" Language="C#" MasterPageFile="~/Empleado/PaginaMaestraEmpleado.master" AutoEventWireup="true" CodeBehind="Ventas.aspx.cs" Inherits="CapaPresentacion.Empleado.Ventas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadEmpleado" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoColIzEmpleado" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoColPpalEmpleado" runat="server">
    <asp:Label ID="lblFiltrar" runat="server" Text="Filtrar por: "></asp:Label>
<br />
<br />
<asp:Label ID="lblVendedor" runat="server" Text="Vendedor: "></asp:Label>
<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Label ID="lblCliente" runat="server" Text="Cliente: "></asp:Label>
<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
<br />
<br />
<asp:Button ID="bttnFiltrar" runat="server" Text="Filtrar" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Button ID="bttnQuitarFiltro" runat="server" Text="Quitar filtro" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="bttnNuevaVenta" runat="server" Text="Nueva Venta" />
<br />
<br />
<asp:ListView ID="ListView1" runat="server" DataKeyNames="ID_VTA" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
    <AlternatingItemTemplate>
        <tr style="background-color: #FAFAD2;color: #284775;">
            <td>
                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Editar" />
            </td>
            <td>
                <asp:Label ID="ID_VTALabel" runat="server" Text='<%# Eval("ID_VTA") %>' />
            </td>
            <td>
                <asp:Label ID="ID_CLI_VTALabel" runat="server" Text='<%# Eval("ID_CLI_VTA") %>' />
            </td>
            <td>
                <asp:Label ID="ID_VENDLabel" runat="server" Text='<%# Eval("ID_VEND") %>' />
            </td>
            <td>
                <asp:Label ID="FECHA_VTALabel" runat="server" Text='<%# Eval("FECHA_VTA") %>' />
            </td>
            <td>
                <asp:Label ID="ID_FORMAENVIO_VTALabel" runat="server" Text='<%# Eval("ID_FORMAENVIO_VTA") %>' />
            </td>
            <td>
                <asp:Label ID="ID_FORMAPAGO_VTALabel" runat="server" Text='<%# Eval("ID_FORMAPAGO_VTA") %>' />
            </td>
            <td>
                <asp:Label ID="IMPORTELabel" runat="server" Text='<%# Eval("IMPORTE") %>' />
            </td>
        </tr>
    </AlternatingItemTemplate>
    <EditItemTemplate>
        <tr style="background-color: #FFCC66;color: #000080;">
            <td>
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
            </td>
            <td>
                <asp:Label ID="ID_VTALabel1" runat="server" Text='<%# Eval("ID_VTA") %>' />
            </td>
            <td>
                <asp:TextBox ID="ID_CLI_VTATextBox" runat="server" Text='<%# Bind("ID_CLI_VTA") %>' />
            </td>
            <td>
                <asp:TextBox ID="ID_VENDTextBox" runat="server" Text='<%# Bind("ID_VEND") %>' />
            </td>
            <td>
                <asp:TextBox ID="FECHA_VTATextBox" runat="server" Text='<%# Bind("FECHA_VTA") %>' />
            </td>
            <td>
                <asp:TextBox ID="ID_FORMAENVIO_VTATextBox" runat="server" Text='<%# Bind("ID_FORMAENVIO_VTA") %>' />
            </td>
            <td>
                <asp:TextBox ID="ID_FORMAPAGO_VTATextBox" runat="server" Text='<%# Bind("ID_FORMAPAGO_VTA") %>' />
            </td>
            <td>
                <asp:TextBox ID="IMPORTETextBox" runat="server" Text='<%# Bind("IMPORTE") %>' />
            </td>
        </tr>
    </EditItemTemplate>
    <EmptyDataTemplate>
        <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
            <tr>
                <td>No se han devuelto datos.</td>
            </tr>
        </table>
    </EmptyDataTemplate>
    <InsertItemTemplate>
        <tr style="">
            <td>
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
            </td>
            <td>
                <asp:TextBox ID="ID_VTATextBox" runat="server" Text='<%# Bind("ID_VTA") %>' />
            </td>
            <td>
                <asp:TextBox ID="ID_CLI_VTATextBox" runat="server" Text='<%# Bind("ID_CLI_VTA") %>' />
            </td>
            <td>
                <asp:TextBox ID="ID_VENDTextBox" runat="server" Text='<%# Bind("ID_VEND") %>' />
            </td>
            <td>
                <asp:TextBox ID="FECHA_VTATextBox" runat="server" Text='<%# Bind("FECHA_VTA") %>' />
            </td>
            <td>
                <asp:TextBox ID="ID_FORMAENVIO_VTATextBox" runat="server" Text='<%# Bind("ID_FORMAENVIO_VTA") %>' />
            </td>
            <td>
                <asp:TextBox ID="ID_FORMAPAGO_VTATextBox" runat="server" Text='<%# Bind("ID_FORMAPAGO_VTA") %>' />
            </td>
            <td>
                <asp:TextBox ID="IMPORTETextBox" runat="server" Text='<%# Bind("IMPORTE") %>' />
            </td>
        </tr>
    </InsertItemTemplate>
    <ItemTemplate>
        <tr style="background-color: #FFFBD6;color: #333333;">
            <td>
                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Editar" />
            </td>
            <td>
                <asp:Label ID="ID_VTALabel" runat="server" Text='<%# Eval("ID_VTA") %>' />
            </td>
            <td>
                <asp:Label ID="ID_CLI_VTALabel" runat="server" Text='<%# Eval("ID_CLI_VTA") %>' />
            </td>
            <td>
                <asp:Label ID="ID_VENDLabel" runat="server" Text='<%# Eval("ID_VEND") %>' />
            </td>
            <td>
                <asp:Label ID="FECHA_VTALabel" runat="server" Text='<%# Eval("FECHA_VTA") %>' />
            </td>
            <td>
                <asp:Label ID="ID_FORMAENVIO_VTALabel" runat="server" Text='<%# Eval("ID_FORMAENVIO_VTA") %>' />
            </td>
            <td>
                <asp:Label ID="ID_FORMAPAGO_VTALabel" runat="server" Text='<%# Eval("ID_FORMAPAGO_VTA") %>' />
            </td>
            <td>
                <asp:Label ID="IMPORTELabel" runat="server" Text='<%# Eval("IMPORTE") %>' />
            </td>
        </tr>
    </ItemTemplate>
    <LayoutTemplate>
        <table runat="server">
            <tr runat="server">
                <td runat="server">
                    <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                        <tr runat="server" style="background-color: #FFFBD6;color: #333333;">
                            <th runat="server"></th>
                            <th runat="server">Venta</th>
                            <th runat="server">DNI Cliente</th>
                            <th runat="server">Legajo</th>
                            <th runat="server">Fecha de emision</th>
                            <th runat="server">Forma de envio</th>
                            <th runat="server">Forma de pago</th>
                            <th runat="server">Importe</th>
                        </tr>
                        <tr id="itemPlaceholder" runat="server">
                        </tr>
                    </table>
                </td>
            </tr>
            <tr runat="server">
                <td runat="server" style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                    <asp:DataPager ID="DataPager1" runat="server">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                        </Fields>
                    </asp:DataPager>
                </td>
            </tr>
        </table>
    </LayoutTemplate>
    <SelectedItemTemplate>
        <tr style="background-color: #FFCC66;font-weight: bold;color: #000080;">
            <td>
                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Editar" />
            </td>
            <td>
                <asp:Label ID="ID_VTALabel" runat="server" Text='<%# Eval("ID_VTA") %>' />
            </td>
            <td>
                <asp:Label ID="ID_CLI_VTALabel" runat="server" Text='<%# Eval("ID_CLI_VTA") %>' />
            </td>
            <td>
                <asp:Label ID="ID_VENDLabel" runat="server" Text='<%# Eval("ID_VEND") %>' />
            </td>
            <td>
                <asp:Label ID="FECHA_VTALabel" runat="server" Text='<%# Eval("FECHA_VTA") %>' />
            </td>
            <td>
                <asp:Label ID="ID_FORMAENVIO_VTALabel" runat="server" Text='<%# Eval("ID_FORMAENVIO_VTA") %>' />
            </td>
            <td>
                <asp:Label ID="ID_FORMAPAGO_VTALabel" runat="server" Text='<%# Eval("ID_FORMAPAGO_VTA") %>' />
            </td>
            <td>
                <asp:Label ID="IMPORTELabel" runat="server" Text='<%# Eval("IMPORTE") %>' />
            </td>
        </tr>
    </SelectedItemTemplate>
</asp:ListView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FINAL_LABConnectionString6 %>" SelectCommand="SELECT * FROM [VENTAS]" DeleteCommand="DELETE FROM [VENTAS] WHERE [ID_VTA] = @ID_VTA" InsertCommand="INSERT INTO [VENTAS] ([ID_VTA], [ID_CLI_VTA], [ID_VEND], [FECHA_VTA], [ID_FORMAENVIO_VTA], [ID_FORMAPAGO_VTA], [IMPORTE]) VALUES (@ID_VTA, @ID_CLI_VTA, @ID_VEND, @FECHA_VTA, @ID_FORMAENVIO_VTA, @ID_FORMAPAGO_VTA, @IMPORTE)" UpdateCommand="UPDATE [VENTAS] SET [ID_CLI_VTA] = @ID_CLI_VTA, [ID_VEND] = @ID_VEND, [FECHA_VTA] = @FECHA_VTA, [ID_FORMAENVIO_VTA] = @ID_FORMAENVIO_VTA, [ID_FORMAPAGO_VTA] = @ID_FORMAPAGO_VTA, [IMPORTE] = @IMPORTE WHERE [ID_VTA] = @ID_VTA">
    <DeleteParameters>
        <asp:Parameter Name="ID_VTA" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="ID_VTA" Type="String" />
        <asp:Parameter Name="ID_CLI_VTA" Type="String" />
        <asp:Parameter Name="ID_VEND" Type="String" />
        <asp:Parameter DbType="Date" Name="FECHA_VTA" />
        <asp:Parameter Name="ID_FORMAENVIO_VTA" Type="String" />
        <asp:Parameter Name="ID_FORMAPAGO_VTA" Type="String" />
        <asp:Parameter Name="IMPORTE" Type="Double" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="ID_CLI_VTA" Type="String" />
        <asp:Parameter Name="ID_VEND" Type="String" />
        <asp:Parameter DbType="Date" Name="FECHA_VTA" />
        <asp:Parameter Name="ID_FORMAENVIO_VTA" Type="String" />
        <asp:Parameter Name="ID_FORMAPAGO_VTA" Type="String" />
        <asp:Parameter Name="IMPORTE" Type="Double" />
        <asp:Parameter Name="ID_VTA" Type="String" />
    </UpdateParameters>
    </asp:SqlDataSource>
<br />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContenidoColDerEmpleado" runat="server">
</asp:Content>
