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
        // funcion que carga la venta con sus respectivos detalles a la base de datos
        public bool Confirmar(string idvendedor, string idcliente, char idformaenvio, char idformapago, float total, List<DetallesVentas> Detalles)
        {
            Venta ObjVenta = new Venta
            {
                IdVendedor = idvendedor,
                IdCliente= idcliente,
                IdFormaEnvio = idformaenvio,
                IdFormaPago = idformapago,
                Total = 0,// cuando cargo la venta la cargo con total igual a 0 por que hay un triggre en la base de datos que al agregar los detalles suma autmaticamente los valores de los celulares
            };

            DVenta Obj = new DVenta();
            return Obj.AgregarVentaConDetalles(ObjVenta, Detalles);
        }
      //funcion para agregar los detalles a la list de detalles de la  session 
        public DetallesVentas CargarDetalle(string IDMODELO, int CANTIDAD, float PRECIOUNITARIO)
        {
            DetallesVentas Obj = new DetallesVentas
            {
                IdModelo = IDMODELO,
                Cantidad = CANTIDAD,
                PrecioUnitario = PRECIOUNITARIO,
            };
            return Obj;
        }
        public int ObtenerIdVenta()
        {
            return (new DVenta().ObtenerIdVenta() + 1);
        }
        //funciones de listado
        public DataTable Mostrar()//muestra las ventas sin detalles
        {
            return new DVenta().MostrarTodas();
        }
        public DataTable MostrarVenta(int IdVenta)//muestra una venta sin detalle si existe
        {
            return new DVenta().MostrarPorId(IdVenta);
        }
        public DataTable MostrarPorVendedor(string IdVendedor)//muestra las ventas sin detalles por vendedor
        {
            return new DVenta().MostrarPorVendedor(IdVendedor);
        }
        public DataTable MostrarPorCliente(string IdCliente)//muestra las ventas sin detalles por vendedor
        {
            return new DVenta().MostrarPorVendedor(IdCliente);
        }
        public DataTable MostrarDetalle(int IdVenta)//muestra los detalles de una venta
        {
            return new DVenta().MostrarDetallesPorIdVta(IdVenta);
        }
        public DataTable MostrarPorModelo(string IdModelo)//muesra los detalles por Modelo
        {
            return new DVenta().MostrarDetallesPorIdModelo(IdModelo);
        }
        public DataTable MostrarPorMarca(string IdMarca)
        {
            return new DVenta().MostrarDetallePorIdMarca(IdMarca);//muestra los detalles por marca
        }

    }
}
