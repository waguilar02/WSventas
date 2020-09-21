using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WSventas.Models;


namespace WSventas.Controllers
{
    public class ConsultaController : ApiController
    {
        /// consultar pedido (id orden long)
        /// EJemplo del servicio usando  Postman GET  https://localhost:44314/api/Consulta?idVenta=1 
        public PedidoConslt Get(long idVenta) {

            PedidoConslt oPedido = new PedidoConslt();
            List<PConcepto> oLConceptos = new List<PConcepto>();
           // IEnumerable<Models.Concepto> lstC; //Lista de conceptos almacenada en memoria local
            IQueryable<Models.VentaOrden> lstP1; //Detalle de venta (consultable para cargar únicamente la venta necesaria en memoria) 
           


            using (Models.VentasRegistroEntities1 db = new Models.VentasRegistroEntities1())
            {
                db.Configuration.ProxyCreationEnabled = false;


              /// Consulta del pedido-orden en BD ///
                lstP1 = (from d in db.VentaOrden 
                        where d.id == idVenta orderby d.id select d);
              

                foreach (var oElement in lstP1) {
                    oPedido.idPedido = oElement.id;
                    oPedido.fecha = oElement.fecha;
                    oPedido.id_cliente = oElement.id_cliente;
                    oPedido.id_oficina = oElement.id_oficina;
                    oPedido.total = oElement.total;
                    oPedido.estado = oElement.estado;
                }

                //lstC = (from d in db.Concepto where d.id_venta_orden == idVenta orderby d.id_venta_orden select d).ToList();
                //Consulta de los conceptos del pedido en BD
                var lstC2 = (from Cto in db.Concepto 
                         where Cto.id_venta_orden == idVenta
                         join Pto in db.Producto
                         on Cto.id_producto equals Pto.id
                         orderby Cto.id
                         select new
                         {
                             Cto.id_producto,
                             Pto.nombre,
                             Cto.cantidad,
                             Cto.precioUnitario,
                             Cto.importe
                         }).ToList();
               
                               
                /// carga de cada uno de los conceptos correspondientes a la orden buscada
                foreach (var oElement in lstC2)
                {
                    PConcepto oConpts = new PConcepto();

                    oConpts.CodProducto = oElement.id_producto;
                    oConpts.ProdNombre = oElement.nombre;
                    oConpts.cantidad = oElement.cantidad;
                    oConpts.precioUnitario = oElement.precioUnitario;
                    oConpts.importe = oElement.importe;
                    oLConceptos.Add(oConpts);

                }

                oPedido.PConceptos = oLConceptos;
           
            }


            return oPedido;

        }

        public List<CL_OF_Prd_Consult> Get(int TipoConsulta)
        {
            List<CL_OF_Prd_Consult> oRespuesta = new List<CL_OF_Prd_Consult>();

            switch (TipoConsulta)
            {
                case 1:
                  oRespuesta =  ConsultaClientes();
                        break;
                case 2:
                   oRespuesta = ConsultaProductos();

                    break;

                case 3:
                   oRespuesta = ConsultaOficinas();
                    break;
                default:
                    break;
            }



            return oRespuesta;
        }

        /// Consultar clientes
        private List<CL_OF_Prd_Consult> ConsultaClientes()
        {
            List<CL_OF_Prd_Consult> oListCli = new List<CL_OF_Prd_Consult>();

            using (VentasRegistroEntities1 db = new VentasRegistroEntities1()) {
                             

                var ListCLi = (from Cli in db.Cliente
                               orderby Cli.id
                               select new
                               {
                                   Cli.id,
                                   Cli.nombre

                               }
                               ).ToList();

                foreach (var oElemt in ListCLi) {
                    CL_OF_Prd_Consult oCli = new CL_OF_Prd_Consult();

                    oCli.Id_CPO = oElemt.id;
                    oCli.Nom_CPO = oElemt.nombre;
                    oListCli.Add(oCli);
                
                }
            
            }

            return oListCli;

        }


        private List<CL_OF_Prd_Consult> ConsultaProductos()
        {
            List<CL_OF_Prd_Consult> oListProd = new List<CL_OF_Prd_Consult>();

            using (VentasRegistroEntities1 db = new VentasRegistroEntities1())
            {


                var ListProd = (from Prod in db.Producto
                               orderby Prod.id
                               select new
                               {
                                   Prod.id,
                                   Prod.nombre

                               }
                               ).ToList();

                foreach (var oElemt in ListProd)
                {
                    CL_OF_Prd_Consult oProd = new CL_OF_Prd_Consult();

                    oProd.Id_CPO = oElemt.id;
                    oProd.Nom_CPO = oElemt.nombre;
                    oListProd.Add(oProd);

                }

            }

            return oListProd;

        }

        
        /// consultar of venta 
        private List<CL_OF_Prd_Consult> ConsultaOficinas()
        {
            List<CL_OF_Prd_Consult> oListOfi = new List<CL_OF_Prd_Consult>();

            using (VentasRegistroEntities1 db = new VentasRegistroEntities1())
            {


                var ListOfi = (from Ofi in db.OficinaDeVenta
                                orderby Ofi.id
                                select new
                                {
                                    Ofi.id,
                                    Ofi.nombre

                                }
                               ).ToList();

                foreach (var oElemt in ListOfi)
                {
                    CL_OF_Prd_Consult oOfi = new CL_OF_Prd_Consult();

                    oOfi.Id_CPO = oElemt.id;
                    oOfi.Nom_CPO = oElemt.nombre;
                    oListOfi.Add(oOfi);

                }

            }

            return oListOfi;

        }


      



    }
}
