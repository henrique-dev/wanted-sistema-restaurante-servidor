/*
 * Copyright (C) 2019 Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>, 10-08-2019
 */
package com.br.phdev.srs.controladores;

import com.br.phdev.srs.daos.SessaoDAO;
import com.br.phdev.srs.exceptions.DAOException;
import com.br.phdev.srs.models.Admin;
import com.br.phdev.srs.models.Cliente;
import com.br.phdev.srs.models.Mensagem;
import com.br.phdev.srs.models.Usuario;
import com.br.phdev.srs.utils.ServicoGeracaoToken;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

/**
 *
 * @author Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>
 */
@Controller
public class SessaoController {
    
    private SessaoDAO dao;
    
    @Autowired
    public SessaoController(SessaoDAO dao) {
        this.dao = dao;
    }
    
    @GetMapping("sessao/entrar")
    public String entrar() {
        return "login";
    }    
    
    @PostMapping("sessao/verificar-sessao")
    public ResponseEntity<Mensagem> verificarSessao(HttpServletRequest req) {
        Mensagem mensagem = new Mensagem();
        try {            
            if (this.dao.verificarSessao(req.getHeader("ac-tk"))) {
                mensagem.setDescricao("Pode autenticar");
                mensagem.setCodigo(100);
            } else {
                mensagem.setDescricao("Sessão perdida, faça o login novamente");
                mensagem.setCodigo(101);
            }
        } catch (DAOException e) {
            e.printStackTrace();
            mensagem.setCodigo(e.codigo);
            mensagem.setDescricao(e.getMessage());
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(mensagem, httpHeaders, HttpStatus.OK);
    }
    
    @PostMapping("sessao/autenticar")
    public ResponseEntity<Mensagem> autenticar(@RequestBody Usuario usuario, HttpServletRequest req, HttpServletResponse res, HttpSession sessao) {
        Mensagem mensagem = new Mensagem();
        try {
            String senhaUsuario = usuario.getSenhaUsuario();
            String nomeUsuario = usuario.getNomeUsuario();
            Cliente cliente = this.dao.autenticar(usuario);
            if (cliente != null) {
                this.dao.gerarSessao(usuario, sessao.getId());
                mensagem.setCodigo(100);
                sessao.setAttribute("usuario", usuario);
                sessao.setAttribute("cliente", cliente);
                HttpHeaders httpHeaders = new HttpHeaders();
                httpHeaders.setContentType(MediaType.APPLICATION_JSON);
                httpHeaders.add("session-id", sessao.getId());
                httpHeaders.add("h-usuario", new ServicoGeracaoToken().gerarSHA256(nomeUsuario));
                httpHeaders.add("h-segredo", new ServicoGeracaoToken().gerarSHA256(senhaUsuario));
                return new ResponseEntity<>(mensagem, httpHeaders, HttpStatus.OK);
            } else {
                mensagem.setCodigo(101);
                mensagem.setDescricao("Usuário ou senha inválidos");
            }
        } catch (DAOException e) {
            e.printStackTrace();
            mensagem.setCodigo(e.codigo);
            mensagem.setDescricao(e.getMessage());
        } catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(mensagem, httpHeaders, HttpStatus.OK);
    }
    
    @PostMapping("sessao/autenticar-2")
    public String autenticar(String nomeUsuario, String senhaUsuario,
            HttpServletRequest req, HttpServletResponse res, HttpSession sessao) {
        Mensagem mensagem = new Mensagem();        
        try {
            Admin admin = this.dao.autenticar2(new Usuario(0, nomeUsuario, senhaUsuario));
            if (admin != null) {                
                this.dao.gerarSessao2(admin, sessao.getId());
                mensagem.setCodigo(100);
                sessao.setAttribute("admin", admin);
                return "redirect:../gerenciador/index";
            } else {
                mensagem.setCodigo(101);
                mensagem.setDescricao("Usuário ou senha inválidos");
            }
        } catch (DAOException e) {
            mensagem.setCodigo(e.codigo);
            mensagem.setDescricao(e.getMessage());
        }
        return "redirect:login";
    }

    @PostMapping("sessao/sair")
    public ResponseEntity<Mensagem> sair(HttpSession sessao, HttpServletRequest request) {
        Mensagem mensagem = new Mensagem();
        try {
            this.dao.sairSessao((Usuario) sessao.getAttribute("usuario"), null);
            mensagem.setCodigo(100);
            mensagem.setDescricao("Desconectado do sistema");
            sessao.removeAttribute("usuario");
            sessao.removeAttribute("cliente");
            sessao.invalidate();
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
