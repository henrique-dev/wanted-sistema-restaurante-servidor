/*
 * Copyright (C) 2019 Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>, 03-08-2019
 */
package com.br.phdev.srs.models;

/**
 *
 * @author Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>
 */
public class Notificacao {
    
    private long id;
    private Cliente cliente;
    private String mensagem;
    private String websocketId;
    private boolean entregue;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public String getMensagem() {
        return mensagem;
    }

    public void setMensagem(String mensagem) {
        this.mensagem = mensagem;
    }

    public boolean isEntregue() {
        return entregue;
    }

    public void setEntregue(boolean entregue) {
        this.entregue = entregue;
    }        

    public String getWebsocketId() {
        return websocketId;
    }

    public void setWebsocketId(String websocketId) {
        this.websocketId = websocketId;
    }
    
}
