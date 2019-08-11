/*
 * Copyright (C) Paulo Henrique Goncalves Bacelar, Inc - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Paulo Henrique Gonacalves Bacelar <henrique.phgb@gmail.com>, Dezembro 2018
 */
package com.br.phdev.srs.controladores;

import com.br.phdev.srs.daos.GerenciadorDAO;
import com.br.phdev.srs.exceptions.DAOException;
import com.br.phdev.srs.exceptions.StorageException;
import com.br.phdev.srs.models.Complemento;
import com.br.phdev.srs.models.Genero;
import com.br.phdev.srs.models.Ingrediente;
import com.br.phdev.srs.models.Item;
import com.br.phdev.srs.models.Mensagem;
import com.br.phdev.srs.models.Notificacao;
import com.br.phdev.srs.models.Pedido;
import com.br.phdev.srs.models.Tipo;
import com.br.phdev.srs.utils.ServicoArmazenamento;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.List;
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
import org.springframework.web.multipart.MultipartFile;

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

    @GetMapping("gerenciador/entrar")
    public String entrar() {
        return "login";
    }    

    @GetMapping("gerenciador/main")
    public String main() {
        return "admin/main";
    }

    @GetMapping("gerenciador/complementos")
    public String complementos(Model modelo) {
        try {
            List<Complemento> complementos = this.dao.getComplementos();
            modelo.addAttribute("listaComplementos", complementos);
        } catch (DAOException e) {
            e.printStackTrace();
        }
        return "admin/pre/complemento";
    }
    
    @GetMapping("gerenciador/generos")
    public String generos(Model modelo) {
        try {
            List<Genero> generos = this.dao.getGeneros();
            modelo.addAttribute("listaGeneros", generos);            
        } catch (DAOException e) {
            e.printStackTrace();
        }
        return "admin/pre/genero";
    }
    
    @GetMapping("gerenciador/itens")
    public String itens(Model modelo) {
        try {
            List<Item> itens = this.dao.getItens();
            modelo.addAttribute("listaItens", itens);            
        } catch (DAOException e) {
            e.printStackTrace();
        }
        return "admin/pre/item";
    }

    @PostMapping("gerenciador/listar-generos")
    public ResponseEntity<List<Genero>> listarGeneros(HttpSession sessao) {
        List<Genero> generos = null;
        try {            
            generos = this.dao.getGeneros();
        } catch (DAOException e) {
            e.printStackTrace();
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(generos, httpHeaders, HttpStatus.OK);
    }

    @PostMapping("gerenciador/cadastrar-generos")
    public ResponseEntity<Mensagem> cadastrarGeneros(@RequestBody List<Genero> generos) {
        Mensagem mensagem = new Mensagem();
        try {            
            this.dao.adicionarGeneros(generos);
            mensagem.setCodigo(0);
            mensagem.setDescricao("Generos inseridos com sucesso");
        } catch (DAOException e) {
            mensagem.setCodigo(-1);
            mensagem.setDescricao("Erro na inserção dos generos");
            e.printStackTrace();
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(mensagem, httpHeaders, HttpStatus.OK);
    }

    @PostMapping("gerenciador/remover-generos")
    public ResponseEntity<Mensagem> removerGeneros(@RequestBody List<Genero> generos) {
        Mensagem mensagem = new Mensagem();
        try {            
            this.dao.removerGeneros(generos);
            mensagem.setCodigo(0);
            mensagem.setDescricao("Generos removidos com sucesso");
        } catch (DAOException | SQLIntegrityConstraintViolationException e) {
            mensagem.setCodigo(-1);
            mensagem.setDescricao("Erro na remoção dos generos");
            e.printStackTrace();
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(mensagem, httpHeaders, HttpStatus.OK);
    }

    @PostMapping("gerenciador/listar-tipos")
    public ResponseEntity<List<Tipo>> listarTipos(HttpSession sessao) {
        List<Tipo> tipos = null;
        try {
            
            tipos = this.dao.getTipos();
        } catch (DAOException e) {
            e.printStackTrace();
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(tipos, httpHeaders, HttpStatus.OK);
    }

    @PostMapping("gerenciador/cadastrar-tipos")
    public ResponseEntity<Mensagem> cadastrarTipos(@RequestBody List<Tipo> tipos) {
        Mensagem mensagem = new Mensagem();
        try {
            
            this.dao.adicionarTipos(tipos);
            mensagem.setCodigo(0);
            mensagem.setDescricao("Tipos inseridos com sucesso");
        } catch (DAOException e) {
            mensagem.setCodigo(-1);
            mensagem.setDescricao("Erro na inserção dos tipos");
            e.printStackTrace();
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(mensagem, httpHeaders, HttpStatus.OK);
    }

    @PostMapping("gerenciador/remover-tipos")
    public ResponseEntity<Mensagem> removerTipos(@RequestBody List<Tipo> tipos) {
        Mensagem mensagem = new Mensagem();
        try {
            
            this.dao.removerTipos(tipos);
            mensagem.setCodigo(0);
            mensagem.setDescricao("Tipos removidos com sucesso");
        } catch (DAOException | SQLIntegrityConstraintViolationException e) {
            mensagem.setCodigo(-1);
            mensagem.setDescricao("Erro na remoção dos tipos");
            e.printStackTrace();
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(mensagem, httpHeaders, HttpStatus.OK);
    }

    @PostMapping("gerenciador/listar-complementos")
    public ResponseEntity<List<Complemento>> listarComplementos(HttpSession sessao) {
        List<Complemento> complementos = null;
        try {
            
            complementos = this.dao.getComplementos();
        } catch (DAOException e) {
            e.printStackTrace();
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(complementos, httpHeaders, HttpStatus.OK);
    }    

    @PostMapping("gerenciador/cadastrar-complemento")
    public ResponseEntity<Mensagem> cadastrarComplemento(@RequestBody Complemento complemento) {
        Mensagem mensagem = new Mensagem();                 
        try {
                        
            this.dao.adicionarComplemento(complemento);
            mensagem.setCodigo(0);
            mensagem.setDescricao("Complementos inseridos com sucesso");
        } catch (DAOException e) {
            mensagem.setCodigo(-1);
            mensagem.setDescricao("Erro na inserção dos complementos");
            e.printStackTrace();
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(mensagem, httpHeaders, HttpStatus.OK);
    }

    @PostMapping("gerenciador/remover-complementos")
    public ResponseEntity<Mensagem> removerComplementos(@RequestBody List<Complemento> complementos) {
        Mensagem mensagem = new Mensagem();
        try {
            ServicoArmazenamento servicoArmazenamento = new ServicoArmazenamento();
            this.dao.removerComplementos(complementos);
            servicoArmazenamento.excluir(complementos);
            mensagem.setCodigo(0);
            mensagem.setDescricao("Tipos removidos com sucesso");
        } catch (DAOException | SQLIntegrityConstraintViolationException e) {
            mensagem.setCodigo(-1);
            mensagem.setDescricao("Erro na remoção dos tipos");
            e.printStackTrace();
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(mensagem, httpHeaders, HttpStatus.OK);
    }
    
    @PostMapping("gerenciador/listar-ingredientes")
    public ResponseEntity<List<Ingrediente>> listarIngredientes(HttpSession sessao) {
        List<Ingrediente> ingredientes = null;
        try {
            
            ingredientes = this.dao.getIngredientes();
        } catch (DAOException e) {
            e.printStackTrace();
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(ingredientes, httpHeaders, HttpStatus.OK);
    }    

    @PostMapping("gerenciador/cadastrar-ingrediente")
    public ResponseEntity<Mensagem> cadastrarIngrediente(@RequestBody List<Ingrediente> ingredientes) {
        Mensagem mensagem = new Mensagem();                 
        try {
                        
            this.dao.adicionarIngrediente(ingredientes);
            mensagem.setCodigo(0);
            mensagem.setDescricao("Ingredientes inseridos com sucesso");
        } catch (DAOException e) {
            mensagem.setCodigo(-1);
            mensagem.setDescricao("Erro na inserção dos complementos");
            e.printStackTrace();
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(mensagem, httpHeaders, HttpStatus.OK);
    }

    @PostMapping("gerenciador/remover-ingredientes")
    public ResponseEntity<Mensagem> removerIngrediente(@RequestBody List<Ingrediente> ingredientes) {
        Mensagem mensagem = new Mensagem();
        try {
                        
            this.dao.removerIngredientes(ingredientes);            
            mensagem.setCodigo(0);
            mensagem.setDescricao("Ingredientes removidos com sucesso");
        } catch (DAOException | SQLIntegrityConstraintViolationException e) {
            mensagem.setCodigo(-1);
            mensagem.setDescricao("Erro na remoção dos tipos");
            e.printStackTrace();
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(mensagem, httpHeaders, HttpStatus.OK);
    }

    @PostMapping("gerenciador/listar-itens")
    public ResponseEntity<List<Item>> listarItens() {
        List<Item> itens = null;
        try {
            
            itens = this.dao.getItens();
        } catch (DAOException e) {
            e.printStackTrace();
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(itens, httpHeaders, HttpStatus.OK);
    }

    @PostMapping("gerenciador/cadastrar-item")
    public ResponseEntity<Mensagem> cadastrarItem(@RequestBody Item item) {
        Mensagem mensagem = new Mensagem();
        try {
            
            this.dao.adicionarItem(item);
            mensagem.setCodigo(0);
            mensagem.setDescricao("Item inserido com sucesso");
        } catch (DAOException e) {
            mensagem.setCodigo(-1);
            mensagem.setDescricao("Erro na inserção do item");
            e.printStackTrace();
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(mensagem, httpHeaders, HttpStatus.OK);
    }

    @PostMapping("gerenciador/salvar-imagem")
    public ResponseEntity<Mensagem> salvarImagem(MultipartFile arquivo) {
        Mensagem mensagem = new Mensagem();
        try {
            
            long id = this.dao.adicionarArquivo();
            ServicoArmazenamento sa = new ServicoArmazenamento();
            sa.salvar(arquivo, id);
            mensagem.setCodigo(0);
            mensagem.setDescricao(String.valueOf(id));
        } catch (DAOException e) {
            mensagem.setCodigo(-1);
            mensagem.setDescricao("Erro na inserção dos complementos");
            e.printStackTrace();
        } catch (StorageException e) {
            mensagem.setCodigo(-1);
            mensagem.setDescricao("Erro ao salvar o arquivo no disco");
            e.printStackTrace();
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(mensagem, httpHeaders, HttpStatus.OK);
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
