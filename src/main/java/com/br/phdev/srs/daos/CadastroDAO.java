/*
 * Copyright (C) Paulo Henrique Goncalves Bacelar, Inc - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Paulo Henrique Gonacalves Bacelar <henrique.phgb@gmail.com>, Dezembro 2018
 */
package com.br.phdev.srs.daos;

import com.br.phdev.srs.exceptions.DAOException;
import com.br.phdev.srs.exceptions.DAOExpectedException;
import com.br.phdev.srs.exceptions.DAOIncorrectData;
import com.br.phdev.srs.models.Cadastro;
import com.br.phdev.srs.models.Codigo;
import com.br.phdev.srs.models.Mensagem;
import com.br.phdev.srs.models.Usuario;
import com.br.phdev.srs.utils.ServicoGeracaoToken;
import com.br.phdev.srs.utils.Util;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Paulo Henrique Gonçalves Bacelar <henrique.phgb@gmail.com>
 */
@Repository
public class CadastroDAO {
    
    private final Connection conexao;    

    @Autowired
    CadastroDAO(DataSource dataSource) {
        try {
            this.conexao = dataSource.getConnection();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Mensagem verificarNumero(Cadastro cadastro) throws DAOException {
        Mensagem mensagem = new Mensagem();
        if (!cadastro.getTelefone().matches("^\\+{1}55[0-9]{2}[0-9]{9}$")) {
            return new Mensagem(101, "Número de telefone inválido");
        } else {
            try {
                String sql = "SELECT nome, ativo, verificado, token_cadastro, token_cadastro_data, "
                        + " (MINUTE(TIMEDIFF(now(), token_cadastro_data)) * 60 + SECOND(TIMEDIFF(now(), token_cadastro_data))) tempo_atual "
                        + " FROM usuario WHERE nome=?";
                PreparedStatement stmt = this.conexao.prepareStatement(sql);
                stmt.setString(1, cadastro.getTelefone());
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    if (!rs.getBoolean("verificado")) {
                        if (rs.getInt("tempo_atual") / 60 < 10) {
                            mensagem.setCodigo(102);
                            mensagem.setDescricao(String.valueOf(rs.getInt("tempo_atual")));
                        } else {
                            mensagem.setCodigo(103);
                            mensagem.setDescricao("Pode enviar sms");
                        }
                    } else if (!rs.getBoolean("ativo")) {
                        mensagem.setCodigo(104);
                        mensagem.setDescricao("Número de telefone verificado, porém o cadastro não foi concluído");
                    } else {
                        mensagem.setCodigo(100);
                        mensagem.setDescricao("Número de telefone ativo");
                    }
                } else {
                    mensagem.setCodigo(105);
                    mensagem.setDescricao("Número de telefone não cadastrado");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                throw new DAOException(e, 200);
            }
        }
        return mensagem;
    }

    public Mensagem enviarCodigoAtivacao(Cadastro cadastro) throws DAOException {
        Mensagem mensagem = null;
        try {
            mensagem = this.verificarNumero(cadastro);            
            String sql = "";
            switch (mensagem.getCodigo()) {
                case 105:
                    sql = "INSERT INTO usuario VALUES (default, ?, '', null, ?, 0, 0, now())";
                    try (PreparedStatement stmt = this.conexao.prepareStatement(sql)) {
                        String token = ServicoGeracaoToken.gerarToken(cadastro.getTelefone(), 6);
                        stmt.setString(1, cadastro.getTelefone());                        
                        stmt.setString(2, token);
                        stmt.execute();
                        mensagem.setCodigo(100);
                        mensagem.setDescricao(token);
                    }
                    break;

                case 103:                    
                    sql = "UPDATE usuario set token_cadastro=?, token_cadastro_data=now() WHERE nome=?";
                    try (PreparedStatement stmt = this.conexao.prepareStatement(sql)) {
                        String token = ServicoGeracaoToken.gerarToken(cadastro.getTelefone(), 6);
                        System.out.println(token);
                        stmt.setString(1, token);
                        stmt.setString(2, cadastro.getTelefone());
                        stmt.execute();
                        mensagem.setCodigo(100);
                        mensagem.setDescricao(token);
                    }
                    break;
            }
            
        } catch (UnsupportedEncodingException | NoSuchAlgorithmException | SQLException e) {            
            e.printStackTrace();
            throw new DAOException(e, 200);
        }
        return mensagem;
    }
    
    public Usuario validarCodigoAtivacao(Cadastro cadastro, String tokenSessao) throws DAOException {
        if (!cadastro.getTelefone().matches("^\\+{1}55[0-9]{2}[0-9]{9}$")) {
            return null;
        }
        String sql = "SELECT id_usuario FROM usuario WHERE nome=? AND token_cadastro=?";        
        try (PreparedStatement stmt = this.conexao.prepareStatement(sql)){
            stmt.setString(1, cadastro.getTelefone());
            stmt.setString(2, cadastro.getCodigo());
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                sql = "UPDATE usuario SET verificado=1, token_sessao=? WHERE id_usuario=?";
                try (PreparedStatement stmt2 = this.conexao.prepareStatement(sql)) {
                    stmt2.setString(1, tokenSessao);
                    stmt2.setLong(2, rs.getLong("id_usuario"));
                    stmt2.execute();
                }
                Usuario usuario = new Usuario();
                usuario.setIdUsuario(rs.getLong("id_usuario"));
                usuario.setNomeUsuario(cadastro.getTelefone());
                return usuario;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new DAOException(e, 200);
        }
        return null;
    }

    public String cadastrarCliente(Usuario usuario, Cadastro cadastro) throws DAOException {
        if (cadastro == null) {
            throw new DAOIncorrectData(300);
        }
        if (cadastro.getNome() == null || cadastro.getCpf() == null || cadastro.getEmail() == null
                 || cadastro.getSenhaUsuario() == null) {
            throw new DAOIncorrectData(300);
        }
        if (cadastro.getNome().trim().isEmpty() || cadastro.getCpf().trim().isEmpty() || cadastro.getEmail().trim().isEmpty()
                || cadastro.getTelefone().trim().isEmpty() || cadastro.getSenhaUsuario().trim().isEmpty()) {
            throw new DAOIncorrectData(301);
        }
        for (char c : cadastro.getNome().toCharArray()) {
            if (!(((int) c > 64 && (int) c < 91) || ((int) c > 96 && (int) c < 123)
                    || ((int) c > 191 && (int) c < 198) || ((int) c > 198 && (int) c < 215)
                    || ((int) c > 215 && (int) c < 222) || ((int) c > 223 && (int) c < 230)
                    || ((int) c > 230 && (int) c < 247) || ((int) c > 248 && (int) c < 257)) && (int) c != 32) {
                throw new DAOIncorrectData(302);
            }
        }
        if (!cadastro.getEmail().contains("@")) {
            throw new DAOIncorrectData(303);
        }
        for (char c : cadastro.getCpf().toCharArray()) {
            if (!((int) c > 47 && (int) c < 58)) {
                throw new DAOIncorrectData(304);
            }
        }
        if (!Util.validarCPF(cadastro.getCpf())) {
            throw new DAOIncorrectData(306);
        }
        
        try {
            String sql = "UPDATE usuario SET usuario.senha = ?, usuario.ativo = true WHERE usuario.id_usuario = ?";
            try (PreparedStatement stmt = this.conexao.prepareStatement(sql)) {
                stmt.setString(1, cadastro.getSenhaUsuario());
                stmt.setLong(2, usuario.getIdUsuario());                
                stmt.execute();
            }
            sql = "INSERT INTO cliente VALUES (default, ?, ?, ?, ?, ?)";
            try (PreparedStatement stmt = this.conexao.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                stmt.setString(1, cadastro.getNome());
                stmt.setString(2, cadastro.getCpf());
                stmt.setString(3, usuario.getNomeUsuario());
                stmt.setString(4, cadastro.getEmail());                
                stmt.setLong(5, usuario.getIdUsuario());
                stmt.execute();
                ResultSet rs = stmt.getGeneratedKeys();
                if (rs.next()) {
                    Long id = rs.getLong(1);
                    System.out.println(id);
                }
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            throw new DAOException(e, 200);
        }
        return null;
    }    

}
