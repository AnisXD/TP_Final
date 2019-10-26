<%@ Page Title="" Language="C#" MasterPageFile="~/Empleado/PaginaMaestraEmpleado.master" AutoEventWireup="true" CodeBehind="Proveedores.aspx.cs" Inherits="CapaPresentacion.Empleado.Proveedores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadEmpleado" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoColIzEmpleado" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoColPpalEmpleado" runat="server">
    <br />
    <asp:Label ID="lblFiltrarpor_prov" runat="server" Text="Filtra por:      "></asp:Label>
    <br />
    <br />
<asp:Label ID="lblIDProv" runat="server" Text="Id Proveedor:       "></asp:Label>
<asp:TextBox ID="TextBox3" runat="server" Width="86px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Label ID="lblMarca_Prov" runat="server" Text="Marca:   "></asp:Label>
<asp:TextBox ID="TextBox2" runat="server" Width="91px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Label ID="LblRazonSocial_Prov" runat="server" Text="Razon Social:   "></asp:Label>
<asp:TextBox ID="TextBox4" runat="server" Height="17px" Width="76px"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="bttnFiltro" runat="server" Text="Filtrar" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="bttnQuitarF" runat="server" Text="Quitar Filtro" />
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="ID_PROV" InsertItemPosition="LastItem">
        <AlternatingItemTemplate>
            <tr style="background-color: #FFF8DC;">
                <td>
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Editar" />
                </td>
                <td>
                    <asp:Label ID="ID_PROVLabel" runat="server" Text='<%# Eval("ID_PROV") %>' />
                </td>
                <td>
                    <asp:Label ID="RAZON_SOCIAL_PROVLabel" runat="server" Text='<%# Eval("RAZON_SOCIAL_PROV") %>' />
                </td>
                <td>
                    <asp:Label ID="DIRECCION_PROVLabel" runat="server" Text='<%# Eval("DIRECCION_PROV") %>' />
                </td>
                <td>
                    <asp:Label ID="TELEFONO_PROVLabel" runat="server" Text='<%# Eval("TELEFONO_PROV") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="ESTADO_PROVCheckBox" runat="server" Checked='<%# Eval("ESTADO_PROV") %>' Enabled="false" />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="background-color: #008A8C; color: #FFFFFF;">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                </td>
                <td>
                    <asp:Label ID="ID_PROVLabel1" runat="server" Text='<%# Eval("ID_PROV") %>' />
                </td>
                <td>
                    <asp:TextBox ID="RAZON_SOCIAL_PROVTextBox" runat="server" Text='<%# Bind("RAZON_SOCIAL_PROV") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DIRECCION_PROVTextBox" runat="server" Text='<%# Bind("DIRECCION_PROV") %>' />
                </td>
                <td>
                    <asp:TextBox ID="TELEFONO_PROVTextBox" runat="server" Text='<%# Bind("TELEFONO_PROV") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="ESTADO_PROVCheckBox" runat="server" Checked='<%# Bind("ESTADO_PROV") %>' />
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
                    <asp:TextBox ID="ID_PROVTextBox" runat="server" Text='<%# Bind("ID_PROV") %>' />
                </td>
                <td>
                    <asp:TextBox ID="RAZON_SOCIAL_PROVTextBox" runat="server" Text='<%# Bind("RAZON_SOCIAL_PROV") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DIRECCION_PROVTextBox" runat="server" Text='<%# Bind("DIRECCION_PROV") %>' />
                </td>
                <td>
                    <asp:TextBox ID="TELEFONO_PROVTextBox" runat="server" Text='<%# Bind("TELEFONO_PROV") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="ESTADO_PROVCheckBox" runat="server" Checked='<%# Bind("ESTADO_PROV") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color: #DCDCDC; color: #000000;">
                <td>
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Editar" />
                </td>
                <td>
                    <asp:Label ID="ID_PROVLabel" runat="server" Text='<%# Eval("ID_PROV") %>' />
                </td>
                <td>
                    <asp:Label ID="RAZON_SOCIAL_PROVLabel" runat="server" Text='<%# Eval("RAZON_SOCIAL_PROV") %>' />
                </td>
                <td>
                    <asp:Label ID="DIRECCION_PROVLabel" runat="server" Text='<%# Eval("DIRECCION_PROV") %>' />
                </td>
                <td>
                    <asp:Label ID="TELEFONO_PROVLabel" runat="server" Text='<%# Eval("TELEFONO_PROV") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="ESTADO_PROVCheckBox" runat="server" Checked='<%# Eval("ESTADO_PROV") %>' Enabled="false" />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color: #DCDCDC; color: #000000;">
                                <th runat="server"></th>
                                <th runat="server">Proveedores</th>
                                <th runat="server">Razon Social</th>
                                <th runat="server">Direccion</th>
                                <th runat="server">Telefono</th>
                                <th runat="server">Estado</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center;background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
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
            <tr style="background-color: #008A8C; font-weight: bold;color: #FFFFFF;">
                <td>
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Editar" />
                </td>
                <td>
                    <asp:Label ID="ID_PROVLabel" runat="server" Text='<%# Eval("ID_PROV") %>' />
                </td>
                <td>
                    <asp:Label ID="RAZON_SOCIAL_PROVLabel" runat="server" Text='<%# Eval("RAZON_SOCIAL_PROV") %>' />
                </td>
                <td>
                    <asp:Label ID="DIRECCION_PROVLabel" runat="server" Text='<%# Eval("DIRECCION_PROV") %>' />
                </td>
                <td>
                    <asp:Label ID="TELEFONO_PROVLabel" runat="server" Text='<%# Eval("TELEFONO_PROV") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="ESTADO_PROVCheckBox" runat="server" Checked='<%# Eval("ESTADO_PROV") %>' Enabled="false" />
                </td>
            </tr>
        </SelectedItemTemplate>
</asp:ListView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FINAL_LABConnectionString %>" DeleteCommand="DELETE FROM [PROVEEDORES] WHERE [ID_PROV] = @ID_PROV" InsertCommand="INSERT INTO [PROVEEDORES] ([ID_PROV], [RAZON_SOCIAL_PROV], [DIRECCION_PROV], [TELEFONO_PROV], [ESTADO_PROV]) VALUES (@ID_PROV, @RAZON_SOCIAL_PROV, @DIRECCION_PROV, @TELEFONO_PROV, @ESTADO_PROV)" SelectCommand="SELECT * FROM [PROVEEDORES]" UpdateCommand="UPDATE [PROVEEDORES] SET [RAZON_SOCIAL_PROV] = @RAZON_SOCIAL_PROV, [DIRECCION_PROV] = @DIRECCION_PROV, [TELEFONO_PROV] = @TELEFONO_PROV, [ESTADO_PROV] = @ESTADO_PROV WHERE [ID_PROV] = @ID_PROV">
    <DeleteParameters>
        <asp:Parameter Name="Proveedor" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="Proveedor" Type="String" />
        <asp:Parameter Name="Razon Social" Type="String" />
        <asp:Parameter Name="Direccion" Type="String" />
        <asp:Parameter Name="Telefono" Type="String" />
        <asp:Parameter Name="Estado" Type="Boolean" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="RAZON_SOCIAL_PROV" Type="String" />
        <asp:Parameter Name="DIRECCION_PROV" Type="String" />
        <asp:Parameter Name="TELEFONO_PROV" Type="String" />
        <asp:Parameter Name="ESTADO_PROV" Type="Boolean" />
        <asp:Parameter Name="ID_PROV" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContenidoColDerEmpleado" runat="server">
</asp:Content>
