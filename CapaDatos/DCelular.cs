using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using ENTIDADES;

namespace CapaDatos
{
    public class DCelular
    {
        private void ParametrosCelular(ref SqlCommand Comando, Celular celular)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@IDMODELOCEL", SqlDbType.VarChar, 15);
            SqlParametros.Value = celular.IdModelo;
            SqlParametros = Comando.Parameters.Add("@IDMARCACEL", SqlDbType.VarChar, 15);
            SqlParametros.Value = celular.IdMarca;
            SqlParametros = Comando.Parameters.Add("@PRECIOUNITARIOCEL", SqlDbType.Float);
            SqlParametros.Value = celular.PrecioUnitario;
            SqlParametros = Comando.Parameters.Add("@STOCKCEL", SqlDbType.Int);
            SqlParametros.Value = celular.Stock;
            SqlParametros = Comando.Parameters.Add("@DESCRIPCIONCEL", SqlDbType.VarChar, 100);
            SqlParametros.Value = celular.Descripcion;
            SqlParametros = Comando.Parameters.Add("@UBICACIONIMAGENCEL", SqlDbType.VarChar, 100);
            SqlParametros.Value = celular.UbicacionImagen;
        }
        private void ParametroIdMarca(ref SqlCommand Comando, string IdMarca)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@IDMARCA", SqlDbType.VarChar, 15);
            SqlParametros.Value = IdMarca;
        }
        private void ParametroIdModeloCel(ref SqlCommand Comando, string IdModelo)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@IDMODELOCEL", SqlDbType.VarChar, 15);
            SqlParametros.Value = IdModelo;
        }
        
        public DataTable MostrarTodos()
        {
            Conexion cn = new Conexion();
            SqlCommand cmd = new SqlCommand();
            return cn.ObtenerTablaPorProcedimiento(ref cmd, "MostrarCelulares");
        }
        public DataTable MostrarPorMarca(string idmarca)
        {
            SqlCommand Comando = new SqlCommand();
            ParametroIdMarca(ref Comando, idmarca);
            Conexion cn = new Conexion();
            DataTable TablaResultado = cn.ObtenerTablaPorProcedimiento(ref Comando, "MostrarCelularesPorIdMarca");
            return TablaResultado;
        }
        public DataTable MostrarPorModelo(string idmodelo)
        {
            SqlCommand Comando = new SqlCommand();
            ParametroIdModeloCel(ref Comando, idmodelo);
            Conexion cn = new Conexion();
            DataTable TablaResultado = cn.ObtenerTablaPorProcedimiento(ref Comando, "MostrarCelularesPorIdModelo");
            return TablaResultado;
        }
        public DataTable MostrarPorFiltro(string Filtro)
        {
            Conexion cn = new Conexion();
            SqlCommand cmd = new SqlCommand();
            string Consulta = "SELECT ID_MODELO as Modelo, " +
                                     "NOMBRE_MARCA as Marca, " +
                                     "DESCRIPCION_CEL as Descripcion, " +
                                     "STOCK_CEL as Stock, " +
                                     "PRECIO_UNITARIO_CEL as Precio," +
                                     "UBICACION_IMAGEN_CEL as Imagen " +
                                     "FROM CELULARES inner join MARCAS on(ID_MARCA_CEL= ID_MARCA)"+
                                     Filtro;
            return cn.ObtenerTablaPorConsultaSQL(Consulta);
        }
        public bool AgregarCelular(Celular celular)
        {
            SqlCommand Comando = new SqlCommand();
            ParametrosCelular(ref Comando, celular);
            Conexion cn = new Conexion();
            int FilasInsertadas = cn.EjecutarProcedimientoDeABM(Comando, "AltaCelular");
            if (FilasInsertadas == 1)
                return true;
            else
                return false;
        }
        public bool ActualizarCelular(Celular celular)
        {
            SqlCommand Comando = new SqlCommand();
            ParametrosCelular(ref Comando, celular);
            Conexion ad = new Conexion();
            int FilasInsertadas = ad.EjecutarProcedimientoDeABM(Comando, "ModificarCelular");
            if (FilasInsertadas == 1)
                return true;
            else
                return false;
        }
        public bool EliminarCelular(string modelocelular)
        {
            SqlCommand Comando = new SqlCommand();
            ParametroIdModeloCel(ref Comando, modelocelular);
            Conexion ad = new Conexion();
            int FilasInsertadas = ad.EjecutarProcedimientoDeABM(Comando, "BajaLogicaCelular");
            if (FilasInsertadas == 1)
                return true;
            else
                return false;
        }

        public void FiltroAvanzado(string NombreCampo, string Operador, string Valor, ref string Clausula)
        {
            string d1 = "";  //Delimitador 1
            string d2 = ""; //Delimitador 2
            if (Clausula == "")
                Clausula = Clausula + " WHERE ";
            else
                Clausula = Clausula + " AND ";
            switch (Operador)
            {
                case "Igual a:"://para comparar precio
                    d1 = " = ";
                    d2 = "";
                    break;
                case "Mayor a:"://para comparar precio
                    d1 = " > ";
                    d2 = "";
                    break;
                case "Menor a:"://para comparar precio
                    d1 = " < ";
                    d2 = "";
                    break;
                case "Es igual a:"://para comparar Marca y Modelo
                    d1 = " ='";
                    d2 = "'";
                    break;

            }
            Clausula =
                Clausula + NombreCampo + d1 + Valor + d2;
        }

    }
}
