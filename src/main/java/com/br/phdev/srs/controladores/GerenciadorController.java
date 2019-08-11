/*
 * Copyright (C) Paulo Henrique Goncalves Bacelar, Inc - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Paulo Henrique Gonacalves Bacelar <henrique.phgb@gmail.com>, Dezembro 2018
 */
package com.br.phdev.srs.controladores;

import com.br.phdev.srs.daos.GerenciadorDAO;
import com.br.phdev.srs.exceptions.DAOException;
import com.br.phdev.srs.models.Genero;
import com.br.phdev.srs.models.Item;
import com.br.phdev.srs.models.Mensagem;
import com.br.phdev.srs.models.Notificacao;
import com.br.phdev.srs.models.Pedido;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

/**
 *
 * @author Paulo Henrique Gonçalves Bacelar <henrique.phgb@gmail.com>
 */
@Controller
public class GerenciadorController {
    
    private final GerenciadorDAO dao;    
    
    @Autowired
    public GerenciadorController(GerenciadorDAO dao) {
        this.dao = dao;
    }    

    @GetMapping("gerenciador/index")
    public String main() {
        return "admin/index";
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
    
    @GetMapping("gerenciador/item")
    public String item(String opcao, Integer id, Model modelo) {        
        try {
            switch(opcao.toUpperCase()) {
                case "EDITAR":
                    List<Item> itens = this.dao.getItens();
                    modelo.addAttribute("listaItens", itens);
                    break;
                case "NOVO":
                    List<Genero> generos = this.dao.getGeneros();
                    modelo.addAttribute("generos", generos);
                    break;
            }            
        } catch (DAOException e) {
            e.printStackTrace();
        }
        return "admin/produtos/item";
    }
    
    @GetMapping("gerenciador/salvar-item")
    public String salvarItem(@Valid @ModelAttribute("item")Item item, 
      BindingResult result, ModelMap model) {
        if (result.hasErrors()) {
            System.out.println(result);
        }
        try {
            System.out.println(item);
            List<Item> itens = this.dao.getItens();
            //modelo.addAttribute("itens", itens);            
        } catch (DAOException e) {
            e.printStackTrace();
        }
        return "admin/produtos/itens";
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
