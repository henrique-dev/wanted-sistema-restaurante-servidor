/*
 * Copyright (C) 2019 Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>, 10-08-2019
 */
package com.br.phdev.srs.utils;

import com.br.phdev.srs.exceptions.DAOIncorrectData;

/**
 *
 * @author Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>
 */
public class Util {
    
    public static boolean validarCPF(String cpf) {
        StringBuilder ultimosDigitos = new StringBuilder();
        int soma = 0;
        int fator = 10;
        for (int i = 0; i < cpf.length() - 2; i++) {
            soma += Integer.parseInt(String.valueOf(cpf.charAt(i))) * fator--;
        }
        int resto = soma % 11;
        if (resto == 0 || resto == 1) {
            ultimosDigitos.append(0);
        } else {
            ultimosDigitos.append((11 - resto));
        }
        soma = 0;
        fator = 11;
        for (int i = 0; i < cpf.length() - 2; i++) {
            soma += Integer.parseInt(String.valueOf(cpf.charAt(i))) * fator--;
        }
        soma += Integer.parseInt(String.valueOf(ultimosDigitos.toString())) * 2;
        resto = soma % 11;
        if (resto == 0 || resto == 1) {
            ultimosDigitos.append(0);
        } else {
            ultimosDigitos.append((11 - resto));
        }

        if (!cpf.endsWith(ultimosDigitos.toString())) {
            return false;
        }
        return true;
    }
    
}
