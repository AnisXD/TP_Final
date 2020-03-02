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
    public class DMarca
    {
        public DataTable MostrarTodasLasMarcas()
        {
            Conexion cn = new Conexion();
            SqlCommand cmd = new SqlCommand();
            return cn.ObtenerTablaPorProcedimiento(ref cmd, "MostrarMarcas");
        }

        public DataTable MostrarPorId(string id)
        {
            Conexion cn = new Conexion();
            SqlCommand cmd = new SqlCommand();
            Marca obj = new Marca
            {
                idmarca = id
            };
            ParametroIdMarca(ref cmd, obj);
            return cn.ObtenerTablaPorProcedimiento(ref cmd, "MostrarMarcasPorId"); ;
        }

        public DataTable MostrarPorNombre(string nombre)
        {
            Conexion cn = new Conexion();
            SqlCommand cmd = new SqlCommand();
            Marca obj = new Marca
            {
                nombremarca = nombre
            };
            ParametroIdMarca(ref cmd, obj);
            return cn.ObtenerTablaPorProcedimiento(ref cmd, "MostrarMarcaPorNombre"); ;
        }
        private void ParametrosMarcas(ref SqlCommand Comando, Marca ObjMarca)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@IDMARCA", SqlDbType.VarChar, 15);
            SqlParametros.Value = ObjMarca.idmarca;
            SqlParametros = Comando.Parameters.Add("@NOMBREMARCA", SqlDbType.VarChar, 20);
            SqlParametros.Value = ObjMarca.nombremarca;
        }
        private void ParametroIdMarca(ref SqlCommand Comando, Marca ObjMarca)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@IDMARCA", SqlDbType.VarChar,15);
            SqlParametros.Value = ObjMarca.idmarca;
        }
        private void ParametrosObtenerMarcaPorNombre(ref SqlCommand Comando, Marca marca)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@NOMBREMARCA", SqlDbType.VarChar, 20);
            SqlParametros.Value = marca.nombremarca;
        }
        private void ParametrosObtenerMarcaPorId(ref SqlCommand Comando, Marca idmarca)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@IDMARCA", SqlDbType.VarChar, 15);
            SqlParametros.Value = idmarca.idmarca;
        }

        public DataTable ObtenerMarcaPorNombre(Marca MARCA)
        {
            SqlCommand Comando = new SqlCommand();
            ParametrosObtenerMarcaPorNombre(ref Comando, MARCA);
            Conexion cn = new Conexion();
            DataTable TablaResultado = cn.ObtenerTablaPorProcedimiento(ref Comando, "MostrarMarcasPorNombre");
            return TablaResultado;
        }
        public DataTable ObtenerMarcaPorId(Marca IDMARCA)
        {
            SqlCommand Comando = new SqlCommand();
            ParametrosObtenerMarcaPorId(ref Comando, IDMARCA);
            Conexion cn = new Conexion();
            DataTable TablaResultado = cn.ObtenerTablaPorProcedimiento(ref Comando, "MostrarMarcasPorId");
            return TablaResultado;
        }
       

        public bool AgregarMarca(Marca marca)
        {
            SqlCommand Comando = new SqlCommand();
            ParametrosMarcas(ref Comando, marca);
            Conexion ad = new Conexion();
            int FilasInsertadas = ad.EjecutarProcedimientoDeABM(Comando, "AltaMarca");
            if (FilasInsertadas == 1)
                return true;
            else
                return false;
        }

        public bool ActualizarMarca(Marca marca)
        {
            SqlCommand Comando = new SqlCommand();
            ParametrosMarcas(ref Comando, marca);
            Conexion ad = new Conexion();
           int FilasInsertadas = ad.EjecutarProcedimientoDeABM(Comando, "ModificarMarca");
            if (FilasInsertadas == 1)
                return true;
            else
                return false;
        }


        public bool EliminarMarca(Marca marca)
        {
            SqlCommand Comando = new SqlCommand();
            ParametroIdMarca(ref Comando, marca);
            Conexion ad = new Conexion();
            int FilasInsertadas = ad.EjecutarProcedimientoDeABM(Comando, "BajaLogicaMarca");
            if (FilasInsertadas == 1)
                return true;
            else
                return false;
        }
    }
}
