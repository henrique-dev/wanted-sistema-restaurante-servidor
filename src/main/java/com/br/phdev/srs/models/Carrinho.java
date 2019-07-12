package com.br.phdev.srs.models;

import java.math.BigDecimal;
import java.util.List;

/**
 *
 * @author henrique
 */


public class Carrinho {
    
    private List<Endereco> enderecos;
    private List<FormaPagamento> formaPagamentos;
    private BigDecimal frete;

    public BigDecimal getFrete() {
        return frete;
    }

    public void setFrete(BigDecimal frete) {
        this.frete = frete;
    }

    public List<Endereco> getEnderecos() {
        return enderecos;
    }

    public void setEnderecos(List<Endereco> enderecos) {
        this.enderecos = enderecos;
    }

    public List<FormaPagamento> getFormaPagamentos() {
        return formaPagamentos;
    }

    public void setFormaPagamentos(List<FormaPagamento> formasPagamento) {
        this.formaPagamentos = formasPagamento;
    }        
    
}
