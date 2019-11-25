using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    public class Domicilio

    {
        #region Propiedades
        protected string _id_provincia;
        protected string _id_localidad;
        protected string _calle_y_altura;
        #endregion

        #region Constructores
        public Domicilio()
        {
            IdProvincia = string.Empty;
            IdLocalidad = string.Empty;
            Calle_y_Altura = string.Empty;
        }


        public Domicilio(string Id_Provincia, string Id_Localidad, string Calle_y_Altura)
        {
            this.IdProvincia = Id_Provincia;
            this.IdLocalidad = Id_Localidad;
            this.Calle_y_Altura = Calle_y_Altura;
        }
        #endregion

        #region Sets y Gets

        public string IdProvincia
        {
            get { return _id_provincia; }
            set { _id_provincia = value; }
        }
        public string IdLocalidad
        {
            get { return _id_localidad; }
            set { _id_localidad = value; }
        }
        public string Calle_y_Altura
        {
            get { return _calle_y_altura; }
            set { _calle_y_altura = value; }
        }
        #endregion

        

       
}
}
