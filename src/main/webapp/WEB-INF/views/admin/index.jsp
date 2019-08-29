<%-- 
    Document   : itens
    Created on : 11 de ago de 2019, 12:46:06
    Author     : Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="core/main.jsp"/>

<!-- Page level plugins -->
<script src="${pageContext.request.contextPath}/resources/js/datatable/datatables.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/spartan-multi-image-picker-min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/sockjs.js"></script>

<link href="${pageContext.request.contextPath}/resources/css/datatable/datatables.min.css" rel="stylesheet" type="text/css">

<style>
    .info-button {
        border-radius: 50%;
    }
</style>

<div id="ctn_index" class="container col-12">
    <div class="row mt-3">
        <div class="col-lg-6 col-md-12 col-sm-12 p-1 pr-3">          
            <div class="card p-2">
                <h3>Confirmaçoes</h3>                
                <c:forEach items="${pedidos}" var="pedido">
                    <div class="card mb-3">
                        <div class="card-header">
                            <div class="row">
                                <div class="col">
                                    <h5 class="card-title">${pedido.id} - ${pedido.cliente.nome}</h5>
                                </div>
                                <div class="col-auto">                                    
                                    <button  data-id='${pedido.id}' data-pedido='${pedido.json}' class='btn btn-primary btn-detalhes-pedido'>Detalhes</button>                                    
                                </div>                                                                
                            </div>                            
                            <small>${pedido.cliente.telefone}</small>
                        </div>
                        <div class="card-body">                                                                                    
                            <p class="card-text">Valor do pedido: R$ ${String.format("%.2f", pedido.precoTotal)}</p>                            
                            
                        </div>
                    </div>
                </c:forEach>                
            </div>
        </div>
        <div class="col-lg-6 col-md-12 col-sm-12 p-1 pl-3">
            <div class="card p-2">
                <h3>Pedidos</h3>
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Special title treatment</h5>
                        <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                        <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div id="modal_detalhe_pedido" class="modal fade" id="modalExemplo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modal_detalhe_pedido_titulo"></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                
            </div>
            <div class="modal-footer">                
                <button data-id='${pedido.id}' data-dismiss="modal" class='btn btn-success btn-confirmar-pedido'>Confirmar</button>
                <button data-id='${pedido.id}' data-dismiss="modal"class='btn btn-danger btn-cancelar-pedido'>Cancelar</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    
    $("#ctn_conteudo").append($("#ctn_index"));

    var sock = null;    

    function carregarTabela(pedidos = null) {

        if (pedidos != null) {            
            if (pedidos.length > 0) {
                $("#tbl_pedidos").append("<tbody></tbody>");
                for (let i=0; i<pedidos.length; i++) {
                    let pedido = pedidos[i];
                    $("#tbl_pedidos").children("tbody").append(
                        "<tr data-child-value='"+pedido["id"]+"' data-id='"+pedido["id"]+"' id='tr_"+pedido["id"]+"' style='height: 50px'>"
                        +   "<td width='10%'><a href='pedido?id="+pedido["id"]+"'>"+pedido["id"]+"</a></td>"
                        +   "<td width='45%'>"+pedido.status+"</td>"
                        +   "<td width='30%'>"+(parseFloat(pedido["precoTotal"]).toFixed(2))+"</td>"                        
                        +   "<td width='15%'><center><button data-id='"+pedido["id"]+"' class='btn btn-success btn-atualizar-estado'>Atualizar</button></center></td>"                        
                        +"<tr>"
                    );
                    $(".btn-atualizar-estado").off().click(function() {
                        atualizarEstadoPedido($(this).data("id"));
                    });
                }
            }
        }
        
    }    

    function connect() {
        //var sock = new WebSocket('wss://headred.com.br/wanted/notificacao');
        var sock = new WebSocket('ws://localhost:8080/wanted/notificacao');
        sock.onmessage = function(e) {
            processarRetornoWebSocket(e);
        };
    }

    function cadastrarToken(token) {
        $.post("cadastrar-token-alerta?token=" + token, function(dados) {
            //location.reload(true);
        });
    }

    function acao(id) {
        $.post("atualizar-estado-pedido2?id=" + id, function(dados) {
            location.reload(true);
        });
    }
    
    function processarRetornoWebSocket(e) {
        dados = JSON.parse(e.data);
        switch(dados.tipo) {
            case "conexao_estabelecida":
                let token = dados.token;
                cadastrarToken(token);
                break;
            case "atualizacao" :
                let pedidos = dados.pedidos;
                carregarTabela(pedidos);
                break;
        }        
    }
    
    $(document).ready(function() {
        //carregarDataTable();
        carregarTabela();
        connect();

        $(".btn-detalhes-pedido").click(function() {
            let json = $(this).data("pedido");
            let modal_body = $("#modal_detalhe_pedido").find(".modal-body");

            $("#modal_detalhe_pedido_titulo").empty().text("#" + json.id);
            
            let itens = json.itens;
            let itens_html = "";
            for (let i=0; i<itens.length; i++) {
                itens_html += "<p><strong>"
                +itens[i].quantidade + " x " + itens[i].nome
                +"</strong></p>"
            }

            modal_body.empty().append(
                "<div class='row'><p><div class='col-3'>Cliente:</div><div class='col'><strong>"+json.cliente.nome+"</strong></p></div></div>"
                +"<div class='row'><p><div class='col-3'>Telefone:</div><div class='col'><strong>"+json.cliente.telefone+"</strong></p></div></div>"
                +"<div class='row'><p><div class='col-3'>Logradouro:</div><div class='col'><strong>"+(json.endereco.logradouro == "" ? "&nbsp" : json.endereco.logradouro)+"</strong></p></div></div>"
                +"<div class='row'><p><div class='col-3'>Bairro:</div><div class='col'><strong>"+(json.endereco.bairro == "" ? "&nbsp" : json.endereco.bairro)+"</strong></p></div></div>"
                +"<div class='row'><p><div class='col-3'>Descricao:</div><div class='col'><strong>"+json.endereco.descricao+"</strong></p></div></div>"
                +"<div class='row'><p><div class='col-3'>Itens do pedido: </p></div></div>"
                +"<div class='row'><div class='col-3'></div><div class='col'>"+itens_html+"</div></div>"
            );
            console.log(json);
            
            $("#modal_detalhe_pedido").modal('show');
        });
        $(".btn-confirmar-pedido").click(function() {
            acao("confirmar", $(this).data("id"));
        });
        $(".btn-cancelar-pedido").click(function() {
            acao("cancelar", $(this).data("id"));
        });
    });
    
</script>