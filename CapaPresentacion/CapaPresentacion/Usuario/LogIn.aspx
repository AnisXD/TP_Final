<%@ Page Title="" Language="C#" MasterPageFile="~/Usuario/PaginaMaestraUsuarios.master" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="CapaPresentacion.Usuario.LogIn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContenidoHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoColIzUsuario" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoColPpalUsuarios" runat="server">
    <div ID="FormLogIn" class="Form">
     <h2>Log In</h2>
        
        <asp:Label ID="lblusucon" runat="server" Text="Ingrese Usuario y Contraseña"></asp:Label>
     <asp:TextBox ID="txtUsuario" runat="server" placeholder="&#128100;Usuario" MaxLength="8" CssClass="ControlesASP" OnTextChanged="txtUsuario_TextChanged" AutoCompleteType="Search"></asp:TextBox>
     
     <asp:TextBox ID="txtClave" runat="server" placeholder="&#128273;Clave" TextMode="Password" MaxLength="8" CssClass="ControlesASP"></asp:TextBox>
        <asp:Label ID="lblRespuesta" runat="server"></asp:Label>
        <br />
     <asp:CheckBox ID="chkRecordarUsuario" runat="server" Text="Recordar Usuario" CssClass="ControlesASP" />
     <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" CssClass="Boton" OnClick="btnIngresar_Click"  />
     <asp:Label ID="lblError" runat="server" Text="" ForeColor="Red"></asp:Label>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContenidoColDerUsuario" runat="server">
</asp:Content>
