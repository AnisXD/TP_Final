using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;


namespace CapaDatos
{
    public class Conexion
    {
        string _rutaConexion;
        string _error;

        public string Error { get => _error; set => _error = value; }
        public string RutaConexion { get => _rutaConexion; set => _rutaConexion = value; }

        public Conexion()
        {
            RutaConexion = "Data Source=localhost\\sqlexpress;Initial Catalog=FINAL_LAB;Integrated Security=True";
        }

        public SqlConnection ObtenerConexion()
        {
            SqlConnection cn = new SqlConnection(RutaConexion);
            try
            {
                cn.Open();
                return cn;
            }
            catch (Exception ex)
            {
                Error = ex.ToString();
                return null;
            }
        }
        public SqlDataAdapter ObtenerAdaptador(String consultaSql)
        {
            SqlDataAdapter adaptador;
            try
            {
                adaptador = new SqlDataAdapter(consultaSql, RutaConexion);
                return adaptador;
            }
            catch (Exception ex)
            {
                Error = ex.ToString();
                return null;

            }
        }

        public int EjecutarProcedimientoAlmacenado(SqlCommand Comando, String NombreSP) //comando que recibe tiene los parametros incluidos
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

        public DataTable ObtenerTabla(String Nombre, String Sql)
        {
            DataSet ds = new DataSet();
            SqlDataAdapter adp = ObtenerAdaptador(Sql);
            adp.Fill(ds, Nombre);
            return ds.Tables[Nombre];
        }
    }
}

