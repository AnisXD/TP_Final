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
    class DMarca
    {
        

        public DataTable MostrarTodasLasMarcas()
        {
            Conexion cn = new Conexion();
            return cn.ObtenerTabla("Marcas", "Select * from Marcas");
        }


        private void ParametroIdMarca(ref SqlCommand Comando, Marca ObjMarca)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@IdMarca", SqlDbType.NVarChar,8);
            SqlParametros.Value = ObjMarca.idmarca;
        }

        private void ParametrosMarcas(ref SqlCommand Comando, Marca ObjMarca)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@IdMarca", SqlDbType.NVarChar, 8);
            SqlParametros.Value = ObjMarca.idmarca;
            SqlParametros = Comando.Parameters.Add("@NombreMarca", SqlDbType.NVarChar, 40);
            SqlParametros.Value = ObjMarca.nombremarca;
        }

        public bool AgregarMarca(Marca marca)
        {
            SqlCommand Comando = new SqlCommand();
            ParametrosMarcas(ref Comando, marca);
            Conexion ad = new Conexion();
            int FilasInsertadas = ad.EjecutarProcedimientoAlmacenado(Comando, "spAgregarMarca");
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
           int FilasInsertadas = ad.EjecutarProcedimientoAlmacenado(Comando, "spActualizarMarca");
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
            int FilasInsertadas = ad.EjecutarProcedimientoAlmacenado(Comando, "spEliminarMarca");
            if (FilasInsertadas == 1)
                return true;
            else
                return false;
        }
    }
}
