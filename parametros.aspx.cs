using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics.Eventing.Reader;
using System.Drawing;
using System.Drawing.Printing;
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
    public partial class parametros : System.Web.UI.Page
    {
        ClassUtilitarios ObjClassUtilitarios = new ClassUtilitarios();

        DataTable _DataTableParam = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {

            ////*************** Para cuando haya que partir directamente desde esta ´página sin pasar por la página default.aspx *******************
            //Session["_paginaOrigen"] = "default.aspx";
            //Session["_input"] = "";
            //Session["_inputNoValido"] = "";

            if ((Session["_input"] != null) && (Session["_inputNoValido"] != null) && (Session["_paginaOrigen"] != null))
            {
                _input.InnerText = Session["_input"].ToString().Trim();
                _inputNoValido.InnerText = Session["_inputNoValido"].ToString().Trim();
                _paginaOrigen.InnerText = Session["_paginaOrigen"].ToString().Trim();
            }
            else
            {
                Session["ex_Message"] = "Tiempo de espera terminado";
                Response.Redirect("error.aspx");
            }

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

            try
            {
                _DataTableParam = ObjClassUtilitarios.GetDataTable("exec dbo.sp_s_param");
                ObjClassUtilitarios.CargarDropDownListSeleccionando(DropDownListDuracCitas, "exec dbo.sp_s_cita", _DataTableParam.Rows[0].ItemArray[7].ToString(), false);
            }
            catch (Exception ex)
            {
                Session["ex_Message"] = ex.Message;
                Session["ex_InnerException"] = ex.InnerException;
                Response.Redirect("error.aspx");
            }

            _hiddenDropDownListDuracCitas.InnerText = _DataTableParam.Rows[0].ItemArray[7].ToString().Trim();
            _hiddenRut.InnerText = inputRut.Value = _DataTableParam.Rows[0].ItemArray[0].ToString().Trim();
            _hiddenNombre.InnerText = inputNombre.Value = _DataTableParam.Rows[0].ItemArray[3].ToString().Trim();
            _hiddenTelefono.InnerText = inputTelefono.Value = _DataTableParam.Rows[0].ItemArray[6].ToString().Trim();
            _hiddenEmail.InnerText = inputEmail.Value = _DataTableParam.Rows[0].ItemArray[5].ToString().Trim();

            //_hiddenDropDownListDuracCitas.InnerText = _DataTableParam.Rows[0].ItemArray[7].ToString().Trim() + ", largo: " + _DataTableParam.Rows[0].ItemArray[7].ToString().Trim().Length;
            //_hiddenRut.InnerText = inputRut.Value = _DataTableParam.Rows[0].ItemArray[0].ToString().Trim() + ", largo: " + _DataTableParam.Rows[0].ItemArray[0].ToString().Trim().Length;
            //_hiddenNombre.InnerText = inputNombre.Value = _DataTableParam.Rows[0].ItemArray[3].ToString().Trim() + ", largo: " + _DataTableParam.Rows[0].ItemArray[3].ToString().Trim().Length;
            //_hiddenTelefono.InnerText = inputTelefono.Value = _DataTableParam.Rows[0].ItemArray[6].ToString().Trim() + ", largo: " + _DataTableParam.Rows[0].ItemArray[6].ToString().Trim().Length;
            //_hiddenEmail.InnerText = inputEmail.Value = _DataTableParam.Rows[0].ItemArray[5].ToString().Trim() + ", largo: " + _DataTableParam.Rows[0].ItemArray[5].ToString().Trim().Length;


            //////Response.Redirect("WebFormLogin.aspx");

            ////Session("VolverLogin") = True

            Session["_paginaOrigen"] = "parametros.aspx";
            Session["_input"] = string.Empty;

        }

        protected void menssage(object sender, EventArgs e)
        {
            //TituloPagina.value = "<p>Para continuar debe chupar el pete.</p>";
            ////myModal.modal('toggle');
        }

    }
}