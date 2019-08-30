/*
 * Copyright (C) Paulo Henrique Goncalves Bacelar, Inc - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Paulo Henrique Gonacalves Bacelar <henrique.phgb@gmail.com>, Dezembro 2018
 */
package com.br.phdev.srs.models;

import java.util.List;
import java.util.Set;

/**
 *
 * @author Paulo Henrique Gonçalves Bacelar <henrique.phgb@gmail.com>
 */
public class ListaPedidos {
    
    private Pedido3 pedidoPendente;
    private Integer quantidadePedidosPendentes;    
    private List<Pedido3> pedidos;
    private Integer quantidadePedidos;

    public Pedido3 getPedidoPendente() {
        return pedidoPendente;
    }

    public void setPedidoPendente(Pedido3 pedidoPendente) {
        this.pedidoPendente = pedidoPendente;
    }

    public Integer getQuantidadePedidosPendentes() {
        return quantidadePedidosPendentes;
    }

    public void setQuantidadePedidosPendentes(Integer quantidadePedidosPendentes) {
        this.quantidadePedidosPendentes = quantidadePedidosPendentes;
    }

    public List<Pedido3> getPedidos() {
        return pedidos;
    }

    public void setPedidos(List<Pedido3> pedidos) {
        this.pedidos = pedidos;
    }

    public Integer getQuantidadePedidos() {
        return quantidadePedidos;
    }

    public void setQuantidadePedidos(Integer quantidadePedidos) {
        this.quantidadePedidos = quantidadePedidos;
    }        
    
}
