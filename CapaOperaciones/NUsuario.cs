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
            return new DUsuario().MostrarTodos();
        }

        public DataTable BuscarPorDNI(string id)
        {
            return new DUsuario().MostrarPorId(id);
        }
        public DataTable BuscarPorRol(string rol)
        {
            return new DUsuario().MostrarPorRol(rol);
        }

        public bool ExisteUsuario(string Usuario, string Contraseña)
        {
            Usuario ObjUsuario = new Usuario
            {
                DNI = Usuario,
                Contraseña = Contraseña,
            };

            DUsuario ObjDUsuario = new DUsuario();
            return ObjDUsuario.ValidarExisteUsuario(ObjUsuario);
        }

        public DataTable RolUsuario(string Usuario)
        {
            Usuario ObjUsuario = new Usuario
            {
                DNI = Usuario
            };

            DUsuario ObjDUsuario = new DUsuario();
            return ObjDUsuario.ObtenerRolUsuario(ObjUsuario);
        }

        public DataTable NombreUsuario(string Usuario)
        {
            Usuario ObjUsuario = new Usuario
            {
                DNI = Usuario
            };

            DUsuario ObjDUsuario = new DUsuario();
            return ObjDUsuario.ObtenerNombreUsuario(ObjUsuario);
        }

        public DataTable BuscarUsuarioPorDNI(string DNI, char ROL)
        {
            Usuario ObjUsuario = new Usuario
            {
                DNI = DNI,
                Rol = ROL
            };

            DUsuario ObjDUsuario = new DUsuario();
            return ObjDUsuario.ObtenerUsuariosPorDNI(ObjUsuario);
        }
    }
}
