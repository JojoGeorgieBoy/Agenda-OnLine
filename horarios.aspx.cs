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

namespace WebAppAgenda
{
    public partial class horarios : System.Web.UI.Page
    {
        ClassUtilitarios ObjClassUtilitarios = new ClassUtilitarios();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                _Grid.DataSource = GenerarDatatable();
                _Grid.DataBind();
                _Grid.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
            }

            ////*************** Para cuando haya que partir directamente desde esta ´página sin pasar por la página default.aspx *******************
            //Session["_paginaOrigen"] = "default.aspx";
            //Session["_input"] = "";
            //Session["_inputNoValido"] = "";


            if ((Session["_input"] == null) || (Session["_inputNoValido"] == null) || (Session["_paginaOrigen"] == null))
            {
                Session["ex_Message"] = "Tiempo de espera terminado..";
                Response.Redirect("error.aspx");
            }
            TituloPagina.Value = _paginaOrigen.InnerHtml = Session["_paginaOrigen"].ToString().Trim();
            _input.InnerText = Session["_input"].ToString().Trim();
            Session["_input"] = String.Empty;
            _inputNoValido.InnerText = Session["_inputNoValido"].ToString().Trim();
            Session["_inputNoValido"] = String.Empty;



            if (Request.Browser.IsMobileDevice)
            {
                _body.Style.Add("height", "635px");
                _card.Style.Add("margin-left", "1%");
                _card.Style.Add("margin-right", "1%");
            }
            else
            {
                _body.Style.Add("height", "515px");
                _card.Style.Add("margin-left", "15%");
                _card.Style.Add("margin-right", "15%");
            }

            Session["_paginaOrigen"] = "horarios.aspx";

        }

        //private String Agregar2Puntos(String Cadena)
        //{

        //    if (Cadena == "0")
        //        return "00:00";

        //    if (Cadena.Length < 4)
        //        Cadena = "0" + Cadena;

        //    return (Cadena.Substring(0, 2) + ":" + Cadena.Substring(2, 2));
        //}

        public DataTable GenerarDatatable()
        {

            DataTable _DataTable = new DataTable();

            try
            {
                _DataTable = ObjClassUtilitarios.GetDataSet("exec dbo.sp_s_horarios").Tables[0];
                if (_DataTable.Rows.Count > 0)
                {
                    foreach (DataRow _DataRow in _DataTable.Rows)
                    {
                        _DataRow["Inicio_AM"] = _DataRow["Inicio_AM"].ToString();
                        _DataRow["Fin_AM"] = _DataRow["Fin_AM"].ToString();
                        _DataRow["Inicio_PM"] = _DataRow["Inicio_PM"].ToString();
                        _DataRow["Fin_PM"] = _DataRow["Fin_PM"].ToString();
                    }
                }
            }

            catch (Exception _Exception)
            {
                throw (_Exception);
            }

            return _DataTable;
        }

    }
}

public class ClassJornada
{
    public String _DiaSemana { get; set; }
    public String _Inicio_AM { get; set; }
    public String _Fin_AM { get; set; }
    public String _Inicio_PM { get; set; }
    public String _Fin_PM { get; set; }
}