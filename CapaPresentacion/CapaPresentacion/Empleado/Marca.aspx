<%@ Page Title="" Language="C#" MasterPageFile="~/Empleado/PaginaMaestraEmpleado.master" AutoEventWireup="true" CodeBehind="Marca.aspx.cs" Inherits="CapaPresentacion.Empleado.Marca" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadEmpleado" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoColIzEmpleado" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoColPpalEmpleado" runat="server">
    <h1>Administrar Marcas</h1>

    <div id="FormMarca" class="Form">
       
        <asp:GridView ID="gdvMarcas" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID_MARCA" DataSourceID="Marcas" HorizontalAlign="Center" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
            <Columns>
                <asp:BoundField DataField="ID_MARCA" HeaderText="ID_MARCA" ReadOnly="True" SortExpression="ID_MARCA" />
                <asp:BoundField DataField="NOMBRE_MARCA" HeaderText="NOMBRE_MARCA" SortExpression="NOMBRE_MARCA" />
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#003399" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />
        </asp:GridView>
        <asp:Label ID="lblTotalRegistros" runat="server" Text="Registros Encontrados: "></asp:Label>
        <asp:SqlDataSource ID="Marcas" runat="server" ConnectionString="<%$ ConnectionStrings:FINAL_LABConnectionString %>" SelectCommand="SELECT [ID_MARCA], [NOMBRE_MARCA] FROM [MARCAS]"></asp:SqlDataSource>
        <br />
        <asp:Label ID="lblIdMarca" runat="server" text="Id Marca: " ></asp:Label>
        &nbsp;
        <asp:TextBox ID="txtIdMarca" runat="server" ></asp:TextBox>
        &nbsp;
        <br />
        <asp:Label ID="lblNombreMarca" runat="server" Text="Nombre Marca: " ></asp:Label>
        &nbsp;
        <asp:TextBox ID="txtNombreMarca" runat="server" ></asp:TextBox>
        &nbsp;
        <br />
        <asp:Button ID="btnAgregar" runat="server" Text="Agregar" CssClass="Boton"/>
        <asp:Button ID="btnEditar" runat="server" Text="Editar" CssClass="Boton"/>
        <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="Boton"/>
        <br />
        

    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContenidoColDerEmpleado" runat="server">
</asp:Content>
