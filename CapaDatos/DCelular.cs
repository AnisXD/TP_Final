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
    public class DCelular
    {
        public DataTable MostrarTodos()
        {
            Conexion cn = new Conexion();
            SqlCommand cmd = new SqlCommand();
            return cn.ObtenerTablaPorProcedimiento(ref cmd, "MostrarCelulares");
        }

        private void ParametrosCelular(ref SqlCommand Comando, Celular celular)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@IDMODELOCEL", SqlDbType.VarChar, 15);
            SqlParametros.Value = celular.IdModelo;
            SqlParametros = Comando.Parameters.Add("@IDMARCACEL", SqlDbType.VarChar, 15);
            SqlParametros.Value = celular.IdMarca;
            SqlParametros = Comando.Parameters.Add("@PRECIOUNITARIOCEL", SqlDbType.Float);
            SqlParametros.Value = celular.PrecioUnitario;
            SqlParametros = Comando.Parameters.Add("@STOCKCEL", SqlDbType.Int);
            SqlParametros.Value = celular.Stock;
            SqlParametros = Comando.Parameters.Add("@DESCRIPCIONCEL", SqlDbType.VarChar, 100);
            SqlParametros.Value = celular.Descripcion;
            SqlParametros = Comando.Parameters.Add("@UBICACIONIMAGENCEL", SqlDbType.VarChar, 100);
            SqlParametros.Value = celular.UbicacionImagen;
        }

        private void ParametroIdModelo(ref SqlCommand Comando, string IdModelo)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@IDMODELOCEL", SqlDbType.VarChar, 15);
            SqlParametros.Value = IdModelo;
        }
        private void ParametroIdMarca(ref SqlCommand Comando, string IdMarca)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@IDMARCACEL", SqlDbType.VarChar, 15);
            SqlParametros.Value = IdMarca;
        }
        public bool AgregarCelular(Celular celular)
        {
            SqlCommand Comando = new SqlCommand();
            ParametrosCelular(ref Comando, celular);
            Conexion cn = new Conexion();
            int FilasInsertadas = cn.EjecutarProcedimientoDeABM(Comando, "AltaCelular");
            if (FilasInsertadas == 1)
                return true;
            else
                return false;
        }

        public DataTable MostrarPorIdModelo(string Idmodelo)
        {
            SqlCommand Comando = new SqlCommand();
            ParametroIdModelo(ref Comando, Idmodelo);  //paso el ID como parametro al comando
            Conexion cn = new Conexion(); //abro la conexion
            DataTable TablaResultado = cn.ObtenerTablaPorProcedimiento(ref Comando, "MostrarCelularPorIdModelo");
            return TablaResultado;  
        }

        public DataTable MostrarPorIdMarca(string idmarca)
        {
            SqlCommand Comando = new SqlCommand();
            ParametroIdMarca(ref Comando, idmarca); 
            Conexion cn = new Conexion(); 
            DataTable TablaResultado = cn.ObtenerTablaPorProcedimiento(ref Comando, "MostrarCelularPorIdMarca");
            return TablaResultado;
        }
        public bool ActualizarCelular(Celular celular)
        {
            SqlCommand Comando = new SqlCommand();
            ParametrosCelular(ref Comando, celular);
            Conexion ad = new Conexion();
            int FilasInsertadas = ad.EjecutarProcedimientoDeABM(Comando, "ModificarCelular");
            if (FilasInsertadas == 1)
                return true;
            else
                return false;
        }
        public bool EliminarCelular(Celular celular)
        {
            SqlCommand Comando = new SqlCommand();
            ParametrosCelular(ref Comando, celular);
            Conexion ad = new Conexion();
            int FilasInsertadas = ad.EjecutarProcedimientoDeABM(Comando, "BajaLogicaCelular");
            if (FilasInsertadas == 1)
                return true;
            else
                return false;
        }
    }
}

