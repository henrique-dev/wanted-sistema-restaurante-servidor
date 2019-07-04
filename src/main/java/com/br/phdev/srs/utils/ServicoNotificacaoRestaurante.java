/*
 * Copyright (C) Paulo Henrique Goncalves Bacelar, Inc - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Paulo Henrique Gonacalves Bacelar <henrique.phgb@gmail.com>, Dezembro 2018
 */
package com.br.phdev.srs.utils;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import org.springframework.context.annotation.Configuration;


/**
 *
 * @author Paulo Henrique Gonçalves Bacelar <henrique.phgb@gmail.com>
 */
public class ServicoNotificacaoRestaurante {
    
    private final static ServicoNotificacaoRestaurante instance = new ServicoNotificacaoRestaurante();
    
    private final ThreadAguardandoConexao mainThread;
    
    private final int PORTA = 45578;
    
    private final List<Cliente> clientesConectados;
    
    private ServicoNotificacaoRestaurante() {
        System.out.println("ServicoNotificacaoRestaurante CRIADO");
        this.clientesConectados = new ArrayList<>();
        this.mainThread = new ThreadAguardandoConexao();
        this.mainThread.start();
    }
    
    public static ServicoNotificacaoRestaurante getInstance() {        
        return instance;
    }
    
    class ThreadAguardandoConexao extends Thread {
        
        @Override
        public void run() {
            ServerSocket serverSocket = null;
            try {
                System.out.println("ServicoNotificacaoRestaurante > Iniciando servidor na porta " + PORTA);
                serverSocket = new ServerSocket(PORTA);
                while (true) {
                    System.out.println("ServicoNotificacaoRestaurante > Aguardando conexão");
                    Socket socket = serverSocket.accept();
                    System.out.println("ServicoNotificacaoRestaurante > Cliente conectado");
                    clientesConectados.add(new Cliente(socket));                    
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }        
    }
    
    class Cliente {
        
        private String nomeUsuario;
        private BufferedWriter bfw;
        
        public Cliente(Socket socket) throws IOException {
            OutputStream out = socket.getOutputStream();
            Writer wr = new OutputStreamWriter(out);
            this.bfw = new BufferedWriter(wr);
            System.out.println("ServicoNotificacaoRestaurante > Novo cliente adicionado");
        }
        
    }
   
}
