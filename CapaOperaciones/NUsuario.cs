using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using CapaDatos;
using ENTIDADES;

namespace CapaOperaciones
{
    public class NUsuario
    {
        public bool Insertar(string dni, string apellido, string nombre, int idprovincia, int idlocalidad, string direccion, string telefono, string clave)
        {
            //Domicilio obj = new Domicilio();
            //obj.IdProvincia = idprovincia;
            //obj.IdProvincia = idlocalidad;
            //obj.Calle_y_Altura = direccion;
            Usuario ObjUsuario = new Usuario
            {
                DNI = dni,
                Apellido = apellido,
                Nombre = nombre,
                IdLocalidad = idlocalidad,
                IdProvincia = idprovincia,
                Telefono = telefono,
                Contraseña = clave,
                Calle_y_Altura = direccion,
                Rol = 'C',
            };
            DUsuario Obj = new DUsuario();
            return Obj.AgregarUsuario(ObjUsuario);
        }

        public DataTable Mostrar()
        {
            return new DUsuario().MostrarTodosLosUsuarios();
        }

        public bool ExisteUsuario(Usuario usu)
        {
            AccesoDatos datos = new AccesoDatos();
            SqlParameter SqlParametros = new SqlParameter();
            SqlCommand comando = new SqlCommand();
            int cantFilasAfectadas;
            bool estado;

            SqlParametros = comando.Parameters.Add("@DNI", SqlDbType.VarChar, 9);
            SqlParametros.Value = usu.DNI;
            SqlParametros = comando.Parameters.Add("@Clave_Usuario", SqlDbType.VarChar, 15);
            SqlParametros.Value = usu.Clave_Usuario;

            cantFilasAfectadas = datos.EjecutarProcedimientoAlmacenado2(comando, "spExisteUsuario");

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

            SqlParametros = comando.Parameters.Add("@DNI", SqlDbType.VarChar, 9);
            SqlParametros.Value = usu.DNI;

            cantFilasAfectadas = datos.EjecutarProcedimientoAlmacenado2(comando, "spCuentaActivada");

            if (cantFilasAfectadas == 1)
                estado = true;
            else
                estado = false;

            return estado;
        }
    }
}
