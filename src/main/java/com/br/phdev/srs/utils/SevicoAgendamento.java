package com.br.phdev.srs.utils;

import com.br.phdev.srs.daos.GerenciadorDAO;
import com.br.phdev.srs.exceptions.DAOException;
import com.br.phdev.srs.jdbc.FabricaConexao;
import com.br.phdev.srs.models.Notificacao;
import com.fasterxml.jackson.core.JsonProcessingException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
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

    @Scheduled(fixedDelay = 10000)
    public void verificaPorHora() throws JsonProcessingException, IOException {
        System.out.println("Executando servico de agendamento");
        try (Connection conexao = new FabricaConexao().conectar()) {
            GerenciadorDAO dao = new GerenciadorDAO(conexao);
            HashSet notificacoes = dao.listarNotificacoes();
            Iterator<Notificacao> iterator = notificacoes.iterator();
            while(iterator.hasNext()) {
                Notificacao notificacao = iterator.next();
                if (ServicoNotificacao.enviarMensagem(notificacao.getWebsocketId(), notificacao.getMensagem())){
                    System.out.println("Mensagem enviada");
                }                
            }
        } catch (SQLException e) {
            e.printStackTrace();
            
        } catch (DAOException e) {
            e.printStackTrace();
            
        }
    }

}
