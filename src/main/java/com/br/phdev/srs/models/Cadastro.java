/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.phdev.srs.models;

import java.util.Set;

/**
 *
 * @author Paulo Henrique Gonçalves Bacelar <henrique.phgb@gmail.com>
 */
public class Cadastro {

    private String nome;
    private String cpf;
    private String telefone;
    private String email;
    private String senhaUsuario;
    private String codigo;
    private Set<PerguntaSeguranca> perguntasSeguranca;

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenhaUsuario() {
        return senhaUsuario;
    }

    public void setSenhaUsuario(String senhaUsuario) {
        this.senhaUsuario = senhaUsuario;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public Set<PerguntaSeguranca> getPerguntasSeguranca() {
        return perguntasSeguranca;
    }

    public void setPerguntasSeguranca(Set<PerguntaSeguranca> perguntasSeguranca) {
        this.perguntasSeguranca = perguntasSeguranca;
    }

    @Override
    public String toString() {
        return "Cadastro{" + "nome=" + nome + ", cpf=" + cpf + ", telefone=" + telefone + ", email=" + email + ", senhaUsuario=" + senhaUsuario + ", codigo=" + codigo + '}';
    }

}
