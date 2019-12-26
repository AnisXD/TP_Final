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
        public DataTable MostrarTodas()
        {
            Conexion cn = new Conexion();
            SqlCommand cmd = new SqlCommand();
            return cn.ObtenerTablaPorProcedimiento(ref cmd, "MostrarLocalidades");
        }

        public DataTable MostrarPorProvincia(int codProv)
        {
            Conexion cn = new Conexion();
            SqlCommand cmd = new SqlCommand();
            ParametroCodProv(ref cmd, codProv);
            return cn.ObtenerTablaPorProcedimiento(ref cmd, "MostrarLocalidadesPorProvincia");
        }

        private void ParametroCodProv(ref SqlCommand Comando, int codProv)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@IDPROVINCIA", SqlDbType.Int);
            SqlParametros.Value = codProv;
        }
    }
}
