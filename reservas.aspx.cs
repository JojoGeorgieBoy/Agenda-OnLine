using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics.Eventing.Reader;
using System.Drawing;
using System.Drawing.Printing;
using System.Globalization;
using System.Reflection.Emit;
using System.Threading;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using WebAppAgenda;
//using static System.Net.Mime.MediaTypeNames;

namespace WebAppAgenda
{

    public partial class reservas : System.Web.UI.Page
    {
        String _sqlSelect = String.Empty;

        ClassUtilitarios ObjClassUtilitarios = new ClassUtilitarios();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["ex_Message"] = string.Empty;
                Session["ex_InnerException"] = string.Empty;
                _labelDate.InnerText = ObjClassUtilitarios.DayOfWeekSpanish(DateTime.Today.DayOfWeek.ToString()) + ", " + DateTime.Today.ToString("dd") + "/" + DateTime.Today.ToString("MM") + "/" + DateTime.Today.ToString("yyyy");

                _sqlSelect = "exec dbo.sp_s_reservasFiltradoFecha ";
                _sqlSelect += "@fecha = '" + DateTime.Today.ToString("yyyyMMdd") + "'";

                _GridReservado.DataSource = ObjClassUtilitarios.GetDataTable(_sqlSelect);
                _GridReservado.DataBind();
                _GridReservado.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;

                _sqlSelect = "exec dbo.sp_s_horariosFiltradoDiaSemana ";
                _sqlSelect += "@diaSemana = '" + ObjClassUtilitarios.DayOfWeekSpanish(DateTime.Today.DayOfWeek.ToString()) + "'";

                PoblarGrilla(_sqlSelect);

            }
            else
            {
                //_sqlSelect = "exec dbo.sp_s_agendaFiltradoFecha ";
                //_sqlSelect += "@fecha = '" + Calendario.SelectedDate.ToString("yyyyMMdd") + "'";
                //_Grid.DataSource = ObjClassUtilitarios.GetDataSet(_sqlSelect);
                //_Grid.DataBind();
                //_Grid.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
            }
            //if (Request.Browser.IsMobileDevice)
            //{
            //    _body.Style.Add("height", "635px");
            //    _card.Style.Add("margin-left", "1%");
            //    _card.Style.Add("margin-right", "1%");
            //}
            //else
            //{
            //    _body.Style.Add("height", "515px");
            //    _card.Style.Add("margin-left", "15%");
            //    _card.Style.Add("margin-right", "15%");
            //}

            //TituloPagina.Value = Session["_paginaOrigen"].ToString().Trim();
            Session["_paginaOrigen"] = "reservas.aspx";

            if (Request.Browser.IsMobileDevice)
            {
                _divCalendario.Style.Add("display", "none");
                _divGrilla.Style.Add("display", "block");
                _divFrame.Style.Add("margin-left", "1%");
                _divFrame.Style.Add("margin-right", "1%");
                _divFrame.Style.Add("height", "610px");
            }
            else
            {
                _divFrame.Style.Add("margin-left", "15%");
                _divFrame.Style.Add("margin-right", "15%");
                _divFrame.Style.Add("height", "470px");
            }
            Calendario.SelectedDate = DateTime.Today;
        }

        protected void CaledarioSelectionChanged(object sender, EventArgs e)
        {
            if (Calendario.SelectedDate < DateTime.Today)
            {
                Calendario.SelectedDate = DateTime.Today;

                _sqlSelect = "exec dbo.sp_s_reservasFiltradoFecha ";
                _sqlSelect += "@fecha = '" + DateTime.Today.ToString("yyyyMMdd") + "'";

                _GridReservado.DataSource = ObjClassUtilitarios.GetDataTable(_sqlSelect);
                _GridReservado.DataBind();

                _sqlSelect = "exec dbo.sp_s_horariosFiltradoDiaSemana ";
                _sqlSelect += "@diaSemana = '" + ObjClassUtilitarios.DayOfWeekSpanish(DateTime.Today.DayOfWeek.ToString()) + "'";
                PoblarGrilla(_sqlSelect);
                _labelDate.InnerText = ObjClassUtilitarios.DayOfWeekSpanish(DateTime.Today.DayOfWeek.ToString()) + ", " + DateTime.Today.ToString("dd") + "/" + DateTime.Today.ToString("MM") + "/" + DateTime.Today.ToString("yyyy");

            }
            else
            {
                //Calendario.SelectedDayStyle.BackColor = ColorTranslator.FromHtml("#90EE90");
                //Calendario.SelectedDayStyle.ForeColor = ColorTranslator.FromHtml("#dc6601");

                _labelDate.InnerText = ObjClassUtilitarios.DayOfWeekSpanish(Calendario.SelectedDate.DayOfWeek.ToString()) + ", " + Calendario.SelectedDate.ToString("dd") + "/" + Calendario.SelectedDate.ToString("MM") + "/" + Calendario.SelectedDate.ToString("yyyy");

                _sqlSelect = "exec dbo.sp_s_reservasFiltradoFecha ";
                _sqlSelect += "@fecha = '" + Calendario.SelectedDate.ToString("yyyyMMdd") + "'";

                _GridReservado.DataSource = ObjClassUtilitarios.GetDataTable(_sqlSelect);
                _GridReservado.DataBind();
                _GridReservado.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;

                _sqlSelect = "exec dbo.sp_s_horariosFiltradoDiaSemana ";
                _sqlSelect += "@diaSemana = '" + ObjClassUtilitarios.DayOfWeekSpanish(Calendario.SelectedDate.DayOfWeek.ToString()) + "'";

                PoblarGrilla(_sqlSelect);

            }

            if (Request.Browser.IsMobileDevice)
            {
                _divCalendario.Style.Add("display", "none");
                _divGrilla.Style.Add("display", "block");
            }

        }

        protected void PoblarGrilla(String _sqlSelect)
        {
            try
            {
                DataSet _dataSet = new DataSet();
                _dataSet = ObjClassUtilitarios.GetDataSet(_sqlSelect);

                DataTable _DataTable = new DataTable();
                _DataTable.Columns.Add("Hora");

                _labelJornAM.InnerText = "AM desde " + _dataSet.Tables[0].Rows[0]["AMDesde"].ToString() + " hrs. hasta " + _dataSet.Tables[0].Rows[0]["AMHasta"].ToString() + " hrs.";
                for (DateTime i = DateTime.Parse(_dataSet.Tables[0].Rows[0]["AMDesde"].ToString(), System.Globalization.CultureInfo.CurrentCulture);
                    i < DateTime.Parse(_dataSet.Tables[0].Rows[0]["AMHasta"].ToString(), System.Globalization.CultureInfo.CurrentCulture);
                    i = i.AddMinutes(Int16.Parse(_dataSet.Tables[0].Rows[0]["DuracionCita"].ToString())))
                { _DataTable.Rows.Add(i.ToString("HH:mm")); }

                if ((_dataSet.Tables[0].Rows[0]["AMHasta"].ToString() != "00:00") & (_dataSet.Tables[0].Rows[0]["PMDesde"].ToString() != "00:00"))
                    _DataTable.Rows.Add("Intermedio");

                _labelJornPM.InnerText = "PM desde " + _dataSet.Tables[0].Rows[0]["PMDesde"].ToString() + " hrs. hasta " + _dataSet.Tables[0].Rows[0]["PMHasta"].ToString() + " hrs.";
                for (DateTime i = DateTime.Parse(_dataSet.Tables[0].Rows[0]["PMDesde"].ToString(), System.Globalization.CultureInfo.CurrentCulture);
                    i < DateTime.Parse(_dataSet.Tables[0].Rows[0]["PMHasta"].ToString(), System.Globalization.CultureInfo.CurrentCulture);
                    i = i.AddMinutes(Int16.Parse(_dataSet.Tables[0].Rows[0]["DuracionCita"].ToString())))
                { _DataTable.Rows.Add(i.ToString("HH:mm")); }

                _GridHorario.DataSource = _DataTable;
                _GridHorario.DataBind();
                _GridHorario.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
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


//UPDATE
//    emitinc1.reservas12891927
//SET
//	fecha = '20240323' 
//WHERE 
//	fecha = '20240322'

//SELECT
//SUBSTRING(hora, 1, 2) + ':' + SUBSTRING(hora, 3, 2)
//FROM
//emitinc1.reservas12891927

//UPDATE
//    emitinc1.reservas12891927
//SET
//	hora = SUBSTRING(hora, 1, 2) + ':' + SUBSTRING(hora, 3, 2)