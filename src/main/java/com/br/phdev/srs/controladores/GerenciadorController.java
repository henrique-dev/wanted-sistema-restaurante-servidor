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
import com.br.phdev.srs.models.Cliente;
import com.br.phdev.srs.models.Complemento;
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
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.util.ArrayList;
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
            modelo.addAttribute("acao", "novo");
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
            Item item = this.dao.getItem(new Item(id));
            System.out.println(item);
            modelo.addAttribute("acao", "atualizar");
            modelo.addAttribute("item", item);
            modelo.addAttribute("generos", this.dao.getGeneros());
            modelo.addAttribute("tipos", this.dao.getTipos());
            modelo.addAttribute("complementos", this.dao.getComplementos());
            modelo.addAttribute("ingredientes", this.dao.getIngredientes());
        } catch (DAOException e) {
            e.printStackTrace();
        }
        return "admin/produtos/item/atualizar";
    }
    
    @PostMapping("gerenciador/item/salvar")
    @ResponseBody
    public void adicionarItem(String nome, String descricao, String preco, String tiposJSON, String genero,
            String ingredientesJSON, String complementosJSON, MultipartFile arquivo0, MultipartFile arquivo1,
            MultipartFile arquivo2, MultipartFile arquivo3) {
        try {
            Item2 item = new Item2();
            item.setNome(nome);
            item.setDescricao(descricao);
            item.setPreco(Double.parseDouble(preco));
            item.setGenero(new Genero(Long.parseLong(genero)));
            
            System.out.println(tiposJSON);
            
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
            
            item.setTipos(tipos);
            item.setComplementos(complementos);
            item.setIngredientes(ingredientes);
             
            List<MultipartFile> arquivos = new ArrayList<>();
            if (arquivo0 != null) arquivos.add(arquivo0);
            if (arquivo1 != null) arquivos.add(arquivo1);
            if (arquivo2 != null) arquivos.add(arquivo2);
            if (arquivo3 != null) arquivos.add(arquivo3);
            item.setFotos(arquivos);
            this.dao.adicionarItem(item);
        } catch (Exception e) {
            e.printStackTrace();
        }
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

}
