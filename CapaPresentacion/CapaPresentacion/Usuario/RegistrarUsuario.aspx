<%@ Page Title="" Language="C#" MasterPageFile="~/Usuario/PaginaMaestraUsuarios.master" AutoEventWireup="true" CodeBehind="RegistrarUsuario.aspx.cs" Inherits="CapaPresentacion.Usuario.RegristrarUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContenidoHead" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoColIzUsuario" runat="server">

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoColPpalUsuarios" runat="server">
     <div id="FormRegistro" class="Form">
        <h2>Registro</h2>
        <asp:TextBox ID="txbDNI" runat="server" placeholder="&#128100;DNI" CssClass="ControlesASP" OnTextChanged="txtDNI_TextChanged"></asp:TextBox>
        <asp:TextBox ID="txbNombre" runat="server" placeholder="&#128100;Nombre" CssClass="ControlesASP"></asp:TextBox>
        <asp:TextBox ID="txbApellido" runat="server" placeholder="&#128100;Apellido" CssClass="ControlesASP"></asp:TextBox>
        <asp:TextBox ID="txbTelefono" runat="server" placeholder="&#128222;Telefono" CssClass="ControlesASP" TextMode="Number"></asp:TextBox>
        <asp:Label ID="lblFProvincia" runat="server" Text="Provincia: " CssClass="ControlesASP"></asp:Label>
        <asp:DropDownList ID="ddlFProvincia" runat="server" CssClass="ControlesASP" OnSelectedIndexChanged="ddlFProvincia_SelectedIndexChanged" DataSourceID="SqlDataSource1" DataTextField="descripcion_provincia" DataValueField="cod_provincia" >
        </asp:DropDownList>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FINALPROG_ConnectionString %>" SelectCommand="SELECT [cod_provincia], [descripcion_provincia] FROM [PROVINCIAS]"></asp:SqlDataSource>
        <asp:Label ID="lblFLocalidad" runat="server" Text="Localidad: " CssClass="ControlesASP"></asp:Label>
        <asp:DropDownList ID="ddlFLocalidad" runat="server" CssClass="ControlesASP">
        </asp:DropDownList>
        <asp:TextBox ID="txbDireccion" runat="server" placeholder="&#8962;Direccion" CssClass="ControlesASP"></asp:TextBox>
        <asp:TextBox ID="txbClave" runat="server" placeholder="&#128273;Clave" MaxLength="8" TextMode="Password" CssClass="ControlesASP"></asp:TextBox>
        <asp:TextBox ID="txbRepitaClave" runat="server" placeholder="&#128273;Repita la Clave" MaxLength="8" TextMode="Password" CssClass="ControlesASP" Width="171px"></asp:TextBox>
        <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="Boton" OnClick="btnAceptar_Click" />
        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="Boton" OnClick="btnCancelar_Click" />
        <asp:Label ID="lblEstado" runat="server"></asp:Label>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContenidoColDerUsuario" runat="server">

</asp:Content>
