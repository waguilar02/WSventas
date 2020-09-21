using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WSventas.Models;

namespace WSventas.Controllers
{
    public class RegistroController : ApiController
    {

        ///Registo pedido
        [HttpPost]
        public string Post(int cliente, int oficina)
        {

            long? resp;
            using (Models.VentasRegistroEntities1 db = new Models.VentasRegistroEntities1())
            {
                resp = db.spInsertarVenta(cliente, oficina).SingleOrDefault();

            }

            return "Registro Satisfactorio orden de compra número = " + resp;


        }
        [HttpPost]
        public string Post(long NroOrden, int NroProducto, int Cantidad)
        {

            long? resp;
            using (Models.VentasRegistroEntities1 db = new Models.VentasRegistroEntities1())
            {
                resp = db.spInsertarConcepto(NroOrden, NroProducto, Cantidad).SingleOrDefault();

            }

            return "Se registró nueva Descripción dentro de Orden Nro = " + NroOrden + " id Concepto " + resp ;


        }



    }
}
