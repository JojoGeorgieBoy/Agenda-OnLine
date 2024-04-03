<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grabar.aspx.cs" Inherits="WebAppAgenda.grabar" %>

<!DOCTYPE html>
<html lang="es-cl">
<head>
    <title>resultado</title>
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

    <section class="row">

        <div class="col-lg-12 mb-12 bg-default">

            <div class="card text-center" id="_card" runat="server">

                <div class="card-header">
                    <h4 runat="server" id="_titulo" style="color: #FFFFFF; font-weight: bold">Resultado</h4>
                </div>
                <hr />
                <div class="card-block">
                    <div class="table-responsive">
                        <h4>
                            <asp:Label runat="server" ID="_LabelTextOperacion"></asp:Label></h4>
                        <h4>
                            <asp:Label runat="server" ID="_LabelIdTextBoxServicio"></asp:Label></h4>
                        <h4>
                            <asp:Label runat="server" ID="_LabelTextBoxServicio"></asp:Label></h4>
                        <h4>
                            <asp:Label runat="server" ID="_LabelComboIdDuracionServicio"></asp:Label></h4>

                        <%--                        <h4>
                            <asp:Label runat="server" ID="_LabelinputRut"></asp:Label></h4>
                        <h4>
                            <asp:Label runat="server" ID="_LabelDropDownListDuracCitas"></asp:Label></h4>
                        <h4>
                            <asp:Label runat="server" ID="_LabelinputNombre"></asp:Label></h4>
                        <h4>
                            <asp:Label runat="server" ID="_LabelinputTelefono"></asp:Label></h4>
                        <h4>
                            <asp:Label runat="server" ID="_LabelinputEmail"></asp:Label></h4>--%>

                        <%--                        <h4>
                         Lunes: 
                            <asp:Label runat="server" ID="_Lunes"></asp:Label>, 
                         Martes: 
                            <asp:Label runat="server" ID="_Martes"></asp:Label>, 
                         Miercoles: 
                            <asp:Label runat="server" ID="_Miercoles"></asp:Label>, 
                         Jueves: 
                            <asp:Label runat="server" ID="_Jueves"></asp:Label>
                         Viernes: 
                            <asp:Label runat="server" ID="_Viernes"></asp:Label>, 
                         Sabado: 
                            <asp:Label runat="server" ID="_Sabado"></asp:Label>, 
                         Domingo: 
                            <asp:Label runat="server" ID="_Domingo"></asp:Label></h4>--%>

                        <%--                        <h4>
                        Lunes_Inicio_AM: 
                            <asp:Label runat="server" ID="_Lunes_Inicio_AM"></asp:Label>, 
                        Lunes_Fin_AM: 
                            <asp:Label runat="server" ID="_Lunes_Fin_AM"></asp:Label>, 
                        Lunes_Inicio_PM: 
                            <asp:Label runat="server" ID="_Lunes_Inicio_PM"></asp:Label>, 
                        Lunes_Fin_PM: 
                            <asp:Label runat="server" ID="_Lunes_Fin_PM"></asp:Label></h4>

                        <h4>
                         Martes_Inicio_AM: 
                            <asp:Label runat="server" ID="_Martes_Inicio_AM"></asp:Label>, 
                         Martes_Fin_AM: 
                            <asp:Label runat="server" ID="_Martes_Fin_AM"></asp:Label>, 
                         Martes_Inicio_PM: 
                            <asp:Label runat="server" ID="_Martes_Inicio_PM"></asp:Label>, 
                         Martes_Fin_PM: 
                            <asp:Label runat="server" ID="_Martes_Fin_PM"></asp:Label></h4>

                        <h4>
                         Miercoles_Inicio_AM: 
                            <asp:Label runat="server" ID="_Miercoles_Inicio_AM"></asp:Label>, 
                         Miercoles_Fin_AM: 
                            <asp:Label runat="server" ID="_Miercoles_Fin_AM"></asp:Label>, 
                         Miercoles_Inicio_PM: 
                            <asp:Label runat="server" ID="_Miercoles_Inicio_PM"></asp:Label>, 
                         Miercoles_Fin_PM: 
                            <asp:Label runat="server" ID="_Miercoles_Fin_PM"></asp:Label></h4>

                        <h4>
                         Jueves_Inicio_AM: 
                            <asp:Label runat="server" ID="_Jueves_Inicio_AM"></asp:Label>, 
                         Jueves_Fin_AM: 
                            <asp:Label runat="server" ID="_Jueves_Fin_AM"></asp:Label>, 
                         Jueves_Inicio_PM: 
                            <asp:Label runat="server" ID="_Jueves_Inicio_PM"></asp:Label>, 
                         Jueves_Fin_PM: 
                            <asp:Label runat="server" ID="_Jueves_Fin_PM"></asp:Label></h4>

                        <h4>
                         Viernes_Inicio_AM: 
                            <asp:Label runat="server" ID="_Viernes_Inicio_AM"></asp:Label>, 
                         Viernes_Fin_AM: 
                            <asp:Label runat="server" ID="_Viernes_Fin_AM"></asp:Label>, 
                         Viernes_Inicio_PM: 
                            <asp:Label runat="server" ID="_Viernes_Inicio_PM"></asp:Label>, 
                         Viernes_Fin_PM: 
                            <asp:Label runat="server" ID="_Viernes_Fin_PM"></asp:Label></h4>

                        <h4>
                         Sabado_Inicio_AM: 
                            <asp:Label runat="server" ID="_Sabado_Inicio_AM"></asp:Label>, 
                         Sabado_Fin_AM: 
                            <asp:Label runat="server" ID="_Sabado_Fin_AM"></asp:Label>, 
                         Sabado_Inicio_PM: 
                            <asp:Label runat="server" ID="_Sabado_Inicio_PM"></asp:Label>, 
                         Sabado_Fin_PM: 
                            <asp:Label runat="server" ID="_Sabado_Fin_PM"></asp:Label></h4>

                        <h4>
                         Domingo_Inicio_AM: 
                            <asp:Label runat="server" ID="_Domingo_Inicio_AM"></asp:Label>, 
                         Domingo_Fin_AM: 
                            <asp:Label runat="server" ID="_Domingo_Fin_AM"></asp:Label>, 
                         Domingo_Inicio_PM: 
                            <asp:Label runat="server" ID="_Domingo_Inicio_PM"></asp:Label>, 
                         Domingo_Fin_PM: 
                            <asp:Label runat="server" ID="_Domingo_Fin_PM"></asp:Label></h4>--%>
                    </div>

                </div>

                <button type="button" class="btn btn-sm btn-info" data-toggle="modal" data-target="#myModal" style="margin-top: 3%; margin-bottom: 3%">Abrir Mensaje</button>

            </div>
            <%--            	SELECT 		
		            j.descripcion,
		            j.AMDesde,
		            j.AMHasta,
		            j.PMDesde,
		            j.PMHasta,
		            j.DuracionCita
	            FROM
		            emitinc1.jorn12891927 j
	            WHERE 
		            descripcion = @descripcion--%>
        </div>

    </section>

    <!-- *********************************************************************************************************** -->
    <div class="modal fade" id="myModal">
        <div class="modal-dialog">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Atención...</h4>
                </div>
                <div id="_p_Msg" runat="server" class="panel-body" />
                <div class="panel-footer text-right">
                    <button type="button" class="btn btn-sm btn-info" data-dismiss="modal">Aceptar</button>
                </div>
            </div>
        </div>
    </div>

</body>

</html>


<script language="javascript">

    let details = navigator.userAgent;
    let regexp = /android|iphone|kindle|ipad/i;
    let isMobileDevice = regexp.test(details);

    if (isMobileDevice) {
        document.getElementById("_Iframe").style.height = "635px";
    } else {
        document.getElementById("_Iframe").style.height = "515px";
    }

</script>


<%-- $(document).ready(function(){
    let servicios = ["Corte", "Tintura", "Alisado", "Ondulaci&oacute;n", "Peinado", "Lavado"]
    servicios.forEach(myFunction);
 });

 function myFunction(item) {
    $("select").append('<option value="' + item + '">' + item + '</option>');
}


function msg()
{
    alert("Grabando")
}

function poblar(objeto)
{
    // alert(objeto.id);
    //  var select = document.getElementById(objeto.id);
    //  alert(select);

    //  var nuevoCSS = { "background": 'blue', "font-weight" : 'bold' };

    //  $("select").css(nuevoCSS);

    

    // $('#TipoServicio').append('<option value="CorteDePelo">Corte de pelo</option>');

}

// function chequear_deschequear(parametro)
// {
//     parametro.name=parametro.id;
 
//     alert(parametro.name);

// }

   $("#anclka").click(function () {
    var var1 = $("#var1").val();
    var var2 = $("#var2").val();
      $.ajax({
      url:'recibo.php',
      data:{var1:var1,var2:var2},
      type:'POST',
      datatype:'json'

    }).done(function(data, textStatus, jqXHR) {

     console.log( "La solicitud se ha completado correctamente." );
     window.location.href = "aqui pagina que se desea redireccionar";
    })
     .fail(function(jqXHR, textStatus, errorThrown) {
     console.log( "La solicitud a fallado: " +  textStatus)
     })

  });

function GrabarRow(objeto)
{
    // alert(objeto.id);
    if (ValidarVacios(objeto)){
        var DatosSentencia_SQL = "Grabando: ";
        DatosSentencia_SQL += "Horario=" + eval("Horario" + objeto.id).value + ",";
        DatosSentencia_SQL += "RutCli=" + eval("RutCli" + objeto.id).value + ",";
        DatosSentencia_SQL += "UsuarioServicio=" + eval("UsuarioServicio" + objeto.id).value + ",";
        DatosSentencia_SQL += "Telefono=" + eval("Telefono" + objeto.id).value + ",";
        DatosSentencia_SQL += "TipoServicio=" + eval("TipoServicio" + objeto.id).value;
        alert(DatosSentencia_SQL);
    };
 }

 function ValidarVacios(objeto)
{
       if (eval("RutCli" + objeto.id).value == "") 
       {
        alert("Por favor ingrese el rut de cliente");
        return false;
        }
        if (eval("UsuarioServicio" + objeto.id).value == "") 
       {
        alert("Por favor ingrese el nombre del cliente");
        return false;
        }
        if (eval("Telefono" + objeto.id).value == "") 
       {
        alert("Por favor ingrese el Telefono de cliente");
        return false;
        }
        if (eval("TipoServicio" + objeto.id).value == "") 
       {
        alert("Por favor seleccione el servicio requerido");
        return false;
        }                        

    // if )
    // {
    //     alert("Horario VACIO");
    //     return false;
    // }
    // else
    // {
    //     
    // };
    // alert(objeto.id);
    // alert(eval("Horario" + objeto.id).value);
    // alert(eval("RutCli" + objeto.id).value);
    // alert(eval("UsuarioServicio" + objeto.id).value);
    // alert(eval("Telefono" + objeto.id).value);
    // alert(eval("TipoServicio" + objeto.id).value);
    return true;
 }--%>