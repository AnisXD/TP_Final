using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    public class Usuario : Persona
    {
        #region Propiedades
        private string _Contraseña;
        private string _Rol;
        #endregion

        #region Constructores
        public Usuario()
        {
            this._Contraseña = string.Empty;
            this._Rol = string.Empty;
        }
        public Usuario(string contraseñaU, string rolU)
        {
            this._Contraseña = contraseñaU;
            this._Rol = rolU;
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
