<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reservas.aspx.cs" Inherits="WebAppAgenda.reservas" %>

<!DOCTYPE html>
<html lang="es-cl">
<head>
    <title>Reservas</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css\bootstrap.min.css">
    <script src="js\jquery-1.10.2.js"></script>
    <script src="js\bootstrap.min.js"></script>
    <link rel="stylesheet" href="css\styles.css">
    <%--    <script type="text/javascript" language="JavaScript"> 
        function click() {
            if (event.button == 2) {
                alert('Agenda OnLine.');
            }
        }
        document.onmousedown = click
    </script>--%>
</head>
<body runat="server" id="_body">

    <form id="_form" runat="server" name="_form" method="post">

        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                <div id="_divFrame" runat="server" style="border-style: outset; margin-top: 15px; margin-bottom: 10px; overflow-x: hidden; -webkit-border-radius: 5px 10px; -moz-border-radius: 5px 10px; background: linear-gradient(to bottom, #888888, #CCCCCC)">

                    <div class="row">

                        <div class="col-sm-12 col-md-7" style="margin-top: 20px">

                            <div class="row">
                                <div class="col">
                                    <div id="_divPanelButton" style="width: 350px; border-style: outset; border-width: 5px; border-color: #337AB7; margin-left: auto; margin-right: auto; background: linear-gradient(#265c89, #3073ac, #337AB7); text-align: center; padding-bottom: 10px" onclick="HidCal();">
                                        <p id="_labelDate" runat="server" class="control-label" style="margin-top: 15px; color: #FFFFFF" />
                                        <p id="_labelJornAM" runat="server" class="control-label" style="margin-top: 10px; color: #FFFFFF" />
                                        <p id="_labelJornPM" runat="server" class="control-label" style="margin-top: 10px; color: #FFFFFF" />
                                    </div>
                                </div>
                            </div>
                            <div id="_hr"
                                style="display: none; width: 350px; margin-top: 40px; margin-left: auto; margin-right: auto; text-align: center; color: #FFFFFF; font-weight: bold">
                                <hr />
                                Seleccione otra fecha
                            </div>
                            <div id="_divCalendario" runat="server" style="width: 352px; border-style: outset; border-width: 5px; margin-top: 20px; background-color: #337AB7; border-color: #337AB7; margin-left: auto; margin-right: auto;">
                                <asp:Calendar ID="Calendario" runat="server"
                                    OnSelectionChanged="CaledarioSelectionChanged"
                                    BackColor="White"
                                    Width="342px"
                                    DayNameFormat="Short"
                                    FirstDayOfWeek="Monday"
                                    Font-Names="Verdana"
                                    Font-Size="10pt"
                                    ForeColor="Black"
                                    ShowGridLines="True">
                                    <SelectedDayStyle Font-Bold="True" BorderColor="#000000" />
                                    <OtherMonthDayStyle ForeColor="#808080" BorderColor="#000000" />
                                    <DayStyle Font-Bold="True" HorizontalAlign="Center" BorderColor="#000000" Height="35px" />
                                    <NextPrevStyle VerticalAlign="Top" Font-Bold="true" ForeColor="#FFFFFF" />
                                    <DayHeaderStyle BackColor="LightGray" Font-Bold="True" Font-Size="9pt" HorizontalAlign="Center" BorderColor="#000000" />
                                    <TitleStyle BackColor="#337AB7" BorderColor="Black" Font-Bold="True" ForeColor="#FFFFFF" Height="35px" />
                                    <WeekendDayStyle ForeColor="#ffffff" BorderColor="#000000" />
                                </asp:Calendar>
                            </div>

                        </div>

                        <div class="col-sm-12 col-md-4" style="margin-top: 15px; margin-bottom: 15px;">
                            <div class="row">
                                <div class="col">
                                    <div id="_divGrilla" runat="server" class="col-12 no-padding" style="max-height: 430px; min-height: 430px; margin-left: 25px; margin-right: 25px; overflow-y: scroll; border-style: outset; border-width: 5px; border-color: #337AB7; background-color: #337AB7">

                                        <asp:GridView
                                            ID="_GridHorario"
                                            runat="server"
                                            AutoGenerateColumns="false"
                                            class="table"
                                            Width="342px"
                                            BorderColor="#CCCCCC"
                                            BackColor="#FFFFFF">
                                            <HeaderStyle BackColor="#337AB7" ForeColor="#FFFFFF" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="Hora" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-BackColor="#337AB7">
                                                    <ItemTemplate>
                                                        <div id="<%#Eval("Hora")%>" onclick="GetId(this)"><%#Eval("Hora")%></div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div style="display: none">
            <asp:GridView
                ID="_GridReservado"
                runat="server"
                AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="servicio" />
                    <asp:BoundField DataField="hora" />
                    <asp:BoundField DataField="usuario" />
                    <asp:BoundField DataField="telefono" />
                </Columns>
            </asp:GridView>
        </div>

    </form>

    <%--<input type="text" id="<%#Eval("Hora")%>" name="<%#Eval("Hora")%>" style="border:none; background-color:transparent; width:440px" onclick="MarcarCambio('<%#Eval("Hora")%>')" value="<%#Eval("Hora")%>" />--%>
</body>
<%--        SeleccionarOption(document.getElementById("_comboDuracion"), _duracionServicio);
        function SeleccionarOption(_select, _duracionServicio) {
            for (var i = 0; i < _select.length; i++)
                if (_select[i].value == _duracionServicio)--%>
</html>
<script language="javascript">

    $(document).ready(function () {

        _tdHTML = $("#Calendario").children("tbody").children("tr").children("td");
        _cont = 0;
        _mesEnCurso = GetMonth(_tdHTML[0].innerText);
        for (i = 1; i < _tdHTML.length; i++) {

            _cont++;

            if (_cont == 6)
                if (_tdHTML[i].innerHTML.indexOf(_mesEnCurso) > 0) {      
                    _tdHTML[i].style.backgroundColor = "#b9dee9";
                    _tdHTML[i + 1].style.backgroundColor = "#fccdd2";
                }

            if (_cont == 7)
                _cont = 0;
        }

        PintarItemsGrilla();

    });

    function GetMonth(_innerText) {
        _array = ['enero', 'febrero', 'marzo', 'abril', 'mayo', 'junio', 'julio', 'agosto', 'septiembre', 'octubre', 'noviembre', 'diciembre'];
        for (i = 0; i < _array.length; i++)
            if (_innerText.indexOf(_array[i]) > 0)
                return (_array[i]);
    }

    function PintarItemsGrilla() {

        var _horarioDefinido = $("#_GridHorario").children("tbody").children("tr").children("td");
        var _citasReservadas = $("#_GridReservado").children("tbody").children("tr").children("td");

        for (var i = 0; i < _horarioDefinido.length; i++) {
            //alert(_citasReservadas[j].innerText + ", " + _citasReservadas[j+1].innerText + ", " + _citasReservadas[i+2].innerText + ", " +  _citasReservadas[j+3].innerText);
            if (_horarioDefinido[i].innerText == 'Intermedio')
                _horarioDefinido[i].style.backgroundColor = "#CCCCCC";
            else {
                var cont = 0;
                for (var j = 0; j < _citasReservadas.length; j += 4)
                    if (_horarioDefinido[i].innerText == _citasReservadas[j + 1].innerText) {
                        cont++;
                        _horarioDefinido[i].style.color = '#FFA500';
                    }

                if (cont > 1) {
                    _horarioDefinido[i].style.backgroundColor = '#C20000';
                    _horarioDefinido[i].style.color = '#FFFFFF';
                }

            }

        }
    }

    function GetId(_tagDiv) {
        alert(_tagDiv.innerText);
    }

    function HidCal() {

        let details = navigator.userAgent;
        let regexp = /android|iphone|kindle|ipad/i;
        let isMobileDevice = regexp.test(details);

        if (isMobileDevice) {

            if ($('#_divCalendario').css("display") == 'block') {
                $("#_hr").css("display", "none");
                $("#_divCalendario").css("display", "none");
                $("#_divGrilla").css("display", "block");
            }
            else {
                $("#_hr").css("display", "block");
                $("#_divCalendario").css("display", "block");
                $("#_divGrilla").css("display", "none");
            }

        }
    }

    //const collectionDiv = $('#_Grid').options

    ////const collectionTD = document.getElementsByTagName("input");
    ////for (let j = 4; j < collectionTD.length; j++)
    ////    if (collectionTD[j].value == "Intermedio") {
    ////        collectionTD[j].style.backgroundColor = "#AAF0F0";
    ////        collectionTD[j].style.borderStyle = "outset";
    ////        collectionTD[j].style.borderWidth = "10px";
    ////        //alert(collectionTD[j].value);
    ////        /*                collectionTD[j].value = "pete";*/
    ////    }

    //////for (var i = 0; i < $("#_Grid").length; i++)
    ////alert($("#_Grid").options.);
    //////if ($("#_Grid")[i].val() == "Intermedio")
    //////    /*_select.options.item(i).selected = 'selected';*/
    //////    $("#_Grid")[i].options.item(i).css("background-color","#32CB32");

    //////let details = navigator.userAgent;
    //////let regexp = /android|iphone|kindle|ipad/i;
    //////let isMobileDevice = regexp.test(details);

    //////if (isMobileDevice)
    //////    $('#Calendario').css('width', '300px');
    //////else
    //////    $('#Calendario').css('width', '305px');

    function MarcarCambio(_hora) {
        //var algo = '"#' + _hora + '"';
        //alert($("#_Grid").html());
        const collectionTD = document.getElementsByTagName("input");
        for (let j = 4; j < collectionTD.length; j++)
            if (collectionTD[j].value == "Intermedio") {
                alert(collectionTD[j].value);
                alert(collectionTD[j].innerText);
            }
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

        <%--_cal2 = ['20231225', '20240129', '20240226', '20240325', '20240429', '20240527', '20240624', '20240729', '20240826', '20240930', '20241028', '20241125'];--%>


