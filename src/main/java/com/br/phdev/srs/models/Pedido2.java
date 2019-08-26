/*
 * Copyright (C) Paulo Henrique Goncalves Bacelar, Inc - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Paulo Henrique Gonacalves Bacelar <henrique.phgb@gmail.com>, Dezembro 2018
 */
package com.br.phdev.srs.models;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

/**
 *
 * @author Paulo Henrique Gonçalves Bacelar <henrique.phgb@gmail.com>
 */
public class Pedido2 {
    
    private long id;
    private double precoTotal;
    private String data;
    private List<ItemPedido> itens;
    private FormaPagamento formaPagamento;    
    private Endereco endereco;
    private CupomDesconto2 cupom;
    private String status;
    private String observacaoEntrega;
    private double frete;
    
    public void calcularPedido() {
        BigDecimal valorTotal = new BigDecimal("0.00").subtract(new BigDecimal(this.frete));
        for (ItemPedido ip : this.getItens()) {            
            BigDecimal valorItem = new BigDecimal("0.00");
            if (ip.getComplementos() != null) {
                for (Complemento c : ip.getComplementos()) {
                    valorItem = valorItem.add(new BigDecimal(String.valueOf(c.getPreco())));
                }
            }
            if (ip.getVariacoes() != null) {
                List<GrupoVariacao> variacoes = ip.getVariacoes();                
                for (GrupoVariacao gv : variacoes) {
                    if (gv.getVariacoes() != null) {
                        for (Variacao v : gv.getVariacoes()) {
                            valorItem = valorItem.add(new BigDecimal(String.valueOf(v.getPreco())));
                        }
                    }
                }
            }
            valorItem = valorItem.add(new BigDecimal(String.valueOf(ip.getPreco())));
            ip.setPrecoTotal(valorItem.doubleValue());
            valorTotal = valorTotal.add(valorItem.multiply(new BigDecimal(ip.getQuantidade())));
        }
        if (this.cupom != null) {
            if (this.cupom.getPercentual()) {
                BigDecimal porcentagem = new BigDecimal(this.cupom.getValor()).divide(new BigDecimal(100));
                valorTotal = valorTotal.subtract(new BigDecimal(valorTotal.doubleValue()).multiply(porcentagem));
            } else {
                BigDecimal desconto = new BigDecimal(this.cupom.getValor());                
                valorTotal = valorTotal.subtract(desconto);
                if (valorTotal.doubleValue() < 0) {
                    valorTotal = new BigDecimal(0);
                }
            }
        }
        this.setPrecoTotal(valorTotal.doubleValue());
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public double getPrecoTotal() {
        return precoTotal;
    }

    public void setPrecoTotal(double precoTotal) {
        this.precoTotal = precoTotal;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public List<ItemPedido> getItens() {
        return itens;
    }

    public void setItens(List<ItemPedido> itens) {
        this.itens = itens;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }      

    public String getObservacaoEntrega() {
        return observacaoEntrega;
    }

    public void setObservacaoEntrega(String observacaoEntrega) {
        this.observacaoEntrega = observacaoEntrega;
    }        

    public double getFrete() {
        return frete;
    }

    public void setFrete(double frete) {
        this.frete = frete;
    }       

    public CupomDesconto2 getCupom() {
        return cupom;
    }

    public void setCupom(CupomDesconto2 cupom) {
        this.cupom = cupom;
    }        
    
}
