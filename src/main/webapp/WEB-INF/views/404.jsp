<%-- 
    Document   : 404
    Created on : 24 de ago de 2019, 21:07:47
    Author     : Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% if (session.getAttribute("admin") != null) { %>
<c:import url="admin/core/main.jsp"/>
<% }%>
<!DOCTYPE html>
<html>
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <div id="ctn_index" class="container col-12">
        <div class="container-fluid">
            <div class="text-center m-auto">
                <div class="error mx-auto" data-text="404">404</div>
                <p class="lead text-gray-800 mb-5">Ops, pagina nao encontrada</p>
                <p class="text-gray-500 mb-0">:(</p>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        $("#ctn_conteudo").append($("#ctn_index"));
    </script>
</html>
