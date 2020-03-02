<%@ Page Title="" Language="C#" MasterPageFile="~/Usuario/PaginaMaestraUsuarios.master" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="CapaPresentacion.Usuario.LogIn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContenidoHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoColIzUsuario" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoColPpalUsuarios" runat="server">
   <div ID="FormLogIn" class="Form">
     <h2>Log In</h2>
        
     <asp:Label ID="lblusucon" runat="server" Text="Ingrese Usuario y Contraseña" CssClass="LabelNegritaLargaCenter"></asp:Label>
     <br />

     <div style="width:50%;display:inline-grid;">
        <asp:TextBox ID="txtUsuario" runat="server" placeholder="&#128100;Usuario" MaxLength="15" CssClass="ControlesASP" AutoCompleteType="Search"></asp:TextBox>
        <asp:TextBox ID="txtClave" runat="server" placeholder="&#128273;Clave" TextMode="Password" MaxLength="15" CssClass="ControlesASP"></asp:TextBox>
        <asp:Label ID="lblRespuesta" runat="server"></asp:Label>
        <br />
        <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" CssClass="Boton" OnClick="btnIngresar_Click"  />
        <asp:Label ID="lblError" runat="server" Text="" ForeColor="Red"></asp:Label>
   
     </div>
  </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContenidoColDerUsuario" runat="server">
</asp:Content>
