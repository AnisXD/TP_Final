<%@ Page Title="" Language="C#" MasterPageFile="~/Usuario/PaginaMaestraUsuarios.master" AutoEventWireup="true" CodeBehind="RegistrarUsuario.aspx.cs" Inherits="CapaPresentacion.Usuario.RegristrarUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContenidoHead" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoColIzUsuario" runat="server">

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoColPpalUsuarios" runat="server">
     <div id="FormRegistro" class="Form">
        <h2>Registro</h2>
        <asp:TextBox ID="txtDNI" runat="server" placeholder="&#128100;DNI" CssClass="ControlesASP" OnTextChanged="txtDNI_TextChanged"></asp:TextBox>
        <asp:TextBox ID="txtNombre" runat="server" placeholder="&#128100;Nombre" CssClass="ControlesASP"></asp:TextBox>
        <asp:TextBox ID="txtApellido" runat="server" placeholder="&#128100;Apellido" CssClass="ControlesASP"></asp:TextBox>
        <asp:TextBox ID="txtTelefono" runat="server" placeholder="&#128222;Telefono" CssClass="ControlesASP" TextMode="Number"></asp:TextBox>
        <asp:Label ID="lblFProvincia" runat="server" Text="Provincia: " CssClass="ControlesASP"></asp:Label>
        <asp:DropDownList ID="ddlFProvincia" runat="server" CssClass="ControlesASP" OnSelectedIndexChanged="ddlFProvincia_SelectedIndexChanged" >
        </asp:DropDownList>
        <asp:Label ID="lblFLocalidad" runat="server" Text="Localidad: " CssClass="ControlesASP"></asp:Label>
        <asp:DropDownList ID="ddlFLocalidad" runat="server" CssClass="ControlesASP">
        </asp:DropDownList>
        <asp:TextBox ID="txtDireccion" runat="server" placeholder="&#8962;Direccion" CssClass="ControlesASP"></asp:TextBox>
        <asp:TextBox ID="txtClave" runat="server" placeholder="&#128273;Clave" MaxLength="8" TextMode="Password" CssClass="ControlesASP"></asp:TextBox>
        <asp:TextBox ID="txtRepitaClave" runat="server" placeholder="&#128273;Repita la Clave" MaxLength="8" TextMode="Password" CssClass="ControlesASP"></asp:TextBox>
        <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="Boton" OnClick="btnAceptar_Click" />
        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="Boton" OnClick="btnCancelar_Click" />
        <asp:Label ID="lblEstado" runat="server"></asp:Label>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContenidoColDerUsuario" runat="server">

</asp:Content>
