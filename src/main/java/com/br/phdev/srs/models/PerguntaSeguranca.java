/*
 * Copyright (C) 2019 Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>, 27-10-2019
 */
package com.br.phdev.srs.models;

/**
 *
 * @author Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>
 */
public class PerguntaSeguranca {

    private long id;
    private String pergunta;
    private String resposta;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getPergunta() {
        return pergunta;
    }

    public void setPergunta(String pergunta) {
        this.pergunta = pergunta;
    }

    public String getResposta() {
        return resposta;
    }

    public void setResposta(String resposta) {
        this.resposta = resposta;
    }
    
    @Override
    public boolean equals(Object obj) {
        if (obj == null) return false;
        if (!(obj instanceof PerguntaSeguranca)) return false;
        if (obj == this) return true;
        return this.id == ((PerguntaSeguranca)obj).id;
    }
    
    
    @Override
    public int hashCode() {
        return (int)this.id;
    }

    @Override
    public String toString() {
        return "PerguntaSeguranca{" + "id=" + id + ", pergunta=" + pergunta + ", resposta=" + resposta + '}';
    }        

}
