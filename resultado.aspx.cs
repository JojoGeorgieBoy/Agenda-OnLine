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
    public partial class resultado : System.Web.UI.Page
    {
        String _sqlUpdate = String.Empty;

        ClassUtilitarios ObjClassUtilitarios = new ClassUtilitarios();

        DataTable _DataTableParam = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Session["ex_Message"] = string.Empty;
                //Session["ex_InnerException"] = string.Empty;
                //Session["FechaSeleccionada"] = DateTime.Today.ToString("dd") + "/" + DateTime.Today.ToString("MM") + "/" + DateTime.Today.ToString("yyyy");
                //_DataTableParam = ObjClassUtilitarios.GetDataTable("exec dbo.sp_s_param");
                //ObjClassUtilitarios.CargarDropDownListSeleccionando(DropDownListDuracCitas, "exec dbo.sp_s_cita", _DataTableParam.Rows[0].ItemArray[7].ToString(), false);
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

            _inputPagina.Value = Session["_paginaOrigen"].ToString();

            ////inputNombre.Value = _DataTableParam.Rows[0].ItemArray[3].ToString();
            ////inputTelefono.Value = _DataTableParam.Rows[0].ItemArray[6].ToString();
            ////inputEmail.Value = _DataTableParam.Rows[0].ItemArray[5].ToString();

            ////inputNombre.Value = inputNombre
            ////inputTelefono.Value = inputTelefono
            ////inputEmail.Value = inputEmail

            ////Response.Redirect("WebFormLogin.aspx");

            //Session("VolverLogin") = True

            _LabelinputRut.Text = Request["inputRut"].ToString();
            _LabelDropDownListDuracCitas.Text = Request["DropDownListDuracCitas"].ToString(); 
            _LabelinputNombre.Text = Request["inputNombre"].ToString();
            _LabelinputTelefono.Text = Request["inputTelefono"].ToString();
            _LabelinputEmail.Text = Request["inputEmail"].ToString();


            _sqlUpdate = "exec dbo.sp_u_parametros ";
            _sqlUpdate += "@rut = '" + Request["inputRut"].ToString() + "', ";
            _sqlUpdate += "@nombre = '" + Request["inputNombre"].ToString() + "', ";
            _sqlUpdate += "@duracionCita = '" + Request["DropDownListDuracCitas"].ToString() + "', ";
            _sqlUpdate += "@fono = '" + Request["inputTelefono"].ToString() + "', ";
            _sqlUpdate += "@email = '" + Request["inputEmail"].ToString() + "'";

            try
            {
                //ObjClassUtilitarios.ExecuteNonQuery(_sqlUpdate);
                ////PopupMensaje("Reserva de hora lista!", ArmarMensaje());
            }
            catch (Exception ex)
            {
                Session["ex_Message"] = ex.Message;
                Session["ex_InnerException"] = ex.InnerException;
                Response.Redirect("error.aspx");
            }

            //Response.Redirect("parametros.aspx");

        }
    }
}