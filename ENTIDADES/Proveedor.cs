using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    class Proveedor
    {
        public class DProveedores
        {
            #region Propiedades
            private string _IdProveedor;
            private string _RazonSocial;
            private Domicilio _Direccion;
            private string _Telefono;
            private string _TextoBuscar;
            #endregion

            #region Metodos Gets y Sets
            //GETs y SETs
            public string IdProveedores
            {
                get { return _IdProveedor; }
                set { _IdProveedor = value; }
            }

            public string RazonSocial
            {
                get { return _RazonSocial; }
                set { _RazonSocial = value; }
            }
            public Domicilio Direccion
            {
                get { return _Direccion; }
                set { _Direccion = value; }
            }
            public string Telefono
            {
                get { return _Telefono; }
                set { _Telefono = value; }
            }
            public string TextoBuscar
            {
                get { return _TextoBuscar; }
                set { _TextoBuscar = value; }
            }
            #endregion

            #region Constructores
            //Constructor vacío
            public DProveedores()
            {
                this.IdProveedores = string.Empty;
                this.RazonSocial = string.Empty;
                this.Direccion = new Domicilio();
                this.Telefono = string.Empty;
                this.TextoBuscar = string.Empty;
            }
            //Constructor con parámetros
            public DProveedores(string idproveedores, string razon_social, Domicilio direccion, string telefono, string textobuscar)
            {
                this.IdProveedores = idproveedores;
                this.RazonSocial = razon_social;
                this.Direccion = direccion;
                this.Telefono = telefono;
                this.TextoBuscar = textobuscar;
            }

        }
    }
}