/*
 * Copyright (C) Paulo Henrique Goncalves Bacelar, Inc - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Paulo Henrique Gonacalves Bacelar <henrique.phgb@gmail.com>, Dezembro 2018
 */
package com.br.phdev.srs.models;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 *
 * @author Paulo Henrique Gonçalves Bacelar <henrique.phgb@gmail.com>
 */
public class Item {
    
    private long id;
    private String nome;
    private String descricao;
    private double preco;
    private Genero genero;
    private Set<Tipo> tipos;
    private boolean modificavel;    
    private Set<Complemento> complementos;
    private boolean modificavelIngrediente;
    private Set<Ingrediente> ingredientes;
    private List<GrupoVariacao> variacoes;    
    private Set<Foto> fotos;

    public Item() {        
    }        

    public Item(long id, String nome, String descricao, double preco, Genero genero, Set<Tipo> tipos, boolean modificavel, Set<Complemento> complementos, List<GrupoVariacao> variacoes, Set<Foto> fotos) {
        this.id = id;
        this.nome = nome;
        this.descricao = descricao;
        this.preco = preco;
        this.genero = genero;
        this.tipos = tipos;
        this.modificavel = modificavel;
        this.complementos = complementos;
        this.variacoes = variacoes;
        this.fotos = fotos;
    }    

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    public Genero getGenero() {
        return genero;
    }

    public void setGenero(Genero genero) {
        this.genero = genero;
    }

    public Set<Tipo> getTipos() {
        return tipos;
    }

    public void setTipos(Set<Tipo> tipos) {
        this.tipos = tipos;
    }

    public boolean isModificavel() {
        return modificavel;
    }

    public void setModificavel(boolean modificavel) {
        this.modificavel = modificavel;
    }

    public Set<Complemento> getComplementos() {
        return complementos;
    }

    public void setComplementos(Set<Complemento> complementos) {
        this.complementos = complementos;
    }

    public Set<Foto> getFotos() {
        return fotos;
    }

    public void setFotos(Set<Foto> fotos) {
        this.fotos = fotos;
    }            

    public List<GrupoVariacao> getVariacoes() {
        return variacoes;
    }

    public void setVariacoes(List<GrupoVariacao> variacoes) {
        this.variacoes = variacoes;
    }    

    public Set<Ingrediente> getIngredientes() {
        return ingredientes;
    }

    public void setIngredientes(Set<Ingrediente> ingredientes) {
        this.ingredientes = ingredientes;
    }        

    public boolean isModificavelIngrediente() {
        return modificavelIngrediente;
    }

    public void setModificavelIngrediente(boolean modificavelIngrediente) {
        this.modificavelIngrediente = modificavelIngrediente;
    }        

    @Override
    public String toString() {
        return "Item{" + "id=" + id + ", nome=" + nome + ", descricao=" + descricao + ", preco=" + preco + ", genero=" + genero + ", tipos=" + tipos + ", modificavel=" + modificavel + ", complementos=" + complementos + ", modificavelIngrediente=" + modificavelIngrediente + ", ingredientes=" + ingredientes + ", variacoes=" + variacoes + ", fotos=" + fotos + '}';
    }    
    
}
