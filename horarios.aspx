<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="horarios.aspx.cs" Inherits="WebAppAgenda.horarios" %>

<!DOCTYPE html>
<html lang="es-cl">
<head>
    <title>Horarios</title>
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
        <%--        _hiddenDropDownListDuracCitas: 30
        _hiddenNombre: Agenda onLine
        _hiddenTelefono: +56977573704
        _hiddenEmail: alarcon.jv@gmail.com--%>
    </div>

    <section class="row">

        <div class="col-lg-12 mb-12 bg-default text-center">

            <form id="_form" runat="server" name="_form" method="post" action="grabar.aspx">

                <div class="card" id="_card" runat="server" style="border-style: outset; padding-bottom: 15px">

                    <div class="card-header">
                        <input type="hidden" runat="server" id="TituloPagina" />
                        <h4 style="color: #FFFFFF; font-weight: bold">Definición de horarios de atención</h4>
                    </div>

                    <div class="card-block">

                        <div class="table-responsive" style="border-style: outset; border-width: 5px; border-color: #337AB7; background-color: #FFFFFF; height: 360px">

                            <asp:GridView
                                ID="_Grid"
                                runat="server"
                                AutoGenerateColumns="false"
                                Style="width: 100%"
                                class="table"
                                BorderColor="#CCCCCC"
                                BackColor="#FFFFFF">
                                <Columns>
                                    <asp:BoundField DataField="idHorario" Visible="false" />

                                    <%--                                    <asp:BoundField DataField="Atencion_dia" HeaderText="D&iacute;a" ControlStyle-BackColor="#337AB7">
                                        <HeaderStyle ForeColor="#FFFFFF" BackColor="#337AB7" HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>--%>

                                    <asp:TemplateField HeaderText="D&iacute;a" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-BackColor="#337AB7" ItemStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <input type="text" value="<%#Eval("Atencion_dia")%>" style="border-style: none; width: 75px" disabled="disabled" />
                                            <input type="hidden" name="<%#Eval("Atencion_dia")%>" id="<%#Eval("Atencion_dia")%>" value="<%#Eval("Atencion_dia")%>" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Inicio AM" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-BackColor="#337AB7">
                                        <ItemTemplate>
                                            <input type="time" name="<%#Eval("Atencion_dia")%>_Inicio_AM" id="Inicio_AM" value="<%#Eval("Inicio_AM")%>" required style="width: 85px; border-color: #F2F3F4" onchange="MarcarCambio('<%#Eval("Atencion_dia")%>')" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Fin AM" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-BackColor="#337AB7">
                                        <ItemTemplate>
                                            <input type="time" name="<%#Eval("Atencion_dia")%>_Fin_AM" id="Fin_AM" value="<%#Eval("Fin_AM")%>" required style="width: 85px; border-color: #F2F3F4" onchange="MarcarCambio('<%#Eval("Atencion_dia")%>')" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Inicio PM" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-BackColor="#337AB7">
                                        <ItemTemplate>
                                            <input type="time" name="<%#Eval("Atencion_dia")%>_Inicio_PM" id="Inicio_PM" value="<%#Eval("Inicio_PM")%>" required style="width: 85px; border-color: #F2F3F4" onchange="MarcarCambio('<%#Eval("Atencion_dia")%>')" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Fin PM" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-BackColor="#337AB7">
                                        <ItemTemplate>
                                            <input type="time" name="<%#Eval("Atencion_dia")%>_Fin_PM" id="Fin_PM" value="<%#Eval("Fin_PM")%>" required style="width: 85px; border-color: #F2F3F4" onchange="MarcarCambio('<%#Eval("Atencion_dia")%>')" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:BoundField DataField="DuracionCita" Visible="false" />

                                </Columns>
                            </asp:GridView>

                        </div>

                        <button class="btn btn-sm btn-info" onclick="Validar()" style="margin-top: 15px;">Guardar cambios</button>

                    </div>

                </div>

            </form>

            <!-- *********************************************************************************************************** -->

            <div class="modal" id="MyModal">
                <div class="modal-dialog">
                    <div id="_panelPrimary" class="panel panel-primary" style="border-color: #31B0D5">
                        <div class="panel-heading" id="_panelHeading" style="background-color: #99D9EA">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title" id="_modalTitle">Atención...</h4>
                        </div>
                        <div id="_p_Msg" runat="server" class="panel-body">Nosotros somos fuertes.</div>
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

    //if ($("#_paginaOrigen").html() == "grabar.aspx") {
    //    //alert($("#_paginaOrigen").html());
    //    if ($("#_input").html() == "") {
    //        $("#_modalTitle").html("<b>Datos aceptados...</b>");
    //        $("#_p_Msg").html('<p>Los datos de la página de "Horarios" fueron modificados exitosamente.</p>');
    //        $('#MyModal').modal('toggle');
    //    }
    //}

    let details = navigator.userAgent;
    let regexp = /android|iphone|kindle|ipad/i;
    let isMobileDevice = regexp.test(details);

    if (isMobileDevice)
        document.getElementById("_Iframe").style.height = "235px"
    else
        document.getElementById("_Iframe").style.height = "515px"

    function confModal(_dia, _jorn) {
        $('#MyModal').attr('class', 'modal');
        //$('#_panelHeading').attr('class', 'panel-footer');
        $("#_modalTitle").html("<b>Existe un error en la definición.</b>");
        $("#_p_Msg").html("<p>Error en la jornada " + _jorn + " del dia " + _dia + "</p><p>Por favor revise y corríjalo...</p>");
        $('#MyModal').modal('toggle');
    }

    function MarcarCambio(Atencion_dia) {

        switch (Atencion_dia) {
            case "Lunes":
                $("#Lunes").attr("value", "X");
                break;
            case "Martes":
                $("#Martes").attr("value", "X");
                break;
            case "Miercoles":
                $("#Miercoles").attr("value", "X");
                break;
            case "Jueves":
                $("#Jueves").attr("value", "X");
                break;
            case "Viernes":
                $("#Viernes").attr("value", "X");
                break;
            case "Sabado":
                $("#Sabado").attr("value", "X");
                break;
            case "Domingo":
                $("#Domingo").attr("value", "X");
                break;
        }
    }

    function Validar() {

        const collectionTD = document.getElementsByTagName("input");
        for (let j = 3; j < collectionTD.length; j++) {

            switch (collectionTD[j].name.substring(0, collectionTD[j].name.indexOf("_"))) {

                case "Lunes":

                    switch (collectionTD[j].id) {
                        case "Inicio_AM":
                            var Inicio_AM = collectionTD[j].value;
                            break;
                        case "Fin_AM":
                            var Fin_AM = collectionTD[j].value;
                            break;
                        case "Inicio_PM":
                            var Inicio_PM = collectionTD[j].value;
                            Inicio_PM.id = collectionTD[j].id;
                            break;
                        case "Fin_PM":
                            var Fin_PM = collectionTD[j].value;
                            Fin_PM.name = collectionTD[j].name;

                            if (Inicio_AM > Fin_AM) {
                                confModal("lunes", "de la mañana");
                                return;
                            }

                            if ((Fin_AM > Inicio_PM) && (Inicio_PM != "00:00")) {
                                confModal("lunes", "intermedia");
                                return;
                            }

                            if (Inicio_PM > Fin_PM) {
                                confModal("lunes", "de la tarde");
                                return;
                            }

                            //alert("Lunes = Inicio_AM:" + Inicio_AM + ", Fin_AM:" + Fin_AM + ", Inicio_PM:" + Inicio_PM + ", Fin_PM:" + Fin_PM);

                            break;
                    }

                    break;

                case "Martes":

                    switch (collectionTD[j].id) {
                        case "Inicio_AM":
                            var Inicio_AM = collectionTD[j].value;
                            break;
                        case "Fin_AM":
                            var Fin_AM = collectionTD[j].value;
                            break;
                        case "Inicio_PM":
                            var Inicio_PM = collectionTD[j].value;
                            break;
                        case "Fin_PM":
                            var Fin_PM = collectionTD[j].value;

                            if (Inicio_AM > Fin_AM) {
                                confModal("martes", "de la mañana");
                                return;
                            }

                            if ((Fin_AM > Inicio_PM) && (Inicio_PM != "00:00")) {
                                confModal("martes", "intermedia");
                                return;
                            }

                            if (Inicio_PM > Fin_PM) {
                                confModal("martes", "de la tarde");
                                return;
                            }

                            //alert("Martes = Inicio_AM:" + Inicio_AM + ", Fin_AM:" + Fin_AM + ", Inicio_PM:" + Inicio_PM + ", Fin_PM:" + Fin_PM);

                            break;
                    }

                    break;

                case "Miercoles":

                    switch (collectionTD[j].id) {
                        case "Inicio_AM":
                            var Inicio_AM = collectionTD[j].value;
                            break;
                        case "Fin_AM":
                            var Fin_AM = collectionTD[j].value;
                            break;
                        case "Inicio_PM":
                            var Inicio_PM = collectionTD[j].value;
                            break;
                        case "Fin_PM":
                            var Fin_PM = collectionTD[j].value;

                            if (Inicio_AM > Fin_AM) {
                                confModal("miercoles", "de la mañana");
                                return;
                            }

                            if ((Fin_AM > Inicio_PM) && (Inicio_PM != "00:00")) {
                                confModal("miercoles", "intermedia");
                                return;
                            }

                            if (Inicio_PM > Fin_PM) {
                                confModal("miercoles", "de la tarde");
                                return;
                            }

                            //alert("Miercoles = Inicio_AM:" + Inicio_AM + ", Fin_AM:" + Fin_AM + ", Inicio_PM:" + Inicio_PM + ", Fin_PM:" + Fin_PM);

                            break;
                    }

                    break;

                case "Jueves":

                    switch (collectionTD[j].id) {
                        case "Inicio_AM":
                            var Inicio_AM = collectionTD[j].value;
                            break;
                        case "Fin_AM":
                            var Fin_AM = collectionTD[j].value;
                            break;
                        case "Inicio_PM":
                            var Inicio_PM = collectionTD[j].value;
                            break;
                        case "Fin_PM":
                            var Fin_PM = collectionTD[j].value;

                            if (Inicio_AM > Fin_AM) {
                                confModal("jueves", "de la mañana");
                                return;
                            }

                            if ((Fin_AM > Inicio_PM) && (Inicio_PM != "00:00")) {
                                confModal("jueves", "intermedia");
                                return;
                            }

                            if (Inicio_PM > Fin_PM) {
                                confModal("jueves", "de la tarde");
                                return;
                            }

                            //alert("Jueves = Inicio_AM:" + Inicio_AM + ", Fin_AM:" + Fin_AM + ", Inicio_PM:" + Inicio_PM + ", Fin_PM:" + Fin_PM);

                            break;
                    }

                    break;

                case "Viernes":

                    switch (collectionTD[j].id) {
                        case "Inicio_AM":
                            var Inicio_AM = collectionTD[j].value;
                            break;
                        case "Fin_AM":
                            var Fin_AM = collectionTD[j].value;
                            break;
                        case "Inicio_PM":
                            var Inicio_PM = collectionTD[j].value;
                            break;
                        case "Fin_PM":
                            var Fin_PM = collectionTD[j].value;

                            if (Inicio_AM > Fin_AM) {
                                confModal("viernes", "de la mañana");
                                return;
                            }

                            if ((Fin_AM > Inicio_PM) && (Inicio_PM != "00:00")) {
                                confModal("viernes", "intermedia");
                                return;
                            }

                            if (Inicio_PM > Fin_PM) {
                                confModal("viernes", "de la tarde");
                                return;
                            }

                            //alert("Viernes = Inicio_AM:" + Inicio_AM + ", Fin_AM:" + Fin_AM + ", Inicio_PM:" + Inicio_PM + ", Fin_PM:" + Fin_PM);

                            break;
                    }

                    break;

                case "Sabado":

                    switch (collectionTD[j].id) {
                        case "Inicio_AM":
                            var Inicio_AM = collectionTD[j].value;
                            break;
                        case "Fin_AM":
                            var Fin_AM = collectionTD[j].value;
                            break;
                        case "Inicio_PM":
                            var Inicio_PM = collectionTD[j].value;
                            break;
                        case "Fin_PM":
                            var Fin_PM = collectionTD[j].value;

                            if (Inicio_AM > Fin_AM) {
                                confModal("sábado", "de la mañana");
                                return;
                            }

                            if ((Fin_AM > Inicio_PM) && (Inicio_PM != "00:00")) {
                                confModal("sábado", "intermedia");
                                return;
                            }

                            if (Inicio_PM > Fin_PM) {
                                confModal("sábado", "de la tarde");
                                return;
                            }

                            //alert("Sabado = Inicio_AM:" + Inicio_AM + ", Fin_AM:" + Fin_AM + ", Inicio_PM:" + Inicio_PM + ", Fin_PM:" + Fin_PM);

                            break;
                    }

                    break;

                case "Domingo":

                    switch (collectionTD[j].id) {
                        case "Inicio_AM":
                            var Inicio_AM = collectionTD[j].value;
                            break;
                        case "Fin_AM":
                            var Fin_AM = collectionTD[j].value;
                            break;
                        case "Inicio_PM":
                            var Inicio_PM = collectionTD[j].value;
                            break;
                        case "Fin_PM":
                            var Fin_PM = collectionTD[j].value;

                            if (Inicio_AM > Fin_AM) {
                                confModal("domingo", "de la mañana");
                                return;
                            }

                            if ((Fin_AM > Inicio_PM) && (Inicio_PM != "00:00")) {
                                confModal("domingo", "intermedia");
                                return;
                            }

                            if (Inicio_PM > Fin_PM) {
                                confModal("domingo", "de la tarde");
                                return;
                            }

                            //alert("Domingo = Inicio_AM:" + Inicio_AM + ", Fin_AM:" + Fin_AM + ", Inicio_PM:" + Inicio_PM + ", Fin_PM:" + Fin_PM);

                            break;
                    }

                    break;

            }
            //alert(collectionTD[j].name + " " + collectionTD[j].id + " " + collectionTD[j].value);
            //alert(collectionTD[j].name.substring(0,collectionTD[j].name.indexOf("_")));
        }

        //$('#_form').attr('action', 'grabar.aspx');
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

</script>

<%--  SELECT id idHorario
          ,descripcion Descripcion
          ,AMDesde Inicio_AM
          ,AMHasta Fin_AM
          ,PMDesde Inicio_PM
          ,PMHasta Fin_PM
          ,DuracionCita
        FROM emitin.emitinc1.jorn12891927--%>

<%--<button type="button" class="btn btn-sm btn-info" onclick="$('#MyModal').modal('toggle')" style="margin-top: 2%; margin-bottom: 2%">Guardar cambios</button>--%>


<%--var array = 
    [
        {"name":"Joe", "age":17}, 
        {"name":"Bob", "age":17}, 
        {"name":"Carl", "age": 35}
    ]--%>

<%--// Create an object:
const car = {type:"Fiat", model:"500", color:"white"};--%>