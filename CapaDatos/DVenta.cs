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
    public class DVenta
    {  
        private void ParametrosVenta(ref SqlCommand Comando, Venta venta)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@IDUSUVTA", SqlDbType.VarChar, 15);
            SqlParametros.Value = venta.IdVendedor;
            SqlParametros = Comando.Parameters.Add("@IDCLIVTA", SqlDbType.VarChar, 15);
            SqlParametros.Value = venta.IdCliente;
            SqlParametros = Comando.Parameters.Add("@IDFORMAENVIOVTA", SqlDbType.Char, 1);
            SqlParametros.Value = venta.IdFormaEnvio;
            SqlParametros = Comando.Parameters.Add("@IDFORMAPAGOVTA", SqlDbType.Char, 1);
            SqlParametros.Value = venta.IdFormaPago;
            SqlParametros = Comando.Parameters.Add("@IMPORTE", SqlDbType.Float);
            SqlParametros.Value = venta.Total;

        }
        private void ParametroIdVenta(ref SqlCommand Comando, int IdVenta)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@IDVENTA", SqlDbType.Int);
            SqlParametros.Value = IdVenta;
        }

        private void ParametroFecha(ref SqlCommand Comando, DateTime Fecha)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@FECHA", SqlDbType.Date);
            SqlParametros.Value = Fecha.Date;
        }
        private void ParametroFechaInicio(ref SqlCommand Comando, DateTime FechaInicio)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@FECHAINICIO", SqlDbType.Date);
            SqlParametros.Value = FechaInicio.Date;
        }
        private void ParametroFechaFin(ref SqlCommand Comando, DateTime FechaFin)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@FECHAFIN", SqlDbType.Date);
            SqlParametros.Value = FechaFin.Date;
        }

        private void ParametroIdFormaPago(ref SqlCommand Comando, char IdFormaPago)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@IDFORMAPAGOVTA", SqlDbType.Char);
            SqlParametros.Value = IdFormaPago;
        }

        private void ParametroIdFormaEnvio(ref SqlCommand Comando, char IdFormaEnvio)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@IDFORMAENVIOVTA", SqlDbType.Char);
            SqlParametros.Value = IdFormaEnvio;
        }
        private void ParametroDniUsuario(ref SqlCommand Comando, string DniUsuario)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@DNIUSU", SqlDbType.VarChar, 15);
            SqlParametros.Value = DniUsuario;
        }
        public void ParametrosDetalle(ref SqlCommand Comando, DetallesVentas Obj)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@IDVENTA", SqlDbType.Int);
            SqlParametros.Value = ObtenerIdVenta();
            SqlParametros = Comando.Parameters.Add("@IDMODELODV", SqlDbType.VarChar, 15);
            SqlParametros.Value = Obj.IdModelo;
            SqlParametros = Comando.Parameters.Add("@CANTIDADDV", SqlDbType.Int);
            SqlParametros.Value = Obj.Cantidad;
            SqlParametros = Comando.Parameters.Add("@PUDV", SqlDbType.Float);
            SqlParametros.Value = Obj.PrecioUnitario;

        }
        
        private void ParametroIdModelo(ref SqlCommand Comando, string IdModelo)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@IDMODELOCEL", SqlDbType.VarChar, 15);
            SqlParametros.Value = IdModelo;
        }
        private void ParametroIdMarca(ref SqlCommand Comando, string IdMarca)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@IDMARCA", SqlDbType.VarChar, 15);
            SqlParametros.Value = IdMarca;
        }
        private void ParametroVentasEntreFechas(ref SqlCommand Comando, string fecha_inicio, string fecha_fin)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@FECHA_DESDE", SqlDbType.VarChar, 14);
            SqlParametros.Value = fecha_inicio;
            SqlParametros = Comando.Parameters.Add("@FECHA_HASTA", SqlDbType.VarChar, 14);
            SqlParametros.Value = fecha_fin;
        }
        public DataTable MostrarTodas()
        {
            Conexion cn = new Conexion();
            SqlCommand cmd = new SqlCommand();
            return cn.ObtenerTablaPorProcedimiento(ref cmd, "MostrarVenta");
        }

        public DataTable MostrarPorVendedor(string IdVendedor)
        {
            SqlCommand Comando = new SqlCommand();
            ParametroDniUsuario(ref Comando, IdVendedor);
            Conexion cn = new Conexion();
            DataTable TablaResultado = cn.ObtenerTablaPorProcedimiento(ref Comando, "MostrarVentasPorVendedor");
            return TablaResultado;
        }
        public DataTable MostrarPorCliente(string IdCliente)
        {
            SqlCommand Comando = new SqlCommand();
            ParametroDniUsuario(ref Comando, IdCliente);
            Conexion cn = new Conexion();
            DataTable TablaResultado = cn.ObtenerTablaPorProcedimiento(ref Comando, "MostrarVentasPorCliente");
            return TablaResultado;
        }

        public DataTable MostrarPorId(int IdVenta)
        {
            SqlCommand Comando = new SqlCommand();
            ParametroIdVenta(ref Comando, IdVenta);
            Conexion cn = new Conexion();
            DataTable TablaResultado = cn.ObtenerTablaPorProcedimiento(ref Comando, "MostrarVentaPorId");
            return TablaResultado;
        }

        public DataTable MostrarPorFormaPago(char IdFormaPago)
        {
            SqlCommand Comando = new SqlCommand();
            ParametroIdFormaPago(ref Comando, IdFormaPago);
            Conexion cn = new Conexion();
            DataTable TablaResultado = cn.ObtenerTablaPorProcedimiento(ref Comando, "MostrarVentasPorFormaDePago");
            return TablaResultado;
        }
        public DataTable MostrarPorFormaEnvio (char IdFormaEnvio)
        {
            SqlCommand Comando = new SqlCommand();
            ParametroIdFormaEnvio(ref Comando, IdFormaEnvio);
            Conexion cn = new Conexion();
            DataTable TablaResultado = cn.ObtenerTablaPorProcedimiento(ref Comando, "MostrarVentasPorFormaDeEnvio");
            return TablaResultado;
        }
        public DataTable MostrarPorFecha(DateTime Fecha)
        {
            SqlCommand Comando = new SqlCommand();
            ParametroFecha(ref Comando, Fecha);
            Conexion cn = new Conexion();
            DataTable TablaResultado = cn.ObtenerTablaPorProcedimiento(ref Comando, "MostrarVentaPorFecha");
            return TablaResultado;
        }
        public DataTable MostrarEntreFechas(DateTime FechaInicio, DateTime FechaFin)
        {
            SqlCommand Comando = new SqlCommand();
            ParametroFechaInicio(ref Comando, FechaInicio);
            ParametroFechaFin(ref Comando, FechaFin);
            Conexion cn = new Conexion();
            DataTable TablaResultado = cn.ObtenerTablaPorProcedimiento(ref Comando, "MostrarVentasEntreFechas");
            return TablaResultado;
        }


        public DataTable MostrarDetallesPorIdVta(int IdVenta)
        {
            SqlCommand Comando = new SqlCommand();
            ParametroIdVenta(ref Comando, IdVenta);
            Conexion cn = new Conexion();
            DataTable TablaResultado = cn.ObtenerTablaPorProcedimiento(ref Comando, "MostrarDetallesPorIdVenta");
            return TablaResultado;
        }

        public DataTable MostrarDetallesPorIdModelo(string IdModelo)
        {
            SqlCommand Comando = new SqlCommand();
            ParametroIdModelo(ref Comando, IdModelo);
            Conexion cn = new Conexion();
            DataTable TablaResultado = cn.ObtenerTablaPorProcedimiento(ref Comando, "MostrarDetallesPorIdModelo");
            return TablaResultado;
        }
        public DataTable MostrarDetallePorIdMarca(string IdMarca)
        {
            SqlCommand Comando = new SqlCommand();
            ParametroIdMarca(ref Comando, IdMarca);
            Conexion cn = new Conexion();
            DataTable TablaResultado = cn.ObtenerTablaPorProcedimiento(ref Comando, "MostrarDetallesPorIdMarca");
            return TablaResultado;
        }
        public int ObtenerIdVenta()
        {
            int IdVenta;
            Conexion cn = new Conexion();
            SqlCommand cmd = new SqlCommand();
            string Consulta = "SELECT MAX(ID_VTA) FROM VENTAS";
            DataTable Resultado = cn.ObtenerTablaPorConsultaSQL(Consulta);
            IdVenta = Convert.ToInt32(Resultado.Rows[0].ItemArray[0]);
            return IdVenta;
        }
        public bool AgregarVentaConDetalles(Venta Vta, List <DetallesVentas> Detalles)
        {
            SqlCommand Comando = new SqlCommand();
            ParametrosVenta(ref Comando, Vta);
            Conexion cn = new Conexion();
            int FilasInsertadas = cn.EjecutarProcedimientoDeABM(Comando, "AltaVenta");
            //chequeo si se inserto bien la venta
            if (FilasInsertadas == 1)
            {
                foreach (DetallesVentas Item in Detalles)
                {
                    SqlCommand ComandoD = new SqlCommand();
                    ParametrosDetalle(ref Comando, Item);
                    FilasInsertadas = cn.EjecutarProcedimientoDeABM(Comando, "AltaDetalleVenta");
                    if(FilasInsertadas!=1)
                    {
                        return false;//falla en cargar detalle
                    }
                }
                return true;//Carga venta y detalles con exito
            }   
            else
            {
                return false;//fallo en cargar venta
            }
                
        }

        private void ParametroDniUsuarioEntreFechas(ref SqlCommand Comando, string DniUsuario, string fecha_inicio, string fecha_fin)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@DNIUSU", SqlDbType.VarChar, 15);
            SqlParametros.Value = DniUsuario;
            SqlParametros = Comando.Parameters.Add("@FECHA_DESDE", SqlDbType.VarChar, 14);
            SqlParametros.Value = fecha_inicio;
            SqlParametros = Comando.Parameters.Add("@FECHA_HASTA", SqlDbType.VarChar, 14);
            SqlParametros.Value = fecha_fin;
        }
        public DataTable MostrarVentasPorVendedorEntreFechas(string IdVendedor, string fecha_inicio, string fecha_fin)
        {
            SqlCommand Comando = new SqlCommand();
            ParametroDniUsuarioEntreFechas(ref Comando, IdVendedor, fecha_inicio, fecha_fin);
            Conexion cn = new Conexion();
            DataTable TablaResultado = cn.ObtenerTablaPorProcedimiento(ref Comando, "sp_MostrarVentasPorVendedorEntreFechas");
            return TablaResultado;
        }
        public DataTable MostrarVentasPorClienteEntreFechas(string IdCliente, string fecha_inicio, string fecha_fin)
        {
            SqlCommand Comando = new SqlCommand();
            ParametroDniUsuarioEntreFechas(ref Comando, IdCliente, fecha_inicio, fecha_fin);
            Conexion cn = new Conexion();
            DataTable TablaResultado = cn.ObtenerTablaPorProcedimiento(ref Comando, "sp_MostrarVentasPorClienteEntreFechas");
            return TablaResultado;
        }
        private void ParametroIdModeloEntreFechas(ref SqlCommand Comando, string IdModelo, string fecha_inicio, string fecha_fin)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@IDMODELOCEL", SqlDbType.VarChar, 15);
            SqlParametros.Value = IdModelo;
            SqlParametros = Comando.Parameters.Add("@FECHA_DESDE", SqlDbType.VarChar, 14);
            SqlParametros.Value = fecha_inicio;
            SqlParametros = Comando.Parameters.Add("@FECHA_HASTA", SqlDbType.VarChar, 14);
            SqlParametros.Value = fecha_fin;
        }
        public DataTable MostrarDetallesPorIdModeloEntreFechas(string IdModelo, string fecha_inicio, string fecha_fin)
        {
            SqlCommand Comando = new SqlCommand();
            ParametroIdModeloEntreFechas(ref Comando, IdModelo, fecha_inicio, fecha_fin);
            Conexion cn = new Conexion();
            DataTable TablaResultado = cn.ObtenerTablaPorProcedimiento(ref Comando, "sp_MostrarDetallesPorIdModeloEntreFechas");
            return TablaResultado;
        }
        private void ParametroIdMarcaEntreFechas(ref SqlCommand Comando, string IdMarca, string fecha_inicio, string fecha_fin)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@IDMARCA", SqlDbType.VarChar, 15);
            SqlParametros.Value = IdMarca;
            SqlParametros = Comando.Parameters.Add("@FECHA_DESDE", SqlDbType.VarChar, 14);
            SqlParametros.Value = fecha_inicio;
            SqlParametros = Comando.Parameters.Add("@FECHA_HASTA", SqlDbType.VarChar, 14);
            SqlParametros.Value = fecha_fin;
        }
        public DataTable MostrarDetallesPorIdMarcaEntreFechas(string IdMarca, string fecha_inicio, string fecha_fin)
        {
            SqlCommand Comando = new SqlCommand();
            ParametroIdMarcaEntreFechas(ref Comando, IdMarca, fecha_inicio, fecha_fin);
            Conexion cn = new Conexion();
            DataTable TablaResultado = cn.ObtenerTablaPorProcedimiento(ref Comando, "sp_MostrarDetallesPorIdMarcaEntreFechas");
            return TablaResultado;
        }
        public DataTable MostrarVentasEntreFechas(string fecha_inicio, string fecha_fin)
        {
            SqlCommand Comando = new SqlCommand();
            ParametroVentasEntreFechas(ref Comando, fecha_inicio, fecha_fin);
            Conexion cn = new Conexion();
            DataTable TablaResultado = cn.ObtenerTablaPorProcedimiento(ref Comando, "MostrarVentasEntreFechas");
            return TablaResultado;
        }
    }
}
