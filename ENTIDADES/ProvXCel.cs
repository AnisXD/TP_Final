using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    class ProvXCel
    {
        #region Propiedades
        private string _idprov;
        private string _idmod;
        private bool _estado;
        #endregion

        #region Constructores
        public ProvXCel()
        {
            this.idprov = string.Empty;
            this.idmod = string.Empty;
            this.estado = true;
        }
        public ProvXCel(string IDPROV, string IDMOD, bool ESTADO)
        {
            this.idprov = IDPROV;
            this.idmod = IDMOD;
            this.estado = ESTADO;
        }

        #endregion

        #region Sets y Gets
        public string idprov
        {
            get => _idprov;
            set => _idprov = value;
        }
        public string idmod
        {
            get => _idmod;
            set => _idmod = value;
        }
        public bool estado
        {
            get => _estado;
            set => _estado = value;
        }
        #endregion
    }
}

