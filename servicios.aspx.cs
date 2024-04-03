using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics.Eventing.Reader;
using System.Drawing;
using System.EnterpriseServices.CompensatingResourceManager;
using System.Globalization;
using System.Reflection.Emit;
using System.Security.Cryptography;
using System.Threading;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using WebAppAgenda;

namespace WebAppAgenda
{
    public partial class servicios : System.Web.UI.Page
    {
        ClassUtilitarios ObjClassUtilitarios = new ClassUtilitarios();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                try /*CargarGrilla*/
                {
                    DataTable _DataTable = ObjClassUtilitarios.GetDataSet("exec dbo.sp_s_servicios").Tables[0];
                    if (_DataTable.Rows.Count > 0)
                    {
                        _Grid.DataSource = _DataTable;
                        _Grid.DataBind();
                        _Grid.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;

                        String _CadenaServicios = String.Empty;
                        Int16 Cont = 0;
                        foreach (DataRow _DataRow in _DataTable.Rows)
                        {
                            _CadenaServicios += _DataRow["Servicio"].ToString() + "_" + _DataRow["duracionServicio"].ToString();
                            Cont++;
                            if (Cont < _DataTable.Rows.Count)
                                _CadenaServicios += ",";

                        }
                        HiddenServicios.Value = _CadenaServicios;
                    }
                }
                catch (ArgumentException ex)
                {
                    Session["ex_Message"] = ex.Message;
                    Session["ex_InnerException"] = ex.InnerException;
                    Response.Redirect("error.aspx");
                }


                try /*CargarCombo*/
                {
                    DataTable _DataTable = ObjClassUtilitarios.GetDataSet("exec dbo.sp_s_duracion").Tables[0];
                    if (_DataTable.Rows.Count > 0)
                    {
                        String _CadenaOptions = "<option hidden value='0' selected></option>";
                        Int16 Cont = 0;
                        foreach (DataRow _DataRow in _DataTable.Rows)
                        {
                            _CadenaOptions += "<option value='" + _DataRow["Duracion"].ToString() + "'>" + _DataRow["Descripcion"].ToString() + "</option>";
                            Cont++;
                            if (Cont < _DataTable.Rows.Count)
                                _CadenaOptions += ",";

                        }
                        HiddenOptions.Value = _CadenaOptions;
                    }
                }
                catch (ArgumentException ex)
                {
                    Session["ex_Message"] = ex.Message;
                    Session["ex_InnerException"] = ex.InnerException;
                    Response.Redirect("error.aspx");
                }

                ////*************** Para cuando haya que partir directamente desde esta ´página sin pasar por la página default.aspx *******************
                //Session["_paginaOrigen"] = "default.aspx";
                //Session["_TipoOperacion"] = string.Empty;
                //Session["_inputValido"] = string.Empty;
                //Session["_inputNoValido"] = string.Empty;

                ////Session["ex_Message"] = string.Empty;
                ////Session["ex_InnerException"] = string.Empty;
                ////Session["FechaSeleccionada"] = DateTime.Today.ToString("dd") + "/" + DateTime.Today.ToString("MM") + "/" + DateTime.Today.ToString("yyyy");
            }

            try
            {
                if ((Session["_inputValido"] != null) && (Session["_paginaOrigen"] != null) && (Session["_TipoOperacion"] != null))
                {
                    _inputValido.InnerText = Session["_inputValido"].ToString().Trim();
                    _paginaOrigen.InnerHtml = Session["_paginaOrigen"].ToString().Trim();
                    _TipoOperacion.InnerHtml = Session["_TipoOperacion"].ToString().Trim();
                }
                else
                {
                    Session["ex_Message"] = "Tiempo de espera terminado";
                    Response.Redirect("error.aspx");
                }

                Session["_inputValido"] = String.Empty;
                _inputNoValido.InnerText = Session["_inputNoValido"].ToString().Trim();
                Session["_inputNoValido"] = String.Empty;

            }
            catch (System.NullReferenceException ex)
            {
                Session["ex_Message"] = ex.Message;
                Session["ex_InnerException"] = ex.InnerException;
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
                TituloPagina.Value = Session["_paginaOrigen"].ToString().Trim();
            }
            catch (System.NullReferenceException ex)
            {
                Session["ex_Message"] = ex.Message;
                Session["ex_InnerException"] = ex.InnerException;
                Response.Redirect("error.aspx");
            }

            //try
            //{
            Session["_paginaOrigen"] = "servicios.aspx";
            //}
            //catch (ArgumentException ex)
            //{
            //    Session["ex_Message"] = ex.Message;
            //    Session["ex_InnerException"] = ex.InnerException;
            //    Response.Redirect("error.aspx");
            //}

        }


    }
}