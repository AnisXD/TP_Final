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
    public class DProvincia
    {
        public DataTable MostrarTodasLasProvincias()
        {
            Conexion cn = new Conexion();
            return cn.ObtenerTabla("Provincias", "SELECT PROVINCIAS.cod_provincia AS ID_PROVINCIA, PROVINCIAS.descripcion_provincia AS DESC_PROVINCIA FROM PROVINCIAS");
        }
    }
}
