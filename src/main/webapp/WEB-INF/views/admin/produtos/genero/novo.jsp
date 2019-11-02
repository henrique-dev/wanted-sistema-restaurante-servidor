<%-- 
    Document   : item
    Created on : 11 de ago de 2019, 13:45:03
    Author     : Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="models" %>
<c:import url="../../core/main.jsp"/>

<!-- Page level plugins -->
<script src="${pageContext.request.contextPath}/resources/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/spartan-multi-image-picker-min.js"></script>


<style>

</style>
<div id="ctn_index" class="container col-12">    
    <div class="row mt-3">
        <div class="col-md-12 col-sm-12">
            <div class="p-2 row">
                <div class="card col-md-12 col-sm-12 p-4">
                    <div class="row">
                        <div class="col-md-12 col-sm-12">
                            <span id="msg_nome" class="text-danger"></span>
                            <models:campoTexto id="fld_nome" name="nome" label="Nome"/>
                        </div>
                    </div>                    
                </div>
            </div>            
        </div>        
    </div>
    <div class="row mt-3 mb-3">
        <div class="col-md-12 col-sm-12">
            <models:botao id="btn_salvar" label="Salvar" icon="fas fa-check" clas="btn btn-primary btn-icon-split"/>
        </div>
    </div>
</div>

<script type="text/javascript">

    $("#ctn_conteudo").append($("#ctn_index"));

    function verifica_dados() {
        let ok = true;
        let nome = $("#fld_nome").val();

        if (nome == null || nome.trim().length == 0) {
            $("#msg_nome").text("Insira um nome válido para o item.");
            ok = false;
        } else {
            $("#msg_nome").text("");
        }

        if (ok) {
            let formData = new FormData();
            formData.append("id", 0);
            formData.append("nome", nome);
            return formData;
        } else {
            return null;
        }

    }

    function limparCampos() {
        $("#fld_nome").val("");
    }

    function processarDados(dados) {
        $("#btn_salvar").attr('disabled', 'disabled');
        $.ajax({
            type: "POST",
            url: "salvar",
            data: dados,
            processData: false,
            contentType: false,
            success: function (dadosIn) {
                let mensagem = JSON.parse(dadosIn);
                switch (mensagem.codigo) {
                    case 100:
                        alertar("success", "Gênero cadastrado com sucesso");
                        limparCampos();
                        break;
                    default :
                        alertar("danger", "Erro ao cadastrar o gênero");
                        break;
                }
                $("#btn_salvar").removeAttr('disabled');
            }
        });
    }

    function processarRetornoAjax(dados) {

    }

    $(document).ready(function () {

        atualizarMenu("generos");

        $("#btn_salvar").click(function () {
            let dados = verifica_dados();
            if (dados != null) {
                processarDados(dados);
            }
        });

    });

</script>