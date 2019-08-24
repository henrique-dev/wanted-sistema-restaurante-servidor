<%-- 
    Document   : itens
    Created on : 11 de ago de 2019, 12:46:06
    Author     : Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="../core/main.jsp"/>

<!-- Page level plugins -->
<script src="${pageContext.request.contextPath}/resources/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<style>
    table {
        overflow-x: hidden;
    }
</style>
  
  <div id="ctn_index" class="container col-12">
    <div class="row mt-3">
        <div class="col-lg-3 col-md-3 col-sm-3 p-1">
            <a href="item?opcao=novo" class="btn btn-primary btn-icon-split">
                <span class="icon text-white-50">
                    <i class="fas fa-plus"></i>
                </span>
                <span class="text">Novo item</span>
            </a>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 p-1">
            <table class="table table-bordered" id="tbl_itens" cellspacing="0">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Nome</th>
                        <th>Gênero</th>
                        <th>Preço</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${itens}" var="item">
                        <tr>
                            <td>${item.id}</td>
                            <td>${item.nome}</td>
                            <td>${item.genero.nome}</td>
                            <td align="right">${String.format("%.2f", item.preco)}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>    
</div>

<script type="text/javascript">
    
    $("#ctn_conteudo").append($("#ctn_index"));
    
    $(document).ready(function() {
        $(".collapse").removeClass("show");
        $(".nav-item").removeClass("active");
        $(".collapse-item").removeClass("active");

        $("#menu_produtos").addClass("show");
        $("#menu_produtos").parent(".nav-item").addClass("active");
        $("#menu_item_itens").addClass("active");

        $('#tbl_itens').DataTable();
    });
    
</script>