package com.br.phdev.srs.daos;

import java.sql.Connection;
import java.sql.SQLException;
import org.apache.commons.dbcp2.BasicDataSource;

/**
 *
 * @author henrique
 */

public class BasicDAO {
    
    final private BasicDataSource dataSource;
    private Connection conexao;

    public BasicDAO(BasicDataSource dataSource) {
        this.dataSource = dataSource;
    }
    
    protected Connection getConexao() throws SQLException {
        if (this.conexao == null || this.conexao.isClosed() || !this.conexao.isValid(0)) {
            this.conexao = this.dataSource.getConnection();
        }
        return this.conexao;
    }
    
}
