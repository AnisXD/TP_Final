using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace ENTIDADES
{
    class AccesoDatos
    {
        String rutaBDTP_Final = "Data Source=localhost\\SQLEXPRESS;Initial Catalog=FINALPROG;Integrated Security=True";

        public AccesoDatos()
        {
            // TODO: Agregar aquí la lógica del constructor.
        }

        public SqlConnection ObtenerConexion()
        {
            SqlConnection cn = new SqlConnection(rutaBDTP_Final);
            try
            {
                cn.Open();
                return cn;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public SqlDataAdapter ObtenerAdaptador(String consultaSql)
        {
            SqlDataAdapter adaptador;
            try
            {
                adaptador = new SqlDataAdapter(consultaSql, rutaBDTP_Final);
                return adaptador;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public DataTable devuelveTabla(String Nombre, String Sql)
        {
            DataSet ds = new DataSet();
            SqlDataAdapter adp = ObtenerAdaptador(Sql);
            adp.Fill(ds, Nombre);
            return ds.Tables[Nombre];
        }

        public int EjecutarProcedimientoAlmacenado(SqlCommand Comando, String NombreSP)
        {
            int FilasCambiadas;
            SqlConnection Conexion = ObtenerConexion();
            SqlCommand cmd = new SqlCommand();
            cmd = Comando;
            cmd.Connection = Conexion;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = NombreSP;
            FilasCambiadas = cmd.ExecuteNonQuery();
            Conexion.Close();
            return FilasCambiadas;
        }

        public int EjecutarProcedimientoAlmacenado2(SqlCommand Comando, String NombreSP)
        {
            int FilasCambiadas = 1;
            SqlConnection Conexion = ObtenerConexion();
            SqlCommand cmd = new SqlCommand();
            cmd = Comando;
            cmd.Connection = Conexion;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = NombreSP;
            SqlDataReader dr = cmd.ExecuteReader();
            dr.Read();

            try
            {
                string aux = dr[0].ToString();
            }
            catch
            {
                FilasCambiadas = 0;
            }

            Conexion.Close();
            return FilasCambiadas;
        }
    }
}
