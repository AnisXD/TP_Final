using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ENTIDADES
{
    #region Propiedades
    public class Persona
    {
        protected string _DNI;
        protected string _Nombre;
        protected string _Apellido;
        protected Domicilio _Direccion;
        protected string _Telefono;
        protected bool _Estado;
        #endregion

        #region Constructor

        public Persona ()
        {
            this._DNI = string.Empty;
            this._Nombre = string.Empty;
            this._Apellido = string.Empty;
            this._Direccion = new Domicilio();
            this._Telefono = string.Empty;
            this._Estado = true;
        }
        public Persona (string dni, string nombre, string apellido, Domicilio direccion, string telefono, bool estado)
        {
            this._DNI = dni;
            this._Nombre = nombre;
            this._Apellido = apellido;
            this._Direccion = direccion; 
            this._Telefono = telefono;
            this._Estado = estado;
        }
        #endregion


        #region Gets y Sets
        public string DNI
        {
            get { return _DNI; }
            set { _DNI = value; }
        }

        public string Nombre
        {
            get { return _Nombre; }
            set { _Nombre = value; }
        }

        public string Apellido
        {
            get { return _Apellido; }
            set { _Apellido = value; }
        }

        public string Telefono
        {
            get { return _Telefono; }
            set { _Telefono = value; }
        }
        public bool Estado
        {
            get { return _Estado; }
            set { _Estado = value; }
        }

        #endregion

    }
}


