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
<script src="${pageContext.request.contextPath}/resources/js/spartan-multi-image-picker-min.js"></script>


<style>
    
</style>
  
<div id="ctn_index">
    <div class="row">
        <div class="col-md-4 col-sm-4">
            <div class="p-2 row">
                <div class="card col-md-12 col-sm-12 p-4">
                    <div class="row">
                        <div class="col-md-12 col-sm-12">
                            <models:campoTexto id="fld_nome" name="nome" label="Nome"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 col-sm-12">
                            <models:areaTexto id="fld_descricao" name="descricao" label="Descrição"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-8 col-sm-8">
                            <models:listaGenero id="fld_genero" name="genero" label="Genêros" data="${generos}"/>
                        </div>
                        <div class="col-md-4 col-sm-4">
                            <models:campoPreco id="fld_preco" name="preco" label="Preço"/>
                        </div>
                    </div>
                </div>
            </div>            
        </div>
        <div class="col-md-8 col-sm-8">
            <div class="p-2 row h-100">
                <div class="card col-md-12 col-sm-12 h-100">
                    <div class="row h-100 align-middle" id="input-arquivo-1"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 col-sm-4">
            <div class="p-2 row">
                <div class="card col-md-12 col-sm-12 p-4 ">
                    <div class="row">
                        <div class="col-md-12 col-sm-12">
                            <models:listaTipo id="fld_tipos" name="tipos" label="Tipos"  data="${tipos}"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 col-sm-12" style="overflow-y: scroll;">
                            <table class="table table-bordered mb-0" >
                                <thead>
                                    <tr>
                                        <th width="80%">Nome</th>
                                        <th width="20%"></th>
                                    </tr>
                                </thead>
                            </table>                            
                        </div>
                        <div class="col-md-12 col-sm-12" style="height: 280px; max-height: 280px; overflow-y: scroll;">
                            <table id="tbl_tipos" class="table table-bordered" cellspacing="0">
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>    
                </div>
            </div>                                                                    
        </div>
        <div class="col-md-4 col-sm-4">
            <div class="p-2 row">
                <div class="card col-md-12 col-sm-12 p-4">
                    <div class="row">
                        <div class="col-md-12 col-sm-12">
                            <models:listaComplemento id="fld_complementos" name="complementos" label="Complementos"  data="${complementos}"/>
                        </div>                
                    </div>
                    <div class="row">
                        <div class="col-md-12 col-sm-12" style="overflow-y: scroll;">
                            <table class="table table-bordered mb-0" >
                                <thead>
                                    <tr>
                                        <th width="50%">Nome</th>
                                        <th width="30%">Preço</th>
                                        <th width="20%"></th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="col-md-12 col-sm-12" style="height: 280px; max-height: 280px; overflow-y: scroll;">
                            <table id="tbl_complementos" class="table table-bordered"cellspacing="0">
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>           
                </div>
            </div>                         
        </div>
        <div class="col-md-4 col-sm-4">
            <div class="p-2 row">
                <div class="card col-md-12 col-sm-12 p-4">
                    <div class="row">
                        <div class="col-md-12 col-sm-12">
                            <models:listaIngrediente id="fld_ingredientes" name="ingredientes" label="Ingredientes"  data="${ingredientes}"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 col-sm-12" style="overflow-y: scroll;">
                            <table class="table table-bordered mb-0" >
                                <thead>
                                    <tr>
                                        <th width="80%">Nome</th>
                                        <th width="20%"></th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="col-md-12 col-sm-12" style="height: 280px; max-height: 280px; overflow-y: scroll;">
                            <table id="tbl_ingredientes" class="table table-bordered" id="dataTable" cellspacing="0">
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>   
                </div>
            </div>         
        </div>        
    </div>
    <div class="row">
        <div class="col-md-12 col-sm-12">
            <models:botao id="btn_salvar" label="Salvar" icon="fas fa-check" clas="btn btn-primary btn-icon-split"/>
        </div>
    </div>
</div>

<script type="text/javascript">
    
    $("#ctn_conteudo").append($("#ctn_index"));    
    
    function verifica_dados() {
        let nome = $("#fld_nome").val();
        let descricao = $("#fld_descricao").val();
        let preco = $("#fld_preco").val();
        let tipos = new Array();
        $("#tbl_tipos").children("tbody").find("tr").each(function() {
            tipos.push($(this).data("id"));
        });
        let complementos = new Array();
        $("#tbl_complementos").children("tbody").find("tr").each(function() {
            complementos.push($(this).data("id"));
        });
        let ingredientes = new Array();
        $("#tbl_ingredientes").children("tbody").find("tr").each(function() {
            ingredientes.push($(this).data("id"));
        });
        let arquivos = new Array();
        $("#input-arquivo-1").find("input").each(function() {
            arquivos.push($(this)[0].files[0]);
        })
        //console.log(json);
        
    }
    
    function processar_dados(aAcao, aComplemento) {
        
    }
    
    function processarRetornoAjax(aAcao, aDados, aComplemento) {
        
    }
    
    $(document).ready(function() {

        $(".collapse").removeClass("show");
        $(".nav-item").removeClass("active");
        $(".collapse-item").removeClass("active");

        $("#menu_produtos").addClass("show");
        $("#menu_produtos").parent(".nav-item").addClass("active");
        $("#menu_item_itens").addClass("active");
        
        $("#input-arquivo-1").spartanMultiImagePicker({
            fieldName:        'fileUpload[]',
            maxCount:         4,
            rowHeight:        '200px',
            groupClassName:   'col-md-3 col-sm-12 mt-auto mb-auto',
            maxFileSize:      '',
            placeholderImage: {
                image: '${pageContext.request.contextPath}/resources/img/placeholder.png',
                width : '100%'
            },
            dropFileLabel : "Drop Here"
        });

        $("#fld_tipos").change(function() {
            let option = $(this).find(":selected");
            $("#tbl_tipos").children("tbody").append(
                "<tr id='tr_"+option.data("id")+"' data-id="+option.data("id")+" data-nome="+option.data("nome")+">"
                    +   "<td width='80%'>"+option.data("nome")+"</td>"
                    +   "<td width='20%'><center><button class='btn btn-danger btn-remover-tipo'>X</button></center></td>"
                +"</tr>"
            );
            option.remove();
            $("#tr_" + option.data("id") + " .btn-remover-tipo").click(function() {
                let tr = $(this).parent().parent().parent();
                $("#fld_tipos").append(
                    "<option data-id='"+tr.data("id")+"' data-nome='"+tr.data("nome")+"'>"+tr.data("nome")+"</option>"
                );
                tr.remove();
            });            
        });

        $("#fld_complementos").change(function() {
            let option = $(this).find(":selected");
            $("#tbl_complementos").children("tbody").append(
                "<tr id='tr_"+option.data("id")+"' data-id='"+option.data("id")+"' data-nome='"+option.data("nome")+"' data-preco='"+option.data("preco")+"'>"
                    +   "<td width='50%'>"+option.data("nome")+"</td>"
                    +   "<td width='30%'>"+option.data("preco")+"</td>"
                    +   "<td width='20%'><center><button class='btn btn-danger btn-remover-complemento'>X</button></center></td>"
                +"</tr>"
            );
            option.remove();
            $("#tr_" + option.data("id") + " .btn-remover-complemento").click(function() {
                let tr = $(this).parent().parent().parent();
                $("#fld_complementos").append(
                    "<option data-id='"+tr.data("id")+"' data-nome='"+tr.data("nome")+"' data-preco='"+tr.data("preco")+"'>"+tr.data("nome")+"</option>"
                );
                tr.remove();
            });            
        });

        $("#fld_ingredientes").change(function() {
            let option = $(this).find(":selected");
            $("#tbl_ingredientes").children("tbody").append(
                "<tr id='tr_"+option.data("id")+"' data-id="+option.data("id")+" data-nome="+option.data("nome")+">"
                    +   "<td width='80%'>"+option.data("nome")+"</td>"
                    +   "<td width='20%'><center><button class='btn btn-danger btn-remover-ingrediente'>X</button></center></td>"
                +"</tr>"
            );
            option.remove();
            $("#tr_" + option.data("id") + " .btn-remover-ingrediente").click(function() {
                let tr = $(this).parent().parent().parent();
                $("#fld_ingredientes").append(
                    "<option data-id='"+tr.data("id")+"' data-nome='"+tr.data("nome")+"'>"+tr.data("nome")+"</option>"
                );
                tr.remove();
            });            
        });

        $("#btn_salvar").click(function() {
            if (verifica_dados()) {
                //processar_dados("INCLUIR");
            }
        });

        //$('#tbl_tipos').DataTable({searching: false, info: false, lengthChange: false});
        //$('#tbl_complementos').DataTable({searching: false, info: false, lengthChange: false});
        //$('#tbl_ingredientes').DataTable({searching: false, info: false, lengthChange: false});


    });
    
</script>