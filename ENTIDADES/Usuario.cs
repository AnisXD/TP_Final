using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    public class Usuario
    {
        #region Propiedades
        private string _DNI;
        private string _Nombre;
        private string _Apellido;
        private int _id_provincia;
        private int _id_localidad;
        private string _calle_y_altura;
        private string _Telefono;
        private bool _Estado;
        private string _Contraseña;
        private char _Rol;
        #endregion

        #region Constructores
        public Usuario()
        {
            this.DNI = string.Empty;
            this.Nombre = string.Empty;
            this.Apellido = string.Empty;
            //this.Direccion = new Domicilio();
            IdProvincia = 0;
            IdLocalidad = 0;
            Calle_y_Altura = string.Empty;
            this.Telefono = string.Empty;
            this.Contraseña = string.Empty;
            this.Rol = ' ';
            this.Estado = true; 
        }

        public Usuario(string dni, string nombre, string apellido, string telefono, int Id_Provincia, int Id_Localidad, string Calle_y_Altura, string contraseña, char rol, bool estado)
        {
            this.DNI = dni;
            this.Nombre = nombre;
            this.Apellido = apellido;
            this.Telefono = telefono;
            //this.Direccion = direccion;
            this.IdProvincia = Id_Provincia;
            this.IdLocalidad = Id_Localidad;
            this.Calle_y_Altura = Calle_y_Altura;
            this.Contraseña = contraseña;
            this.Rol = rol;
            this.Estado = estado;
        }

        #endregion

        #region Sets y Gets
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
        public int IdProvincia
        {
            get { return _id_provincia; }
            set { _id_provincia = value; }
        }
        public int IdLocalidad
        {
            get { return _id_localidad; }
            set { _id_localidad = value; }
        }
        public string Calle_y_Altura
        {
            get { return _calle_y_altura; }
            set { _calle_y_altura = value; }
        }
        public string Telefono
        {
            get { return _Telefono; }
            set { _Telefono = value; }
        }
        public string Contraseña
        {
            get => _Contraseña;
            set => _Contraseña = value;
        }

        public char Rol
        {
            get => _Rol;
            set => _Rol = value;
        }
        public bool Estado
        {
            get { return _Estado; }
            set { _Estado = value; }
        }

        //public Domicilio Direccion
        //{ 
        //    get => _Direccion; 
        //    set => _Direccion = value; 
        //}


        #endregion
    }
}
