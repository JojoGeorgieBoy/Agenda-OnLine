<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="WebAppAgenda._default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="es-cl">

<head>
    <title>Agenda</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=2.0, shrink-to-fit=no" />
    <meta name='robots' content='noindex, nofollow' />
    <link rel="shortcut icon" href="favicon.png" />
    <meta name="keywords" content="bootstrap, bootstrap4" />
    <link href="dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/tiny-slider.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
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

<body>

    <nav class="custom-navbar navbar navbar navbar-expand-md navbar-dark bg-dark" arial-label="navigation bar">

        <div class="container">
            <%--<span id="_spanEmpresa" runat="server" class="navbar-brand" onclick="Viaje('reservas.aspx')">AGENDA On-Line.&nbsp;</span>--%>
            <a id="_spanEmpresa" runat="server" class="navbar-brand" href="default.aspx">AGENDA On-Line.&nbsp;</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbars" aria-controls="navbars" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbars">
                <ul class="custom-navbar-nav navbar-nav ms-auto mb-2 mb-md-0">
                    <%--<li><a class="nav-link" onclick="Viaje('reservas.aspx')">&nbsp;Reservas&nbsp;</a></li>--%>
                    <li><a class="nav-link" onclick="Viaje('servicios.aspx')">&nbsp;Servicios&nbsp;</a></li>
                    <li><a class="nav-link" onclick="Viaje('horarios.aspx')">&nbsp;Horarios&nbsp;</a></li>
                    <li><a class="nav-link" onclick="Viaje('parametros.aspx')">&nbsp;Parámetros&nbsp;</a></li>
                    <%--<li><a class="nav-link" onclick="Viaje('Test.aspx')">&nbsp;Test&nbsp;</a></li>--%>
                </ul>
            </div>
        </div>

    </nav>

    <div style="scroll-behavior:auto">
        <iframe id="_Iframe" runat="server" marginheight="0" marginwidth="0" frameborder="0"
            align="top" allowtransparency="yes" style="width: 100%" />
    </div>

    <footer>
        <span>Desarrollado por: <a href="https://www.linkedin.com/in/jorge-eduardo-alarc%C3%B3n-vallejos-42184256/">Jorge Alarcón</a></span>
    </footer>

    <%--Para que funcione el menú en smartphones--%>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/tiny-slider.js"></script>
    <script src="js/custom.js"></script>

</body>
</html>
<script language="javascript">

    function Viaje(pagina) {
        document.getElementById('_Iframe').src = pagina;
    }

</script>
