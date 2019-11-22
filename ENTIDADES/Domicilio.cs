using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    public class Domicilio
    {
        protected string Altura;
        protected string Calle;
        protected Localidad dLocalidad;
        protected Provincia dProvincia;

        public Domicilio (String dAltura, String dCalle)
        {
            this.Altura = dAltura;
            this.Calle = dCalle;

        }

        public string dAltura
        {
            get { return Altura; }
            set { Altura = value; }
        }

        public string dCalle
        {
            get { return Calle; }
            set { Calle = value; }
        }
   
    }
}
