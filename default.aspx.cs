using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics.Eventing.Reader;
using System.Drawing;
using System.Globalization;
using System.Threading;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using WebAppAgenda;
using static System.Net.Mime.MediaTypeNames;

namespace WebAppAgenda
{
    public partial class _default : System.Web.UI.Page
    {
        ClassUtilitarios ObjClassUtilitarios = new ClassUtilitarios();

        DataTable _DataTableParam = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.Browser.IsMobileDevice)
            {
                _Iframe.Style.Add("height", "635px");
            }
            else
            {
                _Iframe.Style.Add("height", "515px");
            }

            _Iframe.Attributes.Add("src", "reservas.aspx");


            Session["FechaSeleccionada"] = DateTime.Today.ToString("dd") + "/" + DateTime.Today.ToString("MM") + "/" + DateTime.Today.ToString("yyyy");
            Session["_diaSemanaSeleccionado"] = String.Empty;
            Session["_TipoOperacion"] = string.Empty;
            Session["ex_Message"] = string.Empty;
            Session["ex_InnerException"] = string.Empty;
            Session["_input"] = string.Empty;
            Session["_inputNoValido"] = string.Empty;
            Session["_paginaOrigen"] = "_default";
            Session["_inputValido"] = string.Empty;

            try
            {
                _DataTableParam = ObjClassUtilitarios.GetDataTable("exec dbo.sp_s_param");
                if (_DataTableParam != null)
                _spanEmpresa.InnerHtml = _DataTableParam.Rows[0].ItemArray[3].ToString();
            }
            catch (Exception ex)
            {
                Session["ex_Message"] = ex.Message;
                Session["ex_InnerException"] = ex.InnerException;
                Response.Redirect("error.aspx");
            }

        }
    }
}