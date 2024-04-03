<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="error.aspx.cs" Inherits="WebAppAgenda.error" %>

<!DOCTYPE html>
<html lang="es-cl">
<head>
    <title>Error</title>
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
<body runat="server" id="_body" style="width: 100%">

    <section class="row">

        <div class="col-lg-12 mb-12 bg-default">

            <div class="card text-center">

                <div class="card-header">
                    <h4 style="color: #FFFFFF; font-weight: bolder">E r r o r</h4>
                </div>
                <div class="card-block">
                    <div class="table-responsive text-left" style="margin-left: 5%; margin-right: 5%;">

                        <asp:Panel ID="Panel_ex_Message" runat="server"></asp:Panel>
                        <asp:Panel ID="Panel_ex_Page" runat="server"></asp:Panel>

                    </div>

                    <br />
                    <br />

                </div>

            </div>

        </div>

    </section>

    <!-- *********************************************************************************************************** -->
    <div class="modal fade" id="ventanaModal">
        <div class="modal-dialog">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" id="titularModal">Atención...</h4>
                </div>
                <div class="panel-body" id="mensajeModal">
                </div>
                <div class="panel-footer text-right">
                    <button type="button" class="btn btn-sm btn-info" data-dismiss="modal">Aceptar</button>
                </div>
            </div>
        </div>
    </div>
    <%--                        <%

                            // Create a character array.
                            char[] charArray = {'H', 'e', 'l', 'l', 'o', ',', ' ',
                           'w', 'o', 'r', 'l', 'd'};

                            // Write a character array to the client.
                            Response.Write(charArray, 0, charArray.Length);

                            // Write a single characher.
                            Response.Write(';');

                            // Write a sub-section of a character array to the client.
                            Response.Write(charArray, 0, 5);
                            // <snippet6>
                            // Write an object to the client.
                            object obj = (object)13;
                            Response.Write(obj);
                            // </snippet6>

                        %>--%>
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


    //$.ajax({
    //    type: "POST",
    //    url: "reservas.aspx",
    //    data: '{txtUserName: "pepito", txtPassWord: "Carlito"}',
    //    contentType: "application/json; charset=utf-8",
    //    dataType: "json",
    //    async: false,
    //    success: OnSuccess,
    //    failure: function (response) {
    //        alert(response.d);
    //    }
    //});

</script>




