<%@ Page Title="" Language="C#" MasterPageFile="~/Cliente/PaginaMaestraCliente.master" AutoEventWireup="true" CodeBehind="CarritoCliente.aspx.cs" Inherits="CapaPresentacion.Cliente.CarritoCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadCliente" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoColIzCliente" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoColPpalCliente" runat="server">
     <h1>Carrito</h1>
    <div id="CarritoEmpleado" class="Form">
        
       
        
        <asp:Label ID="lblIdVenta" runat="server" Text="Venta N°: " CssClass="CarritoControl"></asp:Label>
        <asp:Label ID="txtIdVenta" runat="server" Text="xxx-0001" CssClass="CarritoControl"></asp:Label>
        <br />
        <asp:Label ID="lblFecha" runat="server" Text="Fecha: " CssClass="CarritoControl"></asp:Label>
        <asp:Label ID="txtFecha" runat="server" Text="04/11/2019" CssClass="CarritoControl"></asp:Label>
       <br />
        <asp:Label ID="lblLegajo" runat="server" Text="Legajo: " CssClass="CarritoControl"></asp:Label>
        <asp:Label ID="txtLegajo" runat="server" Text="E-99999999" CssClass="CarritoControl"></asp:Label>       
        <br />
        <asp:Label ID="lblDNICliente" runat="server" Text="DNI Cliente: " CssClass="CarritoControl"></asp:Label>
        <asp:Label ID="txtDNICliente" runat="server" Text="35767657" CssClass="CarritoControl"></asp:Label>       
        <br />
        <asp:Label ID="lblFormaPago" runat="server" Text="Forma de pago: " CssClass="CarritoControl"></asp:Label>
        <asp:DropDownList ID="ddlFPago" runat="server" DataSourceID="FormaPago" DataTextField="FORMAPAGO_FP" DataValueField="ID_FORMAPAGO_FP" CssClass="CarritoControl"></asp:DropDownList>
        <asp:SqlDataSource ID="FormaPago" runat="server" ConnectionString="<%$ ConnectionStrings:FINAL_LABConnectionString %>" SelectCommand="SELECT [ID_FORMAPAGO_FP], [FORMAPAGO_FP] FROM [FORMA_PAGO]"></asp:SqlDataSource>
       <br />
        <asp:Label ID="lblFormaEnvio" runat="server" Text="Forma de envio: " CssClass="CarritoControl"></asp:Label>
        <asp:DropDownList ID="ddlFEnvio" runat="server" DataSourceID="FormaEnvio" DataTextField="FORMAENVIO_FE" DataValueField="ID_FORMAENVIO_FE" CssClass="CarritoControl"></asp:DropDownList>
        <asp:SqlDataSource ID="FormaEnvio" runat="server" ConnectionString="<%$ ConnectionStrings:FINAL_LABConnectionString2 %>" SelectCommand="SELECT [ID_FORMAENVIO_FE], [FORMAENVIO_FE] FROM [FORMA_ENVIO]"></asp:SqlDataSource>
        <br />
        <asp:Label ID="lblImporte" runat="server" Text="Importe: " CssClass="CarritoControl" ></asp:Label>
         <br />  
        
        
       
        
        <asp:Button ID="bttnAgregarItem" runat="server" Text="Agregar item" CssClass="Boton" />
        <asp:Button ID="bttnFinalizarcompra" runat="server" Text="Finalizar compra" CssClass="Boton" />

        <asp:ListView ID="ListView1" runat="server" DataSourceID="DetalleVenta">
            <AlternatingItemTemplate>
                <li style="background-color: #FFFFFF;color: #284775;">ID_DV:
                    <asp:Label ID="ID_DVLabel" runat="server" Text='<%# Eval("ID_DV") %>' />
                    <br />
                    ID_PROV_DV:
                    <asp:Label ID="ID_PROV_DVLabel" runat="server" Text='<%# Eval("ID_PROV_DV") %>' />
                    <br />
                    CANTIDAD_DV:
                    <asp:Label ID="CANTIDAD_DVLabel" runat="server" Text='<%# Eval("CANTIDAD_DV") %>' />
                    <br />
                    ID_MODELO_DV:
                    <asp:Label ID="ID_MODELO_DVLabel" runat="server" Text='<%# Eval("ID_MODELO_DV") %>' />
                    <br />
                    PU_DV:
                    <asp:Label ID="PU_DVLabel" runat="server" Text='<%# Eval("PU_DV") %>' />
                    <br />
                </li>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <li style="background-color: #999999;">ID_DV:
                    <asp:TextBox ID="ID_DVTextBox" runat="server" Text='<%# Bind("ID_DV") %>' />
                    <br />
                    ID_PROV_DV:
                    <asp:TextBox ID="ID_PROV_DVTextBox" runat="server" Text='<%# Bind("ID_PROV_DV") %>' />
                    <br />
                    CANTIDAD_DV:
                    <asp:TextBox ID="CANTIDAD_DVTextBox" runat="server" Text='<%# Bind("CANTIDAD_DV") %>' />
                    <br />
                    ID_MODELO_DV:
                    <asp:TextBox ID="ID_MODELO_DVTextBox" runat="server" Text='<%# Bind("ID_MODELO_DV") %>' />
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
                    <br />ID_PROV_DV:
                    <asp:TextBox ID="ID_PROV_DVTextBox" runat="server" Text='<%# Bind("ID_PROV_DV") %>' />
                    <br />CANTIDAD_DV:
                    <asp:TextBox ID="CANTIDAD_DVTextBox" runat="server" Text='<%# Bind("CANTIDAD_DV") %>' />
                    <br />ID_MODELO_DV:
                    <asp:TextBox ID="ID_MODELO_DVTextBox" runat="server" Text='<%# Bind("ID_MODELO_DV") %>' />
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
                <li style="background-color: #E0FFFF;color: #333333;">ID_DV:
                    <asp:Label ID="ID_DVLabel" runat="server" Text='<%# Eval("ID_DV") %>' />
                    <br />
                    ID_PROV_DV:
                    <asp:Label ID="ID_PROV_DVLabel" runat="server" Text='<%# Eval("ID_PROV_DV") %>' />
                    <br />
                    CANTIDAD_DV:
                    <asp:Label ID="CANTIDAD_DVLabel" runat="server" Text='<%# Eval("CANTIDAD_DV") %>' />
                    <br />
                    ID_MODELO_DV:
                    <asp:Label ID="ID_MODELO_DVLabel" runat="server" Text='<%# Eval("ID_MODELO_DV") %>' />
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
                <div style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF;">
                </div>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <li style="background-color: #E2DED6;font-weight: bold;color: #333333;">ID_DV:
                    <asp:Label ID="ID_DVLabel" runat="server" Text='<%# Eval("ID_DV") %>' />
                    <br />
                    ID_PROV_DV:
                    <asp:Label ID="ID_PROV_DVLabel" runat="server" Text='<%# Eval("ID_PROV_DV") %>' />
                    <br />
                    CANTIDAD_DV:
                    <asp:Label ID="CANTIDAD_DVLabel" runat="server" Text='<%# Eval("CANTIDAD_DV") %>' />
                    <br />
                    ID_MODELO_DV:
                    <asp:Label ID="ID_MODELO_DVLabel" runat="server" Text='<%# Eval("ID_MODELO_DV") %>' />
                    <br />
                    PU_DV:
                    <asp:Label ID="PU_DVLabel" runat="server" Text='<%# Eval("PU_DV") %>' />
                    <br />
                </li>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="DetalleVenta" runat="server" ConnectionString="<%$ ConnectionStrings:FINAL_LABConnectionString %>" SelectCommand="SELECT [ID_DV], [ID_PROV_DV], [CANTIDAD_DV], [ID_MODELO_DV], [PU_DV] FROM [DETALLES_VENTAS]"></asp:SqlDataSource>

   </>
    </div>
  
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContenidoColDerCliente" runat="server">
</asp:Content>
