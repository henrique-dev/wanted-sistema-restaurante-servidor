/*
 * Copyright (C) Paulo Henrique Goncalves Bacelar, Inc - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Paulo Henrique Gonacalves Bacelar <henrique.phgb@gmail.com>, Dezembro 2018
 */
package com.br.phdev.srs.utils;

import com.br.phdev.srs.daos.ServicoDAO;
import com.br.phdev.srs.models.Notificacao;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.security.Principal;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.HandshakeInterceptor;
import org.springframework.web.socket.server.support.DefaultHandshakeHandler;

/**
 *
 * @author Paulo Henrique Gonçalves Bacelar <henrique.phgb@gmail.com>
 */
@Configuration
@EnableWebSocket
public class ServicoNotificacao implements WebSocketConfigurer {

    private static Map<String, WebSocketSession> sessions = new HashMap<>();

    synchronized public static Map<String, WebSocketSession> getSessions() {
        return sessions;
    }
    
    private final ServicoDAO dao;
    
    @Autowired
    public ServicoNotificacao(ServicoDAO dao) {
        this.dao = dao;
    }

    public static boolean enviarMensagem(String userId, String mensagem) throws IOException {
        System.out.println("Quantidade atual de clientes conextados: " + sessions.size());
        WebSocketSession wss = sessions.get(userId);
        if (wss != null) {
            wss.sendMessage(new TextMessage(mensagem));
            return true;
        }
        return false;
    }

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        registry.addHandler(new MyWebSocketHandler(), "/notificacao")
                .setHandshakeHandler(new MyHandshakeHandler())
                .addInterceptors(new MyHandshakeInterceptor())
                .setAllowedOrigins("*");
    }

    class MyWebSocketHandler implements WebSocketHandler {

        @Override
        public void afterConnectionEstablished(WebSocketSession wss) throws Exception {
            sessions.put(wss.getPrincipal().getName(), wss);
            wss.sendMessage(new TextMessage("{\"id\":0, \"tipo\":\"conexao_estabelecida\", \"token\":\"" + wss.getPrincipal().getName() + "\"}"));
        }

        @Override
        public void handleMessage(WebSocketSession wss, WebSocketMessage<?> wsm) throws Exception {
            try {
                ObjectMapper mapeador = new ObjectMapper();
                Notificacao notificacao = mapeador.readValue(wsm.getPayload().toString(),
                        new TypeReference<Notificacao>() {
                });
                ServicoNotificacao.this.dao.confirmarRecebimentoNotificacao(notificacao);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        @Override
        public void handleTransportError(WebSocketSession wss, Throwable thrwbl) throws Exception {

        }

        @Override
        public void afterConnectionClosed(WebSocketSession wss, CloseStatus cs) throws Exception {
            sessions.remove(wss.getPrincipal().getName());
        }

        @Override
        public boolean supportsPartialMessages() {
            return true;
        }
    }

    class MyHandshakeHandler extends DefaultHandshakeHandler {

        @Override
        protected Principal determineUser(ServerHttpRequest req,
                WebSocketHandler wsHandler,
                Map<String, Object> attributes) {

            String user = "";
            if (req instanceof ServletServerHttpRequest) {
                ServletServerHttpRequest serverHttpRequest = (ServletServerHttpRequest) req;
                HttpSession sessao = serverHttpRequest.getServletRequest().getSession();
                user = sessao.getId();
            }

            return new StompPrincipal(user);
        }

    }

    class MyHandshakeInterceptor implements HandshakeInterceptor {

        @Override
        public boolean beforeHandshake(ServerHttpRequest shr, ServerHttpResponse shr1, WebSocketHandler wsh, Map<String, Object> map) throws Exception {
            return true;
        }

        @Override
        public void afterHandshake(ServerHttpRequest shr, ServerHttpResponse shr1, WebSocketHandler wsh, Exception excptn) {

        }

    }

    class StompPrincipal implements Principal {

        private String name;

        public StompPrincipal(String name) {
            this.name = name;
        }

        @Override
        public String getName() {
            return this.name;
        }

    }

}
