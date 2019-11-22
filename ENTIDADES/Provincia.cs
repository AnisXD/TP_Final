using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    class Provincia
    {
            protected string IdProvincia;
            protected string NProvincia;

            public Provincia (String pIdProvincia, String pProvincia)
            {
                this.IdProvincia = pIdProvincia;
                this.NProvincia = pProvincia;

            }

            public string pIdProvincia
            {
                get { return IdProvincia; }
                set { IdProvincia = value; }
            }

            public string pProvincia
            {
                get { return NProvincia; }
                set { NProvincia = value; }
            }
    }
 }

