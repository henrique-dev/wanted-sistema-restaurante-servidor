package com.br.phdev.srs.daos;

import java.sql.Connection;
import java.sql.SQLException;
import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author henrique
 */

@Repository
public class BasicDAO {
    
    protected Connection conexao;
    private Integer tentativasConexao = 0;
    
    private final BasicDataSource dataSource;
    
    protected BasicDAO(BasicDataSource dataSource) {
        this.dataSource = dataSource;
        this.conectar();
    }
    
    synchronized protected void conectar() {
        try {
            if (this.conexao != null) {
                if (this.conexao.isClosed()) {
                    this.conexao = this.dataSource.getConnection();
                }
            } else {
                this.conexao = this.dataSource.getConnection();
            }            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
}
