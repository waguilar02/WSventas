using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using WSventas.Models;

namespace CnsultaRestCli
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private async void button1_Click(object sender, EventArgs e)
        {
            string respuesta = await GetHttp();
            List<CL_OF_Prd_Consult> lst = JsonConvert.DeserializeObject<List<CL_OF_Prd_Consult>>(respuesta);
            dataGridView1.DataSource = lst;

        }
        private async Task<string> GetHttp()
        {

            string URLServClient = "https://localhost:44314/api/Consulta?TipoConsulta=1";
            ///definimos aceptar el certificado del servicio local

            ServicePointManager.ServerCertificateValidationCallback = delegate (object s, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors) { return true; };


            WebRequest oRequest = WebRequest.Create(URLServClient);
            WebResponse oResponse = oRequest.GetResponse();
            StreamReader sr = new StreamReader(oResponse.GetResponseStream());
            return await sr.ReadToEndAsync();

        }
    }
}
