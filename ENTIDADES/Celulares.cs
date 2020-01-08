using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
       public class Celular
        {
        #region Propiedades
            private string _IdModelo;
            private string _IdMarca;
            private string _Descripcion;
            private int _Stock;
            private float _PrecioUnitario;
            private string _UbicacionImagen;
        
            #endregion

            #region Constructores
            public Celular()
            {
                this.IdModelo = string.Empty;
                this.IdMarca = string.Empty;
                this.Descripcion = string.Empty;
                this.Stock = 0;
                this.PrecioUnitario = 0;
                this.UbicacionImagen = string.Empty;
            }
            public Celular (string IDMODELO, string IDMARCA,string DESCRIPCION,int STOCK,float PRECIOUNITARIO, string UBICACIONIMAGEN)
            {
                this.IdModelo = IDMODELO;
                this.IdMarca = IDMARCA;
                this.Descripcion = DESCRIPCION;
                this.Stock = STOCK;
                this.PrecioUnitario = PRECIOUNITARIO;
                this.UbicacionImagen = UBICACIONIMAGEN;

             }

            #endregion

            #region Sets y Gets
            
            public string IdModelo { get => _IdModelo; set => _IdModelo = value; }
            public string IdMarca { get => _IdMarca; set => _IdMarca = value; }
            public string Descripcion { get => _Descripcion; set => _Descripcion = value; }
            public int Stock { get => _Stock; set => _Stock = value; }
            public float PrecioUnitario { get => _PrecioUnitario; set => _PrecioUnitario = value; }
            public string UbicacionImagen { get => _UbicacionImagen; set => _UbicacionImagen = value; }
        #endregion
    }
    
}
