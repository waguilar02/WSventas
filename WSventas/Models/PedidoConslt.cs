using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WSventas.Models
{
    public class PedidoConslt
    {
        public long idPedido { get; set; }
        public DateTime fecha { get; set; }
        public int id_cliente { get; set; }
        public int id_oficina { get; set; }
        public decimal? total { get; set; }
        public int? estado { get; set; }
        public List<PConcepto>  PConceptos { get; set; }
    }


    public class PConcepto {

        public long CodProducto { get; set; }

        public string ProdNombre { get; set; }
       
        public int cantidad { get; set; }
        public decimal precioUnitario { get; set; }
        public decimal importe { get; set; }
      
    }

    public class CL_OF_Prd_Consult { 
        
        public int Id_CPO { get; set; }

        public string Nom_CPO { get; set; }
    

    }

    






}