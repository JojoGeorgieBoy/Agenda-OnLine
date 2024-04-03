using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppAgenda
{
    public partial class error : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.Browser.IsMobileDevice)
            {
                if (Session["ex_Pagina"] != null)
                    if (Session["ex_Pagina"].ToString().Trim().Length > 0)
                    {
                        Label _Label_ex_Pagina = new Label();
                        _Label_ex_Pagina.Text = "<b>Page</b><br />" + Session["ex_Pagina"].ToString();
                        Panel_ex_Page.Controls.Add(_Label_ex_Pagina);
                        Panel_ex_Page.Controls.Add(new LiteralControl("<br />"));
                    }

                if (Session["ex_Message"] != null)
                    if (Session["ex_Message"].ToString().Trim().Length > 0)
                    {
                        Label Label_ex_Message = new Label();
                        Label_ex_Message.Text = "<b>Message</b><br />" + Session["ex_Message"].ToString();
                        Panel_ex_Page.Controls.Add(Label_ex_Message);
                        Panel_ex_Page.Controls.Add(new LiteralControl("<br />"));
                    }

                if (Session["ex_InnerException"] != null)
                    if (Session["ex_InnerException"].ToString().Trim().Length > 0)
                    {
                        Label _Label_ex_InnerException = new Label();
                        _Label_ex_InnerException.Text = "<b>InnerException</b><br />" + Session["ex_InnerException"].ToString();
                        Panel_ex_Page.Controls.Add(_Label_ex_InnerException);
                        Panel_ex_Page.Controls.Add(new LiteralControl("<br />"));
                    }
            }
            else
            {
                if (Session["ex_Pagina"] != null)
                    if (Session["ex_Pagina"].ToString().Trim().Length > 0)
                    {
                        Label _Label_ex_Pagina = new Label();
                        _Label_ex_Pagina.Text = "<b>Página:</b> " + Session["ex_Pagina"].ToString();
                        Panel_ex_Page.Controls.Add(_Label_ex_Pagina);
                        Panel_ex_Page.Controls.Add(new LiteralControl("<br />"));
                    }

                if (Session["ex_Message"] != null)
                    if (Session["ex_Message"].ToString().Trim().Length > 0)
                    {
                        Label _Label_ex_InnerException = new Label();
                        _Label_ex_InnerException.Text = "<b>Message:</b> " + Session["ex_Message"].ToString();
                        Panel_ex_Page.Controls.Add(_Label_ex_InnerException);
                        Panel_ex_Page.Controls.Add(new LiteralControl("<br />"));
                    }

                if (Session["ex_InnerException"] != null)
                    if (Session["ex_InnerException"].ToString().Trim().Length > 0)
                    {
                        Label _Label_ex_InnerException = new Label();
                        _Label_ex_InnerException.Text = "<b>Excepción:</b> " + Session["ex_InnerException"].ToString();
                        Panel_ex_Page.Controls.Add(_Label_ex_InnerException);
                        Panel_ex_Page.Controls.Add(new LiteralControl("<br />"));
                    }
            }

            Session["FechaSeleccionada"] = DateTime.Today.ToString("dd") + "/" + DateTime.Today.ToString("MM") + "/" + DateTime.Today.ToString("yyyy");

            Session["ex_Message"] = string.Empty;
            Session["ex_InnerException"] = string.Empty;

        }
    }
}

