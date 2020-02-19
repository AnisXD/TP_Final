<%@ Page Title="" Language="C#" MasterPageFile="~/Empleado/PaginaMaestraEmpleado.master" AutoEventWireup="true" CodeBehind="Reportes.aspx.cs" Inherits="CapaPresentacion.Empleado.Reportes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadEmpleado" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoColIzEmpleado" runat="server">
    <p>&nbsp;</p>
    <h2>Total recaudado por: </h2>
   
    <div id="Filtro" style="text-align: left;">

        <asp:CheckBox ID="cbFecha" runat="server" Text="Fecha" CssClass="ControlesASP" AutoPostBack="True" OnCheckedChanged="cbFecha_CheckedChanged" />

        <asp:Calendar ID="FechaInicio" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="100px" NextPrevFormat="FullMonth" SelectedDate="11/16/2019 12:36:13" Width="200px">
            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
            <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
            <TodayDayStyle BackColor="#CCCCCC" />
        </asp:Calendar>

        <asp:TextBox ID="TxtFechaInicio" runat="server" TextMode="Date"></asp:TextBox>

        <asp:Calendar ID="FechaFin" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="100px" NextPrevFormat="FullMonth" SelectedDate="11/16/2019 12:36:06" Width="200px">
            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
            <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
            <TodayDayStyle BackColor="#CCCCCC" />
        </asp:Calendar>
        <br />

        <asp:CheckBox ID="cbId" runat="server" CssClass="ControlesASP" Text="Id" AutoPostBack="True" Height="22px" OnCheckedChanged="cbId_CheckedChanged" />
        <br />

        <asp:DropDownList ID="ddlId" runat="server" AutoPostBack="True" CssClass="ControlesASP" Height="35px" OnSelectedIndexChanged="ddlId_SelectedIndexChanged" Width="95%">
            <asp:ListItem>A determinar</asp:ListItem>
            <asp:ListItem>Cliente</asp:ListItem>
            <asp:ListItem>Vendedor</asp:ListItem>
            <asp:ListItem>Marca</asp:ListItem>
            <asp:ListItem>Modelo</asp:ListItem>
            <asp:ListItem>Total Ventas</asp:ListItem>
        </asp:DropDownList>

        <asp:TextBox ID="tbId" runat="server" CssClass="ControlesASP" Width="95%"></asp:TextBox>
        <br />

        <asp:DropDownList ID="ddlMM" runat="server" CssClass="ControlesASP" Height="35px" Width="95%">
            <asp:ListItem>A determinar</asp:ListItem>
        </asp:DropDownList>
        <br />

        <asp:Button ID="bttnAceptar" runat="server" CssClass="Boton" Text="Aceptar" OnClick="bttnAceptar_Click" />
        <asp:Button ID="bttnCancelar" runat="server" CssClass="Boton" Text="Cancelar" OnClick="bttnCancelar_Click" />

    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoColPpalEmpleado" runat="server">

    <div id="FormReportes" class="Form">
         
        <h2>Reportes: </h2>
        
        <br />
        <asp:GridView ID="gvwReporte" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" HorizontalAlign="Center" Width="100%" Font-Size="Small">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>

        <asp:Label ID="lblTotalRegistros" runat="server" CssClass="LabelLarga"></asp:Label>
        <br />

        <asp:Label ID="lblTotal" runat="server" Text="Total Recaudado: " CssClass="LabelNegritaLargaCenter"></asp:Label>

    </div>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContenidoColDerEmpleado" runat="server">
</asp:Content>
