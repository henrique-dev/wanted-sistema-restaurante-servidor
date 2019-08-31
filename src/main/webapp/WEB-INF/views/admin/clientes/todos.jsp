<%-- 
    Document   : itens
    Created on : 11 de ago de 2019, 12:46:06
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
    table {
        overflow-x: hidden;
    }
</style>
  
<div id="ctn_index" class="w-100">
    <div class="row">        
        <div class="col-lg-12 col-md-12 col-sm-12 p-4">            
            <div class="row ctn-card border mbg-sub-card pt-4 mb-4">
                <div class="col-12 h-auto">
                    <table class="table table-bordered bg-white" id="tbl_clientes" cellspacing="0">
                        <thead>
                            <tr>
                                <th width="5%">Id</th>
                                <th width="40%">Nome</th>
                                <th width="20">Telefone</th>
                                <th width="20%">Email</th>
                                <th width="15%">Ação</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${clientes}" var="cliente">
                                <tr id="tr_${cliente.id}" data-id="${cliente.id}" class="tr-item">
                                    <td>${cliente.id}</td>
                                    <td>${cliente.nome}</td>
                                    <td>${cliente.telefone}</td>
                                    <td>${cliente.email}</td>
                                    <th><center><models:botao label="Excluir" icon="fas fa-delete" clas="btn btn-danger btn-remover"/></center></th>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>    
        </div>
    </div>    
</div>

<script type="text/javascript">
    
    $("#ctn_conteudo").append($("#ctn_index"));

    $('#tbl_clientes').DataTable({
        responsive: true,
        fixedColumns: true,
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

    $(".btn-remover").click(function() {
        let id = $(this).parent().parent().parent().data("id");
        $.post("remover-cliente?id=" + id, function(dados) {
            location.reload(true);
        });
    });
    
    $(document).ready(function() {
        atualizarMenu("clientes");                         
    });
    
</script>