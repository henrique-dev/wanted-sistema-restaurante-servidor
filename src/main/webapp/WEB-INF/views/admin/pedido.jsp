<%-- 
    Document   : itens
    Created on : 11 de ago de 2019, 12:46:06
    Author     : Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="models" %>
<c:import url="core/main.jsp"/>

<!-- Page level plugins -->
<script src="${pageContext.request.contextPath}/resources/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<div id="ctn_index">
    <div class="row wrapper">
        <div class="col-12">
            <div class="p-2 row">
                <div class="card col-md-12 col-sm-12 p-4">
                    <div class="row">
                        <div class="col-md-12 col-sm-12">
                            <div class="row">
                                <div class="col-12">
                                    <models:campoTexto id="fld_nome" name="nome" label="Nome" value="${pedido.cliente.nome}"/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <models:campoTexto id="fld_nome" name="nome" label="Logradouro" value="${pedido.endereco.logradouro}"/>
                                </div>
                                <div class="col-8">
                                    <models:campoTexto id="fld_nome" name="nome" label="Logradouro" value="${pedido.endereco.descricao}"/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <models:campoTexto id="fld_nome" name="nome" label="Forma pagamento" value="${pedido.formaPagamento.descricao}"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    
    $("#ctn_conteudo").append($("#ctn_index"));    
    
    $(document).ready(function() {
       
    });
    
</script>