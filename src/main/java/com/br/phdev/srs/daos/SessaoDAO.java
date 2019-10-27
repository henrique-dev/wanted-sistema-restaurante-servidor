/*
 * Copyright (C) Paulo Henrique Goncalves Bacelar, Inc - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Paulo Henrique Gonacalves Bacelar <henrique.phgb@gmail.com>, Dezembro 2018
 */
package com.br.phdev.srs.daos;

import com.br.phdev.srs.exceptions.DAOException;
import com.br.phdev.srs.exceptions.DAOIncorrectData;
import com.br.phdev.srs.models.Admin;
import com.br.phdev.srs.models.Cliente;
import com.br.phdev.srs.models.Usuario;
import com.br.phdev.srs.utils.ServicoGeracaoToken;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.sql.DataSource;
import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Paulo Henrique Gonçalves Bacelar <henrique.phgb@gmail.com>
 */
@Repository
public class SessaoDAO {
    
    private Connection conexao;
    
    @Autowired
    SessaoDAO(BasicDataSource dataSource) {
        try {
            this.conexao = dataSource.getConnection();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    
    public Cliente autenticar(Usuario usuario) throws DAOException {
        
        if (usuario == null) {
            throw new DAOIncorrectData(300);
        }
        if (usuario.getNomeUsuario() == null || usuario.getSenhaUsuario() == null) {
            throw new DAOIncorrectData(300);
        }
        if (usuario.getNomeUsuario().isEmpty() || usuario.getSenhaUsuario().isEmpty()) {
            throw new DAOIncorrectData(301);
        }
        Cliente cliente = null;
        try {
            String sql = "SELECT cliente.id_usuario, cliente.id_cliente, cliente.nome, cliente.cpf, cliente.telefone, cliente.email "
                + " FROM cliente "
                + " WHERE cliente.id_usuario = (SELECT usuario.id_usuario FROM usuario WHERE usuario.nome = ? AND usuario.senha = ? AND usuario.ativo = true)";
            PreparedStatement stmt = this.conexao.prepareStatement(sql);
            stmt.setString(1, usuario.getNomeUsuario());
            stmt.setString(2, usuario.getSenhaUsuario());
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                usuario.setIdUsuario(rs.getLong("id_usuario"));
                usuario.setNomeUsuario(null);
                usuario.setSenhaUsuario(null);
                cliente = new Cliente();
                cliente.setId(rs.getLong("id_cliente"));
            }
        } catch (SQLException e) {
            throw new DAOException(e, 200);
        }
        return cliente;
    }
    
    public Admin autenticar2(Usuario usuario) throws DAOException {
        
        if (usuario == null) {
            throw new DAOIncorrectData(300);
        }
        if (usuario.getNomeUsuario() == null || usuario.getSenhaUsuario() == null) {
            throw new DAOIncorrectData(300);
        }
        if (usuario.getNomeUsuario().isEmpty() || usuario.getSenhaUsuario().isEmpty()) {
            throw new DAOIncorrectData(301);
        }
        Admin admin = null;
        String sql = "SELECT * FROM usuario_admin WHERE nome=? AND senha=?";
        try (PreparedStatement stmt = this.conexao.prepareStatement(sql)){
            stmt.setString(1, usuario.getNomeUsuario());
            stmt.setString(2, usuario.getSenhaUsuario());
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                usuario.setIdUsuario(rs.getLong("id_usuario"));
                usuario.setNomeUsuario(null);
                usuario.setSenhaUsuario(null);
                admin = new Admin();
                admin.setIdUsuario(rs.getLong("id_usuario"));
            }
        } catch (SQLException e) {
            throw new DAOException(e, 200);
        }
        return admin;
    }

    public void gerarSessao(Usuario usuario, String token1) throws DAOException {
        
        String sql = "UPDATE usuario SET token_sessao = ?, token_login_usuario = ?, token_login_segredo = ? "
                + " WHERE usuario.id_usuario = ?";
        try (PreparedStatement stmt = this.conexao.prepareStatement(sql)) {
            stmt.setString(1, token1);
            String tokenNome = new ServicoGeracaoToken().gerarSHA256(usuario.getNomeUsuario());
            usuario.setNomeUsuario(tokenNome);
            stmt.setString(2, tokenNome);
            String tokenSegredo = new ServicoGeracaoToken().gerarSHA256(usuario.getSenhaUsuario());
            stmt.setString(3, tokenSegredo);
            usuario.setSenhaUsuario(tokenSegredo);
            stmt.setLong(4, usuario.getIdUsuario());
            stmt.execute();
        } catch (SQLException | NoSuchAlgorithmException | UnsupportedEncodingException e) {
            e.printStackTrace();
            throw new DAOException(e, 200);
        }
    }
    
    public void gerarSessao2(Usuario usuario, String token1) throws DAOException {
        
        String sql = "UPDATE usuario_admin SET token_sessao = ? WHERE usuario_admin.id_usuario = ?";
        try (PreparedStatement stmt = this.conexao.prepareStatement(sql)) {
            stmt.setString(1, token1);
            stmt.setLong(2, usuario.getIdUsuario());            
            stmt.execute();
        } catch (SQLException e) {
            throw new DAOException(e, 200);
        }
    }

    public void sairSessao(Usuario usuario, String token) throws DAOException {
        
        if (usuario == null) {
            return;
        }
        if (usuario.getIdUsuario() == 0) {
            throw new DAOIncorrectData(301);
        }
        String sql = "UPDATE usuario SET token_sessao = null WHERE usuario.id_usuario = ?";
        try (PreparedStatement stmt = this.conexao.prepareStatement(sql)) {
            stmt.setLong(1, usuario.getIdUsuario());
            stmt.execute();
        } catch (SQLException e) {
            throw new DAOException(e, 200);
        }
    }
    
    public boolean verificarSessao(String sessaoId) throws DAOException {
        
        if (sessaoId == null) {
            return false;
        }
        try (PreparedStatement stmt = this.conexao.prepareStatement("SELECT id_usuario FROM usuario WHERE usuario.token_sessao = ?")) {
            stmt.setString(1, sessaoId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                if (rs.getObject("id_usuario") != null) {
                    return true;
                } else {
                    return false;
                }
            }
        } catch (SQLException e) {
            throw new DAOException(e, 300);
        }
        return false;
    }
    
    public Cliente verificarTokenLogin(String telefone, String usuario, String segredo) throws DAOException {
        
        Cliente cliente = null;
        if (usuario == null || segredo == null) {
            return cliente;
        }        
        String sql = "SELECT cliente.id_usuario, cliente.id_cliente, cliente.nome, cliente.cpf, cliente.telefone, cliente.email "
                + " FROM usuario "
                + " LEFT JOIN cliente ON usuario.id_usuario = cliente.id_usuario "
                + " WHERE usuario.nome = ? "
                + " AND usuario.token_login_usuario = ? "
                + " AND usuario.token_login_segredo = ? ";
        try (PreparedStatement stmt = this.conexao.prepareStatement(sql)) {
            stmt.setString(1, telefone);
            stmt.setString(2, usuario);
            stmt.setString(3, segredo);
            ResultSet rs = stmt.executeQuery();            
            if (rs.next()) {
                cliente = new Cliente();
                cliente.setId(rs.getLong("id_cliente"));
            }
        } catch (SQLException e) {
            throw new DAOException(e, 300);
        }
        return cliente;
    }
    
}
