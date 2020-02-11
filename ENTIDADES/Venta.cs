using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    public class Venta
    {
        #region Propiedades
        private string _IdVenta;
        private string _IdCliente;
        private string _IdVendedor;
        private DateTime _FechaVta;
        private char __IdFormaEnvio;
        private char __IdFormaPago;
        private float _Total;

        #endregion

        #region Constructores
        public Venta()
        {
            IdVenta = string.Empty;
            IdCliente = string.Empty;
            IdVendedor = string.Empty;
            FechaVta = System.DateTime.Now.Date;
            IdFormaEnvio = ' ';
            IdFormaPago = ' ';
            Total = 0;
        }
        public Venta(string idventa, string idcliente, string idvendedor, char idformaenvio, char idformapago, float total, DateTime fecha )
        {
            IdVenta = idventa;
            IdCliente = idcliente;
            IdVendedor = idvendedor;
            FechaVta = fecha;
            IdFormaEnvio = idformaenvio;
            IdFormaPago = idformapago;
            Total = total;
        }


        #endregion

        #region Sets y Gets

        public string IdVenta { get => _IdVenta; set => _IdVenta = value; }
        public DateTime FechaVta { get => _FechaVta; set => _FechaVta = value; }
        public char IdFormaEnvio { get => __IdFormaEnvio; set => __IdFormaEnvio = value; }
        public char IdFormaPago { get => __IdFormaPago; set => __IdFormaPago = value; }
        public float Total { get => _Total; set => _Total = value; }
        public string IdCliente { get => _IdCliente; set => _IdCliente = value; }
        public string IdVendedor { get => _IdVendedor; set => _IdVendedor = value; }

        #endregion
    }
}
