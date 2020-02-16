<%@ Page Title="" Language="C#" MasterPageFile="~/Usuario/PaginaMaestraUsuarios.master" AutoEventWireup="true" CodeBehind="RegistrarUsuario.aspx.cs" Inherits="CapaPresentacion.Usuario.RegristrarUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContenidoHead" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoColIzUsuario" runat="server">

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoColPpalUsuarios" runat="server">
     <div id="DatosPersonales" class="Form">
        <h2>Datos Personales</h2>
         <table >
            <tr>
                <td style="text-align:center; " class="auto-style1">
                    DNI:
                </td>
                <td class="auto-style2">
                  <asp:TextBox ID="txbDNI" runat="server" placeholder="&#127915;DNI" CssClass="ControlesASP" AutoPostBack="True" OnTextChanged="txbDNI_TextChanged" TextMode="Number" CausesValidation="True" MaxLength="9"></asp:TextBox>
                </td>
                <td class="auto-style3">
                    <asp:CompareValidator ID="cv3" Runat="server" ErrorMessage="Ingrese un numero de Documento." ControlToValidate="txbDNI" Operator="DataTypeCheck" Type="Integer" ValidationGroup="1"></asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txbDNI" ErrorMessage="Ingrese un DNI" SetFocusOnError="true" ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="text-align:center; " class="auto-style1">
                    NOMBRE:
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txbNombre" runat="server" placeholder="&#128100;Nombre" CssClass="ControlesASP" Style="text-transform: uppercase"></asp:TextBox>
                </td>
                <td class="auto-style3">
                    <asp:RegularExpressionValidator ID="rev2" runat="server" ControlToValidate="txbNombre" ErrorMessage="Ingrese un Nombre." ValidationExpression="^[a-zA-Z ]*$" ValidationGroup="1"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txbNombre" ErrorMessage="Ingrese un Nombre" SetFocusOnError="true" ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="text-align:center;" class="auto-style1">
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
                    <asp:TextBox ID="txbTelefono" runat="server" placeholder="&#128241;Telefono" CssClass="ControlesASP" TextMode="Number"></asp:TextBox>
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
                    <asp:DropDownList ID="ddlProvincia" runat="server" CssClass="Ddl" AutoPostBack="True" OnSelectedIndexChanged="ddlFProvincia_SelectedIndexChanged" >
                    </asp:DropDownList>
                </td>
                <td class="auto-style3">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FINALPROG_ConnectionString %>" SelectCommand="SELECT [cod_provincia], [descripcion_provincia] FROM [PROVINCIAS]"></asp:SqlDataSource>
                </td>
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
                   <asp:TextBox ID="txbDireccion" runat="server" placeholder="&#127968;Direccion" CssClass="ControlesASP"></asp:TextBox>
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
                   <asp:TextBox ID="txbClave" runat="server" placeholder="&#128273;Clave" MaxLength="8" TextMode="Password" CssClass="ControlesASP" Style="text-transform: uppercase"></asp:TextBox>
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
                   <asp:TextBox ID="txbRepitaClave" runat="server" placeholder="&#128273;Repita la Clave" MaxLength="8" TextMode="Password" CssClass="ControlesASP" ></asp:TextBox>
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
                    <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="Boton" OnClick="btnAceptar_Click" ValidationGroup="1" />
                </td>
                <td class="auto-style2">
                </td>
                <td class="auto-style3">
                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="Boton" OnClick="btnCancelar_Click" />
                </td>
             </tr>
        </table>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContenidoColDerUsuario" runat="server">

</asp:Content>
