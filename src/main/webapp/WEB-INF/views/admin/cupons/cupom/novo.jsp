<%-- 
    Document   : novo
    Created on : 25 de ago de 2019, 08:37:49
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
                        <div class="col-md-4 col-sm-4">
                            <span id="msg_tipo_cupom" class="text-danger"></span>
                            <models:listaTipoCupomDesconto id="fld_tipo_cupom" name="tipo_cupom" label="Tipo de cupom" data="${tipos}"/>
                        </div>
                        <div class="col-md-4 col-sm-4">
                            <span id="msg_validade" class="text-danger"></span>
                            <models:campoData id="fld_validade" name="validade" label="Validade"/>
                        </div>
                        <div class="col-md-4 col-sm-4">
                            <span id="msg_quantidade" class="text-danger"></span>
                            <models:campoNumero id="fld_quantidade" name="quantidade" label="Quantidade" value="0"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 col-sm-12">
                            <span id="msg_descricao" class="text-danger"></span>
                            <models:areaTexto id="fld_descricao" name="descricao" label="Descrição"/>
                        </div>
                    </div>
                    <div class="row">                        
                        <div class="col-md-4 col-sm-4">
                            <span id="msg_percentual" class="text-danger"></span>
                            <div class="form-group">
                                <label for="fld_percentual">Percentual</label>
                                <select class="form-control" id="fld_percentual" name="fld_percentual">
                                    <option value="NAO">Nao</option>
                                    <option value="SIM">Sim</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-4">
                            <span id="msg_valor" class="text-danger"></span>
                            <models:campoPreco id="fld_valor" name="preco" label="Preço" value="0"/>
                        </div>
                        <div class="col-md-4 col-sm-4">
                            <span id="msg_codigo" class="text-danger"></span>
                            <models:campoTexto id="fld_codigo" name="codigo" label="Codigo"/>
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
        let tipo_cupom = $("#fld_tipo_cupom").val();
        let validade = $("#fld_validade").val();
        let quantidade = $("#fld_quantidade").val();        
        let descricao = $("#fld_descricao").val();
        let percentual = $("#fld_percentual").val() == "SIM" ? true : false;
        let valor = $("#fld_valor").val();
        let codigo = $("#fld_codigo").val();        
        
        if (validade == null || validade.trim().length == 0) {
            $("#msg_validade").text("Insira validade válida para o cupom.");
            ok = false;
        } else {
            $("#msg_validade").text("");            
        }
        if (descricao == null || descricao.trim().length == 0) {
            $("#msg_descricao").text("Insira uma descriçao válida para o cupom.");
            ok = false;
        } else {
            $("#msg_descricao").text("");            
        }
        if (valor == null || valor.trim().length == 0 || parseFloat(valor) < 0) {
            $("#msg_valor").text("Insira um valor válido para o cupom.");
            ok = false;
        } else {
            $("#msg_valor").text("");
        }     
        if (codigo == null || codigo.trim().length == 0) {
            $("#msg_codigo").text("Insira um codigo válido para o cupom.");
            ok = false;
        } else {
            $("#msg_codigo").text("");
        }   

        if (ok) {
            let formData = new FormData();            
            let dados = {};
            dados["tipo"] = {id : tipo_cupom};
            dados["validade"] = validade;
            dados["quantidade"] = quantidade;
            dados["descricao"] = descricao;
            dados["percentual"] = percentual;
            dados["valor"] = valor;
            dados["codigo"] = codigo;
            dados["ativo"] = true;
            formData.append("cupomJSON", JSON.stringify(dados));
            return formData;            
        } else {
            return null;
        }
        
    }

    function limparCampos() {
        $("#fld_nome").val("");
        $("#fld_descricao").val("");
        $("#fld_valor").val(0);
        $("#fld_tempo_preparo").val("");
        $('#fld_genero').val(0);
        $("#tbl_tipos").children("tbody").find("tr").each(function() {
            let tr = $(this);
            $("#fld_tipos").append(
                "<option data-id='"+tr.data("id")+"' data-nome='"+tr.data("nome")+"'>"+tr.data("nome")+"</option>"
            );
            tr.remove();
        });
        $("#tbl_complementos").children("tbody").find("tr").each(function() {
            let tr = $(this);
            $("#fld_complementos").append(
                "<option data-id='"+tr.data("id")+"' data-nome='"+tr.data("nome")+"' data-preco='"+tr.data("preco")+"'>"+tr.data("nome")+"</option>"
            );
            tr.remove();
        });
        $("#tbl_ingredientes").children("tbody").find("tr").each(function() {
            let tr = $(this);
            $("#fld_ingredientes").append(
                "<option data-id='"+tr.data("id")+"' data-nome='"+tr.data("nome")+"'>"+tr.data("nome")+"</option>"
            );
            tr.remove();
        });
        $(".spartan_remove_row").each(function() {
            $(this).trigger('click');
        });
    }
    
    function processarDados(dados) {
        $("#btn_salvar").attr('disabled', 'disabled');
        $.ajax({
            type: "POST",
            url: "salvar",
            data: dados,
            processData: false,
            contentType: false,
            success: function(dadosIn) {
                let mensagem = JSON.parse(dadosIn);
                switch(mensagem.codigo) {
                    case 100:
                        window.location.replace("../cupons?msg_tipo="+escape("success")+"&msg=" + escape("Cupom cadastrado com sucesso"));
                        break;
                    case 300:
                        alertar("warning", "O código informado já existe");
                        break;
                    default :
                        alertar("danger", "Erro ao cadastrar o item");
                        break;
                }                
                $("#btn_salvar").removeAttr('disabled');                
            }
        });
    }
    
    function processarRetornoAjax(dados) {
        
    }
    
    $(document).ready(function() {

        atualizarMenu("cupons");        

        $("#btn_salvar").click(function() {
            let dados = verifica_dados();
            if (dados != null) {
                processarDados(dados);
            }
        });


    });
    
</script>