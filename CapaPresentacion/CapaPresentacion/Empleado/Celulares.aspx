<%@ Page Title="" Language="C#" MasterPageFile="~/Empleado/PaginaMaestraEmpleado.master" AutoEventWireup="true" CodeBehind="Celulares.aspx.cs" Inherits="CapaPresentacion.Empleado.Celulares" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadEmpleado" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoColIzEmpleado" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoColPpalEmpleado" runat="server">
    <h1>Administracion Celulares</h1>
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
    <asp:TextBox ID="TextBox3" runat="server" Width="104px" CssClass="ControlesASP"></asp:TextBox>
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
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID_MODELO" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="ListView1_SelectedIndexChanged">
        <AlternatingItemTemplate>
            <td runat="server" style="background-color:#FFFFFF; color: #284775;">ID_MODELO:
                <asp:Label ID="ID_MODELOLabel" runat="server" Text='<%# Eval("ID_MODELO") %>' />
                <br />ID_MARCA_CEL:
                <asp:Label ID="ID_MARCA_CELLabel" runat="server" Text='<%# Eval("ID_MARCA_CEL") %>' />
                <br />ID_PROVEEDOR_CEL:
                <asp:Label ID="ID_PROVEEDOR_CELLabel" runat="server" Text='<%# Eval("ID_PROVEEDOR_CEL") %>' />
                <br />DESCRIPCION_CEL:
                <asp:Label ID="DESCRIPCION_CELLabel" runat="server" Text='<%# Eval("DESCRIPCION_CEL") %>' />
                <br />
                PRECIO_UNITARIO_CEL:
                <asp:Label ID="PRECIO_UNITARIO_CELLabel" runat="server" Text='<%# Eval("PRECIO_UNITARIO_CEL") %>' />
                <br />
                </td>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <td runat="server" style="background-color:#999999;">ID_MODELO:
                <asp:Label ID="ID_MODELOLabel1" runat="server" Text='<%# Eval("ID_MODELO") %>' />
                <br />ID_MARCA_CEL:
                <asp:TextBox ID="ID_MARCA_CELTextBox" runat="server" Text='<%# Bind("ID_MARCA_CEL") %>' />
                <br />ID_PROVEEDOR_CEL:
                <asp:TextBox ID="ID_PROVEEDOR_CELTextBox" runat="server" Text='<%# Bind("ID_PROVEEDOR_CEL") %>' />
                <br />DESCRIPCION_CEL:
                <asp:TextBox ID="DESCRIPCION_CELTextBox" runat="server" Text='<%# Bind("DESCRIPCION_CEL") %>' />
                <br />
                PRECIO_UNITARIO_CEL:
                <asp:TextBox ID="PRECIO_UNITARIO_CELTextBox" runat="server" Text='<%# Bind("PRECIO_UNITARIO_CEL") %>' />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                </td>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td>No se han devuelto datos.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <td runat="server" style="">ID_MODELO:
                <asp:TextBox ID="ID_MODELOTextBox" runat="server" Text='<%# Bind("ID_MODELO") %>' />
                <br />ID_MARCA_CEL:
                <asp:TextBox ID="ID_MARCA_CELTextBox" runat="server" Text='<%# Bind("ID_MARCA_CEL") %>' />
                <br />ID_PROVEEDOR_CEL:
                <asp:TextBox ID="ID_PROVEEDOR_CELTextBox" runat="server" Text='<%# Bind("ID_PROVEEDOR_CEL") %>' />
                <br />DESCRIPCION_CEL:
                <asp:TextBox ID="DESCRIPCION_CELTextBox" runat="server" Text='<%# Bind("DESCRIPCION_CEL") %>' />
                <br />
                PRECIO_UNITARIO_CEL:
                <asp:TextBox ID="PRECIO_UNITARIO_CELTextBox" runat="server" Text='<%# Bind("PRECIO_UNITARIO_CEL") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
                </td>
        </InsertItemTemplate>
        <ItemTemplate>
            <td runat="server" style="background-color:#E0FFFF; color: #333333;">ID_MODELO:
                <asp:Label ID="ID_MODELOLabel" runat="server" Text='<%# Eval("ID_MODELO") %>' />
                <br />ID_MARCA_CEL:
                <asp:Label ID="ID_MARCA_CELLabel" runat="server" Text='<%# Eval("ID_MARCA_CEL") %>' />
                <br />ID_PROVEEDOR_CEL:
                <asp:Label ID="ID_PROVEEDOR_CELLabel" runat="server" Text='<%# Eval("ID_PROVEEDOR_CEL") %>' />
                <br />DESCRIPCION_CEL:
                <asp:Label ID="DESCRIPCION_CELLabel" runat="server" Text='<%# Eval("DESCRIPCION_CEL") %>' />
                <br />
                PRECIO_UNITARIO_CEL:
                <asp:Label ID="PRECIO_UNITARIO_CELLabel" runat="server" Text='<%# Eval("PRECIO_UNITARIO_CEL") %>' />
                <br />
                </td>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                <tr runat="server" id="itemPlaceholderContainer">
                    <td runat="server" id="itemPlaceholder">
                    </td>
                </tr>
            </table>
            <div style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
            </div>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <td runat="server" style="background-color:#E2DED6; font-weight: bold;color: #333333;">ID_MODELO:
                <asp:Label ID="ID_MODELOLabel" runat="server" Text='<%# Eval("ID_MODELO") %>' />
                <br />ID_MARCA_CEL:
                <asp:Label ID="ID_MARCA_CELLabel" runat="server" Text='<%# Eval("ID_MARCA_CEL") %>' />
                <br />ID_PROVEEDOR_CEL:
                <asp:Label ID="ID_PROVEEDOR_CELLabel" runat="server" Text='<%# Eval("ID_PROVEEDOR_CEL") %>' />
                <br />DESCRIPCION_CEL:
                <asp:Label ID="DESCRIPCION_CELLabel" runat="server" Text='<%# Eval("DESCRIPCION_CEL") %>' />
                <br />
                PRECIO_UNITARIO_CEL:
                <asp:Label ID="PRECIO_UNITARIO_CELLabel" runat="server" Text='<%# Eval("PRECIO_UNITARIO_CEL") %>' />
                <br />
                </td>
        </SelectedItemTemplate>
    </asp:ListView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FINAL_LABConnectionString5 %>" SelectCommand="SELECT [ID_MODELO], [ID_MARCA_CEL], [ID_PROVEEDOR_CEL], [DESCRIPCION_CEL], [PRECIO_UNITARIO_CEL] FROM [CELULARES]">
</asp:SqlDataSource>
        </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContenidoColDerEmpleado" runat="server">
</asp:Content>
