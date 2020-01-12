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
    public class NCelular
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

        public bool Editar(string modelo, string marca, float preciounitario, int stock, string descripcion, string ubicacionimagen )
        {
            Celular ObjCelular = new Celular
            {
                IdModelo = modelo,
                IdMarca = marca,
                PrecioUnitario = preciounitario,
                Stock = stock,
                Descripcion = descripcion,
                UbicacionImagen = ubicacionimagen,
            };
            DCelular Obj = new DCelular();
            return Obj.ActualizarCelular(ObjCelular);

        }
        public bool Eliminar(string modelo)
        {
            DCelular Obj = new DCelular();
            return Obj.EliminarCelular(modelo);

        }

        public DataTable BuscarPorModelo(string idmodelo)
        {
            Celular objCelular = new Celular
            {
                IdModelo = idmodelo
            };

            DCelular Obj = new DCelular();
            return Obj.MostrarPorModelo(objCelular);
        }

        public DataTable BuscarPorMarca(string idmarca)
        {
            return new DCelular().MostrarPorMarca(idmarca);
        }

        public DataTable FiltroPrecio(float Condicion)
        {
            return new DCelular().MostrarPorPrecio(Condicion);
        }
    }
}

