/*
 * Copyright (C) Paulo Henrique Goncalves Bacelar, Inc - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Paulo Henrique Gonacalves Bacelar <henrique.phgb@gmail.com>, Dezembro 2018
 */
package com.br.phdev.srs.models;

import java.util.List;
import java.util.Set;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Paulo Henrique Gonçalves Bacelar <henrique.phgb@gmail.com>
 */
public class Item2 {

    private long id;
    private String nome;
    private String descricao;
    private double preco;
    private Genero genero;
    private String tempoPreparo;
    private boolean favorito;
    private Set<Tipo> tipos;
    private boolean modificavel;
    private Set<Complemento> complementos;
    private boolean modificavelIngrediente;
    private Set<Ingrediente> ingredientes;
    private List<GrupoVariacao> variacoes;
    private List<MultipartFile> fotos;

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

    public String getTempoPreparo() {
        return tempoPreparo;
    }

    public void setTempoPreparo(String tempoPreparo) {
        this.tempoPreparo = tempoPreparo;
    }

    public boolean isFavorito() {
        return favorito;
    }

    public void setFavorito(boolean favorito) {
        this.favorito = favorito;
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

    public boolean isModificavelIngrediente() {
        return modificavelIngrediente;
    }

    public void setModificavelIngrediente(boolean modificavelIngrediente) {
        this.modificavelIngrediente = modificavelIngrediente;
    }

    public Set<Ingrediente> getIngredientes() {
        return ingredientes;
    }

    public void setIngredientes(Set<Ingrediente> ingredientes) {
        this.ingredientes = ingredientes;
    }

    public List<GrupoVariacao> getVariacoes() {
        return variacoes;
    }

    public void setVariacoes(List<GrupoVariacao> variacoes) {
        this.variacoes = variacoes;
    }

    public List<MultipartFile> getFotos() {
        return fotos;
    }

    public void setFotos(List<MultipartFile> fotos) {
        this.fotos = fotos;
    }

}
