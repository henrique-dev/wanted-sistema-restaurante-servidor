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

    .center {
        margin: auto;
        width: 35%;
        text-align: center; 
        vertical-align: middle
    }

    .center-cmp {
        vertical-align: middle;
    }

    .container-center {
        position: absolute;
        top: 50%;
        left: 50%;
        -moz-transform: translateX(-50%) translateY(-50%);
        -webkit-transform: translateX(-50%) translateY(-50%);
        transform: translateX(-50%) translateY(-50%);
    }

    .ctn-card {
        border-radius: 8px;
        border-color: #999 !important;
        border: 1px;
        padding: 5px;
    }
</style>

<div id="ctn_index" class="h-100 w-100">
    <div class="row h-100">
        <div class="col-lg-6 col-md-12 col-sm-12 p-4 h-100 w-100">
            <div id="ctn_pedido_pendente" class="h-100 ctn-card border mbg-sub-card w-100">
                <div class="col-12 h-100">
                    <div class="row h-auto inline-block ctn-card-header">
                        <div class="col-12 h-100 p-2">                            
                            <h3>Confirmações&nbsp;<small><span class="badge badge-dark align-top">${pedidos.quantidadePedidosPendentes}</span></small></h3>
                        </div>
                    </div>
                    <div class="row inline-block ctn-card-body">
                        <c:choose>
                            <c:when test="${pedidos.pedidoPendente != null}">
                                <div class="col-12 h-100">
                                    <div class="card h-100">
                                        <div class="card-header bg-light">
                                            <div class="row">
                                                <div class="col">
                                                    <strong><h5 class="card-title">#${pedidos.pedidoPendente.id}</h5></strong>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-4">
                                                    Cliente:
                                                </div>
                                                <div class="col">
                                                    <strong>${pedidos.pedidoPendente.cliente.nome}</strong>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-4">
                                                    Telefone:
                                                </div>
                                                <div class="col">
                                                    <strong>${pedidos.pedidoPendente.cliente.telefone}</strong>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-4">
                                                    Logradouro:
                                                </div>
                                                <div class="col">
                                                    <strong>${pedidos.pedidoPendente.endereco.logradouro}</strong>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-4">
                                                    Bairro:
                                                </div>
                                                <div class="col">
                                                    <strong>${pedidos.pedidoPendente.endereco.bairro}</strong>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-4">
                                                    Descrição:
                                                </div>
                                                <div class="col">
                                                    <strong>${pedidos.pedidoPendente.endereco.descricao}</strong>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-body bg-light" style="max-height: 0px">
                                            <c:forEach items="${pedidos.pedidoPendente.itens}" var="item">
                                                <p><strong>${item.quantidade} x ${item.nome}</strong></p>
                                            </c:forEach>
                                        </div>
                                        <div class="card-footer bg-light">
                                            <p class="card-text">Valor do pedido: R$ ${String.format("%.2f", pedidos.pedidoPendente.precoTotal)}</p>
                                            <button data-id='${pedidos.pedidoPendente.id}' class='btn btn-success btn-confirmar-pedido'>Confirmar</button>
                                            <button data-id='${pedidos.pedidoPendente.id}' class='btn btn-danger btn-cancelar-pedido'>Cancelar</button>
                                        </div>
                                    </div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="col-12">
                                    <div class="card bg-light">
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-12">
                                                    <p>Sem confirmações</p>
                                                </div>
                                            </div>                                            
                                        </div>
                                    </div>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6 col-md-12 col-sm-12 p-4 h-100 w-100">
            <div id="ctn_pedidos" class="row h-100 mbg-sub-card ctn-card border w-100">
                <div class="col-12 h-100">
                    <div class="row h-auto ctn-card-header">
                        <div class="col-12 h-100 p-2">
                            <h3>Pedidos&nbsp;<small><span class="badge badge-dark align-top">${pedidos.quantidadePedidos}</span></small></h3>
                        </div>
                    </div>
                    <div class="row ctn-card-body w-100 overflow-auto h-100 pr-0">
                        <c:choose>
                            <c:when test="${pedidos.pedidos != null}">
                                <div class="col-12 pr-0">
                                    <c:forEach items="${pedidos.pedidos}" var="pedido">
                                        <c:choose>
                                            <c:when test="${pedido.estado != 4}">
                                                <div class="row w-100 ctn-card-piece pr-0 pb-1">
                                                    <div class="col-12">
                                                        <div class="card border">
                                                            <div class="card-header">                                            
                                                                <div class="row">
                                                                    <div class="col-12">
                                                                        #${pedido.id} - ${pedido.status}
                                                                    </div>                                                    
                                                                </div>
                                                            </div>
                                                            <div class="card-body bg-light">
                                                                <button data-id='${pedido.id}' class='btn btn-primary btn-atualizar-estado-pedido'>Atualizar</button>
                                                                <button data-id='${pedido.id}' data-pedido='${pedido.json}' class='btn btn-warning btn-detalhes-pedido'>Detalhes</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:when>
                                        </c:choose>                        
                                    </c:forEach>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="col-12 h-100">
                                    <div class="card h-100 bg-light">
                                        <div class="card-body h-100">
                                            <div class="row h-100">
                                                <div class="col-12 h-100 w-100">
                                                    <p>Sem pedidos</p>
                                                </div>
                                            </div>                                            
                                        </div>
                                    </div>
                                </div>
                            </c:otherwise>
                        </c:choose>                        
                    </div>                    
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
    var cardHeight = null;
    var cardHeaderHeight = null;

    function atualizarPedidos(pedidos) {
        if (pedidos != null) {
            if (pedidos.length > 0) {
                $("#ctn_pedidos").find(".ctn-card-body").empty();
                for (let i=0; i<pedidos.length; i++) {
                    let pedido = pedidos[i];
                    if (parseInt(pedido["estado"]) == 4) {
                        let itens = pedido.itens;
                        let htmlItens = "";
                        for (let j=0; j<itens.length; j++) {
                            let item = itens[j];
                            htmlItens +="<p><strong>"+item.quantidade+" x "+item.nome+"</strong></p>";
                        }
                        $("#ctn_pedido_pendente").find(".ctn-card-body").empty().append(
                            "<div class='col-12 h-100'>"
                            +"<div class='card h-100'>"
                                +"<div class='card-header'>"
                                    +"<div class='row'>"
                                        +"<div class='col'>"
                                            +"<strong><h5 class='card-title'>#"+pedido.id+"</h5></strong>"
                                        +"</div>"
                                    +"</div>"
                                    +"<div class='row'>"
                                        +"<div class='col-3'>"
                                            +"Cliente:"
                                        +"</div>"
                                        +"<div class='col'>"
                                            +"<strong>"+pedido.cliente.nome+"</strong>"
                                        +"</div>"
                                    +"</div>"
                                    +"<div class='row'>"
                                        +"<div class='col-3'>"
                                            +"Telefone:"
                                        +"</div>"
                                        +"<div class='col'>"
                                            +"<strong>"+pedido.cliente.telefone+"</strong>"
                                        +"</div>"
                                    +"</div>"
                                    +"<div class='row'>"
                                        +"<div class='col-3'>"
                                            +"Logradouro:"
                                        +"</div>"
                                        +"<div class='col'>"
                                            +"<strong>"+pedido.endereco.logradouro+"</strong>"
                                        +"</div>"
                                    +"</div>"
                                    +"<div class='row'>"
                                        +"<div class='col-3'>"
                                            +"Bairro:"
                                        +"</div>"
                                        +"<div class='col'>"
                                            +"<strong>"+pedido.endereco.bairro+"</strong>"
                                        +"</div>"
                                    +"</div>"
                                    +"<div class='row'>"
                                        +"<div class='col-3'>"
                                            +"Descrição:"
                                        +"</div>"
                                        +"<div class='col'>"
                                            +"<strong>"+pedido.endereco.descricao+"</strong>"
                                        +"</div>"
                                    +"</div>"
                                +"</div>"
                                +"<div class='card-body bg-light' style='max-height: 0px'>"
                                    +htmlItens
                                +"</div>"
                                +"<div class='card-footer'>"
                                    +"<p class='card-text'>Valor do pedido: R$ "+pedido.precoTotal.toFixed(2).replace(".", ",")+"</p>"
                                    +"<button data-id='"+pedido.id+"' class='btn btn-success btn-confirmar-pedido'>Confirmar</button>"
                                    +"&nbsp;<button data-id='"+pedido.id+"' class='btn btn-danger btn-cancelar-pedido'>Cancelar</button>"
                                +"</div>"
                            +"</div>"
                        +"</div>"
                        );
                        $(".btn-confirmar-pedido").off().click(function() {
                            acao("confirmar", $(this).data("id"));
                        });
                        $(".btn-cancelar-pedido").off().click(function() {
                            acao("cancelar", $(this).data("id"));
                        });
                        reajustarCardPedidosPendentes();
                    } else {
                        $("#ctn_pedidos").find(".ctn-card-body").append(
                            "<div class='col-12 pr-0'>"
                                +"<div class='row w-100 ctn-card-piece pr-0 pb-1'>"
                                    +"<div class='col-12'>"
                                        +"<div class='card border'>"
                                            +"<div class='card-header'>"
                                                +"<div class='row'>"
                                                    +"<div class='col-12'>"
                                                        +pedido["id"]+" - "+pedido["status"]
                                                    +"</div>"
                                                +"</div>"
                                            +"</div>"
                                            +"<div class='card-body bg-light'>"
                                                +"<button data-id='"+pedido["id"]+"' class='btn btn-primary btn-atualizar-estado-pedido'>Atualizar</button>"
                                                +"<button data-id='"+pedido["id"]+"' data-pedido='"+JSON.stringify(pedido)+"' class='btn btn-warning btn-detalhes-pedido'>Detalhes</button>"
                                            +"</div>"
                                        +"</div>"
                                    +"</div>"
                                +"</div>"
                            +"</div>"
                        );
                        $(".btn-detalhes-pedido").off().click(detalhesPedido);
                        $(".btn-atualizar-estado-pedido").off().click(function() {
                            acao("atualizar", $(this).data("id"));
                        });
                        reajustarCardPedidosPendentes();
                    }                                        
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
        return;
        dados = JSON.parse(e.data);
        //console.log(dados);
        switch(dados.tipo) {
            case "conexao_estabelecida":
                let token = dados.token;
                cadastrarToken(token);
                break;
            case "atualizacao" :
                let pedidos = dados.pedidos;
                atualizarPedidos(pedidos);
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

    function reajustarCardPedidosPendentes() {
        let container = $("#ctn_pedido_pendente");
        let containerHeader = container.find(".ctn-card-header");
        let containerBody = container.find(".ctn-card-body");
        let cardHeader = container.find(".card-header");
        let cardBody = container.find(".card-body");
        let cardFooter = container.find(".card-footer");        
        containerBody.css("height", container.height() - containerHeader.height());
        cardBody.css("height", containerBody.innerHeight() - cardHeader.innerHeight() - cardFooter.innerHeight());
        cardBody.css("max-height", containerBody.innerHeight() - cardHeader.innerHeight() - cardFooter.innerHeight());
        <c:if test="${pedidoPendente != null}">
            cardBody.css("overflow-y", "scroll");
        </c:if>
    }

    function reajustarCardPedidos() {        
        let container = $("#ctn_pedidos");
        let containerORG = $("#ctn_pedido_pendente");
        let cardBodyORG = $("#ctn_pedido_pendente").find(".ctn-card-body");        
        let containerHeader = container.find(".ctn-card-header");
        let containerBody = container.find(".ctn-card-body");                        
        containerBody.css("height", cardBodyORG.height());
        containerBody.css("min-height", cardBodyORG.height());
        containerBody.css("max-height", cardBodyORG.height());
        container.css("height", containerORG.innerHeight());
        container.css("min-height", containerORG.innerHeight());
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

        $("#ctn_pedido_pendente").each(function() {           
            cardHeight = $(this).height();
            cardHeaderHeight = $(this).find(".ctn-card-header").height();
            $("#ctn_pedidos").css("height", cardHeight);
            $("#ctn_pedidos").css("min-height", cardHeight);
            $("#ctn_pedidos").css("max-height", cardHeight);
            reajustarCardPedidosPendentes();
            reajustarCardPedidos();
        })
    });
    
</script>