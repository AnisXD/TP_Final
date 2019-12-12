using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    class Rol
    {
        #region
        protected string _idrol;
        protected string _rol;
        #endregion

            #region Constructor

            public Rol()
            {
                this.idrol = string.Empty;
                this.rol = string.Empty;
            }
            public Rol(string IDROL, string ROL)
            {
                this.idrol = IDROL;
                this.rol = ROL;
            }
            #endregion


            #region Gets y Sets
            public string idrol
            {
                get { return _idrol; }
                set { _idrol = value; }
            }

            public string rol
            {
                get { return _rol; }
                set { _rol = value; }
            }
            #endregion
        }

    }
