package com.br.phdev.srs.daos;

import java.sql.Connection;
import java.sql.SQLException;
import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.stereotype.Repository;

/**
 *
 * @author henrique
 */

@Repository
public class BasicDAO {
    
    private BasicDataSource dataSource;
    protected Connection conexao;
    
    protected BasicDAO(BasicDataSource dataSource) {
        this.dataSource = dataSource;
        try {
            this.conexao = dataSource.getConnection();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    
    protected boolean checarConexao() {
        try {
            if (this.conexao == null || this.conexao.isClosed()) {
                this.conexao = this.dataSource.getConnection();
            } else {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
}
