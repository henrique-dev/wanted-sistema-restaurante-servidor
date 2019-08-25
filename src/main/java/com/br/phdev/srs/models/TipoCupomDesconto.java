/*
 * Copyright (C) 2019 Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>, 25-08-2019
 */
package com.br.phdev.srs.models;

/**
 *
 * @author Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>
 */
public class TipoCupomDesconto {

    private Long id;
    private String descricao;
    private String controle;

    public TipoCupomDesconto() {
    }

    public TipoCupomDesconto(Long id, String descricao, String controle) {
        this.id = id;
        this.descricao = descricao;
        this.controle = controle;
    }        

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getControle() {
        return controle;
    }

    public void setControle(String controle) {
        this.controle = controle;
    }       

    @Override
    public String toString() {
        return "TipoCupomDesconto{" + "id=" + id + ", descricao=" + descricao + '}';
    }

}
