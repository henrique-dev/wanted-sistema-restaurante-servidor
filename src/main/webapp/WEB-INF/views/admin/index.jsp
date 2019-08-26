<%-- 
    Document   : itens
    Created on : 11 de ago de 2019, 12:46:06
    Author     : Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>
--%>
<%@page import="java.util.List"%>
<%@page import="com.br.phdev.srs.models.Pedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="core/main.jsp"/>

<!-- Page level plugins -->
<script src="${pageContext.request.contextPath}/resources/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/spartan-multi-image-picker-min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/sockjs.js"></script>

<div id="ctn_index" class="container col-12">
    <div class="row mt-3">
        <div class="col-lg-6 col-md-12 col-sm-12 p-1">
            <div class="card p-2">
                <table id="tbl_confirmacoes" class="table table-bordered" >
                    <thead>
                        <tr>
                            <th width="10%">Id</th>
                            <th width="45%">Estado</th>
                            <th width="30%">Preço</th>
                            <th width="15%">Acao</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${pedidos}" var="pedido">
                            <tr>
                                <td><a href='pedido?id=${pedido.id}'>${pedido.id}</a></td>
                                <td>${pedido.status}</td>
                                <td>${pedido.precoTotal}</td>
                                <td><center><button data-id='${pedido.id}' class='btn btn-success btn-atualizar-estado'>Atualizar</button></center></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col-lg-6 col-md-12 col-sm-12 p-1">
            <div class="card p-2">
                <table id="tbl_pedidos" class="table table-bordered">
                    <thead>
                        <tr>
                            <th width="10%">Id</th>
                            <th width="45%">Estado</th>
                            <th width="30%">Preço</th>
                            <th width="15%">Acao</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${pedidos}" var="pedido">
                            <tr>
                                <td><a href='pedido?id=${pedido.id}'>${pedido.id}</a></td>
                                <td>${pedido.status}</td>
                                <td>${pedido.precoTotal}</td>
                                <td><center><button data-id='${pedido.id}' class='btn btn-success btn-atualizar-estado'>Atualizar</button></center></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    
    $("#ctn_conteudo").append($("#ctn_index"));

    var ja_carregou_datatable = false;
    var sock = null;

    var tbl_pedidos = null;
    var tbl_confirmacoes = null;

    function carregarTabela(pedidos = null) {             

        $("#tbl_pedidos").DataTable().destroy();

        if (pedidos != null) {
            $("#tbl_pedidos").children("tbody").find("tr").each(function() {
                $(this).remove();
            });
        }        

        if (pedidos != null) {
            if (pedidos.length > 0) {
                for (let i=0; i<pedidos.length; i++) {
                    let pedido = pedidos[i];
                    $("#tbl_pedidos").children("tbody").append(
                        "<tr id='tr_"+pedido["id"]+"' style='height: 50px'>"
                        +   "<td><a href='pedido?id="+pedido["id"]+"'>"+pedido["id"]+"</a></td>"
                        +   "<td>"+pedido.status+"</td>"
                        +   "<td>"+(parseFloat(pedido["precoTotal"]).toFixed(2))+"</td>"                        
                        +   "<td><center><button data-id='"+pedido["id"]+"' class='btn btn-success btn-atualizar-estado'>Atualizar</button></center></td>"
                        +"<tr>"
                    );
                    $(".btn-atualizar-estado").click(function() {
                        atualizarEstadoPedido($(this).data("id"));
                    });
                }                
            } else {
                $("#tbl_pedidos").children("tbody").append(
                    "<tr>"                    
                    +   "<td colspan='5'>Sem pedidos</td>"                    
                    +"<tr>"
                );
            }
        }

        $("#tbl_pedidos").DataTable().draw();

        
    }

    function carregarDataTable() {      
        tbl_pedidos = $('#tbl_pedidos').DataTable({
            responsive: true,
            fixedColumns: true,
            searching: false,
            lengthChange: false,
            language: {
                lengthMenu: "Exibir _MENU_ linhas por página",
                zeroRecords: "Sem pedidos",
                info: "Exibindo pagina _PAGE_ de _PAGES_",
                infoEmpty: "Vazio",
                infoFiltered: "(filtrados de _MAX_ registros)",
                search: "Critério:",
                paginate: {
                        next: "Próximo",
                        previous: "Anterior"
                    }
                },
            lengthMenu: [[10, 25, 35, 50, -1], [10, 25, 35, 50, "Todos"]]
        });
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

    function atualizarEstadoPedido(id) {
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
        //carregarTabela();       
        connect();

        $(".btn-atualizar-estado").click(function() {
            atualizarEstadoPedido($(this).data("id"));
        });
    });
    
</script>