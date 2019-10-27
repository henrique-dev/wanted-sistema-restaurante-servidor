/*
 * Copyright (C) 2019 Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>, 10-08-2019
 */
package com.br.phdev.srs.controladores;

import com.br.phdev.srs.daos.CadastroDAO;
import com.br.phdev.srs.exceptions.DAOException;
import com.br.phdev.srs.models.Cadastro;
import com.br.phdev.srs.models.Cliente;
import com.br.phdev.srs.models.Mensagem;
import com.br.phdev.srs.models.PerguntaSeguranca;
import com.br.phdev.srs.models.RedefinicaoSenha;
import com.br.phdev.srs.models.Usuario;
import com.br.phdev.srs.utils.ServicoGeracaoToken;
import com.br.phdev.srs.utils.ServicoSms;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;
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
public class CadastroController {
    
    private CadastroDAO dao;
    
    @Autowired
    public CadastroController(CadastroDAO dao) {
        this.dao = dao;
    }

    @PostMapping("cadastro/verificar-numero")
    public ResponseEntity<Mensagem> verificarNumero(@RequestBody Cadastro cadastro) {
        Mensagem mensagem = new Mensagem();
        try {
            mensagem = this.dao.verificarNumero(cadastro);
        } catch (DAOException e) {
            e.printStackTrace();
            mensagem.setCodigo(101);
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(mensagem, httpHeaders, HttpStatus.OK);
    }
    
    @PostMapping("cadastro/enviar-codigo")
    public ResponseEntity<Mensagem> enviarCodigo(@RequestBody Cadastro cadastro) {
        Mensagem mensagem = new Mensagem();
        try {
            mensagem = this.dao.enviarCodigoAtivacao(cadastro);
            if (mensagem.getCodigo() == 100) {
                new ServicoSms().enviarMensagem(cadastro.getTelefone(), "Bem vindo a Wanted. Insira o código " + mensagem.getDescricao() + " para ativar sua conta.");
                mensagem.setDescricao("Sms enviado");
            }
        } catch (DAOException e) {
            e.printStackTrace();
            mensagem.setCodigo(e.codigo);
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(mensagem, httpHeaders, HttpStatus.OK);
    }
    
    @PostMapping("cadastro/validar-codigo")
    public ResponseEntity<Mensagem> validarCodigo(@RequestBody Cadastro cadastro, HttpSession sessao) {
        Mensagem mensagem = new Mensagem();
        HttpHeaders httpHeaders = new HttpHeaders();
        try {
            Usuario usuario = this.dao.validarCodigoAtivacao(cadastro, sessao.getId());
            if (usuario != null) {                
                sessao.setAttribute("usuario", usuario);                                
                httpHeaders.add("session-id", sessao.getId());
                mensagem.setCodigo(100);
                mensagem.setDescricao("Número de telefone verificado. Pode prosseguir com o cadastro");
            } else {
                mensagem.setDescricao("Código inválido");
                mensagem.setCodigo(101);
            }            
        } catch (DAOException e) {
            e.printStackTrace();
            mensagem.setCodigo(e.codigo);
        }        
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(mensagem, httpHeaders, HttpStatus.OK);
    }
    
    @PostMapping("cadastro/finalizar-cadastro")
    public ResponseEntity<Mensagem> finalizarCadastro(@RequestBody Cadastro cadastro, HttpSession sessao) {
        Mensagem mensagem = new Mensagem();
        HttpHeaders httpHeaders = new HttpHeaders();
        try {
            Usuario usuario = (Usuario) sessao.getAttribute("usuario");
            if (usuario != null) {
                mensagem = this.dao.cadastrarCliente(usuario, cadastro);
                httpHeaders.add("h-usuario", new ServicoGeracaoToken().gerarSHA256(cadastro.getTelefone()));
                httpHeaders.add("h-segredo", new ServicoGeracaoToken().gerarSHA256(cadastro.getSenhaUsuario()));
                if (mensagem.getCodigo() == 100) {
                    Cliente cliente = this.dao.getCliente(usuario);
                    if (cliente != null) {
                        sessao.setAttribute("cliente", cliente);
                    }                    
                }
            } else {
                mensagem.setCodigo(102);
                mensagem.setDescricao("Ocorreu um erro ao finalizar o cadastro");
            }
        } catch (DAOException e) {
            e.printStackTrace();
            mensagem.setCodigo(e.codigo);
        } catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(mensagem, httpHeaders, HttpStatus.OK);
    }
    
    @PostMapping("cadastro/perguntas-seguranca")
    public ResponseEntity<List<PerguntaSeguranca>> perguntasSeguranca(HttpSession sessao) {
        HttpHeaders httpHeaders = new HttpHeaders();
        List<PerguntaSeguranca> perguntas = new ArrayList<>();
        try {
            Usuario usuario = (Usuario) sessao.getAttribute("usuario");
            if (usuario != null) {
                perguntas = this.dao.getPerguntasSeguranca();
            }
        } catch (DAOException e) {
            e.printStackTrace();
        }
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(perguntas, httpHeaders, HttpStatus.OK);
    }
    
    @PostMapping("cadastro/enviar-codigo-redefinir-senha")
    public ResponseEntity<Mensagem> enviarCodigoRedefinirSenha(@RequestBody Cadastro cadastro) {
        Mensagem mensagem = new Mensagem();
        try {
            mensagem = this.dao.enviarCodigoRedefinirSenha(cadastro);
            if (mensagem.getCodigo() == 100) {
                new ServicoSms().enviarMensagem(cadastro.getTelefone(), "Redefinição de senha da sua conta Wanted. Insira o código " + mensagem.getDescricao() + 
                        " no aplicativo para continuar com a redefinição de senha.");
                mensagem.setDescricao("Sms enviado");
            }
        } catch (DAOException e) {
            e.printStackTrace();
            mensagem.setCodigo(e.codigo);
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(mensagem, httpHeaders, HttpStatus.OK);
    }
    
    @PostMapping("cadastro/validar-codigo-redefinir-senha")
    public ResponseEntity<Mensagem> validarCodigoRedefinirSenha(@RequestBody RedefinicaoSenha redefinicaoSenha) {
        Mensagem mensagem = new Mensagem();
        try {
            mensagem = this.dao.redefinirSenha(redefinicaoSenha);
        } catch (DAOException e) {
            e.printStackTrace();
            mensagem.setCodigo(e.codigo);
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(mensagem, httpHeaders, HttpStatus.OK);
    }
    
    /*@PostMapping("cadastro/recuperar-senha")
    public ResponseEntity<Mensagem> recuperarSenha(HttpSession sessao) {
        
        return new ResponseEntity<>(mensagem, httpHeaders, HttpStatus.OK);
    }*/
    
    @GetMapping("cadastro/termos-uso")
    public String termosUso() {        
        return "termos-uso";
    }
    
    @GetMapping("cadastro/politica-privacidade")
    public String politicaPrivacidade() {        
        return "politica-privacidade";
    }
    
    @GetMapping("cadastro/politica-troca")
    public String politicaTroca() {        
        return "politica-troca";
    }

}
