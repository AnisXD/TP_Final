<%@ Page Title="" Language="C#" MasterPageFile="~/Empleado/PaginaMaestraEmpleado.master" AutoEventWireup="true" CodeBehind="Reportes.aspx.cs" Inherits="CapaPresentacion.Empleado.Reportes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadEmpleado" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoColIzEmpleado" runat="server">
    <asp:Button ID="btnTotalVentas" runat="server" Text="Total Ventas" CssClass="Boton" />
    <asp:Button ID="btnVtasVendedor" runat="server" Text="Vtas por vendedor" CssClass="Boton" />
    <asp:Button ID="btnVtasCliente" runat="server" Text="Vtas por cliente" CssClass="Boton" />
    <asp:Button ID="btnVtasMarca" runat="server" Text="Vtas por marca" CssClass="Boton" />
    <asp:Button ID="btnVtasModelo" runat="server" Text="Vtas por modelo" CssClass="Boton" />

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoColPpalEmpleado" runat="server">
    <h2>Reportes: </h2>
    <div id="FormReportes" class="Form">

    <asp:RadioButton ID="rBtnFecha" runat="server" Text="Fecha" />
       
        <asp:Calendar ID="FechaInicio" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="100px" NextPrevFormat="FullMonth" SelectedDate="11/16/2019 12:36:13" Width="200px">
            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
            <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
            <TodayDayStyle BackColor="#CCCCCC" />
        </asp:Calendar>
        <asp:Calendar ID="FechaFin" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="100px" NextPrevFormat="FullMonth" SelectedDate="11/16/2019 12:36:06" Width="200px">
            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
            <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
            <TodayDayStyle BackColor="#CCCCCC" />
        </asp:Calendar>
        <asp:RadioButton ID="rBtnId" runat="server" Text="Id" />
        <asp:Label ID="lblId" runat="server" Text="Selecione el ID"></asp:Label>
        <asp:DropDownList ID="ddlId" runat="server"></asp:DropDownList>
        <asp:Button ID="btnActualizarGvw" runat="server" Text="Actualizar Reporte" CssClass="Boton" />
        <asp:GridView ID="gvwReporte" runat="server">
        </asp:GridView>
        <asp:Label ID="lblTotal" runat="server" Text="Total Recaudado: "></asp:Label>
    </div>
    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContenidoColDerEmpleado" runat="server">
</asp:Content>
