<%@ Page Title="" Language="C#" MasterPageFile="~/Usuario/PaginaMaestraUsuarios.master" AutoEventWireup="true" CodeBehind="CambioDeClave.aspx.cs" Inherits="CapaPresentacion.Usuario.EditarUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContenidoHead" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoColIzUsuario" runat="server">

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoColPpalUsuarios" runat="server">
    <div id="FormEditarUsuario" class="Form">
        <h2>Cambiar Clave de Usuario</h2>
        <asp:Label ID="lblUsuario" runat="server" text="&#128100; Bienvenido Usuario"></asp:Label>
        &nbsp;
        <br />
        a continuacion podra establecer una nueva clave:<br />
        &nbsp;
        <asp:TextBox ID="txtClaveActual" runat="server" placeholder="&#128273;Clave Actual" MaxLength="8" CssClass="ControlesASP" TextMode="Password"></asp:TextBox>
        <asp:TextBox ID="txtClaveNueva" runat="server" placeholder="&#128273;Clave Nueva" MaxLength="8" CssClass="ControlesASP" TextMode="Password"></asp:TextBox>
        <asp:TextBox ID="txtRepitaClaveNueva" runat="server" placeholder="&#128273;Repita la Clave Nueva" MaxLength="8" CssClass="ControlesASP" TextMode="Password"></asp:TextBox>
        <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="Boton" />
        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="Boton" />
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContenidoColDerUsuario" runat="server">

</asp:Content>
