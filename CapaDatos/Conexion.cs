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
            RutaConexion = "Data Source=localhost\\sqlexpress;Initial Catalog=FINALPROG;Integrated Security=True";
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

        public int EjecutarProcedimientoDeABM(SqlCommand Comando, String NombreSP) 
        //el comando que recibe tiene los parametros incluidos
        {
            int FilasCambiadas;
            SqlCommand cmd =  Comando;
            try
            {
                SqlConnection Conexion = ObtenerConexion();
                cmd.Connection = Conexion;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = NombreSP;
                FilasCambiadas = cmd.ExecuteNonQuery();
                Conexion.Close(); 
            }
            catch (Exception ex)
            {
                Error = ex.ToString();
                FilasCambiadas = 0;
            }
            return FilasCambiadas;
        }

        public DataTable ObtenerTablaPorConsultaSQL( String Sql)
        {
            DataTable DTResultado = new DataTable();
            SqlCommand cmd = new SqlCommand();
            try
            {
                
                SqlConnection Conexion = ObtenerConexion();
                cmd.Connection = Conexion;
                SqlDataAdapter adp = ObtenerAdaptador(Sql);
                adp.Fill(DTResultado);
                Conexion.Close();
            }
            catch(Exception ex)
            {
                Error = ex.ToString();
                DTResultado = null;
            }
            return DTResultado;
        }

        public DataTable ObtenerTablaPorProcedimiento(ref SqlCommand cmd, String NombreSP)
        {
            DataTable DTResultado = new DataTable();
            try
            {
                SqlConnection Conexion = ObtenerConexion();
                cmd.Connection = Conexion;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = NombreSP;
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(DTResultado);
                Conexion.Close();
            }
            catch(Exception ex)
            {
                Error = ex.ToString();
                DTResultado = null;
            }
            return DTResultado;
        }
    }
}

