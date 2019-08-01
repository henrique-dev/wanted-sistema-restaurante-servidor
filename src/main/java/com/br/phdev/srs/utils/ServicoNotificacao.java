/*
 * Copyright (C) Paulo Henrique Goncalves Bacelar, Inc - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Paulo Henrique Gonacalves Bacelar <henrique.phgb@gmail.com>, Dezembro 2018
 */
package com.br.phdev.srs.utils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.handler.TextWebSocketHandler;

/**
 *
 * @author Paulo Henrique Gonçalves Bacelar <henrique.phgb@gmail.com>
 */
@Configuration
@EnableWebSocket
public class ServicoNotificacao implements WebSocketConfigurer {
        
    private static List<WebSocketSession> sessions = new ArrayList();
    
    synchronized public static List<WebSocketSession> getSessions() {
        return sessions;
    }

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        registry.addHandler(new SocketHandler(), "/chat").setAllowedOrigins("*");
    }

    @Component
    public class SocketHandler extends TextWebSocketHandler {        

        @Override
        public void handleTextMessage(WebSocketSession session, TextMessage message)
                throws InterruptedException, IOException {            
            
            System.out.println(message.getPayload());
            /*
            for (WebSocketSession webSocketSession : sessions) {
                System.out.println(webSocketSession.getId());
                System.out.println(webSocketSession.isOpen());
                Map value = new Gson().fromJson(message.getPayload(), Map.class);
                webSocketSession.sendMessage(new TextMessage("OLA MUNDO"));
            }*/
        }

        @Override
        public void afterConnectionEstablished(WebSocketSession session) throws Exception {
            //the messages will be broadcasted to all users.
            sessions.add(session);
            session.sendMessage(new TextMessage(session.getId()));            
        }
    }

}
