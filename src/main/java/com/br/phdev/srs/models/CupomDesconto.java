/*
 * Copyright (C) 2019 Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>, 25-08-2019
 */
package com.br.phdev.srs.models;

import java.sql.Timestamp;

/**
 *
 * @author Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>
 */
public class CupomDesconto {

    private Long id;
    private TipoCupomDesconto tipo;
    private String codigo;
    private String descricao;
    private Long quantidade;
    private Timestamp validade;
    private Boolean ativo;
    private Boolean percentual;
    private Double valor;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public TipoCupomDesconto getTipo() {
        return tipo;
    }

    public void setTipo(TipoCupomDesconto tipo) {
        this.tipo = tipo;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Long getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(Long quantidade) {
        this.quantidade = quantidade;
    }

    public Timestamp getValidade() {
        return validade;
    }

    public void setValidade(Timestamp validade) {
        this.validade = validade;
    }

    public Boolean getAtivo() {
        return ativo;
    }

    public void setAtivo(Boolean ativo) {
        this.ativo = ativo;
    }

    public Boolean getPercentual() {
        return percentual;
    }

    public void setPercentual(Boolean percentual) {
        this.percentual = percentual;
    }

    public Double getValor() {
        return valor;
    }

    public void setValor(Double valor) {
        this.valor = valor;
    }

    @Override
    public String toString() {
        return "CupomDesconto{" + "id=" + id + ", tipo=" + tipo + ", codigo=" + codigo + ", descricao=" + descricao + ", quantidade=" + quantidade + ", validade=" + validade + ", ativo=" + ativo + ", percentual=" + percentual + ", valor=" + valor + '}';
    }

}
