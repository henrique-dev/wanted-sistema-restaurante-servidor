/*
 * Copyright (C) 2019 Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>, 27-10-2019
 */
package com.br.phdev.srs.models;

import java.util.Set;

/**
 *
 * @author Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>
 */
public class RedefinicaoSenha {

    private Set<PerguntaSeguranca> perguntas;
    private String senhaAntiga;
    private String senha;
    private String telefone;
    private String codigo;

    public Set<PerguntaSeguranca> getPerguntas() {
        return perguntas;
    }

    public void setPerguntas(Set<PerguntaSeguranca> perguntas) {
        this.perguntas = perguntas;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getSenhaAntiga() {
        return senhaAntiga;
    }

    public void setSenhaAntiga(String senhaAntiga) {
        this.senhaAntiga = senhaAntiga;
    }

}
