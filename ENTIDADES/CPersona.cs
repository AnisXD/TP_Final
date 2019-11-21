using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ENTIDADES
{
    public class CPersona
    {
        public CPersona(String DNI, String Nombre, String Apellido, String Direccion, String telefono)
        {
            this.DNI = DNI;
            this.Nombre = Nombre;
            this.Apellido = Apellido;
            this.Direccion = Direccion;
            this.Telefono = telefono;
        }

        public string DNI
        {
            get { return DNI; }
            set { DNI = value; }
        }

        public string Nombre
        {
            get { return Nombre; }
            set { Nombre = value; }
        }

        public string Apellido
        {
            get { return Apellido; }
            set { Apellido = value; }
        }

        public string Direccion
        {
            get { return Direccion; }
            set { Direccion = value; }
        }

        public string Telefono
        {
            get { return Telefono; }
            set { Telefono = value; }
        }
    }
}

