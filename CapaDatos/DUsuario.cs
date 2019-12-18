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
        public DataTable MostrarTodosLosUsuarios()
        {
            Conexion cn = new Conexion();
            return cn.ObtenerTabla("Usuarios", "SELECT DNI_USU AS DNI, APELLIDO_USU AS Apellido, NOMBRE_USU AS Nombre, TELEFONO_USU AS Telefono, PROVINCIAS.descripcion_provincia AS PROVINCIA, LOCALIDADES.desc_localidad AS LOCALIDAD, DIRECCION_USU AS Direccion, CONTRASEÑA AS Contraseña, CASE ESTADO_USU WHEN '1' THEN 'Activo' WHEN '0' THEN 'Inactivo' END AS Estado, Rol.ROL AS Tipo_Rol From Usuarios INNER JOIN PROVINCIAS ON PROVINCIAS.cod_provincia = USUARIOS.ID_PROVINCIA_USU INNER JOIN LOCALIDADES ON LOCALIDADES.cod_localidad = USUARIOS.ID_LOCALIDAD_USU INNER JOIN ROL ON USUARIOS.ROL = ROL.ID_ROL");
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

        public bool AgregarUsuario(Usuario usuario)
        {
            SqlCommand Comando = new SqlCommand();
            ParametrosUsuario(ref Comando, usuario);
            Conexion ad = new Conexion();
            int FilasInsertadas = ad.EjecutarProcedimientoAlmacenado(Comando, "AltaUsuario");
            if (FilasInsertadas == 1)
                return true;
            else
                return false;
        }
    }
}
