using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    class Usuario : Persona
    {
        #region Propiedades
        private string _Contraseña;
        private string _Rol;
        #endregion

        #region Constructores
        public Usuario()
        {
            this.Contraseña = string.Empty;
            this.Rol = string.Empty;
        }
        public Usuario(string contraseñaU, string rolU)
        {
            this.Contraseña = contraseñaU;
            this.Rol = rolU;
        }

        #endregion

        #region Sets y Gets
        public string Contraseña
        {
            get => _Contraseña;
            set => _Contraseña = value;
        }

        public string Rol
        {
            get => _Rol;
            set => _Rol = value;
        }
        #endregion
    }
}
