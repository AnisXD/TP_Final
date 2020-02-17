using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    public class DetallesVenta
    {

        #region Propiedades
        private string _IdVenta;
        private string _IdDetalle;
        private string _IdModelo;
        private int _Cantidad;
        private float _PrecioUnitario;

        #endregion

        #region Constructores
        public DetallesVenta()
        {
            IdVenta = string.Empty;
            IdDetalle = string.Empty;
            IdModelo = string.Empty;
            Cantidad = 0;
            PrecioUnitario = 0;
        }
        public DetallesVenta(string IDVENTA, string IDDETALLE, string IDMODELO, int CANTIDAD, float PRECIOUNITARIO)
        {

            IdVenta = IDVENTA;
            IdDetalle = IDDETALLE;
            IdModelo = IDMODELO;
            Cantidad = CANTIDAD;
            PrecioUnitario = PRECIOUNITARIO;

    }


    #endregion

    #region Sets y Gets

    public string IdVenta { get => _IdVenta; set => _IdVenta = value; }
        public string IdDetalle { get => _IdDetalle; set => _IdDetalle = value; }
        public string IdModelo { get => _IdModelo; set => _IdModelo = value; }
        public int Cantidad { get => _Cantidad; set => _Cantidad = value; }
        public float PrecioUnitario { get => _PrecioUnitario; set => _PrecioUnitario = value; }


        #endregion
    }
}
