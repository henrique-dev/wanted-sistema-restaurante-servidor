package com.br.phdev.srs.models;

import java.util.List;

/**
 *
 * @author henrique
 */


public class NotificacaoPedido {
    
    private long id;
    private String tipo;
    private String mensagem;
    private String websocketId;
    private List<Pedido2> pedidos;
    private boolean entregue;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getMensagem() {
        return mensagem;
    }

    public void setMensagem(String mensagem) {
        this.mensagem = mensagem;
    }

    public String getWebsocketId() {
        return websocketId;
    }

    public void setWebsocketId(String websocketId) {
        this.websocketId = websocketId;
    }

    public List<Pedido2> getPedidos() {
        return pedidos;
    }

    public void setPedidos(List<Pedido2> pedidos) {
        this.pedidos = pedidos;
    }

    public boolean isEntregue() {
        return entregue;
    }

    public void setEntregue(boolean entregue) {
        this.entregue = entregue;
    }   
   
}
