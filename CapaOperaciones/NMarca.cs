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
    public class NMarca
    {
        public bool Insertar (string id, string nombre)
        {
            Marca ObjMarca = new Marca
            {
                idmarca = id,
                nombremarca = nombre
            };
            DMarca Obj = new DMarca();
            return Obj.AgregarMarca(ObjMarca);

        }

        public bool Editar (string id, string nombre)
        {;
            Marca ObjMarca = new Marca
            {
                idmarca = id,
                nombremarca = nombre
            };
            DMarca Obj = new DMarca();
            return Obj.ActualizarMarca(ObjMarca);
        
        }

        public bool Eliminar(string id, string nombre)
        {
            Marca ObjMarca = new Marca
            {
                idmarca = id,
                nombremarca = nombre
            };
            DMarca Obj = new DMarca();
            return Obj.EliminarMarca(ObjMarca);

        }
        public DataTable Mostrar()
        {
            return new DMarca().MostrarTodasLasMarcas();
        }

        public DataTable BuscarPorId(string id) 
        {
            return new DMarca().MostrarPorId(id);
        }

        public DataTable BuscarPorNombre(string nombre)
        {
            return new DMarca().MostrarPorNombre(nombre);
        }
    }
}
