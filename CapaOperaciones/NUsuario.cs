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
        public bool Insertar(string dni, string nombre, string apellido, string telefono, int provincia, int localidad, string direccion, string clave, char rol)
        {
            Usuario ObjUsuario = new Usuario
            {
                DNI = dni,
                Nombre = nombre,
                Apellido = apellido,
                Telefono = telefono,
                IdProvincia = provincia,
                IdLocalidad = localidad,
                Calle_y_Altura = direccion,
                Contraseña = clave,
                Rol = rol,
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
        public DataTable BuscarUsuarioPorApellido(string apellido, char ROL)
        {
            Usuario ObjUsuario = new Usuario
            {
                Apellido = apellido,
                Rol = ROL
            };

            DUsuario ObjDUsuario = new DUsuario();
            return ObjDUsuario.ObtenerUsuariosPorApellido(ObjUsuario);
        }
        public bool Eliminar(string dni, char ROL)
        {
            DUsuario Obj = new DUsuario();
            Usuario ObjUsuario = new Usuario
            {
                DNI = dni,
                Rol = ROL
            };

            DUsuario ObjDUsuario = new DUsuario();
            return Obj.EliminarCliente(ObjUsuario);
        }
        public bool Editar(string dni, string nombre, string apellido, string telefono, int provincia, int localidad, string direccion, char rol)
        {
            Usuario ObjUsuario = new Usuario
            {
                DNI = dni,
                Nombre = nombre,
                Apellido = apellido,
                Telefono = telefono,
                IdProvincia = provincia,
                IdLocalidad = localidad,
                Calle_y_Altura = direccion,
                Rol = rol,
            };
            DUsuario Obj = new DUsuario();
            return Obj.ActualizarUsuario(ObjUsuario);
        }
    }
}
