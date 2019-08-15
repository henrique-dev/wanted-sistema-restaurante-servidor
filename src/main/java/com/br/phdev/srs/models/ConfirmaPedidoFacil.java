package com.br.phdev.srs.models;

import java.util.List;

/**
 *
 * @author henrique
 */


public class ConfirmaPedidoFacil {
    
    private List<ItemPedidoFacil> itens;    
    private double precoTotal;    

    public List<ItemPedidoFacil> getItens() {
        return itens;
    }

    public void setItens(List<ItemPedidoFacil> itens) {
        this.itens = itens;
    }

    public double getPrecoTotal() {
        return precoTotal;
    }

    public void setPrecoTotal(double precoTotal) {
        this.precoTotal = precoTotal;
    }        
    
}
