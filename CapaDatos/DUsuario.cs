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

        private void ParametrosUsuario(ref SqlCommand Comando, Usuarios usuario)
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
        public bool AgregarUsuario(Usuarios usuario)
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
        private void ParametroIdUsuario(ref SqlCommand Comando, string IdUsuario)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@DNIUSU", SqlDbType.VarChar, 15);
            SqlParametros.Value = IdUsuario;
        }

        private void ParametroRol(ref SqlCommand Comando, string rol)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@IDROL", SqlDbType.VarChar, 1);
            SqlParametros.Value = rol;
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
            ParametroRol(ref Comando, ROL);  
            Conexion cn = new Conexion(); 
            return cn.ObtenerTablaPorProcedimiento(ref Comando, "MostrarUsuariosPorRol");
            
        }
        private void ParametrosValidarExisteUsuario(ref SqlCommand Comando, Usuarios usuario)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@DNIUSU", SqlDbType.VarChar, 15);
            SqlParametros.Value = usuario.DNI;
            SqlParametros = Comando.Parameters.Add("@CONTRASEÑA", SqlDbType.VarChar, 15);
            SqlParametros.Value = usuario.Contraseña;
        }

        public bool ValidarExisteUsuario(Usuarios usuario)
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

        private void ParametrosObtenerRolUsuario(ref SqlCommand Comando, Usuarios usuario)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@DNIUSU", SqlDbType.VarChar, 15);
            SqlParametros.Value = usuario.DNI;
        }
        public DataTable ObtenerRolUsuario(Usuarios usuario)
        {
            SqlCommand Comando = new SqlCommand();
            ParametrosObtenerRolUsuario(ref Comando, usuario);
            Conexion cn = new Conexion();
            DataTable TablaResultado = cn.ObtenerTablaPorProcedimiento(ref Comando, "ObtenerRolUsuario");
            return TablaResultado;
        }

        private void ParametrosObtenerNombreUsuario(ref SqlCommand Comando, Usuarios usuario)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@DNIUSU", SqlDbType.VarChar, 15);
            SqlParametros.Value = usuario.DNI;
        }
        public DataTable ObtenerNombreUsuario(Usuarios usuario)
        {
            SqlCommand Comando = new SqlCommand();
            ParametrosObtenerNombreUsuario(ref Comando, usuario);
            Conexion cn = new Conexion();
            DataTable TablaResultado = cn.ObtenerTablaPorProcedimiento(ref Comando, "ObtenerNombreUsuario");
            return TablaResultado;
        }
        private void ParametrosObtenerUsuariosPorDNI(ref SqlCommand Comando, Usuarios usuario)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@DNIUSU", SqlDbType.VarChar, 15);
            SqlParametros.Value = usuario.DNI;
            SqlParametros = Comando.Parameters.Add("@ROLUSU", SqlDbType.VarChar, 1);
            SqlParametros.Value = usuario.Rol;
        }
        private void ParametrosObtenerUsuariosPorApellido (ref SqlCommand Comando, Usuarios usuario)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@APELLIDO", SqlDbType.VarChar, 30);
            SqlParametros.Value = usuario.Apellido;
            SqlParametros = Comando.Parameters.Add("@ROLUSU", SqlDbType.VarChar, 1);
            SqlParametros.Value = usuario.Rol;
        }
        public DataTable ObtenerUsuariosPorDNI(Usuarios usuario)
        {
            SqlCommand Comando = new SqlCommand();
            ParametrosObtenerUsuariosPorDNI(ref Comando, usuario);
            Conexion cn = new Conexion();
            DataTable TablaResultado = cn.ObtenerTablaPorProcedimiento(ref Comando, "MostrarUsuariosPorDNIRol");
            return TablaResultado;
        }
        public DataTable ObtenerUsuariosPorApellido(Usuarios usuario)
        {
            SqlCommand Comando = new SqlCommand();
            ParametrosObtenerUsuariosPorApellido(ref Comando, usuario);
            Conexion cn = new Conexion();
            DataTable TablaResultado = cn.ObtenerTablaPorProcedimiento(ref Comando, "MostrarUsuariosPorApellido");
            return TablaResultado;
        }
        private void ParametrosActualizarUsuario(ref SqlCommand Comando, Usuarios usuario)
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
            SqlParametros = Comando.Parameters.Add("@ROL", SqlDbType.VarChar, 1);
            SqlParametros.Value = usuario.Rol;
        }
        public bool ActualizarUsuario(Usuarios usuario)
        {
            SqlCommand Comando = new SqlCommand();
            ParametrosActualizarUsuario(ref Comando, usuario);
            Conexion ad = new Conexion();
            int FilasInsertadas = ad.EjecutarProcedimientoDeABM(Comando, "ModificarUsuarioEmpleados");
            if (FilasInsertadas == 1)
                return true;
            else
                return false;
        }
        public bool ActualizarUsuarioC(Usuarios usuario)
        {
            SqlCommand Comando = new SqlCommand();
            ParametrosUsuario(ref Comando, usuario);
            Conexion ad = new Conexion();
            int FilasInsertadas = ad.EjecutarProcedimientoDeABM(Comando, "ModificarUsuario");
            if (FilasInsertadas == 1)
                return true;
            else
                return false;
        }

        public bool EliminarCliente(Usuarios usuario)
        {
            SqlCommand Comando = new SqlCommand();
            ParametrosObtenerUsuariosPorDNI(ref Comando, usuario);
            Conexion ad = new Conexion();
            int FilasInsertadas = ad.EjecutarProcedimientoDeABM(Comando, "BajaLogicaUsuario");
            if (FilasInsertadas == 1)
                return true;
            else
                return false;
        }

        private void ParametrosObtenerDatosUsuario(ref SqlCommand Comando, Usuarios usuario)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@DNIUSU", SqlDbType.VarChar, 15);
            SqlParametros.Value = usuario.DNI;
        }
        public DataTable ObtenerDatosUsuario(Usuarios usuario)
        {
            SqlCommand Comando = new SqlCommand();
            ParametrosObtenerDatosUsuario(ref Comando, usuario);
            Conexion cn = new Conexion();
            DataTable TablaResultado = cn.ObtenerTablaPorProcedimiento(ref Comando, "ObtenerDatosUsuario");
            return TablaResultado;
        }
        public DataTable ObtenerTEST(Usuarios usuario)
        {
            SqlCommand Comando = new SqlCommand();
            ParametrosObtenerDatosUsuario(ref Comando, usuario);
            Conexion cn = new Conexion();
            DataTable TablaResultado = cn.ObtenerTablaPorProcedimiento(ref Comando, "ObtenerTEST");
            return TablaResultado;
        }

        private void ParametrosActualizarTEST(ref SqlCommand Comando, Usuarios usuario)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@DNI", SqlDbType.VarChar, 15);
            SqlParametros.Value = usuario.DNI;
            SqlParametros = Comando.Parameters.Add("@NOMBRE", SqlDbType.VarChar, 30);
            SqlParametros.Value = usuario.Nombre;
        }
        public bool ActualizarTEST(Usuarios usuario)
        {
            SqlCommand Comando = new SqlCommand();
            ParametrosActualizarTEST(ref Comando, usuario);
            Conexion ad = new Conexion();
            int FilasInsertadas = ad.EjecutarProcedimientoDeABM(Comando, "ModificarTEST");
            if (FilasInsertadas == 1)
                return true;
            else
                return false;
        }
    }
}
