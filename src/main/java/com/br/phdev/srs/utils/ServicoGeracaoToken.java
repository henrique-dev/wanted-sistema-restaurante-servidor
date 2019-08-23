/*
 * Copyright (C) 2019 Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>, 10-08-2019
 */
package com.br.phdev.srs.utils;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Calendar;

/**
 *
 * @author Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>
 */
public class ServicoGeracaoToken {
    
    private static final String chave = "ZXDas7966mby@";
    
    public static String gerarToken(String alvo, Integer tamanho) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        if (tamanho <= 0) tamanho = 1;
        if (tamanho > 64) tamanho = 64;
        StringBuilder token = new StringBuilder();
        String textoParaHash = alvo
                + Calendar.getInstance().getTime().toString() + chave;
        MessageDigest algoritmo = MessageDigest.getInstance("SHA-256");
        byte textoDigerido[] = algoritmo.digest(textoParaHash.getBytes("UTF-8"));
        for (int i = 0; i < textoDigerido.length; i = i + 1) {
            token.append(String.format("%02X", 0xFF & textoDigerido[i]));
        }
        return token.toString().substring(0, tamanho);
    }
    
    public String gerarSHA256(String valor) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        MessageDigest algoritmo = MessageDigest.getInstance("SHA-256");
        byte textoDigerido[] = algoritmo.digest(valor.getBytes("UTF-8"));
        StringBuilder tokenHex = new StringBuilder();
        for (byte b : textoDigerido) {
            tokenHex.append(String.format("%02X", 0xFF & b));
        }
        return tokenHex.toString();
    }
    
}
