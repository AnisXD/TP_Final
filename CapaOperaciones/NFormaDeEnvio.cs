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
    public class NFormaDeEnvio
    {
        public DataTable Mostrar()
        {
            return new DFormaDeEnvio().MostrarTodas();
        }
    }
}
