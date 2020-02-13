using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using CapaDatos;
using ENTIDADES;


namespace CapaOperaciones
{
   public class NVenta
    {
        public DataTable Mostrar()
        {
            return new DVenta().MostrarTodos();
        }
        public DataTable BuscarPorModelo(string idmodelo)
        {
            return new DVenta().MostrarDetallesPorIdModelo(idmodelo);
        }
        public DataTable BuscarPorMarca(string idmarca)
        {
            return new DVenta().MostrarDetallePorIdMarca(idmarca);
        }
        public DataTable BuscarUsuarioPorDNIC(string DNI)
        {
            return new DVenta().MostrarVentasPorCliente(DNI);
        }
        public DataTable BuscarUsuarioPorDNIV(string DNI)
        {
            return new DVenta().MostrarVentasPorVendedor(DNI);
        }
    }
}
