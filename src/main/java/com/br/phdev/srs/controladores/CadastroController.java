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
import com.br.phdev.srs.models.Usuario;
import com.br.phdev.srs.utils.ServicoSms;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
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
                new ServicoSms().enviarMensagem(cadastro.getTelefone(), mensagem.getDescricao());
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
                mensagem = this.dao.cadastrarCliente(usuario, cadastro, sessao);
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
            mensagem.setCodigo(e.codigo);
        }
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(mensagem, httpHeaders, HttpStatus.OK);
    }

}
