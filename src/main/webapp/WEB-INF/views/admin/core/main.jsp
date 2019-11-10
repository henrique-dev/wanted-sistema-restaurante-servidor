<%-- 
    Document   : main
    Created on : 11 de ago de 2019, 12:15:49
    Author     : Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <title>WantedAdmin</title>

        <!-- Custom fonts for this template-->
        <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">

    </head>

    <style>
        .mbg-content {
            background-color: #ece9e4 !important;
        }

        .mbg-primary {
            background-color: #614820; 
        }

        .mbg-card {
            background-color: #d1c5b2;
            color: #000;
        }

        .mbg-sub-card {
            background-color: #cfc8bc;
            color: #000;
        }

        .mbtn-primary {
            background-color: #614820;
            color: white;
        }

        .btn-primary {
            background-color: #614820 !important;
        }

        .mbtn-primary:hover {
            background-color: #614840;
            color: white;
        }

        table {
            overflow-x: hidden;            
        }

        thead {
            background-color: #706554;
            color: #fff;
        }

        tbody {
            background-color: #efece8;
            color: #000;
        }

        table, th, tr, td {
            border: 1px solid #999 !important;
        }        

        .dataTables_filter {
            width: auto;
            float: right;
            text-align: left;
        }

        .page-item.active .page-link {
            color: #fff !important;
            background-color: #614820 !important;
            border-color: #614820 !important; 
        }

        .page-link {
            color: #000 !important;
            background-color: #fff !important;
            border: 1px solid #dee2e6 !important; 
        }

        .page-link:hover {
            color: #fff !important;
            background-color: #614840 !important;
            border-color: #614840 !important; 
        }

        a.active {
            color:#614820 !important;
        }

        .form-control {
            border-color: #999 !important;
        }

        .form-control:focus {
            border-color: rgba(160, 145, 121, 0.5);
            box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset, 0 0 10px rgba(160, 145, 121, 1);            
        }

        .card {
            border-color: #999 !important;
            background-color: #dfdad2;
            color: black;
        }

        .ctn-card {
            border-color: #999 !important;
        }

        div.notification {
            position: fixed;
            z-index: 9;            
            float: right;
            width: calc(20% - 20px);
            height: 50px;
            left: calc(100% - 20%);
            top: 20px;
            background-color: #ece9e4 !important;
            border-color: #999 !important;            
            border-radius: 5px;
            padding: 2px;
            display: none;
        }
        div.notification a {
            color: white;
            height: 100%;
        }
    </style>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav mbg-primary sidebar sidebar-dark accordion" id="accordionSidebar">                

                <br>

                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>

                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block">

                <!-- Sidebar - Brand -->                
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <img class="img-thumbnail" src="${pageContext.request.contextPath}/resources/img/logo-wanted-escura.png">
                    </div>
                    <div class="sidebar-brand-text mx-3">Wanted Restaurante</div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Dashboard -->
                <li class="nav-item active">
                    <a class="nav-link" href="${pageContext.request.contextPath}/gerenciador/index.html">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Pedidos</span></a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Heading -->
                <div class="sidebar-heading">
                    Produtos
                </div>

                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#menu_estoque" aria-expanded="true" aria-controls="menu_estoque">
                        <i class="fas fa-fw fa-book"></i>
                        <span>Estoque</span>
                    </a>
                    <div id="menu_estoque" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">

                    </div>
                </li>

                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#menu_produtos" aria-expanded="true" aria-controls="menu_produtos">
                        <i class="fas fa-fw fa-plus"></i>
                        <span>Cadastro</span>
                    </a>
                    <div id="menu_produtos" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <a id="menu_item_itens" class="collapse-item" href="${pageContext.request.contextPath}/gerenciador/itens">Itens</a>
                            <a id="menu_item_generos" class="collapse-item" href="${pageContext.request.contextPath}/gerenciador/generos">Genêros</a>
                            <a id="menu_item_complementos" class="collapse-item" href="${pageContext.request.contextPath}/gerenciador/complementos">Complementos</a>
                            <a id="menu_item_ingredientes" class="collapse-item" href="${pageContext.request.contextPath}/gerenciador/ingredientes">Ingredientes</a>
                        </div>
                    </div>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Heading -->
                <div class="sidebar-heading">
                    Clientes
                </div>

                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#menu_clientes" aria-expanded="true" aria-controls="menu_clientes">
                        <i class="fas fa-fw fa-book"></i>
                        <span>Gerenciar</span>
                    </a>
                    <div id="menu_clientes" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <a id="menu_cliente_todos" class="collapse-item" href="${pageContext.request.contextPath}/gerenciador/clientes">Todos</a>
                        </div>
                    </div>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Heading -->
                <div class="sidebar-heading">
                    Cupons
                </div>

                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#menu_cupons" aria-expanded="true" aria-controls="menu_cupons">
                        <i class="fas fa-fw fa-book"></i>
                        <span>Gerenciar</span>
                    </a>
                    <div id="menu_cupons" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <a id="menu_cupom_todos" class="collapse-item" href="${pageContext.request.contextPath}/gerenciador/cupons">Todos</a>
                        </div>
                    </div>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Nav Item - Dashboard -->
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/sessao/sair-2">
                        <i class="fas fa-fw fa-sign-out-alt"></i>
                        <span>Sair</span></a>
                </li>

            </ul>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content" class="mbg-content">

                    <!-- Begin Page Content -->
                    <div id="ctn_alerta"></div>
                    <div id="ctn_conteudo" class="container-fluid h-100">

                    </div>
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->                

            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-primary" href="login.html">Logout</a>
                    </div>
                </div>
            </div>
        </div>

        <div id="ctn_notificacao" class="notification ctn-card mbg-primary">
            <a class="btn mbg-primary w-100" href="index">Voce possuí um novo pedido</a>
        </div>

        <!-- Bootstrap core JavaScript-->
        <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>

    </body>

    <script type="text/javascript" >

        var msg_tipo = "${param.msg_tipo}";
        var msg = "${param.msg}";
        var menuAtual;
        var audioElement;
        var sock;

        if (msg != "") {
            alertar(msg_tipo, msg);
        }

        function alertar(tipo, mensagem) {
            if (tipo == "warning" || tipo == "success" || tipo == "danger") {
                $("#ctn_alerta").empty();
                $("#ctn_alerta").append(
                        "<div id='ctn_alerta' class='alert-" + tipo + " show alert alert-dismissible fade' role='alert'>"
                        + mensagem
                        + "<button type='button' class='close' data-dismiss='alert' aria-label='Fechar'>"
                        + "<span aria-hidden='true'>&times;</span>"
                        + "</button>"
                        + "</div>"
                        );
                $("html, body").animate({scrollTop: 0}, "slow");
            }
        }

        function notificarComSom() {
            audioElement.play();
        }

        function atualizarMenu(menuAtivo) {
            menuAtual = menuAtivo;
            $(".collapse").removeClass("show");
            $(".nav-item").removeClass("active");
            $(".collapse-item").removeClass("active");
            switch (menuAtivo) {
                case "itens" :
                    $("#menu_produtos").addClass("show");
                    $("#menu_produtos").parent(".nav-item").addClass("active");
                    $("#menu_item_itens").addClass("active");
                    break;
                case "generos" :
                    $("#menu_produtos").addClass("show");
                    $("#menu_generos").parent(".nav-item").addClass("active");
                    $("#menu_item_generos").addClass("active");
                    break;
                case "complementos" :
                    $("#menu_produtos").addClass("show");
                    $("#menu_complementos").parent(".nav-item").addClass("active");
                    $("#menu_item_complementos").addClass("active");
                    break;
                case "ingredientes" :
                    $("#menu_produtos").addClass("show");
                    $("#menu_ingredientes").parent(".nav-item").addClass("active");
                    $("#menu_item_ingredientes").addClass("active");
                    break;
                case "index" :
                    break;
                case "clientes" :
                    $("#menu_clientes").addClass("show");
                    $("#menu_clientes").parent(".nav-item").addClass("active");
                    $("#menu_cliente_todos").addClass("active");
                    break;
                case "cupons" :
                    $("#menu_cupons").addClass("show");
                    $("#menu_cupons").parent(".nav-item").addClass("active");
                    $("#menu_cupom_todos").addClass("active");
                    break;
            }
        }

        $("#sidebarToggle, #sidebarToggleTop").off().on("click", function () {
            $("body").toggleClass("sidebar-toggled"),
                    $(".sidebar").toggleClass("toggled"),
                    $(".sidebar").hasClass("toggled")
                    &&
                    $(".sidebar .collapse").collapse("hide");
            let sidebarOpened = $("body").hasClass("sidebar-toggled");
            localStorage.setItem("sidebar", sidebarOpened);
        });

        function connect() {
            sock = new WebSocket('wss://headred.com.br/wanted/notificacao');
            //sock = new WebSocket('ws://localhost:8080/wanted/notificacao');
            sock.onopen = function (e) {
                console.log("socket: conexao iniciada");
            };
            sock.onmessage = function (e) {
                console.log("socket: mensagem recebedida");
                processarRetornoWebSocket(e);
            };
            sock.onerror = function (e) {
                console.log("socket: erro");
            };
            sock.onclose = function (e) {
                console.log("socket: conexao encerrada");
            };
        }

        function cadastrarToken(token) {
            $.post("cadastrar-token-alerta?token=" + token, function (dados) {
                console.log("socket: conexao estabelecida");
            });
        }

        function processarRetornoWebSocket(e) {
            dados = JSON.parse(e.data);
            switch (dados.tipo) {
                case "conexao_estabelecida":
                    let token = dados.token;
                    cadastrarToken(token);
                    break;
                case "atualizacao" :
                    switch (menuAtual) {
                        case "index" :
                            atualizarPedidos(dados.pedidos);
                            if (verificarSeTemPedido(dados.pedidos)) {
                                notificarComSom();
                            }
                            break;
                        default :
                            if (verificarSeTemPedido(dados.pedidos)) {
                                $("#ctn_notificacao").fadeIn(400, function () {
                                    notificarComSom();

                                });
                            }
                            break;
                    }
                    break;
            }
        }

        function verificarSeTemPedido(pedidos) {
            console.log(pedidos);
            for (let i = 0; i < pedidos.length; i++) {
                if (parseInt(pedidos[i]["estado"]) == 4) {
                    return true;
                }
            }
            return false;
        }

        function imprimirPedido(pedido) {
            var mywindow = window.open('', 'PRINT', 'height=400,width=600');

            mywindow.document.write('<html><head><title>' + document.title + '</title>');
            mywindow.document.write('</head><body >');
            mywindow.document.write('<h3>Wanted Food Master</h3>');
            console.log(pedido);
            mywindow.document.write("<table>"
                    + "<thead>"
                    + "<tr>"
                    + "<td><strong>Numero do pedido:</strong></td>"
                    + "<td>" + pedido.id + "</td>"
                    + "</tr>"
                    + "</thead>"
                    + "<tbody>"
                    + "<tr>"
                    + "<td><strong>Cliente:</strong></td>"
                    + "<td>" + pedido.cliente.nome + "</td>"
                    + "</tr>"
                    + "<tr>"
                    + "<td><strong>Telefone:</strong></td>"
                    + "<td>" + pedido.cliente.telefone + "</td>"
                    + "</tr>"
                    + "<tr>"
                    + "<td><strong>Logradouro:</strong></td>"
                    + "<td>" + pedido.endereco.logradouro + "</td>"
                    + "</tr>"
                    + "<tr>"
                    + "<td><strong>Bairro:</strong></td>"
                    + "<td>" + pedido.endereco.bairro + "</td>"
                    + "</tr>"
                    + "<tr>"
                    + "<td><strong>Número:</strong></td>"
                    + "<td>" + pedido.endereco.numero + "</td>"
                    + "</tr>"
                    + "<tr><td>&nbsp;</td></tr>"
                    + "<tr>"
                    + "<td><strong>Itens do pedido:</strong></td>"
                    + "</tr>");
            for (let i = 0; i < pedido.itens.length; i++) {
                mywindow.document.write("<tr>"
                        + "<td align='right'>" + pedido.itens[i].quantidade + " x</td>"
                        + "<td>" + pedido.itens[i].nome + "</td>"
                        + "</tr>");
            }
            mywindow.document.write("<tr><td>&nbsp;</td></tr>"
                    + "<tr>"
                    + "<td><strong>Frete:</strong></td>"
                    + "<td>R$  " + parseFloat(Math.round(pedido.frete * 100) / 100).toFixed(2) + "</td>"
                    + "</tr>"
                    + "<tr>"
                    + "<td><strong>Total:</strong></td>"
                    + "<td>R$  " + parseFloat(Math.round(pedido.precoTotal * 100) / 100).toFixed(2) + "</td>"
                    + "</tr>");

            mywindow.document.write('</body></html>');

            mywindow.document.close(); // necessary for IE >= 10
            mywindow.focus(); // necessary for IE >= 10*/

            mywindow.print();
            //mywindow.close();

            return true;
        }
        ;

        function sound(src) {
            audioElement = document.createElement('audio');
            audioElement.setAttribute('src', 'https://headred.com.br' + src);
            //audioElement.setAttribute('src', 'http://localhost:8080' + src);

            audioElement.addEventListener('ended', function () {
                this.play();
            }, false);

            audioElement.addEventListener("canplay", function () {
                $("#length").text("Duration:" + audioElement.duration + " seconds");
                $("#source").text("Source:" + audioElement.src);
                $("#status").text("Status: Ready to play").css("color", "green");
            });
        }

        $(document).ready(function () {
            if (typeof (Storage) !== "undefined") {
                let sidebarOpened = localStorage.getItem("sidebar");
                if (sidebarOpened != null) {
                    if (sidebarOpened == "true") {
                        $("#sidebarToggle").click();
                    }
                }
            }
            notifSound = new sound("${pageContext.request.contextPath}/resources/sounds/notif.mp3");
            connect();
            $("#ctn_notificacao").hide();
        });
    </script>

</html>
