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
            Usuarios ObjUsuario = new Usuarios
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
            DUsuario ObjDUsuario = new DUsuario();
            return ObjDUsuario.MostrarPorId(id);
            //return new DUsuario().MostrarPorId(id);
        }
        public DataTable BuscarPorRol(string rol)
        {
            return new DUsuario().MostrarPorRol(rol);
        }

        public bool ExisteUsuario(string Usuario, string Contraseña)
        {
            Usuarios ObjUsuario = new Usuarios
            {
                DNI = Usuario,
                Contraseña = Contraseña,
            };

            DUsuario ObjDUsuario = new DUsuario();
            return ObjDUsuario.ValidarExisteUsuario(ObjUsuario);
        }

        public DataTable RolUsuario(string Usuario)
        {
            Usuarios ObjUsuario = new Usuarios
            {
                DNI = Usuario
            };

            DUsuario ObjDUsuario = new DUsuario();
            return ObjDUsuario.ObtenerRolUsuario(ObjUsuario);
        }

        public DataTable NombreUsuario(string Usuario)
        {
            Usuarios ObjUsuario = new Usuarios
            {
                DNI = Usuario
            };

            DUsuario ObjDUsuario = new DUsuario();
            return ObjDUsuario.ObtenerNombreUsuario(ObjUsuario);
        }

        public DataTable BuscarUsuarioPorDNI(string DNI, char ROL)
        {
            Usuarios ObjUsuario = new Usuarios
            {
                DNI = DNI,
                Rol = ROL
            };

            DUsuario ObjDUsuario = new DUsuario();
            return ObjDUsuario.ObtenerUsuariosPorDNI(ObjUsuario);
        }
        public DataTable BuscarUsuarioPorApellido(string apellido, char ROL)
        {
            Usuarios ObjUsuario = new Usuarios
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
            Usuarios ObjUsuario = new Usuarios
            {
                DNI = dni,
                Rol = ROL
            };

            DUsuario ObjDUsuario = new DUsuario();
            return Obj.EliminarCliente(ObjUsuario);
        }
        public bool Editar(string dni, string nombre, string apellido, string telefono, int provincia, int localidad, string direccion, char rol)
        {
            Usuarios ObjUsuario = new Usuarios
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
        public bool EditarC(string dni, string nombre, string apellido, string telefono, int provincia, int localidad, string direccion, string clave, char rol)
        {
            Usuarios ObjUsuario = new Usuarios
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
            return Obj.ActualizarUsuarioC(ObjUsuario);
        }
        public DataTable DatosUsuario(string Usuario)
        {
            Usuarios ObjUsuario = new Usuarios
            {
                DNI = Usuario
            };

            DUsuario ObjDUsuario = new DUsuario();
            return ObjDUsuario.ObtenerDatosUsuario(ObjUsuario);
        }

        public DataTable TEST(string Usuario)
        {
            Usuarios ObjUsuario = new Usuarios
            {
                DNI = Usuario
            };

            DUsuario ObjDUsuario = new DUsuario();
            return ObjDUsuario.ObtenerTEST(ObjUsuario);
        }

        public bool EditarTEST(string dni, string nombre)
        {
            Usuarios ObjUsuario = new Usuarios
            {
                DNI = dni,
                Nombre = nombre,
            };
            DUsuario Obj = new DUsuario();
            return Obj.ActualizarTEST(ObjUsuario);
        }
    }
}
