/*
 * Copyright (C) 2019 Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>, 10-08-2019
 */
package com.br.phdev.srs.models;

/**
 *
 * @author Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>
 */
public class MensagemCadastro extends Mensagem{
        
    private String opcional;

    public MensagemCadastro() {
    }

    public MensagemCadastro(String opcional) {
        this.opcional = opcional;
    }
    
    public MensagemCadastro(int codigo, String descricao) {
        super(codigo, descricao);
    }

    public MensagemCadastro(int codigo, String descricao, String opcional) {
        super(codigo, descricao);
        this.opcional = opcional;
    }

    public String getOpcional() {
        return opcional;
    }

    public void setOpcional(String opcional) {
        this.opcional = opcional;
    }
    
}
