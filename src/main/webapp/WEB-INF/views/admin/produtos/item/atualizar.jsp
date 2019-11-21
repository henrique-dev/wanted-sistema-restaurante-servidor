<%-- 
    Document   : item
    Created on : 11 de ago de 2019, 13:45:03
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
    <div class="row pt-3 h-100">
        <div class="col-md-4 col-sm-4">
            <div class="p-2 row h-100">
                <div class="col-md-12 col-sm-12 ctn-card border mbg-sub-card pt-4 mb-4 h-100">
                    <div class="row">
                        <div class="col-md-12 col-sm-12">
                            <span id="msg_nome" class="text-danger"></span>
                            <models:campoTexto id="fld_nome" name="nome" label="Nome" value="${item.nome}"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 col-sm-12">
                            <span id="msg_descricao" class="text-danger"></span>
                            <models:areaTexto id="fld_descricao" name="descricao" label="Descrição" value="${item.descricao}"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-8 col-sm-8">
                            <span id="msg_genero" class="text-danger"></span>
                            <models:listaGenero id="fld_genero" name="genero" label="Genêros" data="${generos}" value="${item.genero.id}"/>
                        </div>
                        <div class="col-md-4 col-sm-4">
                            <span id="msg_preco" class="text-danger"></span>
                            <models:campoPreco id="fld_preco" name="preco" label="Preço" value="${item.preco}"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 col-sm-12">
                            <span id="msg_tempo_preparo" class="text-danger"></span>
                            <models:areaTexto id="fld_tempo_preparo" name="tempo_preparo" label="Tempo de preparo" value="${item.tempoPreparo}"/>
                        </div>
                    </div>
                </div>
            </div>            
        </div>
        <div class="col-md-8 col-sm-8 h-100">
            <div class="p-2 row">
                <div class="col-md-12 col-sm-12 ctn-card border mbg-sub-card p-4 h-100">
                    <span id="msg_arquivo" class="text-danger"></span>
                    <div class="row h-100 pt-2 pb-2">                        
                        <c:forEach items="${item.fotos}" var="foto">                            
                            <div class="col-md-3 col-sm-3 h-100 align-items-center justify-content-center">
                                <img src="https://headred.com.br/wanted/gerenciador/imagens/${foto.id}" alt="..." class="img-thumbnail my-auto">
                                <center><models:botao data="data-id=${foto.id} data-remover='false'" label="Excluir" icon="fas fa-x" clas="btn btn-danger remover-foto"/></center>                                
                            </div>
                        </c:forEach>                                                
                    </div>
                    <div class="row h-100 align-middle" id="fld_arquivo"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="p-2 row">
                <div class="col-md-12 col-sm-12 ctn-card border mbg-sub-card p-4 mb-3">
                    <div class="row">
                        <div class="col-md-12 col-sm-12">
                            <button class="btn btn-primary" href="#" data-toggle="modal" data-target="#modal_adicionar_tipos">Adicionar tipos</button>
                            <button class="btn btn-primary" href="#" data-toggle="modal" data-target="#modal_adicionar_complementos">Adicionar complementos</button>
                            <button class="btn btn-primary" href="#" data-toggle="modal" data-target="#modal_adicionar_ingredientes">Adicionar ingredientes</button>
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

<div id="modal_adicionar_tipos" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Adicionar tipos</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div> 
            <div class="modal-body">
                <div class="col-md-12 col-sm-12">
                    <div class="p-2 row">
                        <div class="card col-md-12 col-sm-12 p-4 ">
                            <div class="row">
                                <div class="col-md-12 col-sm-12">                            
                                    <models:listaTipo id="fld_tipos" name="tipos" label="Tipos"  data="${tipos}" data_to_not_include="${item.tipos}"/>
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
                                            <c:forEach items="${item.tipos}" var="tipo">
                                                <tr id='tr_${tipo.id}' data-id="${tipo.id}" data-nome="${tipo.nome}">
                                                    <td width='80%'>${tipo.nome}</td>
                                                    <td width='20%'><center><button class='btn btn-danger btn-remover-tipo'><i class='fa fa-trash'></button></center></td>
                                            </tr>                                        
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>    
                        </div>
                    </div>                                                                    
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>                
            </div>
        </div>
    </div>
</div>

<div id="modal_adicionar_complementos" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Adicionar complementos</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div> 
            <div class="modal-body">
                <div class="col-md-12 col-sm-12">
                    <div class="p-2 row">
                        <div class="card col-md-12 col-sm-12 p-4">
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                    <models:listaComplemento id="fld_complementos" name="complementos" label="Complementos"  data="${complementos}" data_to_not_include="${item.complementos}"/>
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
                                            <c:forEach items="${item.complementos}" var="complemento">
                                                <tr id='tr_${complemento.id}' data-id="${complemento.id}" data-nome="${complemento.nome}"  data-preco="${complemento.preco}">
                                                    <td width='50%'>${complemento.nome}</td>
                                                    <td width='30%'>${complemento.preco}</td>
                                                    <td width='20%'><center><button class='btn btn-danger btn-remover-complemento'><i class='fa fa-trash'></button></center></td>
                                            </tr>                                        
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>           
                        </div>
                    </div>                         
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>                
            </div>
        </div>
    </div>
</div>        

<div id="modal_adicionar_ingredientes" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Adicionar ingredientes</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div> 
            <div class="modal-body">
                <div class="col-md-12 col-sm-12">
                    <div class="p-2 row">
                        <div class="card col-md-12 col-sm-12 p-4">
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                    <models:listaIngrediente id="fld_ingredientes" name="ingredientes" label="Ingredientes"  data="${ingredientes}" data_to_not_include="${item.ingredientes}"/>
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
                                            <c:forEach items="${item.ingredientes}" var="ingrediente">
                                                <tr id='tr_${ingrediente.id}' data-id="${ingrediente.id}" data-nome="${ingrediente.nome}">
                                                    <td width='80%'>${ingrediente.nome}</td>
                                                    <td width='20%'><center><button class='btn btn-danger btn-remover-ingrediente'><i class='fa fa-trash'></button></center></td>
                                            </tr>                                        
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>   
                        </div>
                    </div>         
                </div>        
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>                
            </div>
        </div>
    </div>
</div>        

<script type="text/javascript">

    const id_item = "${item.id}";

    $("#ctn_conteudo").append($("#ctn_index"));

    function verifica_dados() {
        let ok = true;
        let nome = $("#fld_nome").val();
        let descricao = $("#fld_descricao").val();
        let preco = $("#fld_preco").val();
        let tempo_preparo = $("#fld_tempo_preparo").val();
        let genero = $('#fld_genero').find(":selected").val();
        let tipos = new Array();
        $("#tbl_tipos").children("tbody").find("tr").each(function () {
            tipos.push({id: $(this).data("id")});
        });
        let complementos = new Array();
        $("#tbl_complementos").children("tbody").find("tr").each(function () {
            complementos.push({id: $(this).data("id")});
        });
        let ingredientes = new Array();
        $("#tbl_ingredientes").children("tbody").find("tr").each(function () {
            ingredientes.push({id: $(this).data("id")});
        });
        let arquivos = new Array();
        $("#fld_arquivo").find("input").each(function () {
            if ($(this)[0].files[0] != null) {
                arquivos.push($(this)[0].files[0]);
            }
        });
        let arquivos_para_excluir = new Array();
        let arquivos_mantidos = new Array();
        $(".remover-foto").each(function () {
            if ($(this).data("remover")) {
                arquivos_para_excluir.push({id: $(this).data("id")});
            } else {
                arquivos_mantidos.push({id: $(this).data("id")});
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
        if (tempo_preparo == null || tempo_preparo.trim().length == 0) {
            $("#msg_tempo_preparo").text("Insira o tempo de preparo válido para o item.");
            ok = false;
        } else {
            $("#msg_tempo_preparo").text("");
        }
        if (genero == null || genero == 0) {
            $("#msg_genero").text("Insira um genero para o item.");
            ok = false;
        } else {
            $("#msg_genero").text("");
        }
        if (arquivos == null || arquivos_mantidos.length + arquivos.length == 0) {
            $("#msg_arquivo").text("Insira pelo menos uma imagem para o item.");
            ok = false;
        } else {
            if (arquivos_mantidos.length + arquivos.length > 4) {
                $("#msg_arquivo").text("É permitido o máximo de 4 imagens por item.");
                ok = false;
            } else {
                $("#msg_arquivo").text("");
            }
        }

        if (ok) {
            let formData = new FormData();
            formData.append("id", id_item);
            formData.append("nome", nome);
            formData.append("descricao", descricao);
            formData.append("preco", preco);
            formData.append("tempoPreparo", tempo_preparo);
            formData.append("genero", genero);
            formData.append("tiposJSON", JSON.stringify(tipos));
            formData.append("complementosJSON", JSON.stringify(complementos));
            formData.append("ingredientesJSON", JSON.stringify(ingredientes));
            formData.append("arquivosexcluirJSON", JSON.stringify(arquivos_para_excluir));
            formData.append("arquivosmantidosJSON", JSON.stringify(arquivos_mantidos));
            for (let i = 0; i < arquivos.length; i++) {
                formData.append("arquivo" + i, arquivos[i]);
            }
            return formData;
            //formData.append("tipos", JSON.stringify({tipos : tipos}));
        } else {
            return null;
        }

    }

    function processarDados(dados) {
        $("#btn_salvar").attr('disabled');
        $.ajax({
            type: "POST",
            url: "salvar",
            data: dados,
            processData: false,
            contentType: false,
            success: function (dadosIn) {
                let mensagem = JSON.parse(dadosIn);
                switch (mensagem.codigo) {
                    case 100:
                        alertar("success", "Item atualizado com sucesso");
                        window.location.replace("../itens?msg_tipo=" + escape("success") + "&msg=" + escape("Item atualizado com sucesso"));
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

    $(document).ready(function () {

        $(".collapse").removeClass("show");
        $(".nav-item").removeClass("active");
        $(".collapse-item").removeClass("active");

        $("#menu_produtos").addClass("show");
        $("#menu_produtos").parent(".nav-item").addClass("active");
        $("#menu_item_itens").addClass("active");

        $("#fld_arquivo").spartanMultiImagePicker({
            fieldName: 'fileUpload[]',
            maxCount: 4,
            rowHeight: '200px',
            groupClassName: 'col-md-3 col-sm-12 mt-auto mb-auto',
            maxFileSize: '',
            placeholderImage: {
                image: '${pageContext.request.contextPath}/resources/img/placeholder.png',
                width: '100%'
            },
            dropFileLabel: "Drop Here"
        });

        $("#fld_tipos").change(function () {
            let option = $(this).find(":selected");
            $("#tbl_tipos").children("tbody").append(
                    "<tr id='tr_" + option.data("id") + "' data-id=" + option.data("id") + " data-nome=" + option.data("nome") + ">"
                    + "<td width='80%'>" + option.data("nome") + "</td>"
                    + "<td width='20%'><center><button class='btn btn-danger btn-remover-tipo'><i class='fa fa-trash'></button></center></td>"
                    + "</tr>"
                    );
            option.remove();
            $("#tr_" + option.data("id") + " .btn-remover-tipo").click(function () {
                let tr = $(this).parent().parent().parent();
                $("#fld_tipos").append(
                        "<option data-id='" + tr.data("id") + "' data-nome='" + tr.data("nome") + "'>" + tr.data("nome") + "</option>"
                        );
                tr.remove();
            });
        });

        $("#fld_complementos").change(function () {
            let option = $(this).find(":selected");
            $("#tbl_complementos").children("tbody").append(
                    "<tr id='tr_" + option.data("id") + "' data-id='" + option.data("id") + "' data-nome='" + option.data("nome") + "' data-preco='" + option.data("preco") + "'>"
                    + "<td width='50%'>" + option.data("nome") + "</td>"
                    + "<td width='30%'>" + option.data("preco") + "</td>"
                    + "<td width='20%'><center><button class='btn btn-danger btn-remover-complemento'><i class='fa fa-trash'></i></button></center></td>"
                    + "</tr>"
                    );
            option.remove();
            $("#tr_" + option.data("id") + " .btn-remover-complemento").click(function () {
                let tr = $(this).parent().parent().parent();
                $("#fld_complementos").append(
                        "<option data-id='" + tr.data("id") + "' data-nome='" + tr.data("nome") + "' data-preco='" + tr.data("preco") + "'>" + tr.data("nome") + "</option>"
                        );
                tr.remove();
            });
        });

        $("#fld_ingredientes").change(function () {
            let option = $(this).find(":selected");
            $("#tbl_ingredientes").children("tbody").append(
                    "<tr id='tr_" + option.data("id") + "' data-id=" + option.data("id") + " data-nome=" + option.data("nome") + ">"
                    + "<td width='80%'>" + option.data("nome") + "</td>"
                    + "<td width='20%'><center><button class='btn btn-danger btn-remover-ingrediente'><i class='fa fa-trash'></button></center></td>"
                    + "</tr>"
                    );
            option.remove();
            $("#tr_" + option.data("id") + " .btn-remover-ingrediente").click(function () {
                let tr = $(this).parent().parent().parent();
                $("#fld_ingredientes").append(
                        "<option data-id='" + tr.data("id") + "' data-nome='" + tr.data("nome") + "'>" + tr.data("nome") + "</option>"
                        );
                tr.remove();
            });
        });

        $("#btn_salvar").click(function () {
            let dados = verifica_dados();
            if (dados != null) {
                processarDados(dados);
            }
        });

        $(".remover-foto").click(function () {
            if (!$(this).data("remover")) {
                $(this).parent().prev().css("opacity", "0.2");
                $(this).data("remover", true);
                $(this).find(".text").text("Incluir");
                $(this).removeClass("btn-danger");
                $(this).addClass("btn-primary");
            } else {
                $(this).parent().prev().css("opacity", "1");
                $(this).data("remover", false);
                $(this).find(".text").text("Excluir");
                $(this).removeClass("btn-primary");
                $(this).addClass("btn-danger");
            }
        });

        $(".btn-remover-tipo").click(function () {
            let tr = $(this).parent().parent().parent();
            $("#fld_tipos").append(
                    "<option data-id='" + tr.data("id") + "' data-nome='" + tr.data("nome") + "'>" + tr.data("nome") + "</option>"
                    );
            tr.remove();
        });
        $(".btn-remover-complemento").click(function () {
            let tr = $(this).parent().parent().parent();
            $("#fld_complementos").append(
                    "<option data-id='" + tr.data("id") + "' data-nome='" + tr.data("nome") + "' data-preco='" + tr.data("preco") + "'>" + tr.data("nome") + "</option>"
                    );
            tr.remove();
        });
        $(".btn-remover-ingrediente").click(function () {
            let tr = $(this).parent().parent().parent();
            $("#fld_ingredientes").append(
                    "<option data-id='" + tr.data("id") + "' data-nome='" + tr.data("nome") + "'>" + tr.data("nome") + "</option>"
                    );
            tr.remove();
        });

    });

</script>