using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    class Localidad
    {
            protected string IdLocalidad;
            protected string NLocalidad;

            public Localidad (String lIdLocalidad, String lNLocalidad)
            {
                this.IdLocalidad = lIdLocalidad;
                this.NLocalidad = lNLocalidad;
           
            }

            public string lIdLocalidad
            {
                get { return IdLocalidad; }
                set { IdLocalidad = value; }
            }

            public string lNLocalidad
            {
                get { return NLocalidad; }
                set { NLocalidad = value; }
            }
    }
}
