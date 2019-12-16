<%@ Page Title="" Language="C#" MasterPageFile="~/Empleado/PaginaMaestraEmpleado.master" AutoEventWireup="true" CodeBehind="CarritoEmpleado.aspx.cs" Inherits="CapaPresentacion.Empleado.NuevaVenta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadEmpleado" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoColIzEmpleado" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoColPpalEmpleado" runat="server">
    <h1>Carrito</h1>
    <div id="CarritoEmpleado" class="Form">
        
        <asp:Label ID="lblIdVenta" runat="server" Text="Venta N°: " CssClass="ControlesASP"></asp:Label>
        <asp:Label ID="txtIdVenta" runat="server" Text="xxx-0001" CssClass="ControlesASP"></asp:Label>
        <asp:Label ID="lblFecha" runat="server" Text="Fecha: " CssClass="ControlesASP"></asp:Label>
        <asp:Label ID="txtFecha" runat="server" Text="" CssClass="ControlesASP"></asp:Label>
        <asp:Label ID="lblDNI" runat="server" Text="DNI: " CssClass="ControlesASP"></asp:Label>
        <asp:TextBox ID="txtDNI" runat="server" CssClass="ControlesASP"></asp:TextBox>
        <asp:Label ID="lblFormaPago" runat="server" Text="Forma de pago: " CssClass="ControlesASP"></asp:Label>
        <asp:DropDownList ID="ddlFPago" runat="server" CssClass="ControlesASP" DataSourceID="DS_FORMAPAGO" DataTextField="ID_FORMAPAGO_FP" DataValueField="ID_FORMAPAGO_FP"></asp:DropDownList>
        <asp:SqlDataSource ID="DS_FORMAPAGO" runat="server" ConnectionString="<%$ ConnectionStrings:FINALPROG_ConnectionString %>" SelectCommand="SELECT [ID_FORMAPAGO_FP], [FORMAPAGO_FP] FROM [FORMA_PAGO]"></asp:SqlDataSource>
        <asp:Label ID="lblFormaEnvio" runat="server" Text="Forma de envio: " CssClass="ControlesASP"></asp:Label>
        <asp:DropDownList ID="ddlFEnvio" runat="server"  CssClass="ControlesASP" DataSourceID="DS_FORMAENVIO" DataTextField="FORMAENVIO_FE" DataValueField="ID_FORMAENVIO_FE"></asp:DropDownList>
        <asp:SqlDataSource ID="DS_FORMAENVIO" runat="server" ConnectionString="<%$ ConnectionStrings:FINALPROG_ConnectionString %>" SelectCommand="SELECT [ID_FORMAENVIO_FE], [FORMAENVIO_FE] FROM [FORMA_ENVIO]"></asp:SqlDataSource>
        <asp:Label ID="lblImporte" runat="server" Text="Importe: " CssClass="ControlesASP"></asp:Label>
        <asp:Label ID="txtImporte" runat="server" Text="$0,00" CssClass="ControlesASP"></asp:Label>
        <asp:Button ID="btnAgregarItem" runat="server" Text="Agregar item" CssClass="Boton" />
        <asp:Button ID="btnConfirmarCompra" runat="server" Text="Confirmar compra" CssClass="Boton" />
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID_DV,ID_VTA_DV" DataSourceID="DS_DETALLE_VENTA">
            <AlternatingItemTemplate>
                <tr style="background-color: #FFFFFF;color: #284775;">
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
                    <td>
                        <asp:Label ID="ID_VTA_DVLabel" runat="server" Text='<%# Eval("ID_VTA_DV") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color: #999999;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                    </td>
                    <td>
                        <asp:Label ID="ID_DVLabel1" runat="server" Text='<%# Eval("ID_DV") %>' />
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
                    <td>
                        <asp:Label ID="ID_VTA_DVLabel1" runat="server" Text='<%# Eval("ID_VTA_DV") %>' />
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
                    <td>&nbsp;</td>
                    <td>
                        <asp:TextBox ID="ID_MODELO_DVTextBox" runat="server" Text='<%# Bind("ID_MODELO_DV") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="CANTIDAD_DVTextBox" runat="server" Text='<%# Bind("CANTIDAD_DV") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="PU_DVTextBox" runat="server" Text='<%# Bind("PU_DV") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ID_VTA_DVTextBox" runat="server" Text='<%# Bind("ID_VTA_DV") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color: #E0FFFF;color: #333333;">
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
                    <td>
                        <asp:Label ID="ID_VTA_DVLabel" runat="server" Text='<%# Eval("ID_VTA_DV") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                    <th runat="server">ID_DV</th>
                                    <th runat="server">ID_MODELO_DV</th>
                                    <th runat="server">CANTIDAD_DV</th>
                                    <th runat="server">PU_DV</th>
                                    <th runat="server">ID_VTA_DV</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
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
                <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
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
                    <td>
                        <asp:Label ID="ID_VTA_DVLabel" runat="server" Text='<%# Eval("ID_VTA_DV") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
       
        <asp:SqlDataSource ID="DS_DETALLE_VENTA" runat="server" ConnectionString="<%$ ConnectionStrings:FINALPROG_ConnectionString %>" SelectCommand="SELECT [ID_DV], [ID_MODELO_DV], [CANTIDAD_DV], [PU_DV], [ID_VTA_DV] FROM [DETALLES_VENTA]"></asp:SqlDataSource>
       
   </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContenidoColDerEmpleado" runat="server">
</asp:Content>
