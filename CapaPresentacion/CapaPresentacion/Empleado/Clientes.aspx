<%@ Page Title="" Language="C#" MasterPageFile="~/Empleado/PaginaMaestraEmpleado.master" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="CapaPresentacion.Empleado.Clientes1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadEmpleado" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoColIzEmpleado" runat="server">
    <h2>Filtrar por:</h2>
    <div id="Filtros">
    
        <asp:Label ID="lblDNIF" runat="server" Text="DNI: " CssClass="ControlesASP"></asp:Label>
        <asp:TextBox ID="txtDNIF" runat="server" CssClass="ControlesASP"></asp:TextBox>
        <asp:Label ID="lblApellidos" runat="server" Text="Apellido: " CssClass="ControlesASP"></asp:Label>
        <asp:TextBox ID="txtApellidos" runat="server" CssClass="ControlesASP"></asp:TextBox>
        <asp:Label ID="lblFProvincia" runat="server" Text="Provincia: " CssClass="ControlesASP"></asp:Label>
        <asp:DropDownList ID="ddlFProvincia" runat="server" CssClass="ControlesASP" >
        </asp:DropDownList>
        <asp:Label ID="lblFLocalidad" runat="server" Text="Localidad: " CssClass="ControlesASP"></asp:Label>
        <asp:DropDownList ID="ddlFLocalidad" runat="server" CssClass="ControlesASP">
        </asp:DropDownList>
        <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" CssClass="Boton" />
        <asp:Button ID="btnQuitarFiltro" runat="server" Text="Quitar Filtros" CssClass="Boton" />
    
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoColPpalEmpleado" runat="server">
  <h1>Administrar Clientes</h1>
   <div id="FormClientes" class="Form">

    <asp:GridView ID="gvwClientes" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_CLIENTE" DataSourceID="clientes" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" PageSize="5" Width="90%">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="ID_CLIENTE" HeaderText="DNI" ReadOnly="True" SortExpression="ID_CLIENTE" />
            <asp:BoundField DataField="NOMBRE_CLI" HeaderText="NOMBRE" SortExpression="NOMBRE_CLI" />
            <asp:BoundField DataField="APELLIDO_CLI" HeaderText="APELLIDO" SortExpression="APELLIDO_CLI" />
            <asp:BoundField DataField="DIRECCION_CLI" HeaderText="DIRECCION" SortExpression="DIRECCION_CLI" />
            <asp:BoundField DataField="TELÉFONO_CLI" HeaderText="TELÉFONO" SortExpression="TELÉFONO_CLI" />
        </Columns>
    
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    
    </asp:GridView>
            <asp:Label ID="lblTotalRegistros" runat="server"></asp:Label>
            <br />
       <table >
            <tr>
                <td style="text-align:center; " class="auto-style1">
                    DNDNI:
                </td>
                <td class="auto-style2">
                  <asp:TextBox ID="txbDNI" runat="server" placeholder="&#127915;DNI" CssClass="ControlesASP" AutoPostBack="True" OnTextChanged="txbDNI_TextChanged1" TextMode="Number" CausesValidation="True"></asp:TextBox>
                </td>
                <td class="auto-style3">
                    <asp:CompareValidator ID="cv3" Runat="server" ErrorMessage="Ingrese un numero de Documento." ControlToValidate="txbDNI" Operator="DataTypeCheck" Type="Integer" ValidationGroup="1"></asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txbDNI" ErrorMessage="Ingrese un DNI" SetFocusOnError="true" ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="text-align:center; " class="auto-style1">
                    NOMBRE:
                td>
                <td class="auto-style2">
                    <asp:TextBox ID="txbNombre" runat="server" placeholder="&#128100;Nombre" CssClass="ControlesASP"></asp:TextBox>
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
                     <asp:TextBox ID="txbApellido" runat="server" placeholder="&#128100;Apellido" CssClass="ControlesASP"></asp:TextBox>
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
                    <asp:DropDownList ID="ddlProvincia" runat="server" CssClass="ControlesASP" Width="150px" AutoPostBack="True" OnSelectedIndexChanged="ddlFProvincia_SelectedIndexChanged" >
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
                   <asp:TextBox ID="txbDireccion" runat="server" placeholder="&#127968;Direccion" CssClass="ControlesASP" OnTextChanged="txbDireccion_TextChanged"></asp:TextBox>
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
                    <asp:Label ID="Label1" runat="server"></asp:Label>
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

    <asp:SqlDataSource ID="clientes" runat="server" ConnectionString="<%$ ConnectionStrings:FINAL_LABConnectionString %>" SelectCommand="SELECT [ID_CLIENTE], [NOMBRE_CLI], [APELLIDO_CLI], [DIRECCION_CLI], [TELÉFONO_CLI] FROM [CLIENTES]"></asp:SqlDataSource>
    
    <div id="Administrar" title="Administrar">
            <asp:Label ID="lblEstado" runat="server"></asp:Label>
            <asp:Button ID="btnAgregar" runat="server" Text="Agregar" CssClass="Boton"/>
            <asp:Button ID="btnEditar" runat="server" Text="Editar" CssClass="Boton"/>
            <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="Boton"/>
    </div>
   </div>
    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContenidoColDerEmpleado" runat="server">
</asp:Content>
