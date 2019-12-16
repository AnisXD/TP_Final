using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace ENTIDADES
{
    class GestionUsuario
    {
            public DataTable ObtenerTodosLosUsuarios()
            {
                AccesoDatos ad = new AccesoDatos();
                return ad.devuelveTabla("Usuarios", "SELECT DNI AS DNI, Apellido AS Apellido, Nombre AS Nombre, Telefono AS Telefono, Email AS Email, CASE Estado WHEN '1' THEN 'Activo' WHEN '0' THEN 'Inactivo' END AS Estado, Clave_Usuario AS Clave_Usuario, Rol.Tipo AS ID_ROL From Usuarios INNER JOIN Rol on Usuarios.ID_ROL = Rol.ID_ROL");
            }
            public DataTable ObtenerTodosLosUsuariosMenosRoot()
            {
                AccesoDatos ad = new AccesoDatos();
                return ad.devuelveTabla("Usuarios", "SELECT DNI AS DNI, Apellido AS Apellido, Nombre AS Nombre, Sexo AS Sexo, Telefono AS Telefono, Email AS Email, CASE Estado WHEN '1' THEN 'Activo' WHEN '0' THEN 'Inactivo' END AS Estado, Contraseña AS Contraseña, Rol.IdRol AS ID_ROL From Usuarios INNER JOIN Rol on Usuarios.ID_ROL = Rol.ID_ROL AND DNI <> 1");
            }
            public bool InsertarUsuario(Usuario usu)
            {
                AccesoDatos datos = new AccesoDatos();
                SqlCommand comando = new SqlCommand();
                int cantFilasAfectadas;
                bool estado;

                SqlParameter SqlParametros = new SqlParameter();
                SqlParametros = comando.Parameters.Add("@DNIUSU", SqlDbType.VarChar, 15);
                SqlParametros.Value = usu.DNI;
                SqlParametros = comando.Parameters.Add("@APELLIDOUSU", SqlDbType.VarChar, 30);
                SqlParametros.Value = usu.Apellido;
                SqlParametros = comando.Parameters.Add("@NOMBREUSU", SqlDbType.VarChar, 30);
                SqlParametros.Value = usu.Nombre;
                SqlParametros = comando.Parameters.Add("@TELEFONOUSU", SqlDbType.VarChar, 20);
                SqlParametros.Value = usu.Telefono;
                SqlParametros = comando.Parameters.Add("@CONTRASEÑA", SqlDbType.VarChar, 15);
                SqlParametros.Value = usu.Contraseña;
                SqlParametros = comando.Parameters.Add("@ROL", SqlDbType.VarChar, 1);
                SqlParametros.Value = usu.Rol;

            cantFilasAfectadas = datos.EjecutarProcedimientoAlmacenado(comando, "AltaUsuario");

                if (cantFilasAfectadas == 1)
                    estado = true;
                else
                    estado = false;

                return estado;
            }

            public bool ModificarUsuario(Usuario usu)
            {
                AccesoDatos datos = new AccesoDatos();
                SqlCommand comando = new SqlCommand();
                int cantFilasAfectadas;
                bool estado;

                SqlParameter SqlParametros = new SqlParameter();
                SqlParametros = comando.Parameters.Add("@DNIUSU", SqlDbType.VarChar, 15);
                SqlParametros.Value = usu.DNI;
                SqlParametros = comando.Parameters.Add("@APELLIDOUSU", SqlDbType.VarChar, 30);
                SqlParametros.Value = usu.Apellido;
                SqlParametros = comando.Parameters.Add("@NOMBREUSU", SqlDbType.VarChar, 30);
                SqlParametros.Value = usu.Nombre;
                SqlParametros = comando.Parameters.Add("@TELEFONOUSU", SqlDbType.VarChar, 20);
                SqlParametros.Value = usu.Telefono;
                SqlParametros = comando.Parameters.Add("@CONTRASEÑA", SqlDbType.VarChar, 15);
                SqlParametros.Value = usu.Contraseña;
                SqlParametros = comando.Parameters.Add("@ROL", SqlDbType.Char, 1);
                SqlParametros.Value = usu.Rol;

                cantFilasAfectadas = datos.EjecutarProcedimientoAlmacenado(comando, "ModificarUsuario");

                if (cantFilasAfectadas == 1)
                    estado = true;
                else
                    estado = false;

                return estado;
            }

            public bool EliminarUsuario(Usuario usu)
            {
                AccesoDatos datos = new AccesoDatos();
                SqlParameter SqlParametros = new SqlParameter();
                SqlCommand comando = new SqlCommand();
                int cantFilasAfectadas;
                bool estado;

                SqlParametros = comando.Parameters.Add("@DNIUSU", SqlDbType.VarChar, 9);
                SqlParametros.Value = usu.DNI;

                cantFilasAfectadas = datos.EjecutarProcedimientoAlmacenado(comando, "BajaLogicaUsuario");

                if (cantFilasAfectadas == 1)
                    estado = true;
                else
                    estado = false;

                return estado;
            }

            public bool ExisteUsuario(Usuario usu)
            {
                AccesoDatos datos = new AccesoDatos();
                SqlParameter SqlParametros = new SqlParameter();
                SqlCommand comando = new SqlCommand();
                int cantFilasAfectadas;
                bool estado;

                SqlParametros = comando.Parameters.Add("@DNIUSU", SqlDbType.VarChar, 15);
                SqlParametros.Value = usu.DNI;
                SqlParametros = comando.Parameters.Add("@CONTRASEÑA", SqlDbType.VarChar, 15);
                SqlParametros.Value = usu.Contraseña;

                cantFilasAfectadas = datos.EjecutarProcedimientoAlmacenado(comando, "ExisteUsuario");

                if (cantFilasAfectadas == 1)
                    estado = true;
                else
                    estado = false;

                return estado;
            }
            public bool CuentaActivada(Usuario usu)
            {
                AccesoDatos datos = new AccesoDatos();
                SqlParameter SqlParametros = new SqlParameter();
                SqlCommand comando = new SqlCommand();
                int cantFilasAfectadas;
                bool estado;

                SqlParametros = comando.Parameters.Add("@DNIUSU", SqlDbType.VarChar, 9);
                SqlParametros.Value = usu.DNI;

                cantFilasAfectadas = datos.EjecutarProcedimientoAlmacenado2(comando, "CuentaActivada");

                if (cantFilasAfectadas == 1)
                    estado = true;
                else
                    estado = false;

                return estado;
            }

            public bool DNIRegistrado(Usuario usu)
            {
                AccesoDatos datos = new AccesoDatos();
                SqlParameter SqlParametros = new SqlParameter();
                SqlCommand comando = new SqlCommand();
                int cantFilasAfectadas;
                bool estado;

                SqlParametros = comando.Parameters.Add("@DNIUSU", SqlDbType.VarChar, 9);
                SqlParametros.Value = usu.DNI;

                cantFilasAfectadas = datos.EjecutarProcedimientoAlmacenado2(comando, "DNIRegistrado");

                if (cantFilasAfectadas == 1)
                    estado = true;
                else
                    estado = false;

                return estado;
            }

            public bool RolUsuario(Usuario usu)
            {
                AccesoDatos datos = new AccesoDatos();
                SqlParameter SqlParametros = new SqlParameter();
                SqlCommand comando = new SqlCommand();
                int cantFilasAfectadas;
                bool estado;

                SqlParametros = comando.Parameters.Add("@DNIUSU", SqlDbType.VarChar, 9);
                SqlParametros.Value = usu.DNI;

                cantFilasAfectadas = datos.EjecutarProcedimientoAlmacenado2(comando, "RolUsuario");

                if (cantFilasAfectadas == 1)
                    estado = true;
                else
                    estado = false;

                return estado;
            }
            public DataTable ObtenerNombreUsuario(Usuario usu)
            {
                AccesoDatos ad = new AccesoDatos();
                return ad.devuelveTabla("Usuarios", "SELECT NOMBRE_USU from Usuarios WHERE DNI_USU = " + usu.DNI);
            }

            public DataTable ObtenerDNIUsuario(Usuario usu)
            {
                AccesoDatos ad = new AccesoDatos();
                return ad.devuelveTabla("Usuarios", "SELECT DNI_USU from Usuarios WHERE NOMBRE_USU = '" + usu.Nombre + "'");
            }
        }
    }
