<%-- 
    Document   : ingredientes
    Created on : 12 de ago de 2019, 02:03:36
    Author     : Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="../core/main.jsp"/>

<script type="text/javascript">
    
    $("#ctn_conteudo").append($("#ctn_index"));    
    
    $(document).ready(function() {        
        atualizarMenu("ingredientes");                
    });
    
</script>