<%@ Page Title="" Language="C#" MasterPageFile="~/Empleado/PaginaMaestraEmpleado.master" AutoEventWireup="true" CodeBehind="Celulares.aspx.cs" Inherits="CapaPresentacion.Empleado.Celulares" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadEmpleado" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoColIzEmpleado" runat="server">
    
    <div id="Filtros">
    
    <h2>Filtrar por:</h2>
    <asp:Label ID="lblMarca" runat="server" Text="Marca: " CssClass="ControlesASP"></asp:Label>
    <asp:DropDownList ID="ddlMarca" runat="server"  CssClass="ControlesASP" DataSourceID="marca" DataTextField="NOMBRE_MARCA" DataValueField="ID_MARCA"></asp:DropDownList>
    <asp:SqlDataSource ID="marca" runat="server" ConnectionString="<%$ ConnectionStrings:FINAL_LABConnectionString2 %>" SelectCommand="SELECT [ID_MARCA], [NOMBRE_MARCA] FROM [MARCAS]"></asp:SqlDataSource>
    <asp:Label ID="lblModelo" runat="server" Text="Modelo: " CssClass="ControlesASP"></asp:Label>
    <asp:DropDownList ID="ddlModelo" runat="server" CssClass="ControlesASP" DataSourceID="modelos" DataTextField="ID_MODELO" DataValueField="ID_MARCA_CEL"></asp:DropDownList>
    <asp:SqlDataSource ID="modelos" runat="server" ConnectionString="<%$ ConnectionStrings:FINAL_LABConnectionString2 %>" SelectCommand="SELECT [ID_MODELO], [ID_MARCA_CEL] FROM [CELULARES]"></asp:SqlDataSource>
    <asp:Panel ID="pnlFiltrarPrecio" runat="server">
        <asp:Label ID="lblPrecio" runat="server" Text="Precio: " CssClass="ControlesASP"></asp:Label>
        <asp:RadioButton ID="Mayor" runat="server" Text="Mayor a:" CssClass="ControlesASP"/>
        <asp:RadioButton ID="Menor" runat="server" Text="Menor a:" CssClass="ControlesASP"/>
        <asp:RadioButton ID="Igual" runat="server" Text="Igual a:" CssClass="ControlesASP"/>
        <asp:TextBox ID="txtPrecio" runat="server" CssClass="ControlesASP"></asp:TextBox>
    </asp:Panel>
    <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" CssClass="Boton"/>
    <asp:Button ID="btnQuitarFiltro" runat="server" Text="Quitar Filtro" CssClass="Boton"/>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoColPpalEmpleado" runat="server">
    
    <h1>Celulares</h1>
    <div id="FormCelulares" class="Form">
    
            <asp:GridView ID="gvwCelulares" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ID_MODELO" DataSourceID="SqlDataSource1" Font-Size="10pt" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="gvwCelulares_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ID_MODELO" HeaderText="MODELO" ReadOnly="True" SortExpression="ID_MODELO" />
                    <asp:BoundField DataField="ID_MARCA_CEL" HeaderText="MARCA" SortExpression="ID_MARCA_CEL" />
                    <asp:BoundField DataField="ID_STOCK_CEL" HeaderText="STOCK" SortExpression="ID_STOCK_CEL" />
                    <asp:BoundField DataField="DESCRIPCION_CEL" HeaderText="DESCRIPCION" SortExpression="DESCRIPCION_CEL" />
                    <asp:BoundField DataField="PRECIO_UNITARIO_CEL" HeaderText="PRECIO" SortExpression="PRECIO_UNITARIO_CEL" />
                    <asp:BoundField DataField="UBICACION_IMAGEN_CEL" HeaderText="IMAGEN" SortExpression="UBICACION_IMAGEN_CEL" />
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

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FINAL_LABConnectionString2 %>" SelectCommand="SELECT [ID_MODELO], [ID_MARCA_CEL], [ID_PROVEEDOR_CEL], [DESCRIPCION_CEL], [PRECIO_UNITARIO_CEL], [UBICACION_IMAGEN_CEL] FROM [CELULARES]"></asp:SqlDataSource>

        <div id="Administrar" title="Administrar">
             <asp:Label ID="lblTotalRegistros" runat="server"></asp:Label>   
            <table >
            <tr>
                <td style="text-align:center; " class="auto-style1">
                    MODELO:
                </td>
                <td class="auto-style2">
                  <asp:TextBox ID="txtModelo2" runat="server" placeholder="&#127915;DNI" CssClass="ControlesASP" AutoPostBack="True" OnTextChanged="txtModelo2_TextChanged" TextMode="Number" CausesValidation="True"></asp:TextBox>
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
                    <asp:DropDownList ID="ddlMarca2" runat="server" CssClass="ControlesASP" Width="150px" AutoPostBack="True" OnSelectedIndexChanged="ddlMarca_SelectedIndexChanged" >
                    </asp:DropDownList>
                </td>
                <td class="auto-style3">
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:FINAL_LABConnectionString2 %>" SelectCommand="SELECT [ID_MARCA], [NOMBRE_MARCA] FROM [MARCAS]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td style="text-align:center; " class="auto-style1">
                    DESCRIPCION:
                </td>
                <td class="auto-style2">
                     <asp:TextBox ID="txtDescripcion" runat="server" placeholder="&#128100;Apellido" CssClass="ControlesASP"></asp:TextBox>
                </td>
                <td class="auto-style3">
                   <asp:RegularExpressionValidator ID="rev3" runat="server" ControlToValidate="txtDescripcion" ErrorMessage="Ingrese una Descripcion." ValidationExpression="^[a-zA-Z ]*$" ValidationGroup="1"></asp:RegularExpressionValidator>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txrDescripcion" ErrorMessage="Ingrese una Descripcion" SetFocusOnError="true" ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="text-align:center; " class="auto-style1">
                    PRECIO:
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtPrecio2" runat="server" placeholder="&#128241;" CssClass="ControlesASP"></asp:TextBox>
                </td>
                <td class="auto-style3">
                   <asp:CompareValidator ID="cv2" Runat="server" ErrorMessage="Ingrese un Precio" ControlToValidate="txtPrecio" Operator="DataTypeCheck" ValidationGroup="1" Type="Currency"></asp:CompareValidator>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPrecio2" ErrorMessage="Ingrese un Precio" SetFocusOnError="true" ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="text-align:center; " class="auto-style1">
                    STOCK:
                </td>
                  <td class="auto-style2">
                    <asp:TextBox ID="txtStock" runat="server" placeholder="&#128241;" CssClass="ControlesASP"></asp:TextBox>
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
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </td>
                <td class="auto-style3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Ingrese una Imagen" SetFocusOnError="true" ValidationGroup="1"></asp:RequiredFieldValidator>
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
                 <asp:Button ID="btnAgregar" runat="server" Text="Agregar" CssClass="Boton"/>
                </td>
             <td class="auto-style3">

            <asp:Button ID="btnEditar" runat="server" Text="Editar" CssClass="Boton"/>
        
               <td>
            <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="Boton"/>
                     </td>
                </tr>
        </table>

        </div>

        </div>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContenidoColDerEmpleado" runat="server">
</asp:Content>
            