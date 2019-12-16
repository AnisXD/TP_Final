using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using ENTIDADES;

namespace CapaDatos
{
    public class DLocalidad
    {
        public DataTable MostrarTodasLasLocalidades()
        {
            Conexion cn = new Conexion();
            return cn.ObtenerTabla("Provincias", "SELECT LOCALIDADES.cod_localidad AS ID_LOCALIDAD, LOCALIDADES.desc_localidad AS DESC_LOCALIDAD FROM LOCALIDADES");
        }
    }
}
