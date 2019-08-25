/*
 * Copyright (C) Paulo Henrique Goncalves Bacelar, Inc - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Paulo Henrique Gonacalves Bacelar <henrique.phgb@gmail.com>, Dezembro 2018
 */
package com.br.phdev.srs.controladores;

import com.br.phdev.srs.daos.GerenciadorDAO;
import com.br.phdev.srs.exceptions.DAOException;
import com.br.phdev.srs.models.Admin;
import com.br.phdev.srs.models.Arquivo;
import com.br.phdev.srs.models.Cliente;
import com.br.phdev.srs.models.Complemento;
import com.br.phdev.srs.models.CupomDesconto;
import com.br.phdev.srs.models.Foto;
import com.br.phdev.srs.models.Genero;
import com.br.phdev.srs.models.Ingrediente;
import com.br.phdev.srs.models.Item;
import com.br.phdev.srs.models.Item2;
import com.br.phdev.srs.models.ItemPedido;
import com.br.phdev.srs.models.Mensagem;
import com.br.phdev.srs.models.Notificacao;
import com.br.phdev.srs.models.Pedido;
import com.br.phdev.srs.models.Pedido2;
import com.br.phdev.srs.models.Tipo;
import com.br.phdev.srs.utils.ServicoArmazenamento;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Paulo Henrique Gonçalves Bacelar <henrique.phgb@gmail.com>
 */
@Controller
public class GerenciadorController {
    
    private GerenciadorDAO dao;    
    
    @Autowired
    public GerenciadorController(GerenciadorDAO dao) {
        this.dao = dao;
    }    
    
    @GetMapping("gerenciador/index")
    public String main(Model modelo) {
        try {
            List<Pedido2> pedidos = this.dao.getPedidos();
            modelo.addAttribute("pedidos", pedidos);
        } catch (DAOException e) {
            e.printStackTrace();
        }
        return "admin/index";
    }
    
    @GetMapping("gerenciador/pedido")
    public String pedido(Integer id, Model modelo) {        
        try {
            Pedido pedido = this.dao.getPedido();
            modelo.addAttribute("pedido", pedido);
        } catch (DAOException | IOException e) {
            e.printStackTrace();
        }
        return "admin/pedido";
    }
    
    @GetMapping("gerenciador/cupons")
    public String cupons(Model modelo) {
        try {
            List<CupomDesconto> cupomDescontos = this.dao.getCupomDescontos();
            modelo.addAttribute("cupons", cupomDescontos);
        } catch (DAOException e) {
            e.printStackTrace();
        }
        return "admin/cupons/cupons";
    }
    
    @GetMapping("gerenciador/cupom/novo")
    public String novoCupom(Model modelo) {        
        try {
            modelo.addAttribute("tipos", this.dao.getTipoCupomDescontos());
        } catch (DAOException e) {
            e.printStackTrace();
        }
        return "admin/cupons/cupom/novo";
    }
    
    @ResponseBody
    @PostMapping("gerenciador/cupom/salvar")
    public String salvarCupom(String cupomJSON, Model modelo) throws JsonProcessingException {    
        Mensagem mensagem = new Mensagem();        
        try {
            ObjectMapper mapeador = new ObjectMapper();
            CupomDesconto cupom = mapeador.readValue(cupomJSON,
                    new TypeReference<CupomDesconto>() {
            });
            if (!this.dao.checarExistenciaCupomCodigo(cupom.getCodigo())) {
                this.dao.inserirCupom(cupom);
                mensagem.setCodigo(100);
            } else {
                mensagem.setCodigo(300);
            }            
        } catch (DAOException | IOException e) {
            e.printStackTrace();
        }
        return new ObjectMapper().writeValueAsString(mensagem);
    }
    
    @GetMapping("gerenciador/itens")
    public String itens(Model modelo) {
        try {
            List<Item> itens = this.dao.getItens();
            modelo.addAttribute("itens", itens);
        } catch (DAOException e) {
            e.printStackTrace();
        }
        return "admin/produtos/itens";
    }
    
    @GetMapping("gerenciador/item/novo")
    public String novoItem(String opcao, Integer id, Model modelo) {        
        try {
            modelo.addAttribute("generos", this.dao.getGeneros());
            modelo.addAttribute("tipos", this.dao.getTipos());
            modelo.addAttribute("complementos", this.dao.getComplementos());
            modelo.addAttribute("ingredientes", this.dao.getIngredientes());
        } catch (DAOException e) {
            e.printStackTrace();
        }
        return "admin/produtos/item/novo";
    }
    
    @GetMapping("gerenciador/item/atualizar")
    public String atualizarItem(String opcao, Integer id, Model modelo) {        
        try {
            modelo.addAttribute("item", this.dao.getItem(new Item(id)));
            modelo.addAttribute("generos", this.dao.getGeneros());
            modelo.addAttribute("tipos", this.dao.getTipos());
            modelo.addAttribute("complementos", this.dao.getComplementos());
            modelo.addAttribute("ingredientes", this.dao.getIngredientes());
        } catch (DAOException e) {
            e.printStackTrace();
        }
        return "admin/produtos/item/atualizar";
    }
    
    @ResponseBody
    @PostMapping("gerenciador/item/salvar")    
    public String adicionarItem(Integer id, String nome, String descricao, String preco, String tempoPreparo, String tiposJSON, String genero,
            String ingredientesJSON, String complementosJSON, String arquivosexcluirJSON, String arquivosmantidosJSON, MultipartFile arquivo0, MultipartFile arquivo1,
            MultipartFile arquivo2, MultipartFile arquivo3) throws JsonProcessingException {
        Mensagem mensagem = new Mensagem();
        try {
            Item2 item = new Item2();
            item.setId(id);
            item.setNome(nome);
            item.setDescricao(descricao);
            item.setPreco(Double.parseDouble(preco == null ? "0" : preco));
            item.setTempoPreparo(tempoPreparo);
            item.setGenero(new Genero(Long.parseLong(genero)));
            
            ObjectMapper mapeador = new ObjectMapper();
            Set<Tipo> tipos = mapeador.readValue(tiposJSON,
                    new TypeReference<Set<Tipo>>() {
            });
            Set<Complemento> complementos = mapeador.readValue(complementosJSON,
                    new TypeReference<Set<Complemento>>() {
            });
            Set<Ingrediente> ingredientes = mapeador.readValue(ingredientesJSON,
                    new TypeReference<Set<Ingrediente>>() {
            });            
            List<Arquivo> arquivosParaExcluir = mapeador.readValue(arquivosexcluirJSON == null ? "[]" : arquivosexcluirJSON,
                    new TypeReference<List<Arquivo>>() {
            });
            
            item.setTipos(tipos);
            item.setComplementos(complementos);
            if (!item.getComplementos().isEmpty()) {
                item.setModificavel(true);
            }
            item.setIngredientes(ingredientes);
            if (!item.getIngredientes().isEmpty()) {
                item.setModificavelIngrediente(true);
            }
            
            List<Arquivo> arquivos = new ArrayList<>();
            
            if (arquivo0 != null) {
                arquivos.add(new Arquivo(0l, arquivo0));
            }
            if (arquivo1 != null) {
                arquivos.add(new Arquivo(0l, arquivo1));
            }
            if (arquivo2 != null) {
                arquivos.add(new Arquivo(0l, arquivo2));
            }
            if (arquivo3 != null) {
                arquivos.add(new Arquivo(0l, arquivo3));
            }
            if (arquivosParaExcluir.size() > 0) {
                for (int i = 0; i < arquivosParaExcluir.size(); i++) {
                    Arquivo arq = arquivosParaExcluir.get(i);
                    for (Arquivo arq2 : arquivos) {
                        if (arq2.getId() == 0) {
                            arq2.setId(arq.getId());
                            arq.setId(0l);
                            break;
                        }
                    }
                }
                for (Arquivo arq : arquivosParaExcluir) {
                    if (arq.getId() != 0) {
                        arq.setId(arq.getId() * -1);
                        if (arquivos.size() < 4) {
                            arquivos.add(arq);
                        }                        
                    }                    
                }
            }
            
            item.setFotos(arquivos);
            this.dao.adicionarItem(item);
            mensagem.setCodigo(100);
        } catch (DAOException | IOException e) {
            mensagem.setCodigo(101);
            e.printStackTrace();
        }
        return new ObjectMapper().writeValueAsString(mensagem);
    }
    
    @GetMapping("gerenciador/generos")
    public String generos(Model modelo) {
        try {
            List<Item> itens = this.dao.getItens();
            modelo.addAttribute("itens", itens);            
        } catch (DAOException e) {
            e.printStackTrace();
        }
        return "admin/produtos/generos";
    }
    
    @GetMapping("gerenciador/complementos")
    public String complementos(Model modelo) {
        try {
            List<Item> itens = this.dao.getItens();
            modelo.addAttribute("itens", itens);            
        } catch (DAOException e) {
            e.printStackTrace();
        }
        return "admin/produtos/complementos";
    }
    
    @GetMapping("gerenciador/ingredientes")
    public String ingredientes(Model modelo) {
        try {
            List<Item> itens = this.dao.getItens();
            modelo.addAttribute("itens", itens);            
        } catch (DAOException e) {
            e.printStackTrace();
        }
        return "admin/produtos/ingredientes";
    }    
    
    @GetMapping("gerenciador/clientes")
    public String clientes(Model modelo) {
        try {
            List<Cliente> clientes = this.dao.getClientes();
            modelo.addAttribute("clientes", clientes);
        } catch (DAOException e) {
            e.printStackTrace();
        }
        return "admin/clientes/todos";
    }
    
    @PostMapping("gerenciador/remover-cliente")
    @ResponseBody
    public void removerCliente(Integer id, Model modelo) {
        List<Cliente> clientes = null;
        try {
            this.dao.removerCliente(new Cliente(id));
            clientes = this.dao.getClientes();
            modelo.addAttribute("clientes", clientes);
        } catch (DAOException e) {
            e.printStackTrace();
        }
    }
    
    @PostMapping("gerenciador/cadastrar-token-alerta")
    @ResponseBody
    public void cadastrarWebToken(String token, Model modelo, HttpSession sessao) {
        try {
            Admin admin = (Admin) sessao.getAttribute("admin");
            this.dao.cadastrarTokenAlerta(admin, token);
        } catch (DAOException e) {
            e.printStackTrace();
        }
    }
    
    @PostMapping("gerenciador/atualizar-estado-pedido2")
    @ResponseBody
    public void atualizarEstadoPedido(Integer id, Model modelo, HttpSession sessao) {
        try {
            Admin admin = (Admin) sessao.getAttribute("admin");
            if (admin != null) {
                Pedido pedido = new Pedido();
                pedido.setId(id);
                this.dao.atualizarEstadoPedido2(pedido);
            }            
        } catch (DAOException e) {
            e.printStackTrace();
        }
    }
    
    @PostMapping("gerenciador/atualizar-estado-pedido")
    public ResponseEntity<Mensagem> atualizarEstadoPedido(@RequestBody Pedido pedido) {
        Mensagem mensagem = new Mensagem();
        try {            
            this.dao.atualizarEstadoPedido(pedido);
            mensagem.setCodigo(100);
            mensagem.setDescricao("Estado atualizado");
        } catch (DAOException e) {
            mensagem.setCodigo(-1);
            mensagem.setDescricao("Erro na atualização do estado do pedido");
            e.printStackTrace();
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(mensagem, httpHeaders, HttpStatus.OK);
    }
    
    @PostMapping("gerenciador/enviar-mensagem")
    public ResponseEntity<Mensagem> enviarMensagem(@RequestBody Notificacao notificacao, HttpSession sessao) {
        Mensagem mensagem = new Mensagem();
        try {            
            this.dao.adicionarNotificacao(notificacao);
            mensagem.setCodigo(100);
            mensagem.setDescricao("mensagem salva");
        } catch (DAOException e) {
            e.printStackTrace();
            mensagem.setCodigo(e.codigo);
            mensagem.setDescricao(e.getMessage());
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(mensagem, httpHeaders, HttpStatus.OK);
    }
    
    @GetMapping("gerenciador/imagens/{idArquivo}")
    @ResponseBody
    public ResponseEntity<byte[]> image(@PathVariable int idArquivo) {
        byte[] bytes = null;
        Foto foto = new Foto();
        foto.setId(idArquivo);
        bytes = new ServicoArmazenamento().carregar(foto);
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.IMAGE_PNG);
        return new ResponseEntity<>(bytes, httpHeaders, HttpStatus.OK);
    }
    
}
