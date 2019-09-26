/*
 * Copyright (C) Paulo Henrique Goncalves Bacelar, Inc - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Paulo Henrique Gonacalves Bacelar <henrique.phgb@gmail.com>, Dezembro 2018
 */
package com.br.phdev.srs.controladores;

import br.com.uol.pagseguro.api.exception.PagSeguroLibException;
import br.com.uol.pagseguro.api.notification.NotificationType;
import br.com.uol.pagseguro.api.transaction.search.TransactionDetail;
import com.br.phdev.srs.daos.ClienteDAO;
import com.br.phdev.srs.exceptions.DAOException;
import com.br.phdev.srs.exceptions.PaymentException;
import com.br.phdev.srs.jdbc.FabricaConexao;
import com.br.phdev.srs.models.ExecutarPagamento;
import com.br.phdev.srs.models.IPNMessage;
import com.br.phdev.srs.models.Mensagem;
import com.br.phdev.srs.models.Pedido2;
import com.br.phdev.srs.utils.HttpUtils;
import com.br.phdev.srs.utils.ServicoPagamentoPagSeguro;
import com.br.phdev.srs.utils.ServicoPagamentoPagarme;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import me.pagar.model.PagarMe;
import me.pagar.model.PagarMeRequest;
import me.pagar.model.Postback;
import me.pagar.model.PostbackDelivery;
import me.pagar.model.Transaction;
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
 * @author Paulo Henrique Gonçalves Bacelar <henrique.phgb@gmail.com>
 */
@Controller
public class PagamentoController {
    
    private ClienteDAO dao;
    
    //@Autowired
    public PagamentoController(ClienteDAO dao) {
        this.dao = dao;
    }
    
    @GetMapping("pagamentos/criar-pagamento")
    public ResponseEntity<Mensagem> criarPagamento(HttpSession sessao) {
        Mensagem mensagem = new Mensagem();
        ServicoPagamentoPagSeguro pagSeguro = new ServicoPagamentoPagSeguro();
        String token = pagSeguro.criarTokenPagamento();
        mensagem.setCodigo(100);
        mensagem.setDescricao(token);
        sessao.setAttribute("token_sessao_pagseguro", token);
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(mensagem, httpHeaders, HttpStatus.OK);
    }

    @PostMapping("pagamentos/executar-pagamento2")
    public ResponseEntity<Mensagem> executarPagamento2(@RequestBody ExecutarPagamento ep, HttpSession sessao) {
        System.out.println("Executando pagamento pag-seguro com cartão de credito");
        Mensagem mensagem = new Mensagem();
        try {            
            ExecutarPagamento pagamentoRecuperado = (ExecutarPagamento) sessao.getAttribute("executar-pagamento");
            ServicoPagamentoPagSeguro servicoPagamento = new ServicoPagamentoPagSeguro();
            //pagamentoRecuperado.setEndereco(ep.getEndereco());
            //pagamentoRecuperado.setCpf(ep.getCliente().getCpf());
            //pagamentoRecuperado.setNome(ep.getCliente().getNome());
            //pagamentoRecuperado.setData(ep.getData());
            //pagamentoRecuperado.setTelefone(ep.getCliente().getTelefone());
            //pagamentoRecuperado.setTokenSessao(ep.getTokenSessao());
            pagamentoRecuperado.setTokenCartao(ep.getTokenCartao());
            pagamentoRecuperado.setHashCliente(ep.getHashCliente());
            System.out.println("HERE1");
            String codigoPagamento = servicoPagamento.executarPagamentoCartaoCredito(pagamentoRecuperado);            
            System.out.println("HERE2");
            if (codigoPagamento != null) {
                if (this.dao.atualizarTokenPrePedido(ep.getTokenSessao(), codigoPagamento)) {
                    mensagem.setCodigo(100);
                    mensagem.setDescricao("Processando pagamento");
                } else {
                    mensagem.setCodigo(300);
                    mensagem.setDescricao("Houve algum erro ao processar o pagamento");
                }
            } else {
                mensagem.setCodigo(101);
                mensagem.setDescricao("Não foi possível processar o pagamento");
            }
        } catch (PaymentException e) {
            e.printStackTrace();
            mensagem.setCodigo(300);
            mensagem.setDescricao(e.getMessage());
        } catch (DAOException e) {
            e.printStackTrace();
            mensagem.setCodigo(300);
            mensagem.setDescricao(e.getMessage());
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(mensagem, httpHeaders, HttpStatus.OK);
    }

    @GetMapping("pagamentos/cancelar-pagamento")
    public String cancelarPagamento(HttpServletRequest req) {
        System.out.println("");
        System.out.println("Cancelar pagamento");
        HttpUtils hu = new HttpUtils();
        hu.showHeaders(req);
        hu.showParams(req);
        System.out.println("Pagamento cancelado");
        String paymentId = req.getParameter("paymentId");
        String payerId = req.getParameter("PayerID");
        System.out.println("Id de pagamento: " + paymentId);
        System.out.println("Id do comprador: " + payerId);
        return "processando-pagamento";
    }

    @PostMapping("pagamentos/notificar3")
    public ResponseEntity<String> notificar3(HttpServletRequest request) throws InterruptedException {
        if (request.getParameter("notificationCode").isEmpty()
                || request.getParameter("notificationType").isEmpty()) {
            throw new PagSeguroLibException(
                    new IllegalArgumentException("Notification code or " + "notification type not exists")
            );
        }
        NotificationType notificationType = NotificationType.fromName(
                request.getParameter("notificationType")
        );
        ServicoPagamentoPagSeguro pagamento = new ServicoPagamentoPagSeguro();
        TransactionDetail transacao = pagamento.procurarNotificao(request.getParameter("notificationCode"));
        switch (notificationType) {
            case TRANSACTION:
                try {
                    Mensagem mensagem = new Mensagem();
                    String sessaoUsuario = this.dao.recuperarSessaoClienteParaConfirmarCompra(transacao.getCode());
                    if (sessaoUsuario != null) {
                        switch (transacao.getStatus().getStatus()) {
                            case APPROVED:
                                mensagem.setCodigo(100);
                                mensagem.setDescricao("O pagamento foi confirmado");
                                this.dao.inserirPedidoDePrePedido(transacao.getCode());
                                break;
                            case CANCELLED:
                                mensagem.setCodigo(101);
                                mensagem.setDescricao("O pagamento foi recusado");
                                break;
                        }
                        ObjectMapper mapeador = new ObjectMapper();
                        String msg = mapeador.writeValueAsString(mensagem);
                        System.out.println("Enviando notificação para: " + sessaoUsuario);
                        //this.template.setSendTimeout(10000);
                        //this.template.convertAndSendToUser(sessaoUsuario, "/queue/reply", msg);
                        //Thread.sleep(10000);
                        //this.template.convertAndSendToUser(sessaoUsuario, "/queue/reply", msg);
                    }
                } catch (DAOException | JsonProcessingException e) {
                    e.printStackTrace();
                }
                break;
            case APPLICATION_AUTHORIZATION:
                System.out.println("APPLICATION_AUTHORIZATION");
                break;
            case PRE_APPROVAL:
                System.out.println("PRE_APPROVAL");
                break;
            default:
                System.out.println("NONE");
                throw new PagSeguroLibException(
                        new IllegalArgumentException("Notification not exists")
                );
        }

        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.TEXT_HTML);
        return new ResponseEntity<>("", httpHeaders, HttpStatus.OK);
    }

    @PostMapping("pagamentos/notificar2")
    public ResponseEntity<String> notificar2(HttpServletRequest req) {
        System.out.println("Notificação de pagamento do paypal");
        try (Connection conexao = new FabricaConexao().conectar()) {
            Map<String, String> configMap = new HashMap<>();
            configMap.put("mode", "sandbox");
            IPNMessage ipnListener = new IPNMessage(req, configMap);
            if (ipnListener.validate()) {
                Map<String, String> m = ipnListener.getIpnMap();
                String idComprador = m.get("payer_id");
                Mensagem mensagem = new Mensagem();
                String sessaoUsuario = this.dao.recuperarSessaoClienteParaConfirmarCompra(idComprador);
                if (m.get("payment_status").equals("Completed")) {
                    mensagem.setCodigo(100);
                    mensagem.setDescricao("O pagamento foi confirmado");
                    this.dao.inserirPedidoDePrePedido(idComprador);
                } else {
                    mensagem.setCodigo(101);
                    mensagem.setDescricao("O pagamento foi recusado");
                }
                ObjectMapper mapeador = new ObjectMapper();
                String msg = mapeador.writeValueAsString(mensagem);                
                //this.template.convertAndSendToUser(sessaoUsuario, "/queue/reply", msg);
            }
        } catch (DAOException | SQLException | JsonProcessingException e) {
            e.printStackTrace();
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.TEXT_HTML);
        return new ResponseEntity<>("", httpHeaders, HttpStatus.OK);
    }
    
    @PostMapping("pagamentos/notificar-pagarme")
    public ResponseEntity<String> notificarPagarMe(HttpServletRequest request) throws InterruptedException {        
        System.out.println("Notificação pagarme recebida");
        HttpUtils utils = new HttpUtils();
        utils.showParams(request);        
        String id = request.getParameterMap().get("transaction[id]")[0];
        System.out.println(id);
        System.out.println(request.getParameterMap().get("current_status")[0]);
        try {
            Pedido2 pedido = this.dao.getPedidoPorToken(id);
            switch(request.getParameterMap().get("current_status")[0]) {
                case "paid" :
                    pedido.setEstado(4);
                    this.dao.atualizarEstadoPedido2(pedido);
                    break;
            }            
        } catch (DAOException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.TEXT_HTML);
        return new ResponseEntity<>("", httpHeaders, HttpStatus.OK);
    }

}
