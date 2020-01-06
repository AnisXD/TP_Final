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
    public class NLocalidad
    {
        public DataTable MostrarTodas()
        {
            return new DLocalidad().MostrarTodas();
        }


        public DataTable MostrarPorIdProvincia(int IdProvincia)
        {
            return new DLocalidad().MostrarPorProvincia(IdProvincia);
        }

    }
}
