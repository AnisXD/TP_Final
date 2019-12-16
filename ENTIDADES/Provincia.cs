using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    public class Provincia
    {
        #region Propiedades
        protected string _id;
        protected string _nombre;
        
        
        #endregion

        #region Constructores
        public Provincia()
        {
           this.Id = string.Empty;
           this.Nombre = string.Empty;
        }
        public Provincia (String Id_Provincia, String Nombre_Provincia)
        {
           this.Id = Id_Provincia;
           this.Nombre = Nombre_Provincia;
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

