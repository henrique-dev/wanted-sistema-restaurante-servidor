/*
 * Copyright (C) 2019 Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>, 11-08-2019
 */
package com.br.phdev.srs.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>
 */
public class FabricaConexao {
    
    public Connection conectar() {
        String usuario = "root";
        String senha = "root";
        String url = "jdbc:mysql://localhost:3306/restaurante_wanted?useTimezone=true&serverTimezone=UTC&useSSL=false&allowPublicKeyRetrieval=true";
        try {
            return DriverManager.getConnection(url, usuario, senha);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
}
