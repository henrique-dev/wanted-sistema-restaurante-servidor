<%-- 
    Document   : main
    Created on : 11 de ago de 2019, 12:15:49
    Author     : Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>WantedAdmin</title>

        <!-- Custom fonts for this template-->
        <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">

    </head>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">                

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
                        <i class="fas fa-laugh-wink"></i>
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

            </ul>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">                    

                    <!-- Begin Page Content -->
                    <div id="ctn_alerta"></div>
                    <div id="ctn_conteudo" class="container-fluid">

                    </div>
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->

                <!-- Footer -->
                <footer class="sticky-footer bg-white">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>Copyright &copy; Paulo Henrique G. Bacelar - henrique.phgb@gmail.com</span>
                        </div>
                    </div>
                </footer>
                <!-- End of Footer -->

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
        
        if (msg != "") {
            alertar(msg_tipo, msg);
        }
        
        function alertar(tipo, mensagem) {
            if (tipo == "warning" || tipo == "success" || tipo == "danger") {
                $("#ctn_alerta").empty();
                $("#ctn_alerta").append(
                    "<div id='ctn_alerta' class='alert-"+tipo+" show alert alert-dismissible fade' role='alert'>"
                        +mensagem
                        +"<button type='button' class='close' data-dismiss='alert' aria-label='Fechar'>"
                            +"<span aria-hidden='true'>&times;</span>"
                        +"</button>"
                    +"</div>"
                );
                $("html, body").animate({ scrollTop: 0 }, "slow");
            }            
        }

        function atualizarMenu(menuAtivo) {
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
    </script>

</html>
