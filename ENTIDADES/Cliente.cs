using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    class Cliente : Persona
    {
        #region Propiedades
        private string _idcliente;
        #endregion

        #region Constructores
        public Cliente()
        {
            IdCliente = string.Empty;
        }
        public Cliente (string id_cliente)
        {
            IdCliente = id_cliente;
        }
       
        #endregion

        #region Sets y Gets
        public string IdCliente
        {
            get => _idcliente;
            set => _idcliente = value;
        }
        #endregion
    }
}
