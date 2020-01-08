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
    class NCelular
    {
        public bool Insertar(string idmodelo, string idmarcacel, float preciounitariocel, int stockcel, string descripcioncel, string ubicacionimagen)
        {
            Celular ObjCelular = new Celular
            {
                IdModelo = idmodelo,
                IdMarca = idmarcacel,
                PrecioUnitario = preciounitariocel,
                Stock = stockcel,
                Descripcion= descripcioncel,
                UbicacionImagen= ubicacionimagen,
            };

            DCelular Obj = new DCelular();
            return Obj.AgregarCelular(ObjCelular);
        }

        public DataTable Mostrar()
        {
            return new DCelular().MostrarTodos();
        }

        public DataTable BuscarPorIdModelo(string idmodelo)
        {
            return new DCelular().MostrarPorIdModelo(idmodelo);
        }

        public DataTable BuscarPorIdMarca(string idmarca)
        {
            return new DCelular().MostrarPorIdMarca(idmarca);
        }

    }
}

