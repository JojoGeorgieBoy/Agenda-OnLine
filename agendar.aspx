<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="agendar.aspx.cs" Inherits="WebAppAgenda.agendar" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="es-cl">

<head runat="server">

    <title>Agendar</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <link rel="icon" href="images/favicon.ico" />

    <link href="dist/css/bootstrap.min.css" rel="stylesheet" />

    <link href="css/font-awesome.css" rel="stylesheet" />

    <link href="css/style.css" rel="stylesheet" />

</head>

<body>
    <div class="container-fluid" id="wrapper">
        <div class="row">

            <nav class="sidebar col-xs-12 col-sm-4 col-lg-3 col-xl-2">
                <h4 class="title" style="margin-bottom: 30px"><a href="default.aspx">Agenda peluquería</a></h4>
                <a href="#menu-toggle" class="btn btn-default" id="menu-toggle"><em class="fa fa-bars"></em></a>
                <ul class="nav nav-pills flex-column sidebar-nav">
                    <li class="nav-item"><a class="nav-link" href="default.aspx"><em class="fa fa-clone"></em>&nbsp;Reservas</a></li>
                    <li class="nav-item"><a class="nav-link"><em class="fa fa-calendar"></em>&nbsp;Agendar</a></li>
                    <li class="nav-item"><a class="nav-link" href="servicios.aspx"><em class="fa fa-scissors"></em>&nbsp;Servicios</a></li>
                    <li class="nav-item"><a class="nav-link" href="horarios.aspx"><em class="fa fa-calendar-o"></em>&nbsp;Horarios</a></li>
                    <li class="nav-item"><a class="nav-link" href="parametros.aspx"><em class="fa fa-cogs"></em>&nbsp;Parámetros</a></li>
                </ul>
            </nav>

            <main class="col-xs-12 col-sm-8 col-lg-9 col-xl-10 pt-3 pl-4 ml-auto">

                <form id="formAgendar" runat="server" class="form-horizontal" action="#" method="post">

                    <%--****************************************************************************************************************--%>

                    <div runat="server" id="SpinnerBack" visible="false">

                        <div runat="server" id="popupMensaje">

                            <div class="container">
                                <div class="row" id="titularPopup">
                                    <div class="col" runat="server" id="columnaTitularPopup">
                                        Titular
                                    </div>
                                    <div class="columnaTitularClosePopup" style="padding-top: 5px; float: right;">
                                        <asp:ImageButton runat="server" ID="ImageButtonCloseMe" CssClass="marginRight5" ImageUrl="~/images/close.png" Width="20" Height="20" OnClick="CloseMe" AlternateText="Cerrar" />
                                    </div>
                                </div>
                                <div class="row" runat="server" id="DivMensaje" visible="false">
                                    <div class="col text-center">
                                        <p runat="server" id="Mensaje">Nosotros somos fuertes, nosotros somos ricos, nosotros estamos llenos de suerte y armonía.</p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col text-center">
                                        <asp:Button ID="ButtonCerrar" CssClass="marginBottom20" runat="server" Text="Cerrar" OnClick="ButtonCancelarInput_Click" />
                                    </div>
                                </div>
                            </div>

                            <div runat="server" id="DivInput" visible="false" style="width: 100%; text-align: center;">

                                <asp:Label ID="LabelTextBoxInput" runat="server" CssClass="control-label" AssociatedControlID="TextBoxInput" Text="Tipo del servicio"></asp:Label>
                                <asp:TextBox runat="server" ID="TextBoxInput" CssClass="form-control centrado" pattern="[- a-zA-Z.,)(0-9]{1,50}"></asp:TextBox>
                                <asp:Button runat="server" ID="ButtonTextBoxInput" CssClass="form-control centrado" BorderStyle="Outset" BackColor="Red" ForeColor="White" Visible="false" OnClick="NormalizeTextBoxInput" ToolTip="Click aquí para cerrar este mensaje" />
                                <br />

                                <asp:Label ID="LabelDropDownListInput" runat="server" CssClass="control-label" AssociatedControlID="DropDownListInput" Text="Duración del servicio"></asp:Label>
                                <asp:DropDownList runat="server" ID="DropDownListInput" CssClass="form-control center-block marginBottom30"></asp:DropDownList>
                                <asp:Button runat="server" ID="ButtonDropDownListInput" CssClass="form-control center-block marginBottom30" BorderStyle="Outset" BackColor="Red" ForeColor="White" Visible="false" OnClick="NormalizeDropDownListInput" ToolTip="Click aquí para cerrar este mensaje" />

                                <asp:Button ID="ButtonCancelInput" CssClass="btn btn-sm btn-primary paddingLeft20 paddingRight20 marginRight30" runat="server" Text="Cancelar" OnClick="ButtonCancelarInput_Click" />
                                <asp:Button ID="ButtonUpdateInput" CssClass="btn btn-sm btn-primary paddingLeft20 paddingRight20 marginLeft20" runat="server" Text="Actualizar" OnClick="ButtonUpdateInput_Horario" />
                                <asp:Button ID="ButtonDeleteInput" CssClass="btn btn-sm btn-primary paddingLeft20 paddingRight20 marginLeft20" runat="server" Text="Eliminar" OnClick="ButtonDeleteInput_Horario" />
                                <br />
                                <br />

                            </div>

                            <div runat="server" id="Div2" visible="false">
                                <p runat="server" id="P1">Nosotros somos fuertes, nosotros somos ricos, nosotros estamos llenos de suerte y armonía.</p>
                                <asp:GridView runat="server" ID="GridView1"></asp:GridView>
                                <asp:Button ID="Button1" CssClass="btn btn-sm btn-primary marginBottom20" runat="server" Text="Aceptar" OnClick="ButtonCancelarInput_Click" />
                            </div>

                            <div runat="server" id="DivMensajeGrilla" visible="false">
                                <p runat="server" id="PMensajeGrilla">Nosotros somos fuertes, nosotros somos ricos, nosotros estamos llenos de suerte y armonía.</p>
                                <asp:GridView runat="server" ID="GridViewMensajeGrilla"></asp:GridView>
                                <asp:Button ID="ButtonGridViewMensajeGrilla" CssClass="btn btn-sm btn-primary marginBottom20" runat="server" Text="Aceptar" OnClick="ButtonCancelarInput_Click" />
                            </div>

                        </div>

                    </div>

                    <%--****************************************************************************************************************--%>

                    <section class="row">

                        <div class="col-sm-12">
                            <section class="row">
                                <div class="col-md-6 col-lg-8">
                                    <span class="float-left text-center text-md-left">
                                        <!-- Link to open the modal -->
                                        <asp:Button runat="server" Text="Ventana mensaje" OnClick="OpenPopup" />
                                    </span>
                                </div>
                            </section>
                            <section class="row">

                                <div class="col-lg-12 mb-12 bg-default">
                                    <div class="card">

                                        <div class="card-header">
                                            <h4>Agendar</h4>
                                        </div>

                                        <div class="card-block">

                                            <div class="card-block marginTop10">
                                                <p class="centrado marginBottom30">
                                                    Atiende los d&iacute;as&nbsp;
                                                    <asp:DropDownList ID="DropDownListDiaSemana" runat="server" AutoPostBack="true" OnSelectedIndexChanged="RescatarInfoDia">
                                                        <asp:ListItem Text="Lunes" />
                                                        <asp:ListItem Text="Martes" />
                                                        <asp:ListItem Text="Miercoles" />
                                                        <asp:ListItem Text="Jueves" />
                                                        <asp:ListItem Text="Viernes" />
                                                        <asp:ListItem Text="Sabado" />
                                                        <asp:ListItem Text="Domingo" />
                                                    </asp:DropDownList>
                                                    &nbsp;&nbsp;
                                                    <asp:RadioButton runat="server" ID="RadioButtonDiaYes" Text="&nbsp;Si" GroupName="AtencionDia" AutoPostBack="true" Checked="true" />
                                                    &nbsp;
                                                    <asp:RadioButton runat="server" ID="RadioButtonDiaNo" Text="&nbsp;No" GroupName="AtencionDia" AutoPostBack="true" />
                                                </p>

                                                <hr />
                                            </div>

                                            <div id="DivJornadas" runat="server" class="marginBottom10">
                                                <div class="form-group row">
                                                    <asp:Label runat="server" ID="LabelAMDesde" class="col-md-3 col-form-label" Text="Jornada AM desde:"></asp:Label>
                                                    <div class="col-md-2">
                                                        <asp:DropDownList ID="DropDownListAMdesde" runat="server" AutoPostBack="true" OnSelectedIndexChanged="RevisarDropDownListNoVacio">
                                                            <asp:ListItem Text="" Value="0" />
                                                            <asp:ListItem Text="08:00" Value="800" />
                                                            <asp:ListItem Text="08:30" Value="830" />
                                                            <asp:ListItem Text="09:00" Value="900" Selected="True" />
                                                            <asp:ListItem Text="09:30" Value="930" />
                                                            <asp:ListItem Text="10:00" Value="1000" />
                                                            <asp:ListItem Text="10:30" Value="1030" />
                                                            <asp:ListItem Text="11:00" Value="1100" />
                                                            <asp:ListItem Text="11:30" Value="1130" />
                                                            <asp:ListItem Text="12:00" Value="1200" />
                                                            <asp:ListItem Text="12:30" Value="1230" />
                                                            <asp:ListItem Text="13:00" Value="1300" />
                                                            <asp:ListItem Text="13:30" Value="1330" />
                                                            <asp:ListItem Text="14:00" Value="1400" />
                                                        </asp:DropDownList>
                                                    </div>
                                                    <asp:Label runat="server" ID="LabelAMHasta" class="col-md-3 col-form-label" Text="Jornada AM Hasta:"></asp:Label>
                                                    <div class="col-md-2 marginBottom10">
                                                        <asp:DropDownList ID="DropDownListAMhasta" runat="server" AutoPostBack="true" OnSelectedIndexChanged="RevisarDropDownListNoVacio">
                                                            <asp:ListItem Text="" Value="0" />
                                                            <asp:ListItem Text="08:30" Value="830" />
                                                            <asp:ListItem Text="09:00" Value="900" />
                                                            <asp:ListItem Text="09:30" Value="930" />
                                                            <asp:ListItem Text="10:00" Value="1000" />
                                                            <asp:ListItem Text="10:30" Value="1030" />
                                                            <asp:ListItem Text="11:00" Value="1100" />
                                                            <asp:ListItem Text="11:30" Value="1130" />
                                                            <asp:ListItem Text="12:00" Value="1200" />
                                                            <asp:ListItem Text="12:30" Value="1230" />
                                                            <asp:ListItem Text="13:00" Value="1300" Selected="True" />
                                                            <asp:ListItem Text="13:30" Value="1330" />
                                                            <asp:ListItem Text="14:00" Value="1400" />
                                                            <asp:ListItem Text="14:30" Value="1430" />
                                                            <asp:ListItem Text="15:00" Value="1500" />
                                                            <asp:ListItem Text="15:30" Value="1530" />
                                                            <asp:ListItem Text="16:00" Value="1600" />
                                                        </asp:DropDownList>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <label>
                                                            <asp:CheckBox ID="CheckBoxAM" runat="server" Text="&nbsp;&nbsp;Activa" AutoPostBack="true" OnCheckedChanged="HabilitarDeshabilitarAM" />
                                                        </label>
                                                    </div>
                                                </div>
                                                <hr />
                                                <div style="color: #FFFF00; background-color: #8193C3;">&nbsp;&nbsp;I N T E R M E D I O</div>
                                                <div class="form-group row verdeClaro paddingTop10" style="display: none">
                                                    <asp:Label runat="server" ID="LabelColacionDesde" class="col-md-3 col-form-label" Text="Colación desde:"></asp:Label>
                                                    <div class="col-md-2">
                                                        <asp:DropDownList ID="DropDownListColacionDesde" runat="server" AutoPostBack="true" OnSelectedIndexChanged="RevisarDropDownListNoVacio">
                                                            <asp:ListItem Text="" Value="0" />
                                                            <asp:ListItem Text="11:00" Value="1100" />
                                                            <asp:ListItem Text="11:30" Value="1130" />
                                                            <asp:ListItem Text="12:00" Value="1200" />
                                                            <asp:ListItem Text="12:30" Value="1230" />
                                                            <asp:ListItem Text="13:00" Value="1300" Selected="True" />
                                                            <asp:ListItem Text="13:30" Value="1330" />
                                                            <asp:ListItem Text="14:00" Value="1400" />
                                                            <asp:ListItem Text="14:30" Value="1430" />
                                                            <asp:ListItem Text="15:00" Value="1500" />
                                                            <asp:ListItem Text="15:30" Value="1530" />
                                                            <asp:ListItem Text="16:00" Value="1600" />
                                                        </asp:DropDownList>
                                                    </div>
                                                    <asp:Label runat="server" ID="LabelColacionHasta" class="col-md-3 col-form-label" Text="Colación hasta:"></asp:Label>
                                                    <div class="col-md-2 marginBottom10">
                                                        <asp:DropDownList ID="DropDownListColacionHasta" runat="server" AutoPostBack="true" OnSelectedIndexChanged="RevisarDropDownListNoVacio">
                                                            <asp:ListItem Text="" Value="0" />
                                                            <asp:ListItem Text="12:00" Value="1200" />
                                                            <asp:ListItem Text="12:30" Value="1230" />
                                                            <asp:ListItem Text="13:00" Value="1300" />
                                                            <asp:ListItem Text="13:30" Value="1330" />
                                                            <asp:ListItem Text="14:00" Value="1400" Selected="True" />
                                                            <asp:ListItem Text="14:30" Value="1430" />
                                                            <asp:ListItem Text="15:00" Value="1500" />
                                                            <asp:ListItem Text="15:30" Value="1530" />
                                                            <asp:ListItem Text="16:00" Value="1600" />
                                                            <asp:ListItem Text="16:30" Value="1630" />
                                                            <asp:ListItem Text="17:00" Value="1700" />
                                                        </asp:DropDownList>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <label>
                                                            <asp:CheckBox ID="CheckBoxColacion" runat="server" AutoPostBack="true" OnCheckedChanged="HabilitarDeshabilitarColacion" />
                                                        </label>
                                                    </div>
                                                </div>
                                                <hr />
                                                <div class="form-group row">
                                                    <asp:Label runat="server" ID="LabelJornadaPMDesde" class="col-md-3 col-form-label" Text="Jornada PM desde:"></asp:Label>
                                                    <div class="col-md-2">
                                                        <asp:DropDownList ID="DropDownListPMdesde" runat="server" AutoPostBack="true" OnSelectedIndexChanged="RevisarDropDownListNoVacio">
                                                            <asp:ListItem Text="" Value="0" />
                                                            <asp:ListItem Text="12:00" Value="1200" />
                                                            <asp:ListItem Text="12:30" Value="1230" />
                                                            <asp:ListItem Text="13:00" Value="1300" />
                                                            <asp:ListItem Text="13:30" Value="1330" />
                                                            <asp:ListItem Text="14:00" Value="1400" Selected="True" />
                                                            <asp:ListItem Text="14:30" Value="1430" />
                                                            <asp:ListItem Text="15:00" Value="1500" />
                                                            <asp:ListItem Text="15:30" Value="1530" />
                                                            <asp:ListItem Text="16:00" Value="1600" />
                                                            <asp:ListItem Text="16:30" Value="1630" />
                                                            <asp:ListItem Text="17:00" Value="1700" />
                                                            <asp:ListItem Text="17:30" Value="1730" />
                                                            <asp:ListItem Text="18:00" Value="1800" />
                                                            <asp:ListItem Text="18:30" Value="1830" />
                                                            <asp:ListItem Text="19:00" Value="1900" />
                                                            <asp:ListItem Text="19:30" Value="1930" />
                                                            <asp:ListItem Text="20:00" Value="2000" />
                                                            <asp:ListItem Text="20:30" Value="2030" />
                                                            <asp:ListItem Text="21:00" Value="2100" />
                                                            <asp:ListItem Text="21:30" Value="2130" />
                                                        </asp:DropDownList>
                                                    </div>
                                                    <asp:Label runat="server" ID="LabelJornadaPMHasta" class="col-md-3 col-form-label" Text="Jornada PM hasta:"></asp:Label>
                                                    <div class="col-md-2 marginBottom10">
                                                        <asp:DropDownList ID="DropDownListPMhasta" runat="server" AutoPostBack="true" OnSelectedIndexChanged="RevisarDropDownListNoVacio">
                                                            <asp:ListItem Text="" Value="0" />
                                                            <asp:ListItem Text="12:00" Value="1200" />
                                                            <asp:ListItem Text="12:30" Value="1230" />
                                                            <asp:ListItem Text="13:00" Value="1300" />
                                                            <asp:ListItem Text="13:30" Value="1330" />
                                                            <asp:ListItem Text="14:00" Value="1400" />
                                                            <asp:ListItem Text="14:30" Value="1430" />
                                                            <asp:ListItem Text="15:00" Value="1500" />
                                                            <asp:ListItem Text="15:30" Value="1530" />
                                                            <asp:ListItem Text="16:00" Value="1600" />
                                                            <asp:ListItem Text="16:30" Value="1630" />
                                                            <asp:ListItem Text="17:00" Value="1700" />
                                                            <asp:ListItem Text="17:30" Value="1730" />
                                                            <asp:ListItem Text="18:00" Value="1800" />
                                                            <asp:ListItem Text="18:30" Value="1830" />
                                                            <asp:ListItem Text="19:00" Value="1900" Selected="True" />
                                                            <asp:ListItem Text="19:30" Value="1930" />
                                                            <asp:ListItem Text="20:00" Value="2000" />
                                                            <asp:ListItem Text="20:30" Value="2030" />
                                                            <asp:ListItem Text="21:00" Value="2100" />
                                                            <asp:ListItem Text="21:30" Value="2130" />
                                                            <asp:ListItem Text="22:00" Value="2200" />
                                                        </asp:DropDownList>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <label>
                                                            <asp:CheckBox ID="CheckBoxPM" runat="server" Text="&nbsp;&nbsp;Activa" AutoPostBack="true" OnCheckedChanged="HabilitarDeshabilitarPM" />
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>

                                            <hr />

                                            <asp:Button ID="ButtonGuardarCambios" runat="server" class="btn btn-md marginTop10 marginBottom10" Text="Guardar cambios" OnClick="GuardarCambiosJornada" />

                                            <div class="container" style="display: none">
                                                <div class="row">
                                                    <div class="col-sm-offset-4 col-sm-4">
                                                        <p class="marginTop10 marginBottom30">
                                                            <asp:Button runat="server" ID="ButtonLimpiar" Text="Limpiar" CssClass="btn btn-sm btn-primary paddingLeft20 paddingRight20 marginRight20" OnClick="ButtonLimpiar_Click" />
                                                            <asp:Button runat="server" ID="ButtonAgregar" Text="Agregar" CssClass="btn btn-sm btn-primary paddingLeft20 paddingRight20 marginRight20" OnClick="ButtonAgregar_Click" />
                                                            <asp:Button runat="server" ID="ButtonActualizar" Text="Actualizar" CssClass="btn btn-sm btn-success paddingLeft20 paddingRight19 marginRight20" OnClick="ButtonActualizar_Click" />
                                                            <asp:Button runat="server" ID="ButtonEliminar" Text="Eliminar" CssClass="btn btn-sm btn-danger  paddingLeft20 paddingRight20 marginRight20" OnClick="ButtonEliminar_Click" />
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>

                            </section>

                        </div>

                    </section>

                    <%--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--%>

                    <div id="caja_main_HiddenField">

                        <asp:HiddenField runat="server" ID="HiddenTextBoxTipoHorario" />
                        <asp:HiddenField runat="server" ID="HiddenDropDownListDuracionTipoHorario" />

                        <asp:HiddenField runat="server" ID="HiddenField1" />
                        <asp:HiddenField runat="server" ID="HiddenField2" />
                        <asp:HiddenField runat="server" ID="HiddenField3" />

                        <asp:HiddenField runat="server" ID="HiddenTextBoxTipoServicio" />
                        <asp:HiddenField runat="server" ID="HiddenDropDownListDuracionTipoServicio" />

                        <asp:HiddenField runat="server" ID="hiddenTextBoxInput" />
                        <asp:HiddenField runat="server" ID="hiddenIdRegistro" />
                        <asp:HiddenField runat="server" ID="hiddenDropDownListInput" />

                    </div>

                    <footer>
                        <br />
                        <br />
                        <br />
                        <br />
                        <div class="col-12 mb-4 marginTop40">Desarrollado por <a href="https://iitec.cl/">https://iitec.cl/</a></div>
                    </footer>

                </form>

            </main>

        </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="dist/js/bootstrap.min.js"></script>

    <script src="js/chart.min.js"></script>
    <script src="js/chart-data.js"></script>
    <script src="js/easypiechart.js"></script>
    <script src="js/easypiechart-data.js"></script>
    <script src="js/bootstrap-datepicker.js"></script>
    <script src="js/custom.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>

</body>
</html>



