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
using WebAppAgenda;
using static System.Net.Mime.MediaTypeNames;

namespace WebAppAgenda
{
    public partial class agendar : System.Web.UI.Page
    {
        ClassUtilitarios ObjClassUtilitarios = new ClassUtilitarios();

        //String _sqlSelect;
        //String _sqlInsert;
        String _sqlUpdate;
        //String _sqlDelete;

        protected void Page_Load(object sender, EventArgs e)
        {
            ScreenLayout();

            if (!IsPostBack)
            {
                RefreshControlsTipoHorario();
                //CargarDropDownList(DropDownListDuracionTipoHorario, "exec dbo.sp_s_duracion");
                ////CargarDropDownList(DropDownListInput, "exec dbo.sp_s_duracion");
                //////TituloPagina.Text = "Asignará cita cada: ";
                ////TextBoxTipoHorario.Enabled = true;
                //DropDownListDuracionTipoHorario.Enabled = true;
                ////leerJornadas("execute sp_s_jornadas @descripcion = '" + DropDownListDiaSemana.Text + "'");
            }

            NormalizarBotones();

        }

        protected void CargarDropDownList(DropDownList _DropDownList, String _Select)
        {
            DataTable _DataTable = ObjClassUtilitarios.GetDataSet(_Select).Tables[0];
            if (_DataTable.Rows.Count > 0)
            {
                _DropDownList.Items.Clear();

                ListItem _ListItem = new ListItem(String.Empty, "0");
                _DropDownList.Items.Add(_ListItem);

                foreach (DataRow _DataRow in _DataTable.Rows)
                {
                    _ListItem = new ListItem(_DataRow["descripcion"].ToString(), _DataRow["id"].ToString());
                    _DropDownList.Items.Add(_ListItem);
                }
            }

        }

        protected void ButtonLimpiar_Click(object sender, EventArgs e)
        {
            ClearInputs();
            ////TituloPagina.Text = "Definición de horarios";
            //ButtonLimpiar.Text = "Limpiar";
        }

        protected void ClearInputs()
        {
            ////ButtonTextBoxTipoHorario.Visible = false;
            ////TextBoxTipoHorario.Text = String.Empty;
            ////TextBoxTipoHorario.Visible = true;
            ////TextBoxTipoHorario.Enabled = true;

            //ButtonDropDownListDuracionTipoHorario.Visible = false;
            //DropDownListDuracionTipoHorario.SelectedIndex = 0;
            //DropDownListDuracionTipoHorario.Visible = true;
            //DropDownListDuracionTipoHorario.Enabled = true;

            ////DropDownListTipoHorario.SelectedIndex = 0;
        }

        protected void ButtonAgregar_Click(object sender, EventArgs e)
        {
            //if (TextBoxEmpty(TextBoxTipoHorario, ButtonTextBoxTipoHorario, "Debe ingresar algún tipo de Horario"))
            //    return;

            //if (DropDownListNotSelected(DropDownListDuracionTipoHorario, ButtonDropDownListDuracionTipoHorario, "Seleccione rango de duración"))
            //    return;

            String _sqlSelect = "exec dbo.sp_s_buscarHorarioxDescripcion ";
            _sqlSelect += "@descripcion = ''";

            if (!TipoHorario_Seek(_sqlSelect))
            {
                //_sqlInsert = "exec dbo.sp_i_horarios ";
                //_sqlInsert += "@descripcion = '', ";
                //_sqlInsert += "@idDuracion = " + DropDownListDuracionTipoHorario.Text;
                //ObjClassUtilitarios.ExecuteNonQuery(_sqlInsert);
                ////PopupMensaje("Inserción exitosa", "<br />El tipo de Horario '" + TextBoxTipoHorario.Text + "' ha sido agregado exitosamente.<br />");
                //RefreshControlsTipoHorario();
            }
            else
            {
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "none", "ShowPopup();", true);
                //Thread.Sleep(1000);
                //PopupMensaje("Atención", "<br />El tipo de Horario '" + TextBoxTipoHorario.Text + "' ya existe.<br />");
                //_Error.Style.Add("color", "#333333");
            }
        }

        protected Boolean TextBoxEmpty(TextBox _TextBoxInput, Button _ButtonAlarm, String _texto)
        {
            if (_TextBoxInput.Text == String.Empty)
            {
                _TextBoxInput.Visible = false;
                _ButtonAlarm.Visible = true;
                _ButtonAlarm.Text = _texto;
                return true;
            }
            return false;
        }

        protected Boolean DropDownListNotSelected(DropDownList _DropDownList, Button _ButtonDropDownList, String _Texto)
        {
            if (_DropDownList.SelectedIndex < 1)
            {
                _DropDownList.Visible = false;
                _ButtonDropDownList.Visible = true;
                _ButtonDropDownList.Text = _Texto;
                return true;
            }
            return false;
        }

        protected void NormalizeTextBox(object sender, EventArgs e)
        {
            //ButtonTextBoxTipoHorario.Visible = false;
            //TextBoxTipoHorario.Visible = true;
            //TextBoxTipoHorario.Focus();
        }
        protected void NormalizeDropDownList(object sender, EventArgs e)
        {
            //ButtonDropDownListDuracionTipoHorario.Visible = false;
            //DropDownListDuracionTipoHorario.Visible = true;
            //DropDownListDuracionTipoHorario.Focus();
        }

        protected void NormalizeTextBoxInput(object sender, EventArgs e)
        {
            ButtonTextBoxInput.Visible = false;
            TextBoxInput.Visible = true;
            TextBoxInput.Focus();
        }
        protected void NormalizeDropDownListInput(object sender, EventArgs e)
        {
            ButtonDropDownListInput.Visible = false;
            DropDownListInput.Visible = true;
            DropDownListInput.Focus();
        }

        protected Boolean TipoHorario_Seek(String _sqlSelect)
        {
            if (ObjClassUtilitarios.GetDataSet(_sqlSelect).Tables[0].Rows.Count > 0)
                return true;
            else
                return false;
        }


        #region Func

        void ScreenLayout()
        {
            if (Request.Browser.IsMobileDevice)
            {
                //derecha.Visible = false;
                //izquierda.Style.Add("width", "100%");
                //TituloPagina.Visible = false;
                //divTituloPagina.Style.Add("margin-bottom", "10px");
                //divLabelCalendario.Style.Add("text-align", "center");
                //divLabelHoraDeAtencion.Style.Add("text-align", "center");
                //divLabelTipoServicio.Style.Add("text-align", "center");
                //divLabelNombreUsuario.Style.Add("text-align", "center");
                //divLabelTelefono.Style.Add("text-align", "center");

                //divCalendario.Style.Add("margin-left", "50px");
                //divDropDownListHoraDeAtencion.Style.Add("margin-left", "50px");
                //divDropDownListTipoServicio.Style.Add("margin-left", "50px");
                //divTextBoxNombreUsuario.Style.Add("margin-left", "50px");
                //divTextBoxTelefono.Style.Add("margin-left", "50px");
                //ButtonAceptarReserva.Style.Add("margin-left", "10px");
                popupMensaje.Style.Add("margin-left", "5px");
                popupMensaje.Style.Add("margin-top", "100px");
                popupMensaje.Style.Add("width", "335px");
                //btnAceptarPC.Visible = false;
                //btnAceptarMovil.Visible = true;
                ////lblHora.Visible = false;
                ////lblServicio.Visible = false;
                ////lblNombre.Visible = false;
                ////lblTelefono.Visible = false;
                ////txtHora.Style.Add("placeholder", "Hora de atención");
                ////txtServicio.Style.Add("placeholder", "Tipo de servicio");
                ////txtNombre.Style.Add("placeholder", "Nombre usuaria(o)");
                ////txtTelefono.Style.Add("placeholder", "Ingrese número de teléfono");
            }
            else
            {
                //derecha.Visible = true;
                //izquierda.Style.Add("width", "73%");
                //TituloPagina.Visible = true;
                //divTituloPagina.Style.Add("margin-bottom", "40px");
                //divLabelCalendario.Style.Add("text-align", "right");
                //divLabelHoraDeAtencion.Style.Add("text-align", "right");
                //divLabelTipoServicio.Style.Add("text-align", "right");
                //divLabelNombreUsuario.Style.Add("text-align", "right");
                //divLabelTelefono.Style.Add("text-align", "right");
                //ButtonAceptarReserva.Style.Add("margin-left", "60px");
                popupMensaje.Style.Add("margin-left", "220px");
                popupMensaje.Style.Add("margin-top", "150px");
                popupMensaje.Style.Add("width", "400px");
                //btnAceptarPC.Visible = true;
                //btnAceptarMovil.Visible = false;
                ////lblHora.Visible = true;
                ////lblServicio.Visible = true;
                ////lblNombre.Visible = true;
                ////lblTelefono.Visible = true;
                ////txtHora.Style.Add("placeholder", "");
                ////txtServicio.Style.Add("placeholder", "");
                ////txtNombre.Style.Add("placeholder", "");
                ////txtTelefono.Style.Add("placeholder", "");
            }
        }

        void CargarGridViewTipoHorario()
        {
            //GridViewTipoHorario.DataSource = ObjClassUtilitarios.GetDataSet("exec dbo.sp_s_horarios");
            //GridViewTipoHorario.DataBind();
            //GridViewTipoHorario.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
        }

        void RefreshControlsTipoHorario()
        {
            //ObjClassUtilitarios.CargarListBox(DropDownListTipoHorario, "exec dbo.sp_s_horarios", "idHorario", "DescripcionHorario", "idHorario", "Horario");
            ClearInputs();
            CargarGridViewTipoHorario();
            NormalizarBotones();
        }

        #endregion

        protected void DropDownListTipoHorario_SelectedIndexChanged(object sender, EventArgs e)
        {
            //if (DropDownListTipoHorario.SelectedIndex > 0)
            //{
            //    DropDownList_SelectedIndexChanged(DropDownListTipoHorario, DropDownListDuracionTipoHorario);
            //}
            //else
            ClearInputs();
        }

        protected void DropDownList_SelectedIndexChanged(DropDownList _DropDownList, DropDownList _OtroDropDownList)
        {
            //TextBoxTipoHorario.Text = _DropDownList.SelectedItem.ToString();

            DataTable _DataTable = ObjClassUtilitarios.GetDataTable("exec dbo.sp_s_buscarHorarioxId @id = " + _DropDownList.SelectedValue);
            if (_DataTable.Rows.Count > 0)
            {
                //DataRow _DataRow = _DataTable.Rows[0];
                //foreach (ListItem _ListItem in DropDownListDuracionTipoHorario.Items)
                //{
                //    if (_ListItem.Value == _DataRow["idDuracion"].ToString())
                //    {
                //        _OtroDropDownList.SelectedItem.Selected = false;
                //        _ListItem.Selected = true;
                //    }
                //}
            }
        }

        protected void ButtonCancelarInput_Click(object sender, EventArgs e)
        {
            ButtonTextBoxInput.Visible = false;
            ButtonDropDownListInput.Visible = false;
            SpinnerBack.Visible = false;
            //TituloPagina.Text = "Definición de horarios";
        }

        protected void PopupMensaje(String _Titular, String _InnerHtml)
        {
            SpinnerBack.Visible = true;
            DivInput.Visible = false;
            DivMensaje.Visible = true;
            columnaTitularPopup.InnerText = _Titular;
            Mensaje.InnerHtml = _InnerHtml;
        }

        protected void PopupInput(String _Titular, String _Texto)
        {
            SpinnerBack.Visible = true;
            DivMensaje.Visible = false;
            DivInput.Visible = true;

            LabelTextBoxInput.Visible = true;
            TextBoxInput.Visible = true;

            LabelDropDownListInput.Visible = true;
            DropDownListInput.Visible = true;

            ButtonDeleteInput.Visible = false;
            ButtonUpdateInput.Visible = true;
            columnaTitularPopup.InnerText = _Titular;
            LabelTextBoxInput.Text = _Texto;
        }

        protected void CloseMe(object sender, EventArgs e)
        {
            SpinnerBack.Visible = false;
            //TituloPagina.Text = "Definición de horarios";
        }

        protected void ImageButtonDelete_Click(object sender, EventArgs e)
        {
            ImageButton _imageButton = new ImageButton();
            _imageButton = sender as ImageButton;

            DataTable _DataTable = ObjClassUtilitarios.GetDataSet("exec dbo.sp_s_buscarHorarioxId @id = " + _imageButton.CommandArgument.ToString()).Tables[0];
            if (_DataTable.Rows.Count > 0)
            {
                PopupAceptarCancelar("Eliminación de datos", "<br />Confirma eliminar Horario '" + _DataTable.Rows[0]["descripcion"].ToString() + "'<br /><br />");
                ButtonDeleteInput.CommandArgument = _imageButton.CommandArgument.ToString();
            }
        }

        protected void ButtonDeleteInput_Horario(object sender, EventArgs e)
        {
            Button _Button = new Button();
            _Button = sender as Button;
            ObjClassUtilitarios.ExecuteNonQuery("exec dbo.sp_d_horarios @id = " + _Button.CommandArgument.ToString());
            SpinnerBack.Visible = false;
            //TituloPagina.Text = "Definición de horarios";
            RefreshControlsTipoHorario();
        }

        protected void PopupAceptarCancelar(String _Titular, String _Texto)
        {
            SpinnerBack.Visible = true;
            DivMensaje.Visible = false;
            DivInput.Visible = true;

            columnaTitularPopup.InnerText = _Titular;
            LabelTextBoxInput.Text = _Texto;
            TextBoxInput.Visible = false;

            LabelDropDownListInput.Visible = false;
            DropDownListInput.Visible = false;

            ButtonDeleteInput.Visible = true;
            ButtonUpdateInput.Visible = false;
        }

        protected void ButtonUpdateInput_Horario(object sender, EventArgs e)
        {
            if (TextBoxEmpty(TextBoxInput, ButtonTextBoxInput, "Debe ingresar algún tipo de Horario"))
                return;

            if (DropDownListNotSelected(DropDownListInput, ButtonDropDownListInput, "Seleccione rango de duración"))
                return;

            if ((hiddenTextBoxInput.Value == TextBoxInput.Text) && (hiddenDropDownListInput.Value == DropDownListInput.SelectedValue))
            {
                SpinnerBack.Visible = false;
                //TituloPagina.Text = "Definición de horarios";
                return;
            }

            _sqlUpdate = "exec dbo.sp_u_horarios ";
            _sqlUpdate += "@id = " + hiddenIdRegistro.Value + ", ";
            _sqlUpdate += "@descripcion = '" + TextBoxInput.Text + "', ";
            _sqlUpdate += "@idDuracion = " + DropDownListInput.SelectedValue;

            ObjClassUtilitarios.ExecuteNonQuery(_sqlUpdate);
            RefreshControlsTipoHorario();
            SpinnerBack.Visible = false;
            //TituloPagina.Text = "Definición de horarios";
        }

        protected void SeleccionarOptionDropDownList(DropDownList _DropDownList, String _Id)
        {
            foreach (ListItem _ListItem in _DropDownList.Items)
            {
                if (_ListItem.Value == _Id)
                {
                    _DropDownList.SelectedItem.Selected = false;
                    _ListItem.Selected = true;
                    return;
                }
            }
        }

        protected void ImageButtonSelect_Click(object sender, EventArgs e)
        {
        //    ImageButton imageButton = new ImageButton();
        //    imageButton = sender as ImageButton;

        //    String _AlternateText = imageButton.AlternateText;

        //    hiddenIdRegistro.Value = imageButton.CommandArgument.ToString();

        //    ClearInputs();

        //    _sqlSelect = "exec dbo.sp_s_buscarHorarioxId @id = " + hiddenIdRegistro.Value;
        //    DataTable _DataTable = ObjClassUtilitarios.GetDataTable(_sqlSelect);

        //    if (_DataTable.Rows.Count > 0)
        //    {
        //        DataRow _DataRow = _DataTable.Rows[0];
        //        TextBoxTipoHorario.Text = _DataRow["Descripcion"].ToString();
        //        HiddenTextBoxTipoHorario.Value = TextBoxTipoHorario.Text;
        //        foreach (ListItem _ListItem in DropDownListDuracionTipoHorario.Items)
        //        {
        //            if (_ListItem.Value == _DataRow["idDuracion"].ToString())
        //            {
        //                DropDownListDuracionTipoHorario.SelectedItem.Selected = false;
        //                _ListItem.Selected = true;
        //                HiddenDropDownListDuracionTipoHorario.Value = _ListItem.Value;
        //            }
        //        }
        //        DisponerAccion(_AlternateText);
        //    }
        }

        protected void DisponerAccion(String _AlternateText)
        {
            //ButtonLimpiar.Text = "Cancelar";

            //if (_AlternateText == "Update")
            //{
            //    //TextBoxTipoHorario.Enabled = true;
            //    DropDownListDuracionTipoHorario.Enabled = true;
            //    //TituloPagina.Text = "¡Modificando el Horario!";
            //    ButtonAgregar.Visible = false;
            //    ButtonEliminar.Visible = false;
            //    ButtonActualizar.Visible = true;
            //}

            //if (_AlternateText == "Delete")
            //{
            //    //TextBoxTipoHorario.Enabled = false;
            //    DropDownListDuracionTipoHorario.Enabled = false;
            //    //TituloPagina.Text = "¿Confirma eliminar Horario?";
            //    ButtonAgregar.Visible = false;
            //    ButtonActualizar.Visible = false;
            //    ButtonEliminar.Visible = true;
            //}
        }

        protected void NormalizarBotones()
        {
            //ButtonEliminar.Visible = false;
            //ButtonActualizar.Visible = false;
            //ButtonLimpiar.Visible = true;
            //ButtonAgregar.Visible = true;
        }

        protected void ButtonCancelar_Click(object sender, EventArgs e)
        {
            NormalizarBotones();
        }

        protected void ButtonActualizar_Click(object sender, EventArgs e)
        {
            ////if (TextBoxEmpty(TextBoxTipoHorario, ButtonTextBoxTipoHorario, "Debe ingresar algún tipo de Horario"))
            ////    return;

            //if (DropDownListNotSelected(DropDownListDuracionTipoHorario, ButtonDropDownListDuracionTipoHorario, "Seleccione rango de duración"))
            //    return;

            ////if ((HiddenTextBoxTipoHorario.Value == TextBoxTipoHorario.Text) && (HiddenDropDownListDuracionTipoHorario.Value == DropDownListDuracionTipoHorario.SelectedValue))
            ////{
            ////    PopupMensaje("No hubo cambios", "<br />El tipo de Horario '" + TextBoxTipoHorario.Text + "' no registra cambios.<br />");
            ////    return;
            ////}

            //_sqlUpdate = "exec dbo.sp_u_horarios ";
            //_sqlUpdate += "@id = " + hiddenIdRegistro.Value + ", ";
            //_sqlUpdate += "@descripcion = '', ";
            //_sqlUpdate += "@idDuracion = " + DropDownListDuracionTipoHorario.SelectedValue;

            //ObjClassUtilitarios.ExecuteNonQuery(_sqlUpdate);
            ////PopupMensaje("Modificación exitosa", "<br />El tipo de Horario '" + TextBoxTipoHorario.Text + "' ha sido actualizado exitosamente.<br />");
            //RefreshControlsTipoHorario();
        }

        protected void ButtonEliminar_Click(object sender, EventArgs e)
        {
            ObjClassUtilitarios.ExecuteNonQuery("exec dbo.sp_d_horarios @id = " + hiddenIdRegistro.Value);
            //PopupMensaje("Eliminación exitosa", "<br />El tipo de Horario '" + TextBoxTipoHorario.Text + "' ha sido eliminado exitosamente.<br />");
            RefreshControlsTipoHorario();
        }

        protected void DesplegarOcultarDivJornadas(object sender, EventArgs e)
        {
            //if (RadioButtonDiaYes.Checked)
            //{
            //    DivJornadas.Visible = true;
            //}
            //else
            //{
            //    DivJornadas.Visible = false;
            //}
        }

        protected void HabilitarDeshabilitarAM(object sender, EventArgs e)
        {
            //if (CheckBoxAM.Checked)
            //{
            //    DropDownListAMdesde.SelectedIndex = 5;
            //    DropDownListAMdesde.Enabled = true;
            //    DropDownListAMhasta.SelectedIndex = 12;
            //    DropDownListAMhasta.Enabled = true;
            //}
            //if (!CheckBoxAM.Checked)
            //{
            //    DropDownListAMdesde.SelectedIndex = 0;
            //    DropDownListAMdesde.Enabled = false;
            //    DropDownListAMhasta.SelectedIndex = 0;
            //    DropDownListAMhasta.Enabled = false;
            //}
        }

        protected void HabilitarDeshabilitarColacion(object sender, EventArgs e)
        {
            //if (CheckBoxColacion.Checked)
            //{
            //    DropDownListColacionDesde.SelectedIndex = 7;
            //    DropDownListColacionDesde.Enabled = true;
            //    DropDownListColacionHasta.SelectedIndex = 9;
            //    DropDownListColacionHasta.Enabled = true;
            //}
            //else
            //{
            //    DropDownListColacionDesde.SelectedIndex = 0;
            //    DropDownListColacionDesde.Enabled = false;
            //    DropDownListColacionHasta.SelectedIndex = 0;
            //    DropDownListColacionHasta.Enabled = false;
            //}
        }

        protected void HabilitarDeshabilitarPM(object sender, EventArgs e)
        {
            //if (CheckBoxPM.Checked)
            //{
            //    DropDownListPMdesde.SelectedIndex = 9;
            //    DropDownListPMdesde.Enabled = true;
            //    DropDownListPMhasta.SelectedIndex = 17;
            //    DropDownListPMhasta.Enabled = true;
            //}
            //else
            //{
            //    DropDownListPMdesde.SelectedIndex = 0;
            //    DropDownListPMdesde.Enabled = false;
            //    DropDownListPMhasta.SelectedIndex = 0;
            //    DropDownListPMhasta.Enabled = false;
            //}
        }

        protected void RevisarDropDownListNoVacio(object sender, EventArgs e)
        {
            //if (CheckBoxAM.Checked)
            //{
            //    if (DropDownListAMdesde.SelectedIndex == 0)
            //        DropDownListAMdesde.SelectedIndex = 5;

            //    if (DropDownListAMhasta.SelectedIndex == 0)
            //        DropDownListAMhasta.SelectedIndex = 12;
            //}

            //if (CheckBoxColacion.Checked)
            //{
            //    if (DropDownListColacionDesde.SelectedIndex == 0)
            //        DropDownListColacionDesde.SelectedIndex = 7;

            //    if (DropDownListColacionHasta.SelectedIndex == 0)
            //        DropDownListColacionHasta.SelectedIndex = 9;
            //}

            //if (CheckBoxPM.Checked)
            //{
            //    if (DropDownListPMdesde.SelectedIndex == 0)
            //        DropDownListPMdesde.SelectedIndex = 9;

            //    if (DropDownListPMhasta.SelectedIndex == 0)
            //        DropDownListPMhasta.SelectedIndex = 17;
            //}
        }

        protected void GuardarCambiosJornada(object sender, EventArgs e)
        {
            String _Titular = "Atención del día " + DropDownListDiaSemana.SelectedValue;
            String _InnerHtml = "Desplegado";

            if (!RadioButtonDiaYes.Checked)
            {
                _sqlUpdate = "exec dbo.sp_u_jornadas ";
                _sqlUpdate += "@descripcion = '', ";
                _sqlUpdate += "@AMDesde     = '0', ";
                _sqlUpdate += "@AMHasta     = '0', ";
                _sqlUpdate += "@PMDesde     = '0', ";
                _sqlUpdate += "@PMHasta     = '0', ";
                _sqlUpdate += "@DuraCita    = '0'";
                ObjClassUtilitarios.ExecuteNonQuery(_sqlUpdate);
                //_InnerHtml = "Datos registrados, los " + DropDownListDiaSemana.SelectedValue + " no habrá servicio";
            }
            else
            {
                if (IncongruenciasLogicas())
                    return;

                _sqlUpdate = "exec dbo.sp_u_jornadas ";

                _sqlUpdate += "@descripcion = '', ";
                _sqlUpdate += "@AMDesde     = '" + DropDownListAMdesde.Text + "', ";
                _sqlUpdate += "@AMHasta     = '" + DropDownListAMhasta.Text + "', ";
                _sqlUpdate += "@PMDesde     = '" + DropDownListPMdesde.Text + "', ";
                _sqlUpdate += "@PMHasta     = '" + DropDownListPMhasta.Text + "', ";

                if (!CheckBoxPM.Checked & !CheckBoxPM.Checked)
                    _sqlUpdate += "@DuraCita = '0'";
                else
                    _sqlUpdate += "@DuraCita = '30'";

                ObjClassUtilitarios.ExecuteNonQuery(_sqlUpdate);

                _InnerHtml = "Los datos para los " + DropDownListDiaSemana.SelectedValue + " han sido actualizados ";
            }

            leerJornadas("execute sp_s_jornadas @descripcion = '" + DropDownListDiaSemana.Text + "'");

            PopupMensaje(_Titular, _InnerHtml);
        }

        protected void RescatarInfoDia(object sender, EventArgs e)
        {
            //leerJornadas("execute sp_s_jornadas @descripcion = '" + DropDownListDiaSemana.Text + "'");
        }

        protected void leerJornadas(String _sqlSelect)
        {

            DataTable _DataTable = ObjClassUtilitarios.GetDataTable(_sqlSelect);

            if (_DataTable.Rows.Count > 0)
            {
                DataRow _DataRow = _DataTable.Rows[0];

                switch (_DataRow["DuracionCita"].ToString())
                {
                    case "0":
                        //DropDownListDuracHoras.SelectedIndex = -1;
                        break;
                    case "30":
                        //DropDownListDuracHoras.SelectedIndex = 0;
                        break;
                    case "60":
                        //DropDownListDuracHoras.SelectedIndex = 1;
                        break;
                }


                if (_DataRow["AMDesde"].ToString() == "0")
                {
                    //DropDownListAMdesde.SelectedIndex = 0;
                    //DropDownListAMdesde.Enabled = false;
                    //DropDownListAMhasta.SelectedIndex = 0;
                    //DropDownListAMhasta.Enabled = false;
                    //CheckBoxAM.Checked = false;
                }
                else
                {

                    //foreach (ListItem _ListItem in DropDownListAMdesde.Items)
                    //{
                    //    String Cadena = _DataRow["AMDesde"].ToString();
                    //    if (Cadena != String.Empty)
                    //    {
                    //        if (_ListItem.Value == Cadena)
                    //        {
                    //            DropDownListAMdesde.SelectedItem.Selected = false;
                    //            _ListItem.Selected = true;
                    //            DropDownListAMdesde.Enabled = true;
                    //            break;
                    //        }
                    //    }
                    //}

                    //foreach (ListItem _ListItem in DropDownListAMhasta.Items)
                    //{
                    //    String Cadena = _DataRow["AMhasta"].ToString();
                    //    if (Cadena != String.Empty)
                    //    {
                    //        if (_ListItem.Value == Cadena)
                    //        {
                    //            DropDownListAMhasta.SelectedItem.Selected = false;
                    //            _ListItem.Selected = true;
                    //            DropDownListAMhasta.Enabled = true;
                    //            break;
                    //        }
                    //    }
                    //}

                    //CheckBoxAM.Checked = true;

                }

                if (_DataRow["PMDesde"].ToString() == "0")
                {
                    //DropDownListPMdesde.SelectedIndex = 0;
                    //DropDownListPMdesde.Enabled = false;
                    //DropDownListPMhasta.SelectedIndex = 0;
                    //DropDownListPMhasta.Enabled = false;
                    //CheckBoxPM.Checked = false;
                }
                else
                {
                    //foreach (ListItem _ListItem in DropDownListPMdesde.Items)
                    //{
                    //    String Cadena = _DataRow["PMDesde"].ToString();
                    //    if (Cadena != String.Empty)
                    //    {
                    //        if (_ListItem.Value == Cadena)
                    //        {
                    //            DropDownListPMdesde.SelectedItem.Selected = false;
                    //            _ListItem.Selected = true;
                    //            DropDownListPMdesde.Enabled = true;
                    //            break;
                    //        }
                    //    }
                    //}

                    //foreach (ListItem _ListItem in DropDownListPMhasta.Items)
                    //{
                    //    String Cadena = _DataRow["PMHasta"].ToString();
                    //    if (Cadena != String.Empty)
                    //    {
                    //        if (_ListItem.Value == Cadena)
                    //        {
                    //            DropDownListPMhasta.SelectedItem.Selected = false;
                    //            _ListItem.Selected = true;
                    //            DropDownListPMhasta.Enabled = true;
                    //            break;
                    //        }
                    //    }
                    //}

                    //CheckBoxPM.Checked = true;

                }

            }

            //if (CheckBoxAM.Checked | CheckBoxPM.Checked)
            //{
            //    //RadioButtonDiaNo.Checked = false;
            //    //RadioButtonDiaYes.Checked = true;
            //    DivJornadas.Visible = true;
            //}
            //else
            //{
            //    //RadioButtonDiaYes.Checked = false;
            //    //RadioButtonDiaNo.Checked = true;
            //    DivJornadas.Visible = false;
            //}

        }

        protected Boolean IncongruenciasLogicas()
        {
            //if (CheckBoxAM.Checked)
            //{
            //    if (Int16.Parse(DropDownListAMdesde.SelectedValue) >= Int16.Parse(DropDownListAMhasta.SelectedValue))
            //    {
            //        PopupMensaje("Valores incoherentes en jornada AM", "Horario de inicio debe ser menor que horario final");
            //        return true;
            //    }
            //}

            //if (CheckBoxPM.Checked)
            //{
            //    if (Int16.Parse(DropDownListPMdesde.SelectedValue) >= Int16.Parse(DropDownListPMhasta.SelectedValue))
            //    {
            //        PopupMensaje("Valores incoherentes en jornada PM", "Horario de inicio debe ser menor que horario final");
            //        return true;
            //    }
            //}

            //if ((CheckBoxAM.Checked) & (CheckBoxPM.Checked))
            //{
            //    if (Int16.Parse(DropDownListAMhasta.SelectedValue) >= Int16.Parse(DropDownListPMdesde.SelectedValue))
            //    {
            //        PopupMensaje("ERROR... ¡Traslape de horarios!", "Horarios final AM e inicio PM con problemas</br>Por favor revisar y corregir.");
            //        return true;
            //    }
            //}

            return false;
        }

        protected void OpenPopup(object sender, EventArgs e)
        {
            PopupMensaje("Imposible continuar", "¡las citas disponibles para agendar hoy ya vencieron por horario.");
        }

    }

}