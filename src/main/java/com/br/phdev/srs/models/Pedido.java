/*
 * Copyright (C) Paulo Henrique Goncalves Bacelar, Inc - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Paulo Henrique Gonacalves Bacelar <henrique.phgb@gmail.com>, Dezembro 2018
 */
package com.br.phdev.srs.models;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Paulo Henrique Gonçalves Bacelar <henrique.phgb@gmail.com>
 */
public class Pedido {        
    
    private long id;
    private double precoTotal;
    private double frete;
    private Timestamp data;
    private List<ItemPedidoFacil> itens;
    private FormaPagamento formaPagamento;    
    private Endereco endereco;
    private Cliente cliente;
    private int estado;
    private String observacaoEntrega;

    public Pedido() {
        
    }

    public Pedido(long id, double precoTotal, Timestamp data, List<ItemPedidoFacil> itens, FormaPagamento formaPagamento, Endereco endereco, int estado, String observacaoEntrega) {
        this.id = id;
        this.precoTotal = precoTotal;
        this.data = data;
        this.itens = itens;
        this.formaPagamento = formaPagamento;
        this.endereco = endereco;
        this.estado = estado;
        this.observacaoEntrega = observacaoEntrega;
    }         

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Timestamp getData() {
        return data;
    }

    public void setData(Timestamp data) {
        this.data = data;
    }

    public List<ItemPedidoFacil> getItens() {
        return itens;
    }

    public void setItens(List<ItemPedidoFacil> itens) {
        this.itens = itens;
    }        

    public void convertItemParaItemFacil(List<ItemPedido> itens) {
        this.itens = new ArrayList<>();
        for (ItemPedido item : itens) {
            this.itens.add(new ItemPedidoFacil(item));
        }
    }

    public FormaPagamento getFormaPagamento() {
        return formaPagamento;
    }

    public void setFormaPagamento(FormaPagamento formaPagamento) {
        this.formaPagamento = formaPagamento;
    }

    public Endereco getEndereco() {
        return endereco;
    }

    public void setEndereco(Endereco endereco) {
        this.endereco = endereco;
    }        

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public double getPrecoTotal() {
        return precoTotal;
    }

    public void setPrecoTotal(double precoTotal) {
        this.precoTotal = precoTotal;
    }   

    public String getObservacaoEntrega() {
        return observacaoEntrega;
    }

    public void setObservacaoEntrega(String observacaoEntrega) {
        this.observacaoEntrega = observacaoEntrega;
    }        

    public void setFrete(double frete) {
        this.frete = frete;
    }

    public double getFrete() {
        return frete;
    }       

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
    
}
