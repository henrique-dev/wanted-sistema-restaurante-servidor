<%-- 
    Document   : cupons
    Created on : 25 de ago de 2019, 08:37:29
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
    table {
        overflow-x: hidden;
    }
</style>
  
  <div id="ctn_index" class="container col-12">
    <div class="row mt-3">
        <div class="col-lg-3 col-md-3 col-sm-3 p-1">
            <a href="cupom/novo" class="btn btn-primary btn-icon-split">
                <span class="icon text-white-50">
                    <i class="fas fa-plus"></i>
                </span>
                <span class="text">Novo cupom</span>
            </a>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 p-1">
            <table class="table table-bordered" id="tbl_cupons" cellspacing="0">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Tipo</th>
                        <th>Descricao</th>
                        <th>Codigo</th>
                        <th>Quantidade</th>
                        <th>Validade</th>
                        <th>Ativo</th>
                        <th>Valor</th>
                        <th>Açao</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${cupons}" var="cupom">
                        <tr>
                            <td width='5%'>${cupom.id}</td>
                            <td width='10%'>${cupom.tipo.descricao}</td>
                            <td >${cupom.descricao}</td>
                            <td width='10%'>${cupom.codigo}</td>
                            <td width='10%'>${cupom.quantidade}</td>
                            <td width='10%'>${cupom.validade}</td>
                            <td width='10%'>${cupom.ativo ? "Sim" : "Nao"}</td>
                            <td width='15%' align="right">${String.format("%.2f", cupom.valor)}</td> 
                            <th width='10%' style='min-width:115px;'>
                                <center>                                    
                                    <models:botaoHref link="cupom/remover?id=${item.id}"  label="Excluir" icon="fas fa-delete" clas="btn btn-danger btn-remover"/>                                    
                                </center>
                            </th>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>    
</div>

<script type="text/javascript">
    
    $("#ctn_conteudo").append($("#ctn_index"));
    
    $(document).ready(function() {
        
        atualizarMenu("cupons");        

        $('#tbl_cupons').DataTable({
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