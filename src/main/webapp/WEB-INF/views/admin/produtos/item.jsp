<%-- 
    Document   : item
    Created on : 11 de ago de 2019, 13:45:03
    Author     : Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="models" %>
<c:import url="../core/main.jsp"/>

<!-- Page level plugins -->
<script src="${pageContext.request.contextPath}/resources/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="${pageContext.request.contextPath}/resources/js/demo/datatables-demo.js"></script>

<style>
    
</style>
  
<div id="ctn_index">
    <div class="row">
        <div class="col-6">
            <div class="row">
                <div class="col-12">
                    <models:campoTexto id="fld_nome" name="nome" label="Nome"/>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <models:areaTexto id="fld_descricao" name="descricao" label="Descrição"/>
                </div>
            </div>
            <div class="row">
                    <div class="col-8">
                        <models:lista id="fld_genero" name="genero" label="Genêros" data="${generos}"/>
                    </div>
                    <div class="col-4">
                        <models:campoPreco id="fld_preco" name="preco" label="Preço"/>
                    </div>
                </div>
            <div class="row">
                <div class="col-3">
                    <models:botao id="btn_salvar" label="Salvar" icon="fas fa-check" clas="btn btn-primary btn-icon-split" type="submit"/>
                </div>
            </div>
        </div>
        <div class="col-6">

        </div>
    </div>
</div>

<script type="text/javascript">
    
    $("#ctn_conteudo").append($("#ctn_index"));
    
    function validar_formuluario() {
        if (verifica_dados()) {
            processar_dados("INCLUIR");
        }
        return false;
    }
    
    function verifica_dados() {
        let nome = $("#fld_nome").val();
        let descricao = $("#fld_descricao").val();
        let preco = $("#fld_preco").val();
    }
    
    function processar_dados(aAcao, aComplemento) {
        
    }
    
    function processarRetornoAjax(aAcao, aDados, aComplemento) {
        
    }
    
    $(document).ready(function() {
        
    });
    
</script>