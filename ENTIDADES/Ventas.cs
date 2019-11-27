using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    class Ventas
    {
            #region Propiedades
            private string _idventa;
            private string _idcliente;
            private float _fecha;
              private string _descripcion;
            #endregion

            #region Constructores
            public Celular()
            {
                this.idmodelo = string.Empty;
                this.nombremodelo = string.Empty;
                this.preciounitario = float.Parse;
                this.descripcion = string.Empty;
            }
            public Celular(string IDMODELO, string NOMBREMODELO, float PRECIOUNITARIO, string DESCRIPCION)
            {
                this.idmodelo = IDMODELO;
                this.nombremodelo = NOMBREMODELO;
                this.preciounitario = PRECIOUNITARIO;
                this.descripcion = DESCRIPCION;

            }

            #endregion

            #region Sets y Gets
            public string idmodelo
            {
                get => _idmodelo;
                set => _idmodelo = value;
            }
            public string nombremodelo
            {
                get => _nombremodelo;
                set => _nombremodelo = value;
            }
            public float preciounitario
            {
                get => _preciounitario;
                set => _preciounitario = value;
            }
            public string descripcion
            {
                get => _descripcion;
                set => _descripcion = value;
            }
            #endregion
        }
    }
}
