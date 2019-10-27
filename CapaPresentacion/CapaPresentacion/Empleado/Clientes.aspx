<%@ Page Title="" Language="C#" MasterPageFile="~/Empleado/PaginaMaestraEmpleado.master" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="CapaPresentacion.Empleado.Clientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadEmpleado" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoColIzEmpleado" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoColPpalEmpleado" runat="server">
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblFiltrarpor_Clientes" runat="server" Text="Filtrar por: "></asp:Label>
    <br />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Label ID="lblDNI_Clientes" runat="server" Text="Dni: "></asp:Label>
<asp:TextBox ID="TextBox1" runat="server" Width="90px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Label ID="lblApellido" runat="server" Text="Apellido: "></asp:Label>
<asp:TextBox ID="TextBox2" runat="server" Height="19px" Width="98px"></asp:TextBox>
    <br />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="bttnFiltrar" runat="server" Text="Filtrar" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="bttnQuitarF" runat="server" Text="Quitar filtro" />
    <br />
    <br />
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID_CLIENTE" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
        <AlternatingItemTemplate>
            <tr style="background-color:#FFF8DC;">
                <td>
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Editar" />
                </td>
                <td>
                    <asp:Label ID="ID_CLIENTELabel" runat="server" Text='<%# Eval("ID_CLIENTE") %>' />
                </td>
                <td>
                    <asp:Label ID="NOMBRE_CLILabel" runat="server" Text='<%# Eval("NOMBRE_CLI") %>' />
                </td>
                <td>
                    <asp:Label ID="APELLIDO_CLILabel" runat="server" Text='<%# Eval("APELLIDO_CLI") %>' />
                </td>
                <td>
                    <asp:Label ID="DIRECCION_CLILabel" runat="server" Text='<%# Eval("DIRECCION_CLI") %>' />
                </td>
                <td>
                    <asp:Label ID="TELÉFONO_CLILabel" runat="server" Text='<%# Eval("TELÉFONO_CLI") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="ESTADO_CLICheckBox" runat="server" Checked='<%# Eval("ESTADO_CLI") %>' Enabled="false" />
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
                    <asp:Label ID="ID_CLIENTELabel1" runat="server" Text='<%# Eval("ID_CLIENTE") %>' />
                </td>
                <td>
                    <asp:TextBox ID="NOMBRE_CLITextBox" runat="server" Text='<%# Bind("NOMBRE_CLI") %>' />
                </td>
                <td>
                    <asp:TextBox ID="APELLIDO_CLITextBox" runat="server" Text='<%# Bind("APELLIDO_CLI") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DIRECCION_CLITextBox" runat="server" Text='<%# Bind("DIRECCION_CLI") %>' />
                </td>
                <td>
                    <asp:TextBox ID="TELÉFONO_CLITextBox" runat="server" Text='<%# Bind("TELÉFONO_CLI") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="ESTADO_CLICheckBox" runat="server" Checked='<%# Bind("ESTADO_CLI") %>' />
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
                    <asp:TextBox ID="ID_CLIENTETextBox" runat="server" Text='<%# Bind("ID_CLIENTE") %>' />
                </td>
                <td>
                    <asp:TextBox ID="NOMBRE_CLITextBox" runat="server" Text='<%# Bind("NOMBRE_CLI") %>' />
                </td>
                <td>
                    <asp:TextBox ID="APELLIDO_CLITextBox" runat="server" Text='<%# Bind("APELLIDO_CLI") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DIRECCION_CLITextBox" runat="server" Text='<%# Bind("DIRECCION_CLI") %>' />
                </td>
                <td>
                    <asp:TextBox ID="TELÉFONO_CLITextBox" runat="server" Text='<%# Bind("TELÉFONO_CLI") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="ESTADO_CLICheckBox" runat="server" Checked='<%# Bind("ESTADO_CLI") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color:#DCDCDC;color: #000000;">
                <td>
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Editar" />
                </td>
                <td>
                    <asp:Label ID="ID_CLIENTELabel" runat="server" Text='<%# Eval("ID_CLIENTE") %>' />
                </td>
                <td>
                    <asp:Label ID="NOMBRE_CLILabel" runat="server" Text='<%# Eval("NOMBRE_CLI") %>' />
                </td>
                <td>
                    <asp:Label ID="APELLIDO_CLILabel" runat="server" Text='<%# Eval("APELLIDO_CLI") %>' />
                </td>
                <td>
                    <asp:Label ID="DIRECCION_CLILabel" runat="server" Text='<%# Eval("DIRECCION_CLI") %>' />
                </td>
                <td>
                    <asp:Label ID="TELÉFONO_CLILabel" runat="server" Text='<%# Eval("TELÉFONO_CLI") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="ESTADO_CLICheckBox" runat="server" Checked='<%# Eval("ESTADO_CLI") %>' Enabled="false" />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                <th runat="server"></th>
                                <th runat="server">Dni</th>
                                <th runat="server">Nombres</th>
                                <th runat="server">Apellidos</th>
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
                    <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
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
            <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                <td>
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Editar" />
                </td>
                <td>
                    <asp:Label ID="ID_CLIENTELabel" runat="server" Text='<%# Eval("ID_CLIENTE") %>' />
                </td>
                <td>
                    <asp:Label ID="NOMBRE_CLILabel" runat="server" Text='<%# Eval("NOMBRE_CLI") %>' />
                </td>
                <td>
                    <asp:Label ID="APELLIDO_CLILabel" runat="server" Text='<%# Eval("APELLIDO_CLI") %>' />
                </td>
                <td>
                    <asp:Label ID="DIRECCION_CLILabel" runat="server" Text='<%# Eval("DIRECCION_CLI") %>' />
                </td>
                <td>
                    <asp:Label ID="TELÉFONO_CLILabel" runat="server" Text='<%# Eval("TELÉFONO_CLI") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="ESTADO_CLICheckBox" runat="server" Checked='<%# Eval("ESTADO_CLI") %>' Enabled="false" />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FINAL_LABConnectionString2 %>" DeleteCommand="DELETE FROM [CLIENTES] WHERE [ID_CLIENTE] = @ID_CLIENTE" InsertCommand="INSERT INTO [CLIENTES] ([ID_CLIENTE], [NOMBRE_CLI], [APELLIDO_CLI], [DIRECCION_CLI], [TELÉFONO_CLI], [ESTADO_CLI]) VALUES (@ID_CLIENTE, @NOMBRE_CLI, @APELLIDO_CLI, @DIRECCION_CLI, @TELÉFONO_CLI, @ESTADO_CLI)" SelectCommand="SELECT * FROM [CLIENTES]" UpdateCommand="UPDATE [CLIENTES] SET [NOMBRE_CLI] = @NOMBRE_CLI, [APELLIDO_CLI] = @APELLIDO_CLI, [DIRECCION_CLI] = @DIRECCION_CLI, [TELÉFONO_CLI] = @TELÉFONO_CLI, [ESTADO_CLI] = @ESTADO_CLI WHERE [ID_CLIENTE] = @ID_CLIENTE">
        <DeleteParameters>
            <asp:Parameter Name="ID_CLIENTE" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ID_CLIENTE" Type="String" />
            <asp:Parameter Name="NOMBRE_CLI" Type="String" />
            <asp:Parameter Name="APELLIDO_CLI" Type="String" />
            <asp:Parameter Name="DIRECCION_CLI" Type="String" />
            <asp:Parameter Name="TELÉFONO_CLI" Type="String" />
            <asp:Parameter Name="ESTADO_CLI" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="NOMBRE_CLI" Type="String" />
            <asp:Parameter Name="APELLIDO_CLI" Type="String" />
            <asp:Parameter Name="DIRECCION_CLI" Type="String" />
            <asp:Parameter Name="TELÉFONO_CLI" Type="String" />
            <asp:Parameter Name="ESTADO_CLI" Type="Boolean" />
            <asp:Parameter Name="ID_CLIENTE" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContenidoColDerEmpleado" runat="server">
</asp:Content>
