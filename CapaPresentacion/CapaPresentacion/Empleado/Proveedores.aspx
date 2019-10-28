<%@ Page Title="" Language="C#" MasterPageFile="~/Empleado/PaginaMaestraEmpleado.master" AutoEventWireup="true" CodeBehind="Proveedores.aspx.cs" Inherits="CapaPresentacion.Empleado.Proveedores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadEmpleado" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoColIzEmpleado" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoColPpalEmpleado" runat="server">
    <h1>Administrar Proveedores</h1>
<div id="FormProveedores" class="Form">
    
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
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="ID_PROV">
        <AlternatingItemTemplate>
            <tr style="background-color: #FFFFFF;color: #284775;">
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
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="background-color: #999999;">
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
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color: #E0FFFF;color: #333333;">
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
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                <th runat="server">ID_PROV</th>
                                <th runat="server">RAZON_SOCIAL_PROV</th>
                                <th runat="server">DIRECCION_PROV</th>
                                <th runat="server">TELEFONO_PROV</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF"></td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
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
            </tr>
        </SelectedItemTemplate>
</asp:ListView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FINAL_LABConnectionString %>" DeleteCommand="DELETE FROM [PROVEEDORES] WHERE [ID_PROV] = @ID_PROV" InsertCommand="INSERT INTO [PROVEEDORES] ([ID_PROV], [RAZON_SOCIAL_PROV], [DIRECCION_PROV], [TELEFONO_PROV]) VALUES (@ID_PROV, @RAZON_SOCIAL_PROV, @DIRECCION_PROV, @TELEFONO_PROV)" SelectCommand="SELECT [ID_PROV], [RAZON_SOCIAL_PROV], [DIRECCION_PROV], [TELEFONO_PROV] FROM [PROVEEDORES]" UpdateCommand="UPDATE [PROVEEDORES] SET [RAZON_SOCIAL_PROV] = @RAZON_SOCIAL_PROV, [DIRECCION_PROV] = @DIRECCION_PROV, [TELEFONO_PROV] = @TELEFONO_PROV WHERE [ID_PROV] = @ID_PROV">
    <DeleteParameters>
        <asp:Parameter Name="ID_PROV" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="ID_PROV" Type="String" />
        <asp:Parameter Name="RAZON_SOCIAL_PROV" Type="String" />
        <asp:Parameter Name="DIRECCION_PROV" Type="String" />
        <asp:Parameter Name="TELEFONO_PROV" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="RAZON_SOCIAL_PROV" Type="String" />
        <asp:Parameter Name="DIRECCION_PROV" Type="String" />
        <asp:Parameter Name="TELEFONO_PROV" Type="String" />
        <asp:Parameter Name="ID_PROV" Type="String" />
    </UpdateParameters>

</asp:SqlDataSource>
      </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContenidoColDerEmpleado" runat="server">
</asp:Content>
