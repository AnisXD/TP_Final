<%@ Page Title="" Language="C#" MasterPageFile="~/Usuario/PaginaMaestraUsuarios.master" AutoEventWireup="true" CodeBehind="RegistrarUsuario.aspx.cs" Inherits="CapaPresentacion.Usuario.RegristrarUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContenidoHead" runat="server">
    <style type="text/css">
        .auto-style4 {
            width: 200px;
            height: 53px;
        }
        .auto-style5 {
            width: 268px;
            height: 53px;
        }
        .auto-style6 {
            width: 200px;
            height: 36px;
        }
        .auto-style7 {
            width: 268px;
            height: 36px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoColIzUsuario" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoColPpalUsuarios" runat="server">
    <div id="DatosPersonales" class="Form">
        <h2>Datos Personales</h2>
        <table>
            <tr>
                <td style="text-align: center;" class="auto-style1">DNI:
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txbDNI" runat="server" placeholder="&#127915;DNI" CssClass="ControlesASP" AutoPostBack="True" OnTextChanged="txbDNI_TextChanged" TextMode="Number" CausesValidation="True" MaxLength="9"></asp:TextBox>
                </td>
                <td class="auto-style3">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txbDNI" ErrorMessage="DNI tiene que tener minimo 8 caracteres" ValidationExpression=".{8}.*" ValidationGroup="1"></asp:RegularExpressionValidator>
                    <asp:CompareValidator ID="cvDni" runat="server" ErrorMessage="Ingrese un numero de Documento." ControlToValidate="txbDNI" Operator="DataTypeCheck" Type="Integer" ValidationGroup="1"></asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="rfvDni" runat="server" ControlToValidate="txbDNI" ErrorMessage="Ingrese un numero de Documento" SetFocusOnError="true" ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="text-align: center;" class="auto-style1">NOMBRE:
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txbNombre" runat="server" placeholder="&#128100;Nombre" CssClass="ControlesASP" Style="text-transform: uppercase"></asp:TextBox>
                </td>
                <td class="auto-style3">
                    <asp:RegularExpressionValidator ID="revNombre" runat="server" ControlToValidate="txbNombre" ErrorMessage="Ingrese un Nombre." ValidationExpression="^[a-zA-Z ]*$" ValidationGroup="1"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txbNombre" ErrorMessage="Ingrese un Nombre" SetFocusOnError="true" ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="text-align: center;" class="auto-style1">APELLIDO:
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txbApellido" runat="server" placeholder="&#128100;Apellido" CssClass="ControlesASP" Style="text-transform: uppercase"></asp:TextBox>
                </td>
                <td class="auto-style3">
                    <asp:RegularExpressionValidator ID="revApellido" runat="server" ControlToValidate="txbApellido" ErrorMessage="Ingrese un Apellido." ValidationExpression="^[a-zA-Z ]*$" ValidationGroup="1"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txbApellido" ErrorMessage="Ingrese un Apellido" SetFocusOnError="true" ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="text-align: center;" class="auto-style1">TELEFONO:
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txbTelefono" runat="server" placeholder="&#128241;Telefono" CssClass="ControlesASP" TextMode="Number"></asp:TextBox>
                </td>
                <td class="auto-style3">
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txbTelefono" ErrorMessage="El telefono tiene que tener minimo 8 caracteres" ValidationExpression=".{8}.*" ValidationGroup="1"></asp:RegularExpressionValidator>
                    <%--<asp:Label ID="lblTelefono" runat="server" Text="El Telefono debe tener al menos 10 caracteres." Visible="False"></asp:Label>--%>
                    <asp:CompareValidator ID="cvTelefono" runat="server" ErrorMessage="Ingrese un numero de telefono." ControlToValidate="txbTelefono" Operator="DataTypeCheck" Type="Integer" ValidationGroup="1"></asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="txbTelefono" ErrorMessage="Ingrese un Telefono" SetFocusOnError="true" ValidationGroup="1"></asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>
                <td style="text-align: center;" class="auto-style4">PROVINCIA:
                </td>
                <td class="auto-style5">
                    <asp:DropDownList ID="ddlProvincia" runat="server" CssClass="Ddl" AutoPostBack="True" OnSelectedIndexChanged="ddlFProvincia_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
                <td class="auto-style4">
                    <asp:Label ID="lblProvincia" runat="server" Text="Debe seleccionar una Provincia" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: center;" class="auto-style1">LOCALIDAD:
                </td>
                <td class="auto-style2">
                    <asp:DropDownList ID="ddlLocalidad" runat="server" CssClass="Ddl" ValidateRequestMode="Enabled">
                    </asp:DropDownList></td>
                <td class="auto-style3">
                    <asp:Label ID="lblLocalidad" runat="server" Text="Debe seleccionar una Localidad" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: center;" class="auto-style1">DIRECCION:
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txbDireccion" runat="server" placeholder="&#127968;Direccion" CssClass="ControlesASP"></asp:TextBox>
                </td>
                <td class="auto-style3">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txbDireccion" ErrorMessage="La direccion tiene que tener minimo 5 caracteres" ValidationExpression=".{5}.*" ValidationGroup="1"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="txbDireccion" ErrorMessage="Ingrese una direccion." SetFocusOnError="true" ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="text-align: center;" class="auto-style1">CONTRASEÑA:
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txbClave" runat="server" placeholder="&#128273;Clave" MaxLength="15" TextMode="Password" CssClass="ControlesASP" Style="text-transform: uppercase"></asp:TextBox>
                </td>
                <td class="auto-style3">
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txbClave" ErrorMessage="La clave tiene que tener minimo 8 caracteres" ValidationExpression=".{8}.*" ValidationGroup="1"></asp:RegularExpressionValidator>
                    <asp:Label ID="lblContraseñaSegura" runat="server" Text=" " Visible="False"></asp:Label>
                    <asp:RequiredFieldValidator ID="rfvClave" runat="server" ControlToValidate="txbClave" ErrorMessage="Ingrese una Contraseña." SetFocusOnError="true" ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="text-align: center;" class="auto-style1">REPITA CONTRASEÑA:
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txbRepitaClave" runat="server" placeholder="&#128273;Repita la Clave" MaxLength="15" TextMode="Password" CssClass="ControlesASP"></asp:TextBox>
                </td>
                <td class="auto-style3">                
                    <asp:CompareValidator ID="cvRepitaClave" runat="server" ControlToCompare="txbClave" ControlToValidate="txbRepitaClave" ErrorMessage="Las Contraseñas son distintas." SetFocusOnError="True" ValidationGroup="1"></asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="rfvRepitaClave" runat="server" ControlToValidate="txbRepitaClave" ErrorMessage="Ingrese una Contraseña" SetFocusOnError="true" ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="text-align: center;" class="auto-style6"></td>
                <td class="auto-style7">
                    <asp:Label ID="lblEstado2" runat="server"></asp:Label>
                </td>
                <td class="auto-style6"></td>
            </tr>
            <tr>
                <td style="text-align: center;" class="auto-style1">
                    <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="Boton" OnClick="btnAceptar_Click" ValidationGroup="1" />
                </td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">
                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="Boton" OnClick="btnCancelar_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContenidoColDerUsuario" runat="server">
</asp:Content>
