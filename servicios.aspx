<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="servicios.aspx.cs" Inherits="WebAppAgenda.servicios" %>

<!DOCTYPE html>
<html lang="es-cl">
<head>
    <title>Servicios</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css\bootstrap.min.css">
    <script src="js\jquery-1.10.2.js"></script>
    <script src="js\bootstrap.min.js"></script>
    <link rel="stylesheet" href="css\styles.css">
    <script type="text/javascript" language="JavaScript"> 
        //(c) 1999-2001 Zone Web 
        function click() {
            if (event.button == 2) {
                alert('Agenda OnLine.');
            }
        }
        document.onmousedown = click
        //-->
    </script>
</head>
<body runat="server" id="_body">

    <div style="display: none">
        _paginaOrigen:&nbsp;<span runat="server" id="_paginaOrigen"></span><br />
        _TipoOperacion:&nbsp;<span runat="server" id="_TipoOperacion"></span><br />
        _inputValido:&nbsp;<span runat="server" id="_inputValido"></span><br />
        _inputNoValido:&nbsp;<span runat="server" id="_inputNoValido"></span><br />
        <input type="hidden" runat="server" id="HiddenOptions" />
    </div>

    <section class="row">

        <div class="col-lg-12 mb-12 bg-default text-center">

            <form id="_form" runat="server" name="_form" method="post" action="grabar.aspx">

                <div class="card" id="_card" runat="server" style="border-style: outset; padding-bottom: 15px">

                    <div class="card-header">
                        <input type="hidden" runat="server" id="TituloPagina" />
                        <button type="button" name="buttonServicioAgregar" id="buttonServicioAgregar" style="border-style: none; background-color: transparent" onclick="AbrirVentanaAgregar('<%#Eval("Servicio")%>')">
                            <img src="images/add.png" height="32" width="32" style="margin-bottom: 3px; margin-right: 3px" />
                            <span style="font-size: larger; font-weight: bold; color: #FFFFFF">Agregar servicios</span>
                        </button>
                    </div>

                    <div class="card-block">

                        <div class="table-responsive" style="border-style: outset; border-width: 5px; border-color: #337AB7; background-color: #FFFFFF; height: 405px; overflow-y: scroll;">

                            <asp:GridView
                                ID="_Grid"
                                runat="server"
                                AutoGenerateColumns="false"
                                Style="width: 100%"
                                class="table"
                                BorderColor="#CCCCCC"
                                BackColor="#FFFFFF">
                                <Columns>
                                    <asp:BoundField DataField="idServicio" Visible="false" />

                                    <asp:BoundField DataField="Servicio" HeaderText="&nbsp;Servicio&nbsp;" ControlStyle-BackColor="#DDD5DF">
                                        <HeaderStyle ForeColor="#FFFFFF" BackColor="#337AB7" HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>

                                    <asp:BoundField DataField="Duracion" HeaderText="&nbsp;Duración&nbsp;" ControlStyle-BackColor="#DDD5DF">
                                        <ItemStyle HorizontalAlign="Left" />
                                        <HeaderStyle ForeColor="#FFFFFF" BackColor="#337AB7" HorizontalAlign="Left" />
                                    </asp:BoundField>

                                    <asp:BoundField DataField="duracionServicio" Visible="false" />

                                    <asp:TemplateField HeaderText="&nbsp;Modificar&nbsp;" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-BackColor="#337AB7">
                                        <ItemTemplate>
                                            <button type="button" title="Modificar el servicio de <%#Eval("Servicio").ToString().ToLower()%>" style="border-style: none; background-color: transparent" onclick="AbrirVentanaModificar('<%#Eval("idServicio")%>', '<%#Eval("Servicio")%>', '<%#Eval("duracionServicio")%>')">
                                                <img src="images/edit.png" height="32" width="32" />
                                            </button>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="&nbsp;Eliminar&nbsp;" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-BackColor="#337AB7">
                                        <ItemTemplate>
                                            <button type="button" title="Eliminar el servicio de <%#Eval("Servicio").ToString().ToLower()%>" style="border-style: none; background-color: transparent" onclick="AbrirVentanaEliminar('<%#Eval("idServicio")%>', '<%#Eval("Servicio")%>')">
                                                <img src="images/delete.png" height="32" width="32" />
                                            </button>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>
                            </asp:GridView>

                            <asp:HiddenField runat="server" ID="HiddenOperacion" />
                            <asp:HiddenField runat="server" ID="HiddenIdTextBoxTipoServicio" />

                            <!-- *********************************************************************************************************** -->
                            <div class="modal" id="MyModal">

                                <div class="modal-dialog">

                                    <div id="_panelPrimary" class="panel panel-primary" style="border-color: #31B0D5">

                                        <div class="panel-heading" id="_panelHeading" style="background-color: #99D9EA">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title" id="_modalTitle">Atención...</h4>
                                        </div>

                                        <div id="_p_Msg" runat="server" class="panel-body">Nosotros somos fuertes. Nostros somos ricos. Nostros estamos llenos de suerte y armonía</div>

                                        <div id="_cardBlock" class="card-block" style="margin-left: 15%; margin-right: 15%;">

                                            <div id="_divTextCard" class="row form-group text-md-left text-lg-left" style="display: none;">
                                                <label class="col-md-5 col-form-label">Tipo de servicio</label>
                                                <div class="col-md-7">
                                                    <input type="text" name="TextBoxTipoServicio" id="TextBoxTipoServicio" title="Tipo de servicio sólo acepta caracteres válidos" class="form-control center-block" />
                                                    <input type="hidden" runat="server" id="HiddenTextBoxTipoServicio" />
                                                    <input type="hidden" runat="server" id="HiddenServicios" />
                                                </div>
                                            </div>

                                            <div id="_divComboServicio" class="row form-group" style="display: none;">
                                                <label class="col-md-5 col-form-label">Duración del servicio</label>
                                                <div class="col-md-7">
                                                    <select id="_comboDuracion" name="_comboDuracion" class="custom-select form-control">
                                                    </select>
                                                    <input type="hidden" id="HiddenSelectedOption" />
                                                    <input type="hidden" id="HiddenDuracionServicio" />
                                                </div>
                                            </div>

                                        </div>

                                        <div id="footerOpciones" class="panel-footer text-right" style="margin-top: 20px">
                                            <button type="button" name="ButtonOpciones" id="ButtonOpciones" class="btn btn-sm btn-info" onclick="Validar()"></button>
                                        </div>

                                    </div>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>

            </form>

        </div>

    </section>

</body>

</html>

<script language="javascript">

    if ($("#_paginaOrigen").html() == "grabar.aspx") {

        if ($("#_inputNoValido").html().trim() != "") {
            //    $("#_modalTitle").html("<b>Datos aceptados...</b>");
            //    $("#_p_Msg").html('<p>Los datos de la página de "Servicios" fueron ' + $("#_TipoOperacion").html() + ' exitosamente.</p>');
            //}
            //else {
            $('#MyModal').attr('class', 'modal');
            $("#_modalTitle").html("<b>Existe uno o más caracteres no válidos.</b>");
            $("#_p_Msg").html('<p>Caracteres no válidos en "' + $("#_inputNoValido").html() + '"</p><p>No fue posible aceptar dicha modificación.</p>');
            $('#ButtonOpciones').html(" Aceptar ");
            $('#MyModal').modal('toggle');
        }
    }

    let details = navigator.userAgent;
    let regexp = /android|iphone|kindle|ipad/i;
    let isMobileDevice = regexp.test(details);

    if (isMobileDevice) {
        document.getElementById("_Iframe").style.height = "635px";
    } else {
        document.getElementById("_Iframe").style.height = "515px";
    }

    function InputWhite(_input) {
        _input.css('background-color', '#FFFFFF');
        _input.val('');
        _input.attr('placeholder', '');
    }

    function Resaltar(x) {
        x.css("background-color", "#F2F5A9");
    }

    function CerrarMyModal() {
        alert("CerrarMyModal");
        $('#MyModal').modal('hide');
    }

    function AbrirVentanaAgregar(_servicio) {

        $("#_comboDuracion").html($('#HiddenOptions').val());
        $('#_panelPrimary').css('border-color', '#32CB32');
        $("#_panelHeading").css('background-color', '#32CB32');
        $("#_modalTitle").html("<b>Agregar nuevo servicio...</b>");
        $("#_p_Msg").html('Tenga la precaución de no ingresar caracteres "especiales"... Ojalá sólo letras y números.');
        $('#_cardBlock').css('display', 'block');
        InputWhite($('#TextBoxTipoServicio'));
        /*        $('#TextBoxTipoServicio').val(_servicio);*/
        $('#_divTextCard').css('display', 'block');
        $('#TextBoxTipoServicio').attr('readonly', false);
        //$("#_comboDuracion option[value='0']").attr("selected", true);
        TrasformButton('btn btn-sm btn-success', ' Agregar ');
        $('#_divComboServicio').css('display', 'block');
        $('#footerOpciones').css('display', 'block');
        $('#footerOpciones').css('margin-top', '40px');
        $('#MyModal').attr('class', 'modal fade');
        $('#MyModal').modal('show');
    }

    function AbrirVentanaModificar(_idServicio, _servicio, _duracionServicio) {
        $("#_comboDuracion").html($('#HiddenOptions').val());

        $("#HiddenTextBoxTipoServicio").val(_servicio);
        $("#HiddenDuracionServicio").val(_duracionServicio);

        $("#_panelPrimary").css('border-color', '#EC971F');
        $("#_panelHeading").css('background-color', '#FFC90E');
        $("#_modalTitle").html("<b>Modificación de servicio...</b>");
        $("#_p_Msg").html('Puede modificar la descripción del servicio, y/o la duración del mismo.');
        $('#_cardBlock').css('display', 'block');
        InputWhite($('#TextBoxTipoServicio'));
        $('#TextBoxTipoServicio').val(_servicio);
        $('#_divTextCard').css('display', 'block');
        $("#HiddenIdTextBoxTipoServicio").val(_idServicio);
        $('#TextBoxTipoServicio').attr('readonly', false);
        TrasformButton('btn btn-sm btn-warning', ' Modificar ');
        SeleccionarOption(document.getElementById("_comboDuracion"), _duracionServicio);
        $('#hiddenDuracionServicio').val(_duracionServicio);
        $('#_divComboServicio').css('display', 'block');
        $('#footerOpciones').css('display', 'block');
        $('#footerOpciones').css('margin-top', '40px');
        $('#MyModal').attr('class', 'modal fade');
        $('#MyModal').modal('show');
    }

    function AbrirVentanaEliminar(_idServicio, _servicio) {
        $('#_panelPrimary').css('border-color', '#C9302C');
        $("#_panelHeading").css('background-color', '#ED1C24');
        $("#_modalTitle").html("<b>Eliminar servicio...</b>");
        $("#_p_Msg").html('Para eliminar definitivamente haga click en el botón rojo "Eliminar"');
        $('#_cardBlock').css('display', 'block');
        InputWhite($('#TextBoxTipoServicio'));
        $('#TextBoxTipoServicio').val(_servicio);
        $('#_divTextCard').css('display', 'block');
        $("#HiddenIdTextBoxTipoServicio").val(_idServicio);
        $('#TextBoxTipoServicio').attr('readonly', true);
        TrasformButton("btn btn-sm btn-danger", ' Eliminar ');
        $('#_divComboServicio').css('display', 'none');
        $('#footerOpciones').css('display', 'block');
        $('#footerOpciones').css('margin-top', '40px');
        $('#MyModal').attr('class', 'modal fade');
        $('#MyModal').modal('show');
    }

    function TrasformButton(_class, _text) {
        $('#ButtonOpciones').removeClass("btn btn-sm btn-info");
        $('#ButtonOpciones').removeClass("btn btn-sm btn-success");
        $('#ButtonOpciones').removeClass("btn btn-sm btn-warning");
        $('#ButtonOpciones').removeClass("btn btn-sm btn-danger");
        $('#ButtonOpciones').addClass(_class);
        $('#ButtonOpciones').html(_text);
    }

    function SeleccionarOption(_select, _duracionServicio) {
        for (var i = 0; i < _select.length; i++)
            if (_select[i].value == _duracionServicio)
                _select.options.item(i).selected = 'selected';
    }

    function Validar() {

        if ($('#ButtonOpciones').html().trim() == 'Aceptar' || $('#ButtonOpciones').html().trim() == 'Cancelar') {
            $("#_TipoOperacion").html('');
            $("#_inputNoValido").html('');
            $('#MyModal').modal('hide');
            return false;
        }

        if ($('#TextBoxTipoServicio').val().trim().length == 0) {

            Resaltar($('#TextBoxTipoServicio'));

            if (isMobileDevice) {
                $('#TextBoxTipoServicio').attr("placeholder", "Ingrese tipo de servicio");
                return false;
            }
            else {
                $('#TextBoxTipoServicio').attr("placeholder", "Ingrese algún tipo de servicio");
                return false;
            }

        }

        if ($("#_comboDuracion option:selected").val() == '0') {

            Resaltar($("#_comboDuracion"));
            $("#_comboDuracion option[value='0']").html("Seleccione la duración.");
            document.getElementById("_comboDuracion").addEventListener("mouseover", () => { $("#_comboDuracion").css('background-color', '#FFFFFF') });
            return false;

        }


        if ($('#ButtonOpciones').html().trim() == 'Agregar') {
            /*Verificar si ya existe Servicio a la hora de agregar*/
            collection = $('#HiddenServicios').val().split(",");
            for (let i = 0; i < collection.length; i++) {
                if (collection[i].substring(0, collection[i].indexOf("_")).toLowerCase() == $('#TextBoxTipoServicio').val().toLowerCase().trim()) {
                    Resaltar($('#TextBoxTipoServicio'));
                    $('#TextBoxTipoServicio').val('');
                    $('#TextBoxTipoServicio').attr('placeholder', 'Servicio "' + collection[i].substring(0, collection[i].indexOf("_")) + '" ya existe');
                    document.getElementById("TextBoxTipoServicio").addEventListener("mouseover", () => { $("#TextBoxTipoServicio").css('background-color', '#FFFFFF') });
                    return false;
                }
            }
        }

        if ($('#ButtonOpciones').html().trim() == 'Modificar') {

            /*Verificar si hubo algún cambio, sino no hacer nada*/
            if ($('#TextBoxTipoServicio').val().toLowerCase().trim() == $("#HiddenTextBoxTipoServicio").val().toLowerCase().trim()) {
                /*Verificar si hubo algún cambio, sino no hacer nada*/
                if ($('#_comboDuracion').val().toLowerCase().trim() == $('#HiddenDuracionServicio').val().toLowerCase().trim()) {
                    $('#MyModal').modal('hide');
                    return false;
                }
                else {
                    /*Aquí cambió el Combo_Duración_Servicio*/
                }
            }
            else {
                /*Aquí cambió el TextBox_Tipo_Servicio*/
                _collectDescServ = $('#HiddenServicios').val().split(",");
                for (let i = 0; i < _collectDescServ.length; i++) {
                    if (_collectDescServ[i].substring(0, _collectDescServ[i].indexOf("_")).toLowerCase().trim() == $('#TextBoxTipoServicio').val().toLowerCase().trim()) {
                        $('#_cardBlock').css('display', 'none');
                        $("#_modalTitle").html("<b>Aquí cambió el TextBox_Tipo_Servicio</b>");
                        $("#_modalTitle").html("<b>Cambió no válido...</b>");
                        $("#_p_Msg").html('Ya existe el servicio "' + $('#TextBoxTipoServicio').val().trim() + '".<br />Imposible poder continuar... <br />Pulse Cancelar para abortar la modificación.');
                        $('#ButtonOpciones').removeClass("btn btn-sm btn-info");
                        $('#ButtonOpciones').addClass("btn btn-sm btn-warning");
                        $('#ButtonOpciones').html("Cancelar");
                        return false;
                    }
                }
            }
        }

        $("#HiddenSelectedOption").val($("#_comboDuracion option:selected").val());
        $("#HiddenOperacion").val($('#ButtonOpciones').html().trim());
        $("#_form").submit();

    }

</script>
