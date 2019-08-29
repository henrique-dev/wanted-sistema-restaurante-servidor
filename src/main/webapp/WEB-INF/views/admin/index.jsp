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

<div id="ctn_index" class="container col-12 h-100">
    <div class="row p-3 h-100">
        <div class="col-lg-6 col-md-12 col-sm-12 p-1 pr-3 h-100">
            <div class="card p-2 h-100">
                <h3>Confirmaçoes</h3>                
                <div class="card mb-3">
                    <div class="card-body border">
                        <div class="row">
                            <div class="col">
                                <h5 class="card-title">#${pedidoPendente.id}</h5>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-3">
                                Cliente:
                            </div>
                            <div class="col">
                                <strong>${pedidoPendente.cliente.nome}</strong>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-3">
                                Telefone:
                            </div>
                            <div class="col">
                                <strong>${pedidoPendente.cliente.telefone}</strong>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-3">
                                Logradouro:
                            </div>
                            <div class="col">
                                <strong>${pedidoPendente.endereco.logradouro}</strong>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-3">
                                Bairro:
                            </div>
                            <div class="col">
                                <strong>${pedidoPendente.endereco.bairro}</strong>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-3">
                                Descrição:
                            </div>
                            <div class="col">
                                <strong>${pedidoPendente.endereco.descricao}</strong>
                            </div>
                        </div>
                    </div>
                    <div class="card-header border" style="overflow-y: scroll; max-height: 50vh; min-height: 31vh;">
                        <div class="row">
                            <div class="col-3">
                                Itens:
                            </div>
                            <div class="col">
                                <c:forEach items="${pedidoPendente.itens}" var="item">
                                    <p><strong>${item.quantidade} x ${item.nome}</strong></p>
                                </c:forEach>
                            </div>
                        </div>                        
                    </div>                    
                    <div class="card-body border">                        
                        <p class="card-text">Valor do pedido: R$ ${String.format("%.2f", pedidoPendente.precoTotal)}</p>
                        <button data-id='${pedidoPendente.id}' class='btn btn-success btn-confirmar-pedido'>Confirmar</button>
                        <button data-id='${pedidoPendente.id}' class='btn btn-danger btn-cancelar-pedido'>Cancelar</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6 col-md-12 col-sm-12 p-1 pl-3 h-100">
            <div class="card p-2 h-100">
                <h3>Pedidos</h3>
                <div id="ctn_pedidos" style="overflow-y: auto; max-height: 80vh">
                    <c:forEach items="${pedidosConfirmados}" var="pedido">
                        <div class="card mb-3">
                            <div class="card-header">
                                <div class="row">
                                    <div class="col">
                                        <p><h5 class="card-title">#${pedido.id}</h5></p>
                                        <p><h6>${pedido.status}</h6></p>
                                    </div>
                                    <div class="col-auto">                                    
                                        <button  data-id='${pedido.id}' data-pedido='${pedido.json}' class='btn btn-warning btn-detalhes-pedido'>Detalhes</button>
                                    </div>                                                                
                                </div>
                            </div>
                            <div class="card-body">                                                                                    
                                <button data-id='${pedido.id}' class='btn btn-primary btn-atualizar-estado-pedido'>Atualizar status</button>
                            </div>
                        </div>
                    </c:forEach>
                </div>                
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div id="modal_detalhe_pedido" class="modal fade" id="modalExemplo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modal_detalhe_pedido_titulo"></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body"></div>
        </div>
    </div>
</div>

<script type="text/javascript">
    
    $("#ctn_conteudo").append($("#ctn_index"));

    var sock = null;    

    function atualizarPedidosConfirmados(pedidos) {

        if (pedidos != null) {            
            if (pedidos.length > 0) {
                $("#ctn_pedidos").empty();
                for (let i=0; i<pedidos.length; i++) {
                    let pedido = pedidos[i];
                    $("#ctn_pedidos").append(
                        "<div class='card mb-3'>"
                            +"<div class='card-header'>"
                                +"<div class='row'>"
                                    +"<div class='col'>"
                                        +"<h5 class='card-title'>#"+pedido["id"]+"</h5>"
                                        +"<p><h6>"+pedido["status"]+"</h6></p>"
                                    +"</div>"
                                    +"<div class='col-auto'>"
                                        +"<button data-id='"+pedido["id"]+"' data-pedido='"+JSON.stringify(pedido)+"' class='btn btn-warning btn-detalhes-pedido'>Detalhes</button>"
                                    +"</div>"
                                +"</div>"
                            +"</div>"
                            +"<div class='card-body'>"
                                +"<button  data-id='"+pedido["id"]+"' class='btn btn-primary btn-atualizar-estado-pedido'>Próximo status</button>"
                            +"</div>"
                        +"</div>"
                    );
                    $(".btn-detalhes-pedido").off().click(detalhesPedido);
                    $(".btn-atualizar-estado-pedido").off().click(function() {
                        atualizarEstadoPedido($(this).data("id"));
                    });
                }
            }
        }
    }    

    function connect() {
        var sock = new WebSocket('wss://headred.com.br/wanted/notificacao');
        //var sock = new WebSocket('ws://localhost:8080/wanted/notificacao');
        sock.onmessage = function(e) {
            processarRetornoWebSocket(e);
        };
    }

    function cadastrarToken(token) {
        $.post("cadastrar-token-alerta?token=" + token, function(dados) {
            //location.reload(true);
        });
    }

    function acao(acao, complemento) {
        let url = "";
        switch(acao) {
            case "confirmar" :
                url = "confirmar-pedido?id=" + complemento;
                break;
            case "cancelar" :
                url = "cancelar-pedido?id=" + complemento;
                break;
            case "atualizar" :
                url = "atualizar-estado-pedido2?id=" + complemento;
                break;
        }
        $.post(url, function(dados) {
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
                atualizarPedidosConfirmados(pedidos);
                break;
        }        
    }

    function detalhesPedido() {
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
            "<div class='row'><p><div class='col-4'>Cliente:</div><div class='col'><strong>"+json.cliente.nome+"</strong></p></div></div>"
            +"<div class='row'><p><div class='col-4'>Telefone:</div><div class='col'><strong>"+json.cliente.telefone+"</strong></p></div></div>"
            +"<div class='row'><p><div class='col-4'>Logradouro:</div><div class='col'><strong>"+(json.endereco.logradouro == "" ? "&nbsp" : json.endereco.logradouro)+"</strong></p></div></div>"
            +"<div class='row'><p><div class='col-4'>Bairro:</div><div class='col'><strong>"+(json.endereco.bairro == "" ? "&nbsp" : json.endereco.bairro)+"</strong></p></div></div>"
            +"<div class='row'><p><div class='col-4'>Descricao:</div><div class='col'><strong>"+json.endereco.descricao+"</strong></p></div></div>"
            +"<div class='row'><p><div class='col-4'>Itens do pedido: </p></div></div>"
            +"<div class='row'><div class='col-4'></div><div class='col'>"+itens_html+"</div></div>"
        );
        
        $("#modal_detalhe_pedido").modal('show');
    }
    
    $(document).ready(function() {

        connect();

        $(".btn-detalhes-pedido").click(detalhesPedido);
        $(".btn-confirmar-pedido").click(function() {
            acao("confirmar", $(this).data("id"));
        });
        $(".btn-cancelar-pedido").click(function() {
            acao("cancelar", $(this).data("id"));
        });
        $(".btn-atualizar-estado-pedido").off().click(function() {
            acao("atualizar", $(this).data("id"));
        });
    });
    
</script>