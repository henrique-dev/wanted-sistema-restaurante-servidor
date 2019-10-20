/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.phdev.srs.models;

/**
 *
 * @author Paulo Henrique Gonçalves Bacelar <henrique.phgb@gmail.com>
 */
public class ItemPedidoFacil extends ItemFacil {

    private int quantidade;
    private Double precoTotal;

    public ItemPedidoFacil() {

    }

    public ItemPedidoFacil(ItemPedido itemPedido) {
        super(itemPedido);
        this.quantidade = itemPedido.getQuantidade();
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public Double getPrecoTotal() {
        return precoTotal;
    }

    public void setPrecoTotal(Double precoTotal) {
        this.precoTotal = precoTotal;
    }        

    @Override
    public String toString() {
        return super.toString() + "\nItemPedidoFacil{" + "quantidade=" + quantidade + ", precoTotal=" + precoTotal + '}';
    }

}
