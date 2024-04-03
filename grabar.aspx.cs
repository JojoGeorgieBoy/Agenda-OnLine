using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics.Eventing.Reader;
using System.Drawing;
using System.Drawing.Printing;
using System.Globalization;
using System.Text.RegularExpressions;
using System.Threading;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using WebAppAgenda;

namespace WebAppAgenda
{
    public partial class grabar : System.Web.UI.Page
    {
        String _sqlUpdate = String.Empty;
        String _pattern = String.Empty;
        String _page = String.Empty;

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

            ////inputNombre.Value = _DataTableParam.Rows[0].ItemArray[3].ToString();
            ////inputTelefono.Value = _DataTableParam.Rows[0].ItemArray[6].ToString();
            ////inputEmail.Value = _DataTableParam.Rows[0].ItemArray[5].ToString();

            try
            {
                _page = Session["_paginaOrigen"].ToString();
            }
            catch (System.NullReferenceException ex)
            {
                Session["ex_Message"] = ex.Message;
                Session["ex_InnerException"] = ex.InnerException;
                Response.Redirect("error.aspx");
            }

            Session["_paginaOrigen"] = "grabar.aspx";

            switch (_page)
            {
                case "reservas":
                    _titulo.InnerText = _page;
                    break;

                case "servicios.aspx":

                    _titulo.InnerText = _page;

                    _pattern = "^([.a-zA-Z0-9 áéíóúÁÉÍÓÚüÜñÑ]{1,})$";
                    if (!Regex.IsMatch(Request["TextBoxTipoServicio"], _pattern))
                    {
                        Session["_inputValido"] = String.Empty;
                        Session["_inputNoValido"] = Request["TextBoxTipoServicio"].ToString();
                        Response.Redirect("servicios.aspx");
                    }

                    //_LabelTextOperacion.Text = "Operacion: " + Request["HiddenOpcion"];
                    //_LabelIdTextBoxServicio.Text = "Id: " + Request["HiddenIdTextBoxTipoServicio"];
                    //_LabelTextBoxServicio.Text = "Servicio: " + Request["TextBoxTipoServicio"];
                    //_LabelComboIdDuracionServicio.Text = "Duracion: " +  Request["DropDownListDuracionServicio"];

                    switch (Request["HiddenOperacion"])
                    {

                        case "Agregar":

                            _titulo.InnerText = "Agregar servicio";
                            Session["_inputValido"] = Request["TextBoxTipoServicio"].ToString();
                            Session["_inputNoValido"] = String.Empty;
                            Session["_TipoOperacion"] = "agregados";

                            _sqlUpdate = "exec dbo.sp_i_servicios ";
                            _sqlUpdate += "@descripcion = '" + Request["TextBoxTipoServicio"].ToString() + "', ";
                            _sqlUpdate += "@duracion = '" + Request["_comboDuracion"].ToString() + "'";

                            break;

                        case "Modificar":

                            _titulo.InnerText = "Modificar servicio";
                            Session["_inputValido"] = Request["TextBoxTipoServicio"].ToString();
                            Session["_inputNoValido"] = String.Empty;
                            Session["_TipoOperacion"] = "modificados";

                            _sqlUpdate = "exec dbo.sp_u_servicios ";
                            _sqlUpdate += "@id = '" + Request["HiddenIdTextBoxTipoServicio"].ToString() + "', ";
                            _sqlUpdate += "@descripcion = '" + Request["TextBoxTipoServicio"].ToString() + "', ";
                            _sqlUpdate += "@duracion = '" + Request["_comboDuracion"].ToString() + "'";

                            break;

                        case "Eliminar":

                            _titulo.InnerText = "Eliminar servicio";
                            Session["_inputValido"] = Request["TextBoxTipoServicio"].ToString();
                            Session["_inputNoValido"] = String.Empty;
                            Session["_TipoOperacion"] = "eliminados";

                            _sqlUpdate = "exec dbo.sp_d_servicios ";
                            _sqlUpdate += "@id = '" + Request["HiddenIdTextBoxTipoServicio"].ToString() + "'";

                            break;
                    }

                    _p_Msg.InnerHtml = _sqlUpdate;

                    ExecuteNonQuery(_sqlUpdate);

                    break;

                case "horarios.aspx":

                    _titulo.InnerText = _page;

                    //List<ClassJornada> ListClassJornada = new List<ClassJornada>();

                    //ClassJornada ClassJornadaLunes = new ClassJornada();
                    //ClassJornadaLunes._DiaSemana = "Lunes";
                    //ClassJornadaLunes._Inicio_AM = Request["Lunes_Inicio_AM"].ToString();
                    //ClassJornadaLunes._Fin_AM = Request["Lunes_Fin_AM"].ToString();
                    //ClassJornadaLunes._Inicio_PM = Request["Lunes_Inicio_PM"].ToString();
                    //ClassJornadaLunes._Fin_PM = Request["Lunes_Fin_PM"].ToString();
                    //ListClassJornada.Add(ClassJornadaLunes);

                    //ClassJornada ClassJornadaMartes = new ClassJornada();
                    //ClassJornadaMartes._DiaSemana = "Martes";
                    //ClassJornadaMartes._Inicio_AM = Request["Martes_Inicio_AM"].ToString();
                    //ClassJornadaMartes._Fin_AM = Request["Martes_Fin_AM"].ToString();
                    //ClassJornadaMartes._Inicio_PM = Request["Martes_Inicio_PM"].ToString();
                    //ClassJornadaMartes._Fin_PM = Request["Martes_Fin_PM"].ToString();
                    //ListClassJornada.Add(ClassJornadaMartes);

                    //ClassJornada ClassJornadaMiercoles = new ClassJornada();
                    //ClassJornadaMiercoles._DiaSemana = "Miercoles";
                    //ClassJornadaMiercoles._Inicio_AM = Request["Miercoles_Inicio_AM"].ToString();
                    //ClassJornadaMiercoles._Fin_AM = Request["Miercoles_Fin_AM"].ToString();
                    //ClassJornadaMiercoles._Inicio_PM = Request["Miercoles_Inicio_PM"].ToString();
                    //ClassJornadaMiercoles._Fin_PM = Request["Miercoles_Fin_PM"].ToString();
                    //ListClassJornada.Add(ClassJornadaMiercoles);

                    //ClassJornada ClassJornadaJueves = new ClassJornada();
                    //ClassJornadaJueves._DiaSemana = "Jueves";
                    //ClassJornadaJueves._Inicio_AM = Request["Jueves_Inicio_AM"].ToString();
                    //ClassJornadaJueves._Fin_AM = Request["Jueves_Fin_AM"].ToString();
                    //ClassJornadaJueves._Inicio_PM = Request["Jueves_Inicio_PM"].ToString();
                    //ClassJornadaJueves._Fin_PM = Request["Jueves_Fin_PM"].ToString();
                    //ListClassJornada.Add(ClassJornadaJueves);

                    //ClassJornada ClassJornadaViernes = new ClassJornada();
                    //ClassJornadaViernes._DiaSemana = "Viernes";
                    //ClassJornadaViernes._Inicio_AM = Request["Viernes_Inicio_AM"].ToString();
                    //ClassJornadaViernes._Fin_AM = Request["Viernes_Fin_AM"].ToString();
                    //ClassJornadaViernes._Inicio_PM = Request["Viernes_Inicio_PM"].ToString();
                    //ClassJornadaViernes._Fin_PM = Request["Viernes_Fin_PM"].ToString();
                    //ListClassJornada.Add(ClassJornadaViernes);

                    //ClassJornada ClassJornadaSabado = new ClassJornada();
                    //ClassJornadaSabado._DiaSemana = "Sabado";
                    //ClassJornadaSabado._Inicio_AM = Request["Sabado_Inicio_AM"].ToString();
                    //ClassJornadaSabado._Fin_AM = Request["Sabado_Fin_AM"].ToString();
                    //ClassJornadaSabado._Inicio_PM = Request["Sabado_Inicio_PM"].ToString();
                    //ClassJornadaSabado._Fin_PM = Request["Sabado_Fin_PM"].ToString();
                    //ListClassJornada.Add(ClassJornadaSabado);

                    //ClassJornada ClassJornadaDomingo = new ClassJornada();
                    //ClassJornadaDomingo._DiaSemana = "Domingo";
                    //ClassJornadaDomingo._Inicio_AM = Request["Domingo_Inicio_AM"].ToString();
                    //ClassJornadaDomingo._Fin_AM = Request["Domingo_Fin_AM"].ToString();
                    //ClassJornadaDomingo._Inicio_PM = Request["Domingo_Inicio_PM"].ToString();
                    //ClassJornadaDomingo._Fin_PM = Request["Domingo_Fin_PM"].ToString();
                    //ListClassJornada.Add(ClassJornadaDomingo);

                    ////CREATE PROCEDURE[dbo].[sp_u_jornadas]
                    ////@descripcion NVARCHAR(50),
                    ////@AMDesde NVARCHAR(5),
                    ////@AMHasta NVARCHAR(5),
                    ////@PMDesde NVARCHAR(5),
                    ////@PMHasta NVARCHAR(5)

                    //_Lunes.Text = Request["Lunes"].ToString();
                    //_Martes.Text = Request["Martes"].ToString();
                    //_Miercoles.Text = Request["Miercoles"].ToString();
                    //_Jueves.Text = Request["Jueves"].ToString();
                    //_Viernes.Text = Request["Viernes"].ToString();
                    //_Sabado.Text = Request["Sabado"].ToString();
                    //_Domingo.Text = Request["Domingo"].ToString();

                    //_Lunes_Inicio_AM.Text = Request["Lunes_Inicio_AM"].ToString();
                    //_Lunes_Fin_AM.Text = Request["Lunes_Fin_AM"].ToString();
                    //_Lunes_Inicio_PM.Text = Request["Lunes_Inicio_PM"].ToString();
                    //_Lunes_Fin_PM.Text = Request["Lunes_Fin_PM"].ToString();

                    if (Request["Lunes"].ToString() == "X")
                    {
                        _sqlUpdate = "exec dbo.sp_u_jornadas ";
                        _sqlUpdate += "@descripcion = 'Lunes', ";
                        _sqlUpdate += "@AMDesde = '" + Request["Lunes_Inicio_AM"].ToString() + "', ";
                        _sqlUpdate += "@AMHasta = '" + Request["Lunes_Fin_AM"].ToString() + "', ";
                        _sqlUpdate += "@PMDesde = '" + Request["Lunes_Inicio_PM"].ToString() + "', ";
                        _sqlUpdate += "@PMHasta = '" + Request["Lunes_Fin_PM"].ToString() + "'";

                        _p_Msg.InnerHtml = _sqlUpdate;
                        ExecuteNonQuery(_sqlUpdate);
                    }

                    //_Martes_Inicio_AM.Text = Request["Martes_Inicio_AM"].ToString();
                    //_Martes_Fin_AM.Text = Request["Martes_Fin_AM"].ToString();
                    //_Martes_Inicio_PM.Text = Request["Martes_Inicio_PM"].ToString();
                    //_Martes_Fin_PM.Text = Request["Martes_Fin_PM"].ToString();

                    if (Request["Martes"].ToString() == "X")
                    {
                        _sqlUpdate = "exec dbo.sp_u_jornadas ";
                        _sqlUpdate += "@descripcion = 'Martes', ";
                        _sqlUpdate += "@AMDesde = '" + Request["Martes_Inicio_AM"].ToString() + "', ";
                        _sqlUpdate += "@AMHasta = '" + Request["Martes_Fin_AM"].ToString() + "', ";
                        _sqlUpdate += "@PMDesde = '" + Request["Martes_Inicio_PM"].ToString() + "', ";
                        _sqlUpdate += "@PMHasta = '" + Request["Martes_Fin_PM"].ToString() + "'";

                        _p_Msg.InnerHtml = _sqlUpdate;
                        ExecuteNonQuery(_sqlUpdate);
                    }

                    //_Miercoles_Inicio_AM.Text = Request["Miercoles_Inicio_AM"].ToString();
                    //_Miercoles_Fin_AM.Text = Request["Miercoles_Fin_AM"].ToString();
                    //_Miercoles_Inicio_PM.Text = Request["Miercoles_Inicio_PM"].ToString();
                    //_Miercoles_Fin_PM.Text = Request["Miercoles_Fin_PM"].ToString();

                    if (Request["Miercoles"].ToString() == "X")
                    {
                        _sqlUpdate = "exec dbo.sp_u_jornadas ";
                        _sqlUpdate += "@descripcion = 'Miercoles', ";
                        _sqlUpdate += "@AMDesde = '" + Request["Miercoles_Inicio_AM"].ToString() + "', ";
                        _sqlUpdate += "@AMHasta = '" + Request["Miercoles_Fin_AM"].ToString() + "', ";
                        _sqlUpdate += "@PMDesde = '" + Request["Miercoles_Inicio_PM"].ToString() + "', ";
                        _sqlUpdate += "@PMHasta = '" + Request["Miercoles_Fin_PM"].ToString() + "'";

                        _p_Msg.InnerHtml = _sqlUpdate;
                        ExecuteNonQuery(_sqlUpdate);
                    }

                    //_Jueves_Inicio_AM.Text = Request["Jueves_Inicio_AM"].ToString();
                    //_Jueves_Fin_AM.Text = Request["Jueves_Fin_AM"].ToString();
                    //_Jueves_Inicio_PM.Text = Request["Jueves_Inicio_PM"].ToString();
                    //_Jueves_Fin_PM.Text = Request["Jueves_Fin_PM"].ToString();

                    if (Request["Jueves"].ToString() == "X")
                    {
                        _sqlUpdate = "exec dbo.sp_u_jornadas ";
                        _sqlUpdate += "@descripcion = 'Jueves', ";
                        _sqlUpdate += "@AMDesde = '" + Request["Jueves_Inicio_AM"].ToString() + "', ";
                        _sqlUpdate += "@AMHasta = '" + Request["Jueves_Fin_AM"].ToString() + "', ";
                        _sqlUpdate += "@PMDesde = '" + Request["Jueves_Inicio_PM"].ToString() + "', ";
                        _sqlUpdate += "@PMHasta = '" + Request["Jueves_Fin_PM"].ToString() + "'";

                        _p_Msg.InnerHtml = _sqlUpdate;
                        ExecuteNonQuery(_sqlUpdate);
                    }

                    //_Viernes_Inicio_AM.Text = Request["Viernes_Inicio_AM"].ToString();
                    //_Viernes_Fin_AM.Text = Request["Viernes_Fin_AM"].ToString();
                    //_Viernes_Inicio_PM.Text = Request["Viernes_Inicio_PM"].ToString();
                    //_Viernes_Fin_PM.Text = Request["Viernes_Fin_PM"].ToString();

                    if (Request["Viernes"].ToString() == "X")
                    {
                        _sqlUpdate = "exec dbo.sp_u_jornadas ";
                        _sqlUpdate += "@descripcion = 'Viernes', ";
                        _sqlUpdate += "@AMDesde = '" + Request["Viernes_Inicio_AM"].ToString() + "', ";
                        _sqlUpdate += "@AMHasta = '" + Request["Viernes_Fin_AM"].ToString() + "', ";
                        _sqlUpdate += "@PMDesde = '" + Request["Viernes_Inicio_PM"].ToString() + "', ";
                        _sqlUpdate += "@PMHasta = '" + Request["Viernes_Fin_PM"].ToString() + "'";

                        _p_Msg.InnerHtml = _sqlUpdate;
                        ExecuteNonQuery(_sqlUpdate);
                    }

                    //_Sabado_Inicio_AM.Text = Request["Sabado_Inicio_AM"].ToString();
                    //_Sabado_Fin_AM.Text = Request["Sabado_Fin_AM"].ToString();
                    //_Sabado_Inicio_PM.Text = Request["Sabado_Inicio_PM"].ToString();
                    //_Sabado_Fin_PM.Text = Request["Sabado_Fin_PM"].ToString();

                    if (Request["Sabado"].ToString() == "X")
                    {
                        _sqlUpdate = "exec dbo.sp_u_jornadas ";
                        _sqlUpdate += "@descripcion = 'Sabado', ";
                        _sqlUpdate += "@AMDesde = '" + Request["Sabado_Inicio_AM"].ToString() + "', ";
                        _sqlUpdate += "@AMHasta = '" + Request["Sabado_Fin_AM"].ToString() + "', ";
                        _sqlUpdate += "@PMDesde = '" + Request["Sabado_Inicio_PM"].ToString() + "', ";
                        _sqlUpdate += "@PMHasta = '" + Request["Sabado_Fin_PM"].ToString() + "'";

                        _p_Msg.InnerHtml = _sqlUpdate;
                        ExecuteNonQuery(_sqlUpdate);
                    }

                    //_Domingo_Inicio_AM.Text = Request["Domingo_Inicio_AM"].ToString();
                    //_Domingo_Fin_AM.Text = Request["Domingo_Fin_AM"].ToString();
                    //_Domingo_Inicio_PM.Text = Request["Domingo_Inicio_PM"].ToString();
                    //_Domingo_Fin_PM.Text = Request["Domingo_Fin_PM"].ToString();

                    if (Request["Domingo"].ToString() == "X")
                    {
                        _sqlUpdate = "exec dbo.sp_u_jornadas ";
                        _sqlUpdate += "@descripcion = 'Domingo', ";
                        _sqlUpdate += "@AMDesde = '" + Request["Domingo_Inicio_AM"].ToString() + "', ";
                        _sqlUpdate += "@AMHasta = '" + Request["Domingo_Fin_AM"].ToString() + "', ";
                        _sqlUpdate += "@PMDesde = '" + Request["Domingo_Inicio_PM"].ToString() + "', ";
                        _sqlUpdate += "@PMHasta = '" + Request["Domingo_Fin_PM"].ToString() + "'";

                        _p_Msg.InnerHtml = _sqlUpdate;
                        ExecuteNonQuery(_sqlUpdate);
                    }

                    break;

                case "parametros.aspx":

                    _pattern = "^([.a-zA-Z0-9 áéíóúÁÉÍÓÚüÜñÑ]{1,})$";
                    if (!Regex.IsMatch(Request["inputNombre"], _pattern))
                    {
                        Session["_input"] = "inputNombre";
                        Session["_inputNoValido"] = Request["inputNombre"].ToString();
                        Response.Redirect("parametros.aspx");
                    }

                    _pattern = "(\\+569|569|09|9)?[0-9]{8,}[0-9]$";
                    if (!Regex.IsMatch(Request["inputTelefono"], _pattern))
                    {
                        Session["_input"] = "inputTelefono";
                        Session["_inputNoValido"] = Request["inputTelefono"].ToString();
                        Response.Redirect("parametros.aspx");
                    }

                    _pattern = "^([a-zA-Z0-9@_\\.áéíóúÁÉÍÓÚüÜñÑ]{1,})$";
                    if (!Regex.IsMatch(Request["inputEmail"], _pattern))
                    {
                        Session["_input"] = "inputEmail";
                        Session["_inputNoValido"] = Request["inputEmail"].ToString();
                        Response.Redirect("parametros.aspx");
                    }

                    _titulo.InnerText = _page;
                    //_LabelinputRut.Text = Request["inputRut"].ToString();
                    //_LabelDropDownListDuracCitas.Text = Request["DropDownListDuracCitas"].ToString();
                    //_LabelinputNombre.Text = Request["inputNombre"].ToString();
                    //_LabelinputTelefono.Text = Request["inputTelefono"].ToString();
                    //_LabelinputEmail.Text = Request["inputEmail"].ToString();

                    _sqlUpdate = "exec dbo.sp_u_parametros ";
                    _sqlUpdate += "@rut = '" + Request["inputRut"].ToString() + "', ";
                    _sqlUpdate += "@nombre = '" + Request["inputNombre"].ToString() + "', ";
                    _sqlUpdate += "@duracionCita = '" + Request["DropDownListDuracCitas"].ToString() + "', ";
                    _sqlUpdate += "@fono = '" + Request["inputTelefono"].ToString() + "', ";
                    _sqlUpdate += "@email = '" + Request["inputEmail"].ToString() + "'";

                    _p_Msg.InnerHtml = _sqlUpdate;

                    ExecuteNonQuery(_sqlUpdate);

                    break;
            }

            Response.Redirect(_page);

        }

        private void ExecuteNonQuery(String _sqlUpdate)
        {
            if (_sqlUpdate.Trim().Length > 0)
            {
                try
                {
                    ObjClassUtilitarios.ExecuteNonQuery(_sqlUpdate);
                }
                catch (Exception ex)
                {
                    Session["ex_Message"] = ex.Message;
                    Session["ex_InnerException"] = ex.InnerException;
                    Response.Redirect("error.aspx");
                }
            }
        }

        //private String String Cadena)
        //{
        //    String _variable = Cadena;
        //    if (_variable.Length < 0)
        //        _variable = _variable.Substring(0, 2) + _variable.Substring(3, 2);

        //    return _variable;
        //}

    }
}
