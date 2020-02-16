<%@ Page Title="" Language="C#" MasterPageFile="~/Cliente/PaginaMaestraCliente.master" AutoEventWireup="true" CodeBehind="EditarPerfilCliente.aspx.cs" Inherits="CapaPresentacion.Cliente.PerfilCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadCliente" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoColIzCliente" runat="server">    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoColPpalCliente" runat="server">
   <div id="FormClientes" class="Form">
     <h2>Modificacion de datos</h2>
           <br />
       <table >
            <tr>
                <td style="text-align:center; " class="auto-style1">
                    DNI:
                </td>
                <td class="auto-style2">
                  <asp:TextBox ID="txbDNI" runat="server" placeholder="&#127915;DNI" CssClass="ControlesASP" AutoPostBack="True" TextMode="Number" CausesValidation="True" ReadOnly="True"></asp:TextBox>
                </td>
                <td class="auto-style3">
                    <asp:CompareValidator ID="cv3" Runat="server" ErrorMessage="Ingrese un numero de Documento." ControlToValidate="txbDNI" Operator="DataTypeCheck" Type="Integer" ValidationGroup="1"></asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txbDNI" ErrorMessage="Ingrese un DNI" SetFocusOnError="true" ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="text-align:center; " class="auto-style1">
                    NOMBRE:&nbsp;
                <td class="auto-style2">
                    <asp:TextBox ID="txbNombre" runat="server" placeholder="&#128100;Nombre" CssClass="ControlesASP" Style="text-transform: uppercase"></asp:TextBox>
                </td>
                <td class="auto-style3">
                    <asp:RegularExpressionValidator ID="rev2" runat="server" ControlToValidate="txbNombre" ErrorMessage="Ingrese un Nombre." ValidationExpression="^[a-zA-Z ]*$" ValidationGroup="1"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txbNombre" ErrorMessage="Ingrese un Nombre" SetFocusOnError="true" ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="text-align:center; " class="auto-style1">
                    APELLIDO:
                </td>
                <td class="auto-style2">
                     <asp:TextBox ID="txbApellido" runat="server" placeholder="&#128100;Apellido" CssClass="ControlesASP" Style="text-transform: uppercase"></asp:TextBox>
                </td>
                <td class="auto-style3">
                   <asp:RegularExpressionValidator ID="rev3" runat="server" ControlToValidate="txbApellido" ErrorMessage="Ingrese un Apellido." ValidationExpression="^[a-zA-Z ]*$" ValidationGroup="1"></asp:RegularExpressionValidator>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txbApellido" ErrorMessage="Ingrese un Apellido" SetFocusOnError="true" ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="text-align:center; " class="auto-style1">
                    TELEFONO:
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txbTelefono" runat="server" placeholder="&#128241;Telefono" CssClass="ControlesASP" TextMode="Phone"></asp:TextBox>
                </td>
                <td class="auto-style3">
                   <asp:CompareValidator ID="cv2" Runat="server" ErrorMessage="Ingrese un numero de telefono." ControlToValidate="txbTelefono" Operator="DataTypeCheck" Type="Integer" ValidationGroup="1"></asp:CompareValidator>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txbTelefono" ErrorMessage="Ingrese un Telefono" SetFocusOnError="true" ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="text-align:center; " class="auto-style1">
                    PROVINCIA:
                </td>
                <td class="auto-style2">
                    <asp:DropDownList ID="ddlProvincia" runat="server" CssClass="Ddl" AutoPostBack="True" OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged" >
                    </asp:DropDownList>
                </td>
                <td class="auto-style3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="text-align:center; " class="auto-style1">
                    LOCALIDAD:
                </td>
                <td class="auto-style2">
                    <asp:DropDownList ID="ddlLocalidad" runat="server" CssClass="Ddl">
                    </asp:DropDownList>
                </td>
                <td class="auto-style3">
                    <%--NADA--%>
                </td>
            </tr>
            <tr>
                <td style="text-align:center; " class="auto-style1">
                    DIRECCION:
                </td>
                <td class="auto-style2">
                   <asp:TextBox ID="txbDireccion" runat="server" placeholder="&#127968;Direccion" CssClass="ControlesASP" Style="text-transform: uppercase"></asp:TextBox>
                </td>
                <td class="auto-style3">
                   <asp:RequiredFieldValidator ID="rfv6" runat="server" ControlToValidate="txbDireccion" ErrorMessage="Ingrese una direccion." SetFocusOnError="true" ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="text-align:center; " class="auto-style1">
                    CONTRASEÑA:
                </td>
                <td class="auto-style2">
                   <asp:TextBox ID="txbClave" runat="server" placeholder="&#128273;Clave" MaxLength="8" CssClass="ControlesASP" Style="text-transform: uppercase"></asp:TextBox>
                </td>
                <td class="auto-style3">
                   <asp:RequiredFieldValidator ID="rfv4" runat="server" ControlToValidate="txbClave" ErrorMessage="Ingrese una Contraseña." SetFocusOnError="true" ValidationGroup="1"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txbClave" ErrorMessage="Ingrese una Contraseña" SetFocusOnError="true" ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
             </tr>
             <tr>
                <td style="text-align:center; " class="auto-style1">
                    REPITA CONTRASEÑA:
                </td>
                <td class="auto-style2">
                   <asp:TextBox ID="txbRepitaClave" runat="server" placeholder="&#128273;Repita la Clave" MaxLength="8" CssClass="ControlesASP" ></asp:TextBox>
                </td>
                <td class="auto-style3">
                   <asp:CompareValidator ID="cv1" runat="server" ControlToCompare="txbClave" ControlToValidate="txbRepitaClave" ErrorMessage="Las Contraseñas son distintas." SetFocusOnError="True" ValidationGroup="1"></asp:CompareValidator>
                </td>
             </tr>
             <tr>
                <td style="text-align:center; " class="auto-style1">
                </td>
                <td class="auto-style2">
            <asp:Label ID="lblEstado" runat="server"></asp:Label>
                </td>
                <td class="auto-style3">
                </td>
             </tr>
             <tr>
                <td style="text-align:center; " class="auto-style1">
            <asp:Button ID="btnAceptar" runat="server" Text="Editar" CssClass="Boton" OnClick="btnAceptar_Click" PostBackUrl="~/Cliente/EditarPerfilCliente.aspx"/>
                </td>
                 <td class="auto-style2">
                </td>
                 <td class="auto-style3">
            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="Boton" OnClick="btnCancelar_Click"/>
                </td>
             </tr>
        </table>

    <div id="Administrar" title="Administrar">
    </div>
   </div>
   
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContenidoColDerCliente" runat="server">
</asp:Content>
