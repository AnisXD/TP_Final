<%@ Page Title="" Language="C#" MasterPageFile="~/Cliente/PaginaMaestraCliente.master" AutoEventWireup="true" CodeBehind="MisCompras.aspx.cs" Inherits="CapaPresentacion.Cliente.MisCompras" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadCliente" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoColIzCliente" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoColPpalCliente" runat="server">
     <div id="FormReportes" class="Form">

        <h2>Mis Compras: </h2>

        <asp:GridView ID="gvwCompra" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" Width="100%" Font-Size="Small" RowStyle-Height="40px" AutoGenerateSelectButton="True" OnSelectedIndexChanged="gvwCompra_SelectedIndexChanged">
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
        
        <asp:Label ID="lblDetalle" runat="server" Text="Seleccione una compra para ver su Detalle " CssClass="LabelNegritaLargaCenter"></asp:Label>

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
<asp:Content ID="Content4" ContentPlaceHolderID="ContenidoColDerCliente" runat="server">
</asp:Content>
