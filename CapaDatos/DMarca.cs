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
            return cn.ObtenerTabla("Marcas", "SELECT ID_MARCA, NOMBRE_MARCA FROM MARCAS WHERE ESTADO_MARCA=1");
        }

        public DataTable MostrarPorId(string id)
        {
            Conexion cn = new Conexion();
            string consulta = "SELECT * FROM MARCAS WHERE ID_MARCA = '" + id +"'";
            return cn.ObtenerTabla("Marcas", consulta);
        }

        private void ParametroIdMarca(ref SqlCommand Comando, Marca ObjMarca)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@IDMARCA", SqlDbType.VarChar,15);
            SqlParametros.Value = ObjMarca.idmarca;
        }

        private void ParametrosMarcas(ref SqlCommand Comando, Marca ObjMarca)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@IDMARCA", SqlDbType.VarChar, 15);
            SqlParametros.Value = ObjMarca.idmarca;
            SqlParametros = Comando.Parameters.Add("@NOMBREMARCA", SqlDbType.VarChar, 20);
            SqlParametros.Value = ObjMarca.nombremarca;
        }

        public bool AgregarMarca(Marca marca)
        {
            SqlCommand Comando = new SqlCommand();
            ParametrosMarcas(ref Comando, marca);
            Conexion ad = new Conexion();
            int FilasInsertadas = ad.EjecutarProcedimientoAlmacenado(Comando, "AltaMarca");
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
           int FilasInsertadas = ad.EjecutarProcedimientoAlmacenado(Comando, "ModificarMarca");
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
            int FilasInsertadas = ad.EjecutarProcedimientoAlmacenado(Comando, "BajaLogicaMarca");
            if (FilasInsertadas == 1)
                return true;
            else
                return false;
        }
    }
}
