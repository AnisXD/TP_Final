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
        protected Domicilio Direccion;
        protected string _Telefono;
        protected bool _Estado;
        #endregion

        #region Constructor

        public Persona ()
        {
            this.DNI = string.Empty;
            this.Nombre = string.Empty;
            this.Apellido = string.Empty;
            this.Direccion = new Domicilio();
            this.Telefono = string.Empty;
            this.Estado = true;
        }
        public Persona (string dni, string nombre, string apellido, Domicilio direccion, string telefono, bool estado)
        {
            this.DNI = dni;
            this.Nombre = nombre;
            this.Apellido = apellido;
            this.Direccion = direccion; 
            this.Telefono = telefono;
            this.Estado = estado;
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


