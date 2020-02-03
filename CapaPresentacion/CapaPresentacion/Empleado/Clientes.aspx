<%@ Page Title="" Language="C#" MasterPageFile="~/Empleado/PaginaMaestraEmpleado.master" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="CapaPresentacion.Empleado.Clientes1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadEmpleado" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoColIzEmpleado" runat="server">
    <h2>Filtrar por:</h2>
    <div id="Filtros">
    
        <asp:CheckBox ID="cbDNI" runat="server" AutoPostBack="True" Text="DNI" OnCheckedChanged="cbDNI_CheckedChanged" />
        <asp:TextBox ID="txtDNIF" runat="server" CssClass="ControlesASP"></asp:TextBox>
        <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" Text="Apellido" OnCheckedChanged="CheckBox1_CheckedChanged" />
        <asp:TextBox ID="txtApellidos" runat="server" CssClass="ControlesASP" Style="text-transform: uppercase"></asp:TextBox>
        <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" CssClass="Boton" OnClick="btnFiltrar_Click" />
        <asp:Button ID="btnQuitarFiltro" runat="server" Text="Quitar Filtros" CssClass="Boton" OnClick="btnQuitarFiltro_Click" />
    
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoColPpalEmpleado" runat="server">
    <h1>Administrar Clientes</h1>
   <div id="FormClientes" class="Form">

       <asp:GridView ID="gvwClientes" runat="server" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" AutoGenerateSelectButton="True" OnSelectedIndexChanged="gvwClientes_SelectedIndexChanged">
           <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
           <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
           <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
           <RowStyle BackColor="White" ForeColor="#003399" />
           <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
           <SortedAscendingCellStyle BackColor="#EDF6F6" />
           <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
           <SortedDescendingCellStyle BackColor="#D6DFDF" />
           <SortedDescendingHeaderStyle BackColor="#002876" />
       </asp:GridView>
            <asp:Label ID="lblTotalRegistros" runat="server"></asp:Label>
            <br />
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
                    <asp:DropDownList ID="ddlProvincia" runat="server" CssClass="ControlesASP" Width="150px" AutoPostBack="True" OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged" >
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
                    <asp:DropDownList ID="ddlLocalidad" runat="server" CssClass="ControlesASP">
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
                   <asp:TextBox ID="txbClave" runat="server" placeholder="&#128273;Clave" MaxLength="8" TextMode="Password" CssClass="ControlesASP"></asp:TextBox>
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
                   <asp:TextBox ID="txbRepitaClave" runat="server" placeholder="&#128273;Repita la Clave" MaxLength="8" TextMode="Password" CssClass="ControlesASP" Width="160px"></asp:TextBox>
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
                    <asp:Button ID="btnAgregar" runat="server" Text="Agregar" CssClass="Boton" OnClick="btnAgregar_Click" ValidationGroup="1" />
                </td>
                <td class="auto-style2">
            <asp:Button ID="btnEditar" runat="server" Text="Editar" CssClass="Boton" OnClick="btnEditar_Click"/>
                </td>
                <td class="auto-style3">
            <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="Boton" OnClick="btnEliminar_Click"/>
                </td>
             </tr>
        </table>

    <div id="Administrar" title="Administrar">
    </div>
   </div>
    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContenidoColDerEmpleado" runat="server">
</asp:Content>
