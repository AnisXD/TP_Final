using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    class Empleado:Persona
    {
        #region Propiedades
        private string _legajo;
        #endregion

        #region Constructores
        public Empleado()
        {
            this.Legajo = string.Empty;
        }
        public Empleado(string legajo)
        {
            this.Legajo = legajo;
        }

        #endregion

        #region Sets y Gets
        public string Legajo
        {
            get => _legajo;
            set => _legajo = value;
        }
        #endregion
    }
}
