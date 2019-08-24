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
  
  <div id="ctn_index" class="container col-12">
    <div class="row mt-3">
        <div class="col-md-4 col-sm-4">
            <div class="p-2 row">
                <div class="card col-md-12 col-sm-12 p-4">
                    <div class="row">
                        <div class="col-md-12 col-sm-12">
                            <span id="msg_nome" class="text-danger"></span>
                            <models:campoTexto id="fld_nome" name="nome" label="Nome"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 col-sm-12">
                            <span id="msg_descricao" class="text-danger"></span>
                            <models:areaTexto id="fld_descricao" name="descricao" label="Descrição"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-8 col-sm-8">
                            <span id="msg_genero" class="text-danger"></span>
                            <models:listaGenero id="fld_genero" name="genero" label="Genêros" data="${generos}"/>
                        </div>
                        <div class="col-md-4 col-sm-4">
                            <span id="msg_preco" class="text-danger"></span>
                            <models:campoPreco id="fld_preco" name="preco" label="Preço"/>
                        </div>
                    </div>
                </div>
            </div>            
        </div>
        <div class="col-md-8 col-sm-8">
            <div class="p-2 row h-100">
                <div class="card col-md-12 col-sm-12 h-100">
                    <span id="msg_arquivo" class="text-danger"></span>
                    <div class="row h-100 align-middle" id="fld_arquivo"></div>
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
        let ok = true;
        let nome = $("#fld_nome").val();
        let descricao = $("#fld_descricao").val();
        let preco = $("#fld_preco").val();
        let genero = $('#fld_genero').find(":selected").val();        
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
        $("#fld_arquivo").find("input").each(function() {
            if ($(this)[0].files[0] != null) {
                arquivos.push($(this)[0].files[0]);
            }            
        });


        if (nome == null || nome.trim().length == 0) {
            $("#msg_nome").text("Insira um nome válido para o item.");
            ok = false;
        } else {
            $("#msg_nome").text("");
        }
        if (descricao == null || descricao.trim().length == 0) {
            $("#msg_descricao").text("Insira uma descriçao válida para o item.");
            ok = false;
        } else {
            $("#msg_descricao").text("");
        }
        if (preco == null || preco.trim().length == 0 || parseFloat(preco) < 0) {
            $("#msg_preco").text("Insira um preço válido para o item.");
            ok = false;
        } else {
            $("#msg_preco").text("");
        }
        if (genero == null || genero == 0) {
            $("#msg_genero").text("Insira um genero para o item.");
            ok = false;
        } else {
            $("#msg_genero").text("");
        }
        if (arquivos == null || arquivos.length == 0) {
            $("#msg_arquivo").text("Insira pelo menos uma imagem para o item.");
            ok = false;
        } else {
            $("#msg_arquivo").text("");
        }

        if (ok) {
            let formData = new FormData();
            formData.append("nome", nome);
            formData.append("descricao", descricao);
            formData.append("preco", preco);
            formData.append("genero", genero);
            formData.append("tipos", JSON.stringify({tipos : tipos}));
            formData.append("complementos", JSON.stringify({complementos : complementos}));
            formData.append("ingredientes", JSON.stringify({ingredientes : ingredientes}));
            for (let i=0; i<arquivos.length; i++) {
                formData.append("arquivo" + i, arquivos[i]);
            }
            return formData;
            //formData.append("tipos", JSON.stringify({tipos : tipos}));
        } else {
            return null;
        }
        
    }

    function limparCampos() {
        $("#fld_nome").val("");
        $("#fld_descricao").val("");
        $("#fld_preco").val(0);
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
    }
    
    function processarDados(dados) {        
        $.ajax({
            type: "POST",
            url: "adicionar-item",
            data: dados,
            processData: false,
            contentType: false,
            success: function(dadosIn) {
                limparCampos();
            }
        });
    }
    
    function processarRetornoAjax(dados) {
        
    }
    
    $(document).ready(function() {

        $(".collapse").removeClass("show");
        $(".nav-item").removeClass("active");
        $(".collapse-item").removeClass("active");

        $("#menu_produtos").addClass("show");
        $("#menu_produtos").parent(".nav-item").addClass("active");
        $("#menu_item_itens").addClass("active");
        
        $("#fld_arquivo").spartanMultiImagePicker({
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
            let dados = verifica_dados();
            if (dados != null) {
                processarDados(dados);
            }
        });

        //$('#tbl_tipos').DataTable({searching: false, info: false, lengthChange: false});
        //$('#tbl_complementos').DataTable({searching: false, info: false, lengthChange: false});
        //$('#tbl_ingredientes').DataTable({searching: false, info: false, lengthChange: false});


    });
    
</script>