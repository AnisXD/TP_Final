using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
   
    class FormaPago
    {

            #region Propiedades

            protected string _idformapago;
            protected string _formapago;
            protected bool _estado;


            #endregion

    #region Constructor

            public FormaPago()
            {
                this.idformapago = string.Empty;
                this.formapago = string.Empty;
                this.estado = true;
            }
            public FormaPago(string IDFORMAPAGO, string FORMAPAGO, bool ESTADO)
            {
                this.idformapago = IDFORMAPAGO;
                this.formapago = FORMAPAGO;
                this.estado = ESTADO;
            }
            #endregion


     #region Gets y Sets
            public string idformapago
            {
                get { return _idformapago; }
                set { _idformapago = value; }
            }

            public string formapago
            {
                get { return _formapago; }
                set { _formapago = value; }
            }

            public bool estado
            {
                get { return _estado; }
                set { _estado = value; }
            }

            #endregion

        }
  
}
