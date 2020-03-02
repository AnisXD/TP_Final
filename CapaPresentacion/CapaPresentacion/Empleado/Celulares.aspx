<%@ Page Title="" Language="C#" MasterPageFile="~/Empleado/PaginaMaestraEmpleado.master" AutoEventWireup="true" CodeBehind="Celulares.aspx.cs" Inherits="CapaPresentacion.Empleado.Celulares" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadEmpleado" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoColIzEmpleado" runat="server">
    <p>&nbsp;</p>
    <h2>Filtrar por:</h2>

    <div id="Filtro" style="text-align: left;">

        <asp:CheckBox ID="CbxMarca" runat="server" Text="Marca" CssClass="ControlesASP"/>
        <asp:DropDownList ID="ddlMarca" runat="server" CssClass="ControlesASP" OnSelectedIndexChanged="DdlMarca_SelectedIndexChanged" AutoPostBack="True" Width="95%"></asp:DropDownList>
        <asp:CheckBox ID="CbxModelo" runat="server" Text="Modelo" CssClass="ControlesASP" AutoPostBack="True" OnCheckedChanged="CbxModelo_CheckedChanged" />
        <asp:DropDownList ID="ddlModelo" runat="server" CssClass="ControlesASP" Width="95%"></asp:DropDownList>
        <asp:CheckBox ID="CbxPrecio" runat="server" Text="Precio" CssClass="ControlesASP" />
        <asp:DropDownList ID="ddlPrecio" runat="server" CssClass="ControlesASP" Width="95%"></asp:DropDownList>
        <asp:TextBox ID="txtPrecio" runat="server" CssClass="ControlesASP" Width="95%" TextMode="Number"></asp:TextBox>
        <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" CssClass="Boton" OnClick="BtnFiltrar_Click" />
        <asp:Button ID="btnQuitarFiltro" runat="server" Text="Quitar Filtro" CssClass="Boton" OnClick="BtnQuitarFiltro_Click" />
        <asp:Label ID="lblFiltro" runat="server" CssClass="ControlesASP"></asp:Label>

    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoColPpalEmpleado" runat="server">

    <div id="FormCelulares" class="Form">

        <h2>Administrar Celulares</h2>

        <asp:GridView ID="gvwCelulares" runat="server" AllowPaging="True" AllowSorting="True" HorizontalAlign="Center" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" OnSelectedIndexChanged="GvwCelulares_SelectedIndexChanged" AutoGenerateSelectButton="True" Font-Size="Small">
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

        <asp:Label ID="lblTotalRegistros" runat="server" CssClass="LabelLarga"></asp:Label>

        <table>
            <tr>
                <td style="text-align: center;" class="auto-style1">MODELO:
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtModelo2" runat="server" placeholder="&#128241;Modelo" CssClass="ControlesASP" AutoPostBack="True" OnTextChanged="TxtModelo2_TextChanged" CausesValidation="True" ValidationGroup="1"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtModelo2" ErrorMessage="Ingrese un Modelo" SetFocusOnError="true" ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td style="text-align: center;" class="auto-style1">MARCA:
                </td>
                <td class="auto-style2">
                    <asp:DropDownList ID="ddlMarca2" runat="server" CssClass="ControlesASP" Width="91%" AppendDataBoundItems="True">
                    <asp:ListItem Value="0">&lt;Seleccione una Marca&gt;</asp:ListItem></asp:DropDownList>
                </td>
                <td class="auto-style3">&nbsp;
                </td>
            </tr>

            <tr>
                <td style="text-align: center;" class="auto-style1">DESCRIPCION:
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtDescripcion" runat="server" placeholder="Descripcion" CssClass="ControlesASP" ValidationGroup="1"></asp:TextBox>
                </td>
                <td class="auto-style3">
                    <asp:RequiredFieldValidator ID="rfv6" runat="server" ControlToValidate="txtDescripcion" ErrorMessage="Ingrese una descripcion." SetFocusOnError="true" ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td style="text-align: center;" class="auto-style1">PRECIO:
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtPrecio2" runat="server" placeholder="Precio" CssClass="ControlesASP" TextMode="Number" ValidationGroup="1" CausesValidation="True"></asp:TextBox>
                </td>
                <td class="auto-style3">
                    <asp:CompareValidator ID="cv2" runat="server" ErrorMessage="Ingrese un Precio" ControlToValidate="txtPrecio2" Operator="DataTypeCheck" ValidationGroup="1" Type="Currency"></asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPrecio2" ErrorMessage="Ingrese un Precio" SetFocusOnError="true" ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td style="text-align: center;" class="auto-style1">STOCK:
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtStock" runat="server" placeholder="Stock" CssClass="ControlesASP" TextMode="Number" ValidationGroup="1"></asp:TextBox>
                </td>
                <td class="auto-style3">
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Ingrese Stock" ControlToValidate="txtStock" Operator="DataTypeCheck" ValidationGroup="1" Type="Integer"></asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtStock" ErrorMessage="Ingrese Stock" SetFocusOnError="true" ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td style="text-align: center;" class="auto-style1">IMAGEN:
                </td>
                <td style="text-align: left;" class="auto-style2">
                    <asp:FileUpload ID="UbicacionImagen" runat="server" Font-Size="Small" EnableTheming="True" ValidateRequestMode="Enabled" />
                </td>

            </tr>

            <tr>
                <td style="text-align: center;" class="auto-style1">UBICACION IMAGEN:
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtUbicacion" runat="server" placeholder="UbicacionImagen" CssClass="ControlesASP" ReadOnly="True"></asp:TextBox>
                </td>
                <td class="auto-style3">
                    <asp:Button ID="btnVerUbicacion" runat="server" OnClick="BtnVerUbicacion_Click" Text="Ver Ubicacion" CssClass="Boton" />
                    <asp:Button ID="btnGuardar" runat="server" CssClass="Boton" OnClick="BtnGuardar_Click" Text="Guardar" Enabled="False" Visible="False" />

                </td>
            </tr>

            <tr>
                <td style="text-align: center;" class="auto-style1"></td>
                <td class="auto-style2">
                    <asp:Label ID="lblEstado" runat="server"></asp:Label>
                </td>
                <td class="auto-style3">&nbsp;
                </td>
            </tr>

            <tr>
                <td class="auto-style1">
                    <asp:Button ID="btnAgregar" runat="server" Text="Agregar" CssClass="Boton" OnClick="BtnAgregar_Click" ValidationGroup="1" />
                </td>
                <td class="auto-style2">
                    <asp:Button ID="btnEditar" runat="server" Text="Editar" CssClass="Boton" OnClick="BtnEditar_Click1" />
                </td>
                <td class="auto-style3">
                    <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="Boton" OnClick="BtnEliminar_Click1" />
                </td>
            </tr>

        </table>

    </div>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContenidoColDerEmpleado" runat="server">
</asp:Content>
