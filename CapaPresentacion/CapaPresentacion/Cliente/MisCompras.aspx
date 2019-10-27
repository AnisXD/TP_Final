<%@ Page Title="" Language="C#" MasterPageFile="~/Cliente/PaginaMaestraCliente.master" AutoEventWireup="true" CodeBehind="MisCompras.aspx.cs" Inherits="CapaPresentacion.Cliente.MisCompras" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadCliente" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoColIzCliente" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoColPpalCliente" runat="server">
    <asp:ListView ID="ListView3" runat="server" DataKeyNames="ID_VTA" DataSourceID="SqlDataSource1" GroupItemCount="3">
        <AlternatingItemTemplate>
            <td runat="server" style="background-color:#FFF8DC;">ID_VTA:
                <asp:Label ID="ID_VTALabel" runat="server" Text='<%# Eval("ID_VTA") %>' />
                <br />
                ID_CLI_VTA:
                <asp:Label ID="ID_CLI_VTALabel" runat="server" Text='<%# Eval("ID_CLI_VTA") %>' />
                <br />
                ID_VEND:
                <asp:Label ID="ID_VENDLabel" runat="server" Text='<%# Eval("ID_VEND") %>' />
                <br />
                FECHA_VTA:
                <asp:Label ID="FECHA_VTALabel" runat="server" Text='<%# Eval("FECHA_VTA") %>' />
                <br />
                ID_FORMAENVIO_VTA:
                <asp:Label ID="ID_FORMAENVIO_VTALabel" runat="server" Text='<%# Eval("ID_FORMAENVIO_VTA") %>' />
                <br />
                ID_FORMAPAGO_VTA:
                <asp:Label ID="ID_FORMAPAGO_VTALabel" runat="server" Text='<%# Eval("ID_FORMAPAGO_VTA") %>' />
                <br />
                IMPORTE:
                <asp:Label ID="IMPORTELabel" runat="server" Text='<%# Eval("IMPORTE") %>' />
                <br />
            </td>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <td runat="server" style="background-color:#008A8C;color: #FFFFFF;">ID_VTA:
                <asp:Label ID="ID_VTALabel1" runat="server" Text='<%# Eval("ID_VTA") %>' />
                <br />
                ID_CLI_VTA:
                <asp:TextBox ID="ID_CLI_VTATextBox" runat="server" Text='<%# Bind("ID_CLI_VTA") %>' />
                <br />
                ID_VEND:
                <asp:TextBox ID="ID_VENDTextBox" runat="server" Text='<%# Bind("ID_VEND") %>' />
                <br />
                FECHA_VTA:
                <asp:TextBox ID="FECHA_VTATextBox" runat="server" Text='<%# Bind("FECHA_VTA") %>' />
                <br />
                ID_FORMAENVIO_VTA:
                <asp:TextBox ID="ID_FORMAENVIO_VTATextBox" runat="server" Text='<%# Bind("ID_FORMAENVIO_VTA") %>' />
                <br />
                ID_FORMAPAGO_VTA:
                <asp:TextBox ID="ID_FORMAPAGO_VTATextBox" runat="server" Text='<%# Bind("ID_FORMAPAGO_VTA") %>' />
                <br />
                IMPORTE:
                <asp:TextBox ID="IMPORTETextBox" runat="server" Text='<%# Bind("IMPORTE") %>' />
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
            <td runat="server" style="">ID_VTA:
                <asp:TextBox ID="ID_VTATextBox" runat="server" Text='<%# Bind("ID_VTA") %>' />
                <br />
                ID_CLI_VTA:
                <asp:TextBox ID="ID_CLI_VTATextBox" runat="server" Text='<%# Bind("ID_CLI_VTA") %>' />
                <br />
                ID_VEND:
                <asp:TextBox ID="ID_VENDTextBox" runat="server" Text='<%# Bind("ID_VEND") %>' />
                <br />
                FECHA_VTA:
                <asp:TextBox ID="FECHA_VTATextBox" runat="server" Text='<%# Bind("FECHA_VTA") %>' />
                <br />
                ID_FORMAENVIO_VTA:
                <asp:TextBox ID="ID_FORMAENVIO_VTATextBox" runat="server" Text='<%# Bind("ID_FORMAENVIO_VTA") %>' />
                <br />
                ID_FORMAPAGO_VTA:
                <asp:TextBox ID="ID_FORMAPAGO_VTATextBox" runat="server" Text='<%# Bind("ID_FORMAPAGO_VTA") %>' />
                <br />
                IMPORTE:
                <asp:TextBox ID="IMPORTETextBox" runat="server" Text='<%# Bind("IMPORTE") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                <br />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
                <br />
            </td>
        </InsertItemTemplate>
        <ItemTemplate>
            <td runat="server" style="background-color:#DCDCDC;color: #000000;">ID_VTA:
                <asp:Label ID="ID_VTALabel" runat="server" Text='<%# Eval("ID_VTA") %>' />
                <br />
                ID_CLI_VTA:
                <asp:Label ID="ID_CLI_VTALabel" runat="server" Text='<%# Eval("ID_CLI_VTA") %>' />
                <br />
                ID_VEND:
                <asp:Label ID="ID_VENDLabel" runat="server" Text='<%# Eval("ID_VEND") %>' />
                <br />
                FECHA_VTA:
                <asp:Label ID="FECHA_VTALabel" runat="server" Text='<%# Eval("FECHA_VTA") %>' />
                <br />
                ID_FORMAENVIO_VTA:
                <asp:Label ID="ID_FORMAENVIO_VTALabel" runat="server" Text='<%# Eval("ID_FORMAENVIO_VTA") %>' />
                <br />
                ID_FORMAPAGO_VTA:
                <asp:Label ID="ID_FORMAPAGO_VTALabel" runat="server" Text='<%# Eval("ID_FORMAPAGO_VTA") %>' />
                <br />
                IMPORTE:
                <asp:Label ID="IMPORTELabel" runat="server" Text='<%# Eval("IMPORTE") %>' />
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
                    <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;"></td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <td runat="server" style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">ID_VTA:
                <asp:Label ID="ID_VTALabel" runat="server" Text='<%# Eval("ID_VTA") %>' />
                <br />
                ID_CLI_VTA:
                <asp:Label ID="ID_CLI_VTALabel" runat="server" Text='<%# Eval("ID_CLI_VTA") %>' />
                <br />
                ID_VEND:
                <asp:Label ID="ID_VENDLabel" runat="server" Text='<%# Eval("ID_VEND") %>' />
                <br />
                FECHA_VTA:
                <asp:Label ID="FECHA_VTALabel" runat="server" Text='<%# Eval("FECHA_VTA") %>' />
                <br />
                ID_FORMAENVIO_VTA:
                <asp:Label ID="ID_FORMAENVIO_VTALabel" runat="server" Text='<%# Eval("ID_FORMAENVIO_VTA") %>' />
                <br />
                ID_FORMAPAGO_VTA:
                <asp:Label ID="ID_FORMAPAGO_VTALabel" runat="server" Text='<%# Eval("ID_FORMAPAGO_VTA") %>' />
                <br />
                IMPORTE:
                <asp:Label ID="IMPORTELabel" runat="server" Text='<%# Eval("IMPORTE") %>' />
                <br />
            </td>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FINAL_LABConnectionString %>" SelectCommand="SELECT [ID_VTA], [ID_CLI_VTA], [ID_VEND], [FECHA_VTA], [ID_FORMAENVIO_VTA], [ID_FORMAPAGO_VTA], [IMPORTE] FROM [VENTAS]"></asp:SqlDataSource>
    <br />
    <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2">
        <AlternatingItemTemplate>
            <tr style="background-color:#FFF8DC;">
                <td>
                    <asp:Label ID="ID_DVLabel" runat="server" Text='<%# Eval("ID_DV") %>' />
                </td>
                <td>
                    <asp:Label ID="ID_MODELO_DVLabel" runat="server" Text='<%# Eval("ID_MODELO_DV") %>' />
                </td>
                <td>
                    <asp:Label ID="CANTIDAD_DVLabel" runat="server" Text='<%# Eval("CANTIDAD_DV") %>' />
                </td>
                <td>
                    <asp:Label ID="PU_DVLabel" runat="server" Text='<%# Eval("PU_DV") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="background-color:#008A8C;color: #FFFFFF;">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                </td>
                <td>
                    <asp:TextBox ID="ID_DVTextBox" runat="server" Text='<%# Bind("ID_DV") %>' />
                </td>
                <td>
                    <asp:TextBox ID="ID_MODELO_DVTextBox" runat="server" Text='<%# Bind("ID_MODELO_DV") %>' />
                </td>
                <td>
                    <asp:TextBox ID="CANTIDAD_DVTextBox" runat="server" Text='<%# Bind("CANTIDAD_DV") %>' />
                </td>
                <td>
                    <asp:TextBox ID="PU_DVTextBox" runat="server" Text='<%# Bind("PU_DV") %>' />
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
                    <asp:TextBox ID="ID_DVTextBox" runat="server" Text='<%# Bind("ID_DV") %>' />
                </td>
                <td>
                    <asp:TextBox ID="ID_MODELO_DVTextBox" runat="server" Text='<%# Bind("ID_MODELO_DV") %>' />
                </td>
                <td>
                    <asp:TextBox ID="CANTIDAD_DVTextBox" runat="server" Text='<%# Bind("CANTIDAD_DV") %>' />
                </td>
                <td>
                    <asp:TextBox ID="PU_DVTextBox" runat="server" Text='<%# Bind("PU_DV") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color:#DCDCDC;color: #000000;">
                <td>
                    <asp:Label ID="ID_DVLabel" runat="server" Text='<%# Eval("ID_DV") %>' />
                </td>
                <td>
                    <asp:Label ID="ID_MODELO_DVLabel" runat="server" Text='<%# Eval("ID_MODELO_DV") %>' />
                </td>
                <td>
                    <asp:Label ID="CANTIDAD_DVLabel" runat="server" Text='<%# Eval("CANTIDAD_DV") %>' />
                </td>
                <td>
                    <asp:Label ID="PU_DVLabel" runat="server" Text='<%# Eval("PU_DV") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                <th runat="server">Detalle de venta</th>
                                <th runat="server">Modelo</th>
                                <th runat="server">Cantidad</th>
                                <th runat="server">Precio Unitario</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                        <asp:DataPager ID="DataPager2" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                <td>
                    <asp:Label ID="ID_DVLabel" runat="server" Text='<%# Eval("ID_DV") %>' />
                </td>
                <td>
                    <asp:Label ID="ID_MODELO_DVLabel" runat="server" Text='<%# Eval("ID_MODELO_DV") %>' />
                </td>
                <td>
                    <asp:Label ID="CANTIDAD_DVLabel" runat="server" Text='<%# Eval("CANTIDAD_DV") %>' />
                </td>
                <td>
                    <asp:Label ID="PU_DVLabel" runat="server" Text='<%# Eval("PU_DV") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:FINAL_LABConnectionString %>" SelectCommand="SELECT [ID_DV], [ID_MODELO_DV], [CANTIDAD_DV], [PU_DV] FROM [DETALLES_VENTAS]"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContenidoColDerCliente" runat="server">
</asp:Content>
