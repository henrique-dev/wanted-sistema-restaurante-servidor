<%-- 
    Document   : login
    Created on : 14/01/2019, 20:12:16
    Author     : Paulo Henrique Gonçalves Bacelar <henrique.phgb@gmail.com>
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>WantedAdmin - Login</title>

        <!-- Custom fonts for this template-->
        <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">

    </head>

    <style>
        #ctn_background {
            background: url(${pageContext.request.contextPath}/resources/img/logo-wanted.png) no-repeat center center;
            background-size: 50%;
        }

        .center {
            margin: auto;
            width: 25%;
            text-align: center; 
            vertical-align: middle
        }

        .center-cmp {
            display: inline-block;
            vertical-align: middle;
        }
    </style>    

    <body style="background: #000; overflow-y: hidden">

        <div id="ctn_background" style="height: 100vh;" class="text-center">
            
        </div>
        <div id="ctn_login" style="height: 100vh;">
            <div class="row center h-100">
                <div class="col justify-content-center" style="margin-top: 30vh;">
                    <form class="user" id="formLogin" method="POST" action="${pageContext.request.contextPath}/sessao/autenticar-2">
                        <p><img src="${pageContext.request.contextPath}/resources/img/logo-wanted-escura.png" width="auto" height="100px" class="pb-3"></p>
                        <div class="form-group">
                            <input type="text" class="form-control" id="nome" name="nomeUsuario" aria-describedby="emailHelp" placeholder="Usuário">
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" id="senha" name="senhaUsuario" placeholder="Senha">
                        </div>
                        <div class="form-group">
                            <input type="submit" class="btn btn-warning btn-block text-dark" value="Entrar">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Bootstrap core JavaScript-->
        <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>

        <script>

            var login = false;

            $(document).mousemove(function() {
                if (login == false) {
                    $('html, body').animate({
                        scrollTop: $("#ctn_login").offset().top
                    }, {
                        step: function(i,j) {
                            let unR = 143 / j.end;
                            let unG = 123 / j.end;
                            let unB = 95 / j.end;
                            let R = parseInt(i * unR);
                            let G = parseInt(i * unG);
                            let B = parseInt(i * unB);                            
                            let cor = "rgb(" + R.toString() 
                                + "," + G.toString() 
                                + "," + B.toString() + ")";
                            $("body").css("background", cor);
                        },
                        duration: 2000
                    });
                    login = true;
                }                
            }); 

            $(document).ready(function() {
                $('html, body').animate({
                    scrollTop: $("#ctn_background").offset().top
                }, 1000, function() {

                });
            });
        </script>

    </body>

</html>
