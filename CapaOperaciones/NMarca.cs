using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;
using ENTIDADES;
namespace CapaOperaciones
{
    public class NMarca
    {
        public bool Insertar (Marca objMarca)
        {
            DMarca Obj = new DMarca();
            return Obj.AgregarMarca(objMarca);

        }

        public bool Editar(Marca objMarca)
        {
            DMarca Obj = new DMarca();
            return Obj.ActualizarMarca(objMarca);

        }

        public bool Eliminar(Marca objMarca)
        {
            DMarca Obj = new DMarca();
            return Obj.EliminarMarca(objMarca);

        }
    }
}
