<%@ Page Title="" Language="C#" MasterPageFile="~/Usuario/PaginaMaestraUsuarios.master" AutoEventWireup="true" CodeBehind="RegistrarUsuario.aspx.cs" Inherits="CapaPresentacion.Usuario.RegristrarUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContenidoHead" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoColIzUsuario" runat="server">

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoColPpalUsuarios" runat="server">
     <div id="FormRegistro" class="Form">
        <h2>Registro</h2>
        <asp:TextBox ID="txtUsuario" runat="server" placeholder="&#128100;Usuario" CssClass="ControlesASP" MaxLength="8"></asp:TextBox>
        <asp:TextBox ID="txtDNI" runat="server" placeholder="&#128100;DNI" CssClass="ControlesASP"></asp:TextBox>
        <asp:TextBox ID="txtClave" runat="server" placeholder="&#128273;Clave" MaxLength="8" TextMode="Password" CssClass="ControlesASP"></asp:TextBox>
        <asp:TextBox ID="txtRepitaClave" runat="server" placeholder="&#128273;Repita la Clave" MaxLength="8" TextMode="Password" CssClass="ControlesASP"></asp:TextBox>
       <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="Boton" />
        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="Boton" />
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContenidoColDerUsuario" runat="server">

</asp:Content>
