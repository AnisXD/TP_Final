using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
        #region Propiedades
        public class FormaEnvio
        {
            private string _idformaenvio;
            private string _formaenvio;
            private bool _estado;
            #endregion

            #region Constructor

            public FormaEnvio()
            {
                this.idformaenvio = string.Empty;
                this.formaenvio = string.Empty;
                this.estado = true;
            }
            public FormaEnvio(string IDFORMAENVIO, string FORMAENVIO, bool ESTADO)
            {
                this.idformaenvio = IDFORMAENVIO;
                this.formaenvio = FORMAENVIO;
                this.estado = ESTADO;
            }
            #endregion


            #region Gets y Sets
            public string idformaenvio
            {
                get { return _idformaenvio; }
                set { _idformaenvio = value; }
            }

            public string formaenvio
            {
                get { return _formaenvio; }
                set { _formaenvio = value; }
            }

            public bool estado
            {
                get { return _estado; }
                set { _estado = value; }
            }

            #endregion

        }
    
}
