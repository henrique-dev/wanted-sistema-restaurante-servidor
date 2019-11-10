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

<style>    

    .ctn-card {
        border-radius: 8px;
        border: 1px;
        padding: 5px;
    }

    
</style>
  
<div id="ctn_index" class="w-100">
    <div class="row h-100">        
        <div class="col-lg-12 col-md-12 col-sm-12 p-4 h-100">
            <div class="row pb-4">
                <div class="col-12">                    
                    <a href="item/novo" class="btn mbtn-primary btn-icon-split">
                        <span class="icon text-white">
                            <i class="fas fa-plus"></i>
                        </span>
                        <span class="text">Novo item</span>
                    </a>
                </div>
            </div>
            <div class="row h-100 ctn-card border mbg-sub-card pt-4 mb-4">
                <div class="col-12 h-auto">
                    <table class="table table-bordered bg-white" id="tbl_itens" cellspacing="0">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Nome</th>
                                <th>Gênero</th>
                                <th>Preço</th>
                                <th>Açao</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${itens}" var="item">
                                <tr>
                                    <td width='5%'>${item.id}</td>
                                    <td >${item.nome}</td>
                                    <td width='20%'>${item.genero.nome}</td>
                                    <td width='15%' align="right">${String.format("%.2f", item.preco)}</td> 
                                    <th width='15%' style='min-width:210px;'>
                                        <center>
                                            <models:botaoHref link="item/atualizar?id=${item.id}" label="Atualizar" icon="fas fa-delete" clas="btn btn-success btn-atualizar"/>
                                            <models:botaoHref link="item/remover?id=${item.id}"  label="Excluir" icon="fas fa-delete" clas="btn btn-danger btn-remover"/>                                    
                                        </center>
                                    </th>
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
    
    $(document).ready(function() {
                
        atualizarMenu("itens");

        $('#tbl_itens').DataTable({
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

        $('.btn-atualizar').click(function() {

        });
        $('.btn-remover').click(function() {
            $(this).attr('disabled', 'disabled');
        });
    });
    
</script>