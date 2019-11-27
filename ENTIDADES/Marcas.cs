using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    #region Propiedades
    public class Marca
    {
        protected string _idmarca;
        protected string _nombremarca;
        protected bool _estado;
        #endregion

        #region Constructor

        public Marca()
        {
            this.idmarca = string.Empty;
            this.nombremarca = string.Empty;
            this.estado = true;
        }
        public Marca(string IDMARCA, string NOMBREMARCA, bool ESTADO)
        {
            this.idmarca = IDMARCA;
            this.nombremarca = NOMBREMARCA;
            this.estado = ESTADO;
        }
        #endregion


        #region Gets y Sets
        public string idmarca
        {
            get { return _idmarca; }
            set { _idmarca = value; }
        }

        public string nombremarca
        {
            get { return _nombremarca; }
            set { _nombremarca = value; }
        }

        public bool estado
        {
            get { return _estado; }
            set { _estado = value; }
        }

        #endregion

    }
}
