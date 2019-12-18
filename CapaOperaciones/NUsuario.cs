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
    }
}
