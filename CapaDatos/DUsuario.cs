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
    public class DUsuario
    {
        public DataTable MostrarTodos()
        {
            Conexion cn = new Conexion();
            SqlCommand cmd = new SqlCommand();
            return cn.ObtenerTablaPorProcedimiento(ref cmd, "MostrarUsuarios");
        }

        private void ParametrosUsuario(ref SqlCommand Comando, Usuario usuario)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@DNIUSU", SqlDbType.VarChar, 15);
            SqlParametros.Value = usuario.DNI;
            SqlParametros = Comando.Parameters.Add("@APELLIDOUSU", SqlDbType.VarChar, 30);
            SqlParametros.Value = usuario.Apellido;
            SqlParametros = Comando.Parameters.Add("@NOMBREUSU", SqlDbType.VarChar, 30);
            SqlParametros.Value = usuario.Nombre;
            SqlParametros = Comando.Parameters.Add("@TELEFONOUSU", SqlDbType.VarChar, 20);
            SqlParametros.Value = usuario.Telefono;
            SqlParametros = Comando.Parameters.Add("@PROVINCIAUSU", SqlDbType.Int);
            SqlParametros.Value = Convert.ToInt32(usuario.IdProvincia);
            SqlParametros = Comando.Parameters.Add("@LOCALIDADUSU", SqlDbType.Int);
            SqlParametros.Value = Convert.ToInt32(usuario.IdLocalidad);
            SqlParametros = Comando.Parameters.Add("@DIRRECIONUSU", SqlDbType.VarChar, 30);
            SqlParametros.Value = usuario.Calle_y_Altura;
            SqlParametros = Comando.Parameters.Add("@CONTRASEÑA", SqlDbType.VarChar, 15);
            SqlParametros.Value = usuario.Contraseña;
            SqlParametros = Comando.Parameters.Add("@ROL", SqlDbType.VarChar, 1);
            SqlParametros.Value = usuario.Rol;
        }

        private void ParametroIdUsuario(ref SqlCommand Comando, string IdUsuario)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@DNIUSU", SqlDbType.VarChar, 15);
            SqlParametros.Value = IdUsuario;
        }

        private void ParametroRol(ref SqlCommand Comando, string rol)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@IDROL", SqlDbType.VarChar, 15);
            SqlParametros.Value = rol;
        }

        public bool AgregarUsuario(Usuario usuario)
        {
            SqlCommand Comando = new SqlCommand();
            ParametrosUsuario(ref Comando, usuario);
            Conexion cn = new Conexion();
            int FilasInsertadas = cn.EjecutarProcedimientoDeABM(Comando, "AltaUsuario");
            if (FilasInsertadas == 1)
                return true;
            else
                return false;
        }

        public DataTable MostrarPorId(string ID)
        {
            SqlCommand Comando = new SqlCommand();
            ParametroIdUsuario(ref Comando, ID);  //paso el ID como parametro al comando
            Conexion cn= new Conexion(); //abro la conexion
            DataTable TablaResultado = cn.ObtenerTablaPorProcedimiento(ref Comando, "MostrarUsuariosPorId");
            return TablaResultado;
        }

        public DataTable MostrarPorRol(string ROL)
        {
            SqlCommand Comando = new SqlCommand();
            ParametroIdUsuario(ref Comando, ROL);  
            Conexion cn = new Conexion(); 
            DataTable TablaResultado = cn.ObtenerTablaPorProcedimiento(ref Comando, "MostrarUsuariosPorRol");
            return TablaResultado;
        }
        private void ParametrosValidarExisteUsuario(ref SqlCommand Comando, Usuario usuario)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@DNIUSU", SqlDbType.VarChar, 15);
            SqlParametros.Value = usuario.DNI;
            SqlParametros = Comando.Parameters.Add("@CONTRASEÑA", SqlDbType.VarChar, 15);
            SqlParametros.Value = usuario.Contraseña;
        }

        public bool ValidarExisteUsuario(Usuario usuario)
        {
            SqlCommand Comando = new SqlCommand();
            ParametrosValidarExisteUsuario(ref Comando, usuario);
            Conexion cn = new Conexion();
            int FilasInsertadas = cn.EjecutarProcedimientoValidar(Comando, "ValidarExisteUsuario");

            if (FilasInsertadas == 1)
                return true;
            else
                return false;
        }

        private void ParametrosObtenerRolUsuario(ref SqlCommand Comando, Usuario usuario)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@DNIUSU", SqlDbType.VarChar, 15);
            SqlParametros.Value = usuario.DNI;
        }
        public DataTable ObtenerRolUsuario(Usuario usuario)
        {
            SqlCommand Comando = new SqlCommand();
            ParametrosObtenerRolUsuario(ref Comando, usuario);
            Conexion cn = new Conexion();
            DataTable TablaResultado = cn.ObtenerTablaPorProcedimiento(ref Comando, "ObtenerRolUsuario");
            return TablaResultado;
        }
    }
}
