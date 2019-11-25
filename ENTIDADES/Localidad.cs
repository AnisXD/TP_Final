using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    class Localidad
    {
        #region Propiedades
        protected string _id;
        protected string _nombre;


        #endregion

        #region Constructores
        public Localidad (String Id_Localidad, String Nombre_Localidad)
        {
            this.Id = Id_Localidad;
            this.Nombre = Nombre_Localidad;
        }
        #endregion

        #region Sets y Gets
        public string Id
        {
           get { return _id; }
           set { _id = value; }
        }

        public string Nombre
        {
           get { return _nombre; }
           set { _nombre = value; }
        }
        #endregion
    }
}
