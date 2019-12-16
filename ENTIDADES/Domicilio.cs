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
        protected int _id_provincia;
        protected int _id_localidad;
        protected string _calle_y_altura;
        #endregion

        #region Constructores
        public Domicilio()
        {
            IdProvincia = 0;
            IdLocalidad = 0;
            Calle_y_Altura = string.Empty;
        }


        public Domicilio(int Id_Provincia, int Id_Localidad, string Calle_y_Altura)
        {
            this.IdProvincia = Id_Provincia;
            this.IdLocalidad = Id_Localidad;
            this.Calle_y_Altura = Calle_y_Altura;
        }
        #endregion

        #region Sets y Gets

        public int IdProvincia
        {
            get { return _id_provincia; }
            set { _id_provincia = value; }
        }
        public int IdLocalidad
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
