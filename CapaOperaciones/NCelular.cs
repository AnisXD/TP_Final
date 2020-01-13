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

        public DataTable Mostrar()
        {
            return new DCelular().MostrarTodos();
        }

        public DataTable BuscarPorModelo(string idmodelo)
        {
            return new DCelular().MostrarPorModelo(idmodelo);
        }

        public DataTable BuscarPorMarca(string idmarca)
        {
            return new DCelular().MostrarPorMarca(idmarca);
        }
        public DataTable BuscarPorFiltro(string filtro)
        {
            return new DCelular().MostrarPorFiltro(filtro);
        }
        public void AgregarFiltro(string NombreCampo, string Operador, string Valor, ref string Clausula)
        {
            new DCelular().FiltroAvanzado( NombreCampo,  Operador,  Valor, ref Clausula);
        }
    }
}

