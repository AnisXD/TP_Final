<%@ Page Title="" Language="C#" MasterPageFile="~/Empleado/PaginaMaestraEmpleado.master" AutoEventWireup="true" CodeBehind="DetallesVentas.aspx.cs" Inherits="CapaPresentacion.Empleado.DetallesVentas" %>

<script runat="server">

    protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadEmpleado" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoColIzEmpleado" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoColPpalEmpleado" runat="server">
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID_VTA" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="ListView1_SelectedIndexChanged">
        <AlternatingItemTemplate>
            <li style="background-color: #FFF8DC;">Venta:
                <asp:Label ID="ID_VTALabel" runat="server" Text='<%# Eval("ID_VTA") %>' />
                <br />
                DNI Cliente
                <asp:Label ID="ID_CLI_VTALabel" runat="server" Text='<%# Eval("ID_CLI_VTA") %>'></asp:Label>
                <br />
                Legajo:
                <asp:Label ID="ID_VENDLabel" runat="server" Text='<%# Eval("ID_VEND") %>' />
                <br />
                Fecha:
                <asp:Label ID="FECHA_VTALabel" runat="server" Text='<%# Eval("FECHA_VTA") %>' />
                <br />
                Forma de envio:
                <asp:Label ID="ID_FORMAENVIO_VTALabel" runat="server" Text='<%# Eval("ID_FORMAENVIO_VTA") %>' />
                <br />
                Forma de pago:
                <asp:Label ID="ID_FORMAPAGO_VTALabel" runat="server" Text='<%# Eval("ID_FORMAPAGO_VTA") %>' />
                <br />
                Total:
                <asp:Label ID="IMPORTELabel" runat="server" Text='<%# Eval("IMPORTE") %>' />
                <br />
            </li>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <li style="background-color: #008A8C;color: #FFFFFF;">ID_VTA:
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
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
            </li>
        </EditItemTemplate>
        <EmptyDataTemplate>
            No se han devuelto datos.
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <li style="">ID_VTA:
                <asp:TextBox ID="ID_VTATextBox" runat="server" Text='<%# Bind("ID_VTA") %>' />
                <br />ID_CLI_VTA:
                <asp:TextBox ID="ID_CLI_VTATextBox" runat="server" Text='<%# Bind("ID_CLI_VTA") %>' />
                <br />ID_VEND:
                <asp:TextBox ID="ID_VENDTextBox" runat="server" Text='<%# Bind("ID_VEND") %>' />
                <br />FECHA_VTA:
                <asp:TextBox ID="FECHA_VTATextBox" runat="server" Text='<%# Bind("FECHA_VTA") %>' />
                <br />ID_FORMAENVIO_VTA:
                <asp:TextBox ID="ID_FORMAENVIO_VTATextBox" runat="server" Text='<%# Bind("ID_FORMAENVIO_VTA") %>' />
                <br />ID_FORMAPAGO_VTA:
                <asp:TextBox ID="ID_FORMAPAGO_VTATextBox" runat="server" Text='<%# Bind("ID_FORMAPAGO_VTA") %>' />
                <br />IMPORTE:
                <asp:TextBox ID="IMPORTETextBox" runat="server" Text='<%# Bind("IMPORTE") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
            </li>
        </InsertItemTemplate>
        <ItemSeparatorTemplate>
<br />
        </ItemSeparatorTemplate>
        <ItemTemplate>
            <li style="background-color: #DCDCDC;color: #000000;">ID_VTA:
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
            </li>
        </ItemTemplate>
        <LayoutTemplate>
            <ul id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                <li runat="server" id="itemPlaceholder" />
            </ul>
            <div style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
            </div>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <li style="background-color: #008A8C;font-weight: bold;color: #FFFFFF;">ID_VTA:
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
            </li>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FINAL_LABConnectionString %>" SelectCommand="SELECT * FROM [VENTAS]"></asp:SqlDataSource>
    &nbsp;<br />
    <asp:ListView ID="ListView2" runat="server" DataKeyNames="ID_DV,ID_VTA_DV" DataSourceID="SqlDataSource2">
        <AlternatingItemTemplate>
            <li style="background-color: #FFF8DC;">ID_DV:
                <asp:Label ID="ID_DVLabel" runat="server" Text='<%# Eval("ID_DV") %>' />
                <br />
                ID_VTA_DV:
                <asp:Label ID="ID_VTA_DVLabel" runat="server" Text='<%# Eval("ID_VTA_DV") %>' />
                <br />
                ID_PROV_DV:
                <asp:Label ID="ID_PROV_DVLabel" runat="server" Text='<%# Eval("ID_PROV_DV") %>' />
                <br />
                ID_MODELO_DV:
                <asp:Label ID="ID_MODELO_DVLabel" runat="server" Text='<%# Eval("ID_MODELO_DV") %>' />
                <br />
                CANTIDAD_DV:
                <asp:Label ID="CANTIDAD_DVLabel" runat="server" Text='<%# Eval("CANTIDAD_DV") %>' />
                <br />
                PU_DV:
                <asp:Label ID="PU_DVLabel" runat="server" Text='<%# Eval("PU_DV") %>' />
                <br />
            </li>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <li style="background-color: #008A8C;color: #FFFFFF;">ID_DV:
                <asp:Label ID="ID_DVLabel1" runat="server" Text='<%# Eval("ID_DV") %>' />
                <br />
                ID_VTA_DV:
                <asp:Label ID="ID_VTA_DVLabel1" runat="server" Text='<%# Eval("ID_VTA_DV") %>' />
                <br />
                ID_PROV_DV:
                <asp:TextBox ID="ID_PROV_DVTextBox" runat="server" Text='<%# Bind("ID_PROV_DV") %>' />
                <br />
                ID_MODELO_DV:
                <asp:TextBox ID="ID_MODELO_DVTextBox" runat="server" Text='<%# Bind("ID_MODELO_DV") %>' />
                <br />
                CANTIDAD_DV:
                <asp:TextBox ID="CANTIDAD_DVTextBox" runat="server" Text='<%# Bind("CANTIDAD_DV") %>' />
                <br />
                PU_DV:
                <asp:TextBox ID="PU_DVTextBox" runat="server" Text='<%# Bind("PU_DV") %>' />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
            </li>
        </EditItemTemplate>
        <EmptyDataTemplate>
            No se han devuelto datos.
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <li style="">ID_DV:
                <asp:TextBox ID="ID_DVTextBox" runat="server" Text='<%# Bind("ID_DV") %>' />
                <br />ID_VTA_DV:
                <asp:TextBox ID="ID_VTA_DVTextBox" runat="server" Text='<%# Bind("ID_VTA_DV") %>' />
                <br />ID_PROV_DV:
                <asp:TextBox ID="ID_PROV_DVTextBox" runat="server" Text='<%# Bind("ID_PROV_DV") %>' />
                <br />ID_MODELO_DV:
                <asp:TextBox ID="ID_MODELO_DVTextBox" runat="server" Text='<%# Bind("ID_MODELO_DV") %>' />
                <br />CANTIDAD_DV:
                <asp:TextBox ID="CANTIDAD_DVTextBox" runat="server" Text='<%# Bind("CANTIDAD_DV") %>' />
                <br />PU_DV:
                <asp:TextBox ID="PU_DVTextBox" runat="server" Text='<%# Bind("PU_DV") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
            </li>
        </InsertItemTemplate>
        <ItemSeparatorTemplate>
<br />
        </ItemSeparatorTemplate>
        <ItemTemplate>
            <li style="background-color: #DCDCDC;color: #000000;">ID_DV:
                <asp:Label ID="ID_DVLabel" runat="server" Text='<%# Eval("ID_DV") %>' />
                <br />
                ID_VTA_DV:
                <asp:Label ID="ID_VTA_DVLabel" runat="server" Text='<%# Eval("ID_VTA_DV") %>' />
                <br />
                ID_PROV_DV:
                <asp:Label ID="ID_PROV_DVLabel" runat="server" Text='<%# Eval("ID_PROV_DV") %>' />
                <br />
                ID_MODELO_DV:
                <asp:Label ID="ID_MODELO_DVLabel" runat="server" Text='<%# Eval("ID_MODELO_DV") %>' />
                <br />
                CANTIDAD_DV:
                <asp:Label ID="CANTIDAD_DVLabel" runat="server" Text='<%# Eval("CANTIDAD_DV") %>' />
                <br />
                PU_DV:
                <asp:Label ID="PU_DVLabel" runat="server" Text='<%# Eval("PU_DV") %>' />
                <br />
            </li>
        </ItemTemplate>
        <LayoutTemplate>
            <ul id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                <li runat="server" id="itemPlaceholder" />
            </ul>
            <div style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                <asp:DataPager ID="DataPager1" runat="server">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                    </Fields>
                </asp:DataPager>
            </div>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <li style="background-color: #008A8C;font-weight: bold;color: #FFFFFF;">ID_DV:
                <asp:Label ID="ID_DVLabel" runat="server" Text='<%# Eval("ID_DV") %>' />
                <br />
                ID_VTA_DV:
                <asp:Label ID="ID_VTA_DVLabel" runat="server" Text='<%# Eval("ID_VTA_DV") %>' />
                <br />
                ID_PROV_DV:
                <asp:Label ID="ID_PROV_DVLabel" runat="server" Text='<%# Eval("ID_PROV_DV") %>' />
                <br />
                ID_MODELO_DV:
                <asp:Label ID="ID_MODELO_DVLabel" runat="server" Text='<%# Eval("ID_MODELO_DV") %>' />
                <br />
                CANTIDAD_DV:
                <asp:Label ID="CANTIDAD_DVLabel" runat="server" Text='<%# Eval("CANTIDAD_DV") %>' />
                <br />
                PU_DV:
                <asp:Label ID="PU_DVLabel" runat="server" Text='<%# Eval("PU_DV") %>' />
                <br />
            </li>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:FINAL_LABConnectionString %>" SelectCommand="SELECT * FROM [DETALLES_VENTAS]"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContenidoColDerEmpleado" runat="server">
</asp:Content>
