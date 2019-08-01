package com.br.phdev.srs.utils;

import com.br.phdev.srs.models.Mensagem;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

/**
 *
 * @author henrique
 */
@Component
@EnableScheduling
public class SevicoAgendamento {
//Atributos        

    @Scheduled(fixedDelay = 5000)
    public void verificaPorHora() throws JsonProcessingException, IOException {
        List<WebSocketSession> sessions = ServicoNotificacao.getSessions();
        for (WebSocketSession s : sessions) {
            //s.sendMessage(new TextMessage("Testando envio de mensagens"));
            //System.out.println("Enviou msg para: " + s);
        }
    }

}
