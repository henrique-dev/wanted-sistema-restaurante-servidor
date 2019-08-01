package com.br.phdev.srs.utils;

import com.br.phdev.srs.models.Mensagem;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 *
 * @author henrique
 */
//@Component
//@EnableScheduling
public class SevicoAgendamento {
//Atributos

    /*
    @Autowired
    private SimpMessagingTemplate template;

    @Scheduled(fixedDelay = 5000)
    public void verificaPorHora() throws JsonProcessingException {
        List<String> usuarios = ServicoNotificacao.getUsuarios();
        for (String s : usuarios) {
            Mensagem mensagem = new Mensagem();
            mensagem.setDescricao("MASOQUEISSO");
            ObjectMapper mapeador = new ObjectMapper();
            String msg = mapeador.writeValueAsString(mensagem);
            this.template.convertAndSendToUser(s, "/queue/reply", msg);
            System.out.println("Enviou msg para: " + s);
        }
    }*/

}
