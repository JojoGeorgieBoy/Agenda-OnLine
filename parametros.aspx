<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="parametros.aspx.cs" Inherits="WebAppAgenda.parametros" %>

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
        _input:&nbsp;<span runat="server" id="_input"></span><br />
        _inputNoValido:&nbsp;<span runat="server" id="_inputNoValido"></span><br />
        _hiddenDropDownListDuracCitas:&nbsp;<span runat="server" id="_hiddenDropDownListDuracCitas"></span><br />
        <div style="display: none">
            _hiddenRut:&nbsp;<span runat="server" id="_hiddenRut"></span><br />
        </div>
        _hiddenNombre:&nbsp;<span runat="server" id="_hiddenNombre"></span><br />
        _hiddenTelefono:&nbsp;<span runat="server" id="_hiddenTelefono"></span><br />
        _hiddenEmail:&nbsp;<span runat="server" id="_hiddenEmail"></span><br />
    </div>
    <section class="row">

        <div class="col-lg-12 mb-12 bg-default text-center">

            <div class="card" id="_card" runat="server" style="border-style: outset">

                <div class="card-header text-white bg-primary" style="margin: 0; padding: 5px; border-style: solid; border-width: thin; border-color: #FFFFFF; background: linear-gradient(#265c89, #3073ac, #337AB7); -webkit-border-radius: 5px 10px; -moz-border-radius: 5px 10px;">
                    <h4 id="ParamIntern" style="font-weight: bold">Parámetros internos</h4>
                </div>

                <div class="card-block" style="-webkit-border-radius: 5px 10px; -moz-border-radius: 5px 10px; padding-top: 5px;">

                    <div class="table-responsive">

                        <form id="_form" name="_form" runat="server" method="post">

                            <div class="card-block" style="margin-left: 20%; margin-right: 20%; padding-top: 5%">

                                <div class="form-group row">
                                    <asp:Label runat="server" CssClass="col-md-5 col-form-label" Text="Duración de cada cita" Font-Bold="true" />
                                    <div class="col-md-7">
                                        <asp:DropDownList
                                            runat="server"
                                            ID="DropDownListDuracCitas"
                                            name="DropDownListDuracCitas"
                                            Font-Size="Large"
                                            class="custom-select form-control" />
                                    </div>
                                </div>

                                <hr />

                                <div class="form-group row" style="display: none">
                                    <label class="col-md-5 col-form-labell">Rut</label>
                                    <div class="col-md-7">
                                        <input
                                            type="text"
                                            runat="server"
                                            name="inputRut"
                                            id="inputRut" />
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-5 col-form-label">Nombre comercial</label>
                                    <div class="col-md-7">
                                        <input
                                            type="text"
                                            runat="server"
                                            name="inputNombre"
                                            id="inputNombre"
                                            class="form-control"
                                            onclick="_normalizarTexto(this)"
                                            onmouseout="_normalizarTexto(this)"
                                            onchange="_normalizarTexto(this)"
                                            onmouseover="_normalizarTexto(this)"
                                            autocomplete="off"
                                            title="El nombre comercial es requerido"
                                            maxlength="30" />
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-5 col-form-label">Teléfono o Whatsapp</label>
                                    <div class="col-md-7">
                                        <input
                                            type="text"
                                            runat="server"
                                            name="inputTelefono"
                                            id="inputTelefono"
                                            class="form-control"
                                            onclick="_normalizarTexto(this)"
                                            onmouseout="_normalizarTexto(this)"
                                            onchange="_normalizarTexto(this)"
                                            onmouseover="_normalizarTexto(this)"
                                            value="+569"
                                            autocomplete="off"
                                            title="Por favor ingrese un telefóno válido" />
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-5 col-form-label">E-Mail</label>
                                    <div class="col-md-7">
                                        <input
                                            type="text"
                                            runat="server"
                                            name="inputEmail"
                                            id="inputEmail"
                                            class="form-control"
                                            onmouseout="_normalizarTexto(this)"
                                            onchange="_normalizarTexto(this)"
                                            onmouseover="_normalizarTexto(this)"
                                            value="+569"
                                            title="Por favor ingrese un E-Mail válido"
                                            autocomplete="off" />
                                    </div>
                                </div>

                            </div>

                            <br />

                        </form>

                    </div>

                </div>

                <p>
                    <button runat="server" class="btn btn-sm btn-info" onclick="validar()" style="margin-top: 2%; margin-bottom: 2%">Guardar datos</button>
                </p>

            </div>

            <!-- *********************************************************************************************************** -->

            <div class="modal" id="MyModal">

                <div class="modal-dialog">

                    <div id="_panelPrimary" class="panel panel-primary" style="border-color: #31B0D5">

                        <div class="panel-heading" id="_panelHeading" style="background-color: #99D9EA">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title" id="_modalTitle">Atención...</h4>
                        </div>

                        <div id="_p_Msg" runat="server" class="panel-body">Nosotros somos fuertes. Nostros somos ricos. Nostros estamos llenos de suerte y armonía</div>

                        <div class="panel-footer text-right">
                            <button type="button" class="btn btn-sm btn-info" data-dismiss="modal">Aceptar</button>
                        </div>

                    </div>

                </div>

            </div>

        </div>

    </section>

</body>

</html>

<script language="javascript">

    //function _SiZer() {

    //    $('#_hiddenDropDownListDuracCitas').val('_hiddenDropDownListDuracCitas: ' + $('#_hiddenDropDownListDuracCitas').val().trim() + ', largo: ' + $('#_hiddenDropDownListDuracCitas').val().trim().length());
    //    $('#_hiddenNombre').val('_hiddenNombre: ' + $('#_hiddenNombre').val().trim() + ', largo: ' + $('#_hiddenNombre').val().trim().length());
    //    $('#_hiddenTelefono').val('_hiddenTelefono: ' + $('#_hiddenTelefono').val().trim() + ', largo: ' + $('#_hiddenDropDownListDuracCitas').val().trim().length());
    //    $('#_hiddenEmail').val('_hiddenEmail: ' + $('#_hiddenEmail').val().trim() + ', largo: ' + $('#_hiddenEmail').val().trim().length());

    //}

    //if ($("#TituloPagina").val() == "parametros.aspx") {
    //    alert($("#TituloPagina").html());
    //    //$("#_p_Msg").html("<p>Datos grabados exitosamente</p>");
    //    //$('#myModal').modal('toggle');
    //}

    if ($("#_paginaOrigen").html() == "grabar.aspx") {
        if ($("#_input").html() != "") {
            ////    $("#_modalTitle").html("<b>Datos aceptados...</b>");
            ////    $("#_p_Msg").html('<p>Los datos de la página de Parámetros internos" fueron modificados exitosamente.</p>');
            //$("#ParamIntern").html("Los datos fueron modificados exitosamente.");
            //setTimeout(function () { $("#ParamIntern").html("Parámetros internos"); }, 3000);
            //}
            //else {
            $('#MyModal').attr('class', 'modal');
            //$('#_panelHeading').attr('class', 'panel-footer');
            $("#_modalTitle").html("<b>Existe uno o más caracteres no válidos.</b>");
            switch ($("#_input").html()) {
                case "inputNombre":
                    {
                        $("#_p_Msg").html("<p>El nombre comercial ingresado: " + $("#_inputNoValido").html() + " no es válido.<br />Por lo tanto no fue posible admitir dicha modificación.</p>");
                        break;
                    }
                case "inputTelefono":
                    {
                        $("#_p_Msg").html("<p>El teléfono o Whatsapp ingresado: " + $("#_inputNoValido").html() + " no es válido.<br />Por lo tanto no fue posible admitir dicha modificación.</p>");
                        break;
                    }
                case "inputEmail":
                    {
                        $("#_p_Msg").html("<p>El correo electrónico ingresado: " + $("#_inputNoValido").html() + " no es válido.<br />Por lo tanto no fue posible aceptar dicha modificación.</p>");
                        break;
                    }
            }
            $('#MyModal').modal('toggle');
        }
    }

    function validar() {
        let details = navigator.userAgent;
        let regexp = /android|iphone|kindle|ipad/i;
        let isMobileDevice = regexp.test(details);

        if ($('#inputNombre').val().trim().length == 0) {

            _resaltar($('#inputNombre'));

            if (isMobileDevice)
                _placeholder($('#inputNombre'), "Ingrese un nombre comercial");
            else
                _placeholder($('#inputNombre'), "Por favor ingrese un nombre comercial");

            return false;
        }

        if ($('#inputTelefono').val().length == 0) {

            _resaltar($('#inputTelefono'));

            //let details = navigator.userAgent;
            //let regexp = /android|iphone|kindle|ipad/i;
            //let isMobileDevice = regexp.test(details);

            if (isMobileDevice)
                _placeholder($('#inputTelefono'), "Ingrese un teléfono o whatsapp");
            else
                _placeholder($('#inputTelefono'), "Por favor ingrese teléfono o whatsapp");

            return false;
        }

        if ($('#inputEmail').val().length == 0) {

            _resaltar($('#inputEmail'));

            //let details = navigator.userAgent;
            //let regexp = /android|iphone|kindle|ipad/i;
            //let isMobileDevice = regexp.test(details);

            if (isMobileDevice)
                _placeholder($('#inputEmail'), "Ingrese un correo electrónico");
            else
                _placeholder($('#inputEmail'), "Por favor ingrese un correo electrónico");

            return false;
        }

        ////alert($('#_hiddenDropDownListDuracCitas').html().trim() + ', ' + $('#DropDownListDuracCitas').val().trim());
        ////alert($('#_hiddenNombre').html().trim() + ', ' + $('#inputNombre').val().trim());
        ////alert($('#_hiddenTelefono').html().trim() + ', ' + $('#inputTelefono').val().trim());
        ////alert($('#_hiddenEmail').html().trim() + ', ' + $('#inputEmail').val().trim());

        ////alert($('#_hiddenDropDownListDuracCitas').html().trim());
        ////alert($('#_hiddenNombre').html().trim());
        ////alert($('#_hiddenTelefono').html().trim());
        ////alert($('#_hiddenEmail').html().trim());

        //alert($('#_hiddenDropDownListDuracCitas').html().trim() == $('#DropDownListDuracCitas').val().trim());
        //alert($('#_hiddenNombre').html().trim() == $('#inputNombre').val().trim());
        //alert($('#_hiddenTelefono').html().trim() == $('#inputTelefono').val().trim());
        //alert($('#_hiddenEmail').html().trim() == $('#inputEmail').val().trim());

        //return false;

        if ($('#_hiddenDropDownListDuracCitas').html().trim() == $('#DropDownListDuracCitas').val().trim() && $('#_hiddenNombre').html().trim() == $('#inputNombre').val().trim() && $('#_hiddenTelefono').html().trim() == $('#inputTelefono').val().trim() && $('#_hiddenEmail').html().trim() == $('#inputEmail').val().trim())
            return false;

        $('#_form').attr('action', 'grabar.aspx');
        $("#_form").submit();

    }


    function _resaltar(x) {
        // x.style.fontWeight = "bold"   
        //x.style.backgroundColor = "#F2F5A9";
        //x.style.color = "#0404B4";
        // x.style.textDecoration = "underline";
        // x.style.border = "none";  
        x.css("background-color", "#F2F5A9");
        //$('#inputNombre').style.color = "#0404B4";
        x.focus();
    }

    function _placeholder(x, _msg) {
        $(x).attr("placeholder", _msg);
    }

    function _normalizar(x) {
        // x.style.fontWeight = "normal"    
        x.style.backgroundColor = "#E8F0FE";
        x.style.color = "#3C4142";
        // x.style.textDecoration = "underline";    
        // x.style.border = "none"; 
    }

    function _normalizarTexto(x) {
        x.style.backgroundColor = "#FFFFFF";
        x.style.color = "#000000";
        //$(x).attr("placeholder", "");
        x.placeholder = "";
    }

    function Ocultar(x) {
        $(x).css("display", "none");
    }

    function Desplegar(x) {
        $(x).css("display", "block");
    }

    function ltrim(s) {
        return s.replace(/^\s+/, "");
    }

    function rtrim(s) {
        return s.replace(/\s+$/, "");
    }

    function trim(s) {
        return rtrim(ltrim(s));
    }

    //if ($("#_p_Msg").attr("value", "parametros.aspx"))
    //{
    //    alert("parametros.aspx");
    //}

    function pete() {
        var term = "sample1";
        var re = new RegExp("^([a-zA-Z0-9]{5,})$");
        if (re.test(term)) {
            alert("Valid");
        } else {
            alert("Invalid");
        }
        //$('#myModal').modal('toggle');
    }

</script>
