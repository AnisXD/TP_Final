using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ENTIDADES
{
    public class Persona
    {
        protected string DNI;
        protected string Nombre;
        protected string Apellido;
        protected Domicilio Direccion;
        protected string Telefono;

        public Persona (String cDNI, String cNombre, String cApellido, String ctelefono)
        {
            this.DNI = cDNI;
            this.Nombre = cNombre;
            this.Apellido = cApellido;
            this.Telefono = ctelefono;

        }

        public string cDNI
        {
            get { return DNI; }
            set { DNI = value; }
        }

        public string cNombre
        {
            get { return Nombre; }
            set { Nombre = value; }
        }

        public string cApellido
        {
            get { return Apellido; }
            set { Apellido = value; }
        }

        public string cTelefono
        {
            get { return Telefono; }
            set { Telefono = value; }
        }
    }
}


