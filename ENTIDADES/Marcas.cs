using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    
    public class Marca
    {

        #region Propiedades
        private string _idmarca;
        private string _nombremarca;
        private bool _estado;
        #endregion

        #region Constructor

        public Marca()
        {
            this.idmarca = string.Empty;
            this.nombremarca = string.Empty;
            this.estado = true;
        }
        public Marca(string IDMARCA, string NOMBREMARCA)
        {
            this.idmarca = IDMARCA;
            this.nombremarca = NOMBREMARCA;
            this.estado = true;
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
