using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using WSventas.Models;

namespace WebApiMVC.Controllers
{
    public class HomeController : Controller
    {
        public async Task<ActionResult> Index()
        {
            string URLServClient = "https://localhost:44314/api/Consulta?TipoConsulta=1";
            ///definimos aceptar el certificado del servicio local

            ServicePointManager.ServerCertificateValidationCallback = delegate (object s, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors) { return true; };
            var httpClient = new HttpClient();
            var Json = await httpClient.GetStringAsync(URLServClient);
            List<CL_OF_Prd_Consult> ClientList = JsonConvert.DeserializeObject<List<CL_OF_Prd_Consult>>(Json);


            return View(ClientList);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}