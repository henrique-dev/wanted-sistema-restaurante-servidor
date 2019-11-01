/*
 * Copyright (C) Paulo Henrique Goncalves Bacelar, Inc - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Paulo Henrique Gonacalves Bacelar <henrique.phgb@gmail.com>, Dezembro 2018
 */
package com.br.phdev.srs.controladores;

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
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
                case "refunded" :
                    break;
                default :
                    pedido.setEstado(3);
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
