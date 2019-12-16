using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    class Venta
    {

        #region Propiedades
        private string _IdVenta;
        private string _IdUsuario;
        private DateTime _FechaVta;
        private char __IdFormaEnvio;
        private char __IdFormaPago;
        private float _Total;

        #endregion

        #region Constructores
        public Venta()
        {
            IdVenta = string.Empty;
        }
        public Venta(string IDVENTA)
        {

            IdVenta = IDVENTA;
        }


        #endregion

        #region Sets y Gets

        public string IdVenta { get => _IdVenta; set => _IdVenta = value; }
        public string IdUsuario { get => _IdUsuario; set => _IdUsuario = value; }
        public DateTime FechaVta { get => _FechaVta; set => _FechaVta = value; }
        public char IdFormaEnvio { get => __IdFormaEnvio; set => __IdFormaEnvio = value; }
        public char IdFormaPago { get => __IdFormaPago; set => __IdFormaPago = value; }
        public float Total { get => _Total; set => _Total = value; }

        #endregion
    }
}
