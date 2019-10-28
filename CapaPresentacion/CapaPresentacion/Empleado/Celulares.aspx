<%@ Page Title="" Language="C#" MasterPageFile="~/Empleado/PaginaMaestraEmpleado.master" AutoEventWireup="true" CodeBehind="Celulares.aspx.cs" Inherits="CapaPresentacion.Empleado.Celulares" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadEmpleado" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoColIzEmpleado" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoColPpalEmpleado" runat="server">
    <div id="FormCelulares" class="Form">
    <br />
    <asp:Label ID="lblFiltrarpor_cel" runat="server" Text="Filtrar por: "></asp:Label>
    <br />
    &nbsp;<br />
    <asp:Label ID="lblMarca_cel" runat="server" Text="Marca: "></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblModelo_cel" runat="server" Text="Modelo: "></asp:Label>
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    &nbsp;&nbsp;
    <asp:Label ID="lblProv_cel" runat="server" Text="Proveedor:"></asp:Label>
    &nbsp;&nbsp;
    <asp:TextBox ID="TextBox3" runat="server" Width="104px"></asp:TextBox>
    &nbsp;
    <br />
    <asp:Panel ID="Panel1" runat="server" Height="67px" Width="580px">
        <asp:Label ID="Label1" runat="server" Text="Precio: "></asp:Label>
        <br />
        <br />
        <asp:RadioButton ID="Mayor" runat="server" Text="Mayor a:" />
        <asp:RadioButton ID="Menor" runat="server" Text="Menor a:" />
        <asp:RadioButton ID="Igual" runat="server" Text="Igual a:" />
        &nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox4" runat="server" Height="19px"></asp:TextBox>
    </asp:Panel>
    <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;
        <asp:Button ID="bttnFiltrar" runat="server" Text="Filtrar" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="bttnQuitarFiltro" runat="server" Text="Quitar Filtro" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
    <br />
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID_MODELO" DataSourceID="SqlDataSource1" GroupItemCount="3" InsertItemPosition="LastItem" OnSelectedIndexChanged="ListView1_SelectedIndexChanged">
        <AlternatingItemTemplate>
            <td runat="server" style="background-color:#FFF8DC;">ID_MODELO:
                <asp:Label ID="ID_MODELOLabel" runat="server" Text='<%# Eval("ID_MODELO") %>' />
                <br />ID_MARCA_CEL:
                <asp:Label ID="ID_MARCA_CELLabel" runat="server" Text='<%# Eval("ID_MARCA_CEL") %>' />
                <br />DESCRIPCION_CEL:
                <asp:Label ID="DESCRIPCION_CELLabel" runat="server" Text='<%# Eval("DESCRIPCION_CEL") %>' />
                <br />PRECIO_UNITARIO_CEL:
                <asp:Label ID="PRECIO_UNITARIO_CELLabel" runat="server" Text='<%# Eval("PRECIO_UNITARIO_CEL") %>' />
                <br />
                IMAGEN_CEL:
                <asp:Label ID="IMAGEN_CELLabel" runat="server" Text='<%# Eval("IMAGEN_CEL") %>' />
                <br />
                <asp:CheckBox ID="ESTADO_CELCheckBox" runat="server" Checked='<%# Eval("ESTADO_CEL") %>' Enabled="false" Text="ESTADO_CEL" />
                <br />
                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Editar" />
                <br /></td>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <td runat="server" style="background-color:#008A8C;color: #FFFFFF;">ID_MODELO:
                <asp:Label ID="ID_MODELOLabel1" runat="server" Text='<%# Eval("ID_MODELO") %>' />
                <br />ID_MARCA_CEL:
                <asp:TextBox ID="ID_MARCA_CELTextBox" runat="server" Text='<%# Bind("ID_MARCA_CEL") %>' />
                <br />DESCRIPCION_CEL:
                <asp:TextBox ID="DESCRIPCION_CELTextBox" runat="server" Text='<%# Bind("DESCRIPCION_CEL") %>' />
                <br />PRECIO_UNITARIO_CEL:
                <asp:TextBox ID="PRECIO_UNITARIO_CELTextBox" runat="server" Text='<%# Bind("PRECIO_UNITARIO_CEL") %>' />
                <br />
                IMAGEN_CEL:
                <asp:TextBox ID="IMAGEN_CELTextBox" runat="server" Text='<%# Bind("IMAGEN_CEL") %>' />
                <br />
                <asp:CheckBox ID="ESTADO_CELCheckBox" runat="server" Checked='<%# Bind("ESTADO_CEL") %>' Text="ESTADO_CEL" />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                <br />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                <br /></td>
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
            <td runat="server" style="">ID_MODELO:
                <asp:TextBox ID="ID_MODELOTextBox" runat="server" Text='<%# Bind("ID_MODELO") %>' />
                <br />ID_MARCA_CEL:
                <asp:TextBox ID="ID_MARCA_CELTextBox" runat="server" Text='<%# Bind("ID_MARCA_CEL") %>' />
                <br />DESCRIPCION_CEL:
                <asp:TextBox ID="DESCRIPCION_CELTextBox" runat="server" Text='<%# Bind("DESCRIPCION_CEL") %>' />
                <br />PRECIO_UNITARIO_CEL:
                <asp:TextBox ID="PRECIO_UNITARIO_CELTextBox" runat="server" Text='<%# Bind("PRECIO_UNITARIO_CEL") %>' />
                <br />
                IMAGEN_CEL:
                <asp:TextBox ID="IMAGEN_CELTextBox" runat="server" Text='<%# Bind("IMAGEN_CEL") %>' />
                <br />
                <asp:CheckBox ID="ESTADO_CELCheckBox" runat="server" Checked='<%# Bind("ESTADO_CEL") %>' Text="ESTADO_CEL" />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                <br />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
                <br /></td>
        </InsertItemTemplate>
        <ItemTemplate>
            <td runat="server" style="background-color:#DCDCDC;color: #000000;">ID_MODELO:
                <asp:Label ID="ID_MODELOLabel" runat="server" Text='<%# Eval("ID_MODELO") %>' />
                <br />ID_MARCA_CEL:
                <asp:Label ID="ID_MARCA_CELLabel" runat="server" Text='<%# Eval("ID_MARCA_CEL") %>' />
                <br />DESCRIPCION_CEL:
                <asp:Label ID="DESCRIPCION_CELLabel" runat="server" Text='<%# Eval("DESCRIPCION_CEL") %>' />
                <br />PRECIO_UNITARIO_CEL:
                <asp:Label ID="PRECIO_UNITARIO_CELLabel" runat="server" Text='<%# Eval("PRECIO_UNITARIO_CEL") %>' />
                <br />
                IMAGEN_CEL:
                <asp:Label ID="IMAGEN_CELLabel" runat="server" Text='<%# Eval("IMAGEN_CEL") %>' />
                <br />
                <asp:CheckBox ID="ESTADO_CELCheckBox" runat="server" Checked='<%# Eval("ESTADO_CEL") %>' Enabled="false" Text="ESTADO_CEL" />
                <br />
                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Editar" />
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
                    <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <td runat="server" style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">ID_MODELO:
                <asp:Label ID="ID_MODELOLabel" runat="server" Text='<%# Eval("ID_MODELO") %>' />
                <br />ID_MARCA_CEL:
                <asp:Label ID="ID_MARCA_CELLabel" runat="server" Text='<%# Eval("ID_MARCA_CEL") %>' />
                <br />DESCRIPCION_CEL:
                <asp:Label ID="DESCRIPCION_CELLabel" runat="server" Text='<%# Eval("DESCRIPCION_CEL") %>' />
                <br />PRECIO_UNITARIO_CEL:
                <asp:Label ID="PRECIO_UNITARIO_CELLabel" runat="server" Text='<%# Eval("PRECIO_UNITARIO_CEL") %>' />
                <br />
                IMAGEN_CEL:
                <asp:Label ID="IMAGEN_CELLabel" runat="server" Text='<%# Eval("IMAGEN_CEL") %>' />
                <br />
                <asp:CheckBox ID="ESTADO_CELCheckBox" runat="server" Checked='<%# Eval("ESTADO_CEL") %>' Enabled="false" Text="ESTADO_CEL" />
                <br />
                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Editar" />
                <br /></td>
        </SelectedItemTemplate>
    </asp:ListView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FINAL_LABConnectionString5 %>" DeleteCommand="DELETE FROM [CELULARES] WHERE [ID_MODELO] = @ID_MODELO" InsertCommand="INSERT INTO [CELULARES] ([ID_MODELO], [ID_MARCA_CEL], [DESCRIPCION_CEL], [PRECIO_UNITARIO_CEL], [IMAGEN_CEL], [ESTADO_CEL]) VALUES (@ID_MODELO, @ID_MARCA_CEL, @DESCRIPCION_CEL, @PRECIO_UNITARIO_CEL, @IMAGEN_CEL, @ESTADO_CEL)" SelectCommand="SELECT * FROM [CELULARES]" UpdateCommand="UPDATE [CELULARES] SET [ID_MARCA_CEL] = @ID_MARCA_CEL, [DESCRIPCION_CEL] = @DESCRIPCION_CEL, [PRECIO_UNITARIO_CEL] = @PRECIO_UNITARIO_CEL, [IMAGEN_CEL] = @IMAGEN_CEL, [ESTADO_CEL] = @ESTADO_CEL WHERE [ID_MODELO] = @ID_MODELO" ProviderName="System.Data.SqlClient">
    <DeleteParameters>
        <asp:Parameter Name="ID_MODELO" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="ID_MODELO" Type="String" />
        <asp:Parameter Name="ID_MARCA_CEL" Type="String" />
        <asp:Parameter Name="DESCRIPCION_CEL" Type="String" />
        <asp:Parameter Name="PRECIO_UNITARIO_CEL" Type="Double" />
        <asp:Parameter Name="IMAGEN_CEL" Type="String" />
        <asp:Parameter Name="ESTADO_CEL" Type="Boolean" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="ID_MARCA_CEL" Type="String" />
        <asp:Parameter Name="DESCRIPCION_CEL" Type="String" />
        <asp:Parameter Name="PRECIO_UNITARIO_CEL" Type="Double" />
        <asp:Parameter Name="IMAGEN_CEL" Type="String" />
        <asp:Parameter Name="ESTADO_CEL" Type="Boolean" />
        <asp:Parameter Name="ID_MODELO" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
        </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContenidoColDerEmpleado" runat="server">
</asp:Content>
