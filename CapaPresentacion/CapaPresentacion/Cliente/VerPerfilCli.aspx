<%@ Page Title="" Language="C#" MasterPageFile="~/Cliente/PaginaMaestraCliente.master" AutoEventWireup="true" CodeBehind="VerPerfilCli.aspx.cs" Inherits="CapaPresentacion.Cliente.VerPerfilCli" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadCliente" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoColIzCliente" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoColPpalCliente" runat="server">
    <asp:Label ID="lblperfil" runat="server" Text="Perfil"></asp:Label>
    <br />
&nbsp;<br />
    <asp:LinkButton ID="lbVerdatos" runat="server" OnClick="lbVerdatos_Click">Ver/Modificar datos</asp:LinkButton>
    <br />
    <asp:LinkButton ID="lbCambiarcontra" runat="server" OnClick="lbCambiarcontra_Click">Cambiar contraseña</asp:LinkButton>
    <br />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContenidoColDerCliente" runat="server">
</asp:Content>
