<%@ Page Title="" Language="C#" MasterPageFile="~/Empleado/PaginaMaestraEmpleado.master" AutoEventWireup="true" CodeBehind="Celulares.aspx.cs" Inherits="CapaPresentacion.Empleado.Celulares" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadEmpleado" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoColIzEmpleado" runat="server">
    
    <div id="Filtros">
    
    <h2>Filtrar por:</h2>
    
        <asp:CheckBox ID="CbxMarca" runat="server" Text="Marca" CssClass="ControlesASP"/>
        <asp:DropDownList ID="ddlMarca" runat="server"  CssClass="ControlesASP" OnSelectedIndexChanged="ddlMarca_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
    
        <asp:CheckBox ID="CbxModelo" runat="server" Text="Modelo" CssClass="ControlesASP" AutoPostBack="True" />
        <asp:DropDownList ID="ddlModelo" runat="server" CssClass="ControlesASP"></asp:DropDownList>
      
        <asp:CheckBox ID="CbxPrecio" runat="server" Text="Precio" CssClass="ControlesASP" />
        <asp:DropDownList ID="ddlPrecio" runat="server"> </asp:DropDownList>
        <asp:TextBox ID="txtPrecio" runat="server" CssClass="ControlesASP"></asp:TextBox>
    
    <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" CssClass="Boton" OnClick="btnFiltrar_Click"/>
    <asp:Button ID="btnQuitarFiltro" runat="server" Text="Quitar Filtro" CssClass="Boton" OnClick="btnQuitarFiltro_Click"/>
    
        </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoColPpalEmpleado" runat="server">
    
    <h1>Celulares</h1>
    <div id="FormCelulares" class="Form">
    
        <div id="Administrar" title="Administrar">
       
        <asp:GridView ID="gvwCelulares" runat="server" AllowPaging="True" AllowSorting="True" HorizontalAlign="Center" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" OnSelectedIndexChanged="gvwCelulares_SelectedIndexChanged" AutoGenerateSelectButton="True">
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
            
        <table >
            <tr>
                <td style="text-align:center; " class="auto-style1">
                    MODELO:
                </td>
                <td class="auto-style2">
                  <asp:TextBox ID="txtModelo2" runat="server" placeholder="&#128241;Modelo" CssClass="ControlesASP" AutoPostBack="True" OnTextChanged="txtModelo2_TextChanged" CausesValidation="True" ReadOnly="True"></asp:TextBox>
                </td>
                <td class="auto-style3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtModelo2" ErrorMessage="Ingrese un Modelo" SetFocusOnError="true" ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td style="text-align:center; " class="auto-style1">
                    MARCA:
                </td>
                <td class="auto-style2">
                    <asp:DropDownList ID="ddlMarca2" runat="server" CssClass="ControlesASP" Width="150px" AutoPostBack="True" >
                    </asp:DropDownList>
                </td>
                <td class="auto-style3">
                    &nbsp;</td>
            </tr>

            <tr>
                <td style="text-align:center; " class="auto-style1">
                    DESCRIPCION:
                </td>
                <td class="auto-style2">
                     <asp:TextBox ID="txtDescripcion" runat="server" placeholder="Descripcion" CssClass="ControlesASP"></asp:TextBox>
                </td>
                <td class="auto-style3">
                   <asp:RegularExpressionValidator ID="rev3" runat="server" ControlToValidate="txtDescripcion" ErrorMessage="Ingrese una Descripcion." ValidationExpression="^[a-zA-Z ]*$" ValidationGroup="1"></asp:RegularExpressionValidator>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtDescripcion" ErrorMessage="Ingrese una Descripcion" SetFocusOnError="true" ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td style="text-align:center; " class="auto-style1">
                    PRECIO:
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtPrecio2" runat="server" placeholder="Precio" CssClass="ControlesASP"></asp:TextBox>
                </td>
                <td class="auto-style3">
                   <asp:CompareValidator ID="cv2" Runat="server" ErrorMessage="Ingrese un Precio" ControlToValidate="txtPrecio2" Operator="DataTypeCheck" ValidationGroup="1" Type="Currency"></asp:CompareValidator>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPrecio2" ErrorMessage="Ingrese un Precio" SetFocusOnError="true" ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td style="text-align:center; " class="auto-style1">
                    STOCK:
                </td>
                  <td class="auto-style2">
                    <asp:TextBox ID="txtStock" runat="server" placeholder="Stock" CssClass="ControlesASP"></asp:TextBox>
                </td>
                <td class="auto-style3">
                   <asp:CompareValidator ID="CompareValidator1" Runat="server" ErrorMessage="Ingrese Stock" ControlToValidate="txtStock" Operator="DataTypeCheck" ValidationGroup="1" Type="Integer"></asp:CompareValidator>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtStock" ErrorMessage="Ingrese Stock" SetFocusOnError="true" ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td style="text-align:center; " class="auto-style1">
                    IMAGEN:
                </td>
                <td class="auto-style2">
                    <asp:FileUpload ID="UbicacionImagen" runat="server" />
                </td>
                <td class="auto-style3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Ingrese una Imagen" SetFocusOnError="true" ValidationGroup="1" ControlToValidate="UbicacionImagen"></asp:RequiredFieldValidator>
                </td>
             </tr>

             <tr>
                <td style="text-align:center; " class="auto-style1">
                    UBICACION IMAGEN:
                </td>
                <td class="auto-style2">
                  <asp:TextBox ID="txtUbicacion" runat="server" placeholder="UbicacionImagen" CssClass="ControlesASP" ReadOnly="True" Width="170px"></asp:TextBox>
                    <asp:Button ID="btnVerUbicacion" runat="server" OnClick="btnVerUbicacion_Click" Text="Ver Ubicacion" />
                </td>
                <td class="auto-style3">
                   
                </td>
             </tr>

             <tr>
                <td style="text-align:center; " class="auto-style1">
                </td>
                <td class="auto-style2">
                    <asp:Label ID="lblEstado" runat="server"></asp:Label>
                </td>
            </tr>

            <tr>
                <td class="auto-style2">
                 <asp:Button ID="btnAgregar" runat="server" Text="Agregar" CssClass="Boton" OnClick="btnAgregar_Click" ValidationGroup="1"/>
                </td>

                <td class="auto-style3">
                    <asp:Button ID="btnEditar" runat="server" Text="Editar" CssClass="Boton" OnClick="btnEditar_Click1"/>
                </td>
                <td>
                    <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="Boton" OnClick="btnEliminar_Click1"/>
                </td>
            </tr>

        </table>

        </div>

        </div>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContenidoColDerEmpleado" runat="server">
</asp:Content>
            