package com.br.phdev.srs.utils;

import com.br.phdev.srs.daos.ServicoDAO;
import com.br.phdev.srs.exceptions.DAOException;
import com.br.phdev.srs.models.Notificacao;
import com.br.phdev.srs.models.NotificacaoPedido;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.util.HashSet;
import java.util.Iterator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 *
 * @author henrique
 */
@Component
@EnableScheduling
public class SevicoAgendamento {

    private final ServicoDAO dao;

    @Autowired
    public SevicoAgendamento(ServicoDAO dao) {
        this.dao = dao;
    }

    @Scheduled(fixedDelay = 10000)
    public void verificaPorHora() throws JsonProcessingException, IOException {
        try {
            HashSet notificacoes = this.dao.listarNotificacoes();
            Iterator<Notificacao> iterator = notificacoes.iterator();
            while (iterator.hasNext()) {
                Notificacao notificacao = iterator.next();
                if (ServicoNotificacao.enviarMensagem(notificacao.getWebsocketId(), notificacao.getMensagem())) {
                    //System.out.println("Mensagem enviada");
                }
            }
        } catch (DAOException e) {
            //e.printStackTrace();
        }
    }

    @Scheduled(fixedDelay = 10000)
    public void verificarPedidos() throws JsonProcessingException, IOException {
        try {
            NotificacaoPedido notificacaoPedido = this.dao.listarPedidos();
            ObjectMapper objectMapper = new ObjectMapper();
            String json = objectMapper.writeValueAsString(notificacaoPedido);
            if (ServicoNotificacao.enviarMensagem(notificacaoPedido.getWebsocketId(), json)) {
                //System.out.println("Mensagem enviada");
            }
        } catch (DAOException e) {
            e.printStackTrace();
        }
    }

}
