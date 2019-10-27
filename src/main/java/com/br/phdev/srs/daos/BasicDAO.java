package com.br.phdev.srs.daos;

import java.sql.Connection;
import java.sql.SQLException;
import org.apache.commons.dbcp2.BasicDataSource;

/**
 *
 * @author henrique
 */

public class BasicDAO {
    
    private BasicDataSource dataSource;

    public BasicDAO(BasicDataSource dataSource) {
        this.dataSource = dataSource;
    }
    
    protected Connection getConexao() throws SQLException {
        Connection con = this.dataSource.getConnection();
        return con;
    }
    
}
