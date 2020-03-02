<%@ Page Title="" Language="C#" MasterPageFile="~/Empleado/PaginaMaestraEmpleado.master" AutoEventWireup="true" CodeBehind="Ventas.aspx.cs" Inherits="CapaPresentacion.Empleado.Ventas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadEmpleado" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoColIzEmpleado" runat="server">
    <p>&nbsp;</p>
    <h2>Filtrar por: </h2>

    <div id="Filtro" style="text-align: left;">

        <asp:CheckBox ID="cbFecha" runat="server" Text="Fecha" CssClass="ControlesASP" AutoPostBack="True" OnCheckedChanged="cbFecha_CheckedChanged" />

        Desde:<asp:TextBox ID="TxtFechaInicio" runat="server" TextMode="Date"></asp:TextBox>
        <br />
        <br />
        Hasta: <asp:TextBox ID="TxtFechaFin" runat="server" TextMode="Date"></asp:TextBox>
        <br />

        <asp:CheckBox ID="cbId" runat="server" CssClass="ControlesASP" Text="Id" AutoPostBack="True" Height="22px" OnCheckedChanged="cbId_CheckedChanged" />
        <br />

        <asp:DropDownList ID="ddlId" runat="server" AutoPostBack="True" CssClass="ControlesASP" Height="35px" OnSelectedIndexChanged="ddlId_SelectedIndexChanged" Width="95%">
            <asp:ListItem>A determinar</asp:ListItem>
            <asp:ListItem>Cliente</asp:ListItem>
            <asp:ListItem>Todas</asp:ListItem>
        </asp:DropDownList>

        <asp:TextBox ID="tbId" runat="server" CssClass="ControlesASP" Width="95%"></asp:TextBox>
        
        <asp:Button ID="bttnAceptar" runat="server" CssClass="Boton" Text="Aceptar" OnClick="bttnAceptar_Click" />
        <asp:Button ID="bttnCancelar" runat="server" CssClass="Boton" Text="Cancelar" OnClick="bttnCancelar_Click" />

    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoColPpalEmpleado" runat="server">

    <div id="FormReportes" class="Form">

        <h2>Mis Ventas: </h2>

        <asp:GridView ID="gvwVenta" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" Width="100%" Font-Size="Small" RowStyle-Height="40px" AutoGenerateSelectButton="True" OnSelectedIndexChanged="gvwVenta_SelectedIndexChanged">
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

        <asp:GridView ID="gvwDetalle" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" Width="100%" Font-Size="Small" RowStyle-Height="40px">
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


    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContenidoColDerEmpleado" runat="server">
</asp:Content>
