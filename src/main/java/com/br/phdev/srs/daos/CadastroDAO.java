/*
 * Copyright (C) Paulo Henrique Goncalves Bacelar, Inc - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Paulo Henrique Gonacalves Bacelar <henrique.phgb@gmail.com>, Dezembro 2018
 */
package com.br.phdev.srs.daos;

import com.br.phdev.srs.exceptions.DAOException;
import com.br.phdev.srs.models.Cadastro;
import com.br.phdev.srs.models.Cliente;
import com.br.phdev.srs.models.Mensagem;
import com.br.phdev.srs.models.MensagemCadastro;
import com.br.phdev.srs.models.PerguntaSeguranca;
import com.br.phdev.srs.models.RedefinicaoSenha;
import com.br.phdev.srs.models.Usuario;
import com.br.phdev.srs.utils.ServicoGeracaoToken;
import com.br.phdev.srs.utils.Util;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Paulo Henrique Gonçalves Bacelar <henrique.phgb@gmail.com>
 */
@Repository
public class CadastroDAO extends BasicDAO {

    @Autowired
    CadastroDAO(BasicDataSource dataSource) {
        super(dataSource);
    }

    public MensagemCadastro verificarNumero(Cadastro cadastro) throws DAOException {
        MensagemCadastro mensagem = new MensagemCadastro();
        if (!cadastro.getTelefone().matches("^\\+{1}55[0-9]{2}[0-9]{9}$")) {
            return new MensagemCadastro(101, "Número de telefone inválido", null);
        } else {
            try {
                String sql = "SELECT nome, ativo, verificado, token_cadastro, token_cadastro_data, "
                        + " (MINUTE(TIMEDIFF(now(), token_cadastro_data)) * 60 + SECOND(TIMEDIFF(now(), token_cadastro_data))) tempo_atual "
                        + " FROM usuario WHERE nome=?";
                PreparedStatement stmt = getConexao().prepareStatement(sql);
                stmt.setString(1, cadastro.getTelefone());
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    if (!rs.getBoolean("verificado")) {
                        if (rs.getInt("tempo_atual") / 60 < 10) {
                            mensagem.setCodigo(102);
                            mensagem.setDescricao(String.valueOf(rs.getInt("tempo_atual")));
                            mensagem.setOpcional(String.valueOf(60 * 10));
                        } else {
                            mensagem.setCodigo(103);
                            mensagem.setDescricao("Pode enviar sms");
                        }
                    } else if (!rs.getBoolean("ativo")) {
                        if (rs.getInt("tempo_atual") / 60 < 10) {
                            mensagem.setCodigo(106);
                            mensagem.setDescricao(String.valueOf(rs.getInt("tempo_atual")));
                            mensagem.setOpcional(String.valueOf(60 * 10));
                        } else {
                            mensagem.setCodigo(104);
                            mensagem.setDescricao("Número de telefone verificado, porém o cadastro não foi concluído");
                        }
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

    public MensagemCadastro enviarCodigoAtivacao(Cadastro cadastro) throws DAOException {

        MensagemCadastro mensagem = null;
        try {
            mensagem = this.verificarNumero(cadastro);
            String sql = "";
            switch (mensagem.getCodigo()) {
                case 105:
                    sql = "INSERT INTO usuario VALUES (default, ?, '', null, ?, null, null, 0, 0, now())";
                    try (PreparedStatement stmt = getConexao().prepareStatement(sql)) {
                        String token = ServicoGeracaoToken.gerarToken(cadastro.getTelefone(), 6);
                        stmt.setString(1, cadastro.getTelefone());
                        stmt.setString(2, token);
                        stmt.execute();
                        mensagem.setCodigo(100);
                        mensagem.setDescricao(token);
                        mensagem.setOpcional(String.valueOf(60 * 10));
                    }
                    break;
                case 104:
                case 103:
                    sql = "UPDATE usuario set token_cadastro=?, token_cadastro_data=now() WHERE nome=?";
                    try (PreparedStatement stmt = getConexao().prepareStatement(sql)) {
                        String token = ServicoGeracaoToken.gerarToken(cadastro.getTelefone(), 6);
                        stmt.setString(1, token);
                        stmt.setString(2, cadastro.getTelefone());
                        stmt.execute();
                        mensagem.setCodigo(100);
                        mensagem.setDescricao(token);
                        mensagem.setOpcional(String.valueOf(60 * 10));
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
        try (PreparedStatement stmt = getConexao().prepareStatement(sql)) {
            stmt.setString(1, cadastro.getTelefone());
            stmt.setString(2, cadastro.getCodigo().toUpperCase());
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                sql = "UPDATE usuario SET verificado=1, token_sessao=? WHERE id_usuario=?";
                try (PreparedStatement stmt2 = getConexao().prepareStatement(sql)) {
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

    public MensagemCadastro cadastrarCliente(Usuario usuario, Cadastro cadastro) throws DAOException {

        MensagemCadastro mensagem = this.verificarNumero(cadastro);
        if (!(mensagem.getCodigo() == 104 || mensagem.getCodigo() == 106)) {
            return mensagem;
        }
        mensagem.setCodigo(101);
        if (cadastro == null) {
            return new MensagemCadastro(101, "Forneça informaçoes válidas para o cadastro");
        }
        if (cadastro.getNome() == null || cadastro.getNome().trim().isEmpty() || !cadastro.getNome().toLowerCase().matches("^[a-zà-ÿ']+(\\s([a-zà-ÿ']\\s?)*[a-zà-ÿ][A-zà-ÿ']+)*$")) {
            return new MensagemCadastro(101, "Forneça um nome válido");
        }
        if (cadastro.getEmail() != null && cadastro.getEmail().trim().isEmpty() && !cadastro.getEmail().matches("^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$")) {
            return new MensagemCadastro(101, "Formato de email não suportado");
        }
        if (cadastro.getCpf() == null || cadastro.getCpf().isEmpty() || !cadastro.getCpf().matches("[0-9]+") || !Util.validarCPF(cadastro.getCpf())) {
            return new MensagemCadastro(101, "Forneça um CPF válido");
        }
        if (cadastro.getSenhaUsuario() == null || cadastro.getSenhaUsuario().isEmpty()) {
            return new MensagemCadastro(101, "Forneça uma senha válida");
        }
        if (cadastro.getPerguntasSeguranca() == null || cadastro.getPerguntasSeguranca().size() < 2) {
            return new MensagemCadastro(101, "Forneça 2 perguntas de seguranca");
        }

        try {
            String tokenLoginUsuario = new ServicoGeracaoToken().gerarSHA256(cadastro.getTelefone());
            String tokenLoginSegredo = new ServicoGeracaoToken().gerarSHA256(cadastro.getSenhaUsuario());

            String sql = "UPDATE usuario SET usuario.senha = ?, usuario.ativo = true, "
                    + " token_login_usuario = ?, token_login_segredo = ? "
                    + " WHERE usuario.id_usuario = ?";
            try (PreparedStatement stmt = getConexao().prepareStatement(sql)) {
                stmt.setString(1, cadastro.getSenhaUsuario());
                stmt.setString(2, tokenLoginUsuario);
                stmt.setString(3, tokenLoginSegredo);
                stmt.setLong(4, usuario.getIdUsuario());
                stmt.execute();
            }
            sql = "INSERT INTO cliente VALUES (default, ?, ?, ?, ?, ?)";
            try (PreparedStatement stmt = getConexao().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                stmt.setString(1, cadastro.getNome());
                stmt.setString(2, cadastro.getCpf());
                stmt.setString(3, usuario.getNomeUsuario());
                stmt.setString(4, cadastro.getEmail());
                stmt.setLong(5, usuario.getIdUsuario());
                stmt.execute();
                ResultSet rs = stmt.getGeneratedKeys();
                if (rs.next()) {
                    sql = "INSERT INTO enderecos_favoritos VALUES (?,0)";
                    try (PreparedStatement stmt2 = getConexao().prepareStatement(sql)) {
                        stmt2.setLong(1, rs.getLong(1));
                        stmt2.execute();
                    }
                    sql = "INSERT INTO formapagamentos_favoritas VALUES (?,0)";
                    try (PreparedStatement stmt2 = getConexao().prepareStatement(sql)) {
                        stmt2.setLong(1, rs.getLong(1));
                        stmt2.execute();
                    }
                    sql = "INSERT INTO websocket VALUES (?,null)";
                    try (PreparedStatement stmt2 = getConexao().prepareStatement(sql)) {
                        stmt2.setLong(1, rs.getLong(1));
                        stmt2.execute();
                    }
                }
            }

            sql = "INSERT INTO pergunta_seguranca_usuario (id_pergunta_seguranca, id_usuario, resposta) VALUES (?,?,?), (?,?,?), (?,?,?)";
            try (PreparedStatement stmt = getConexao().prepareStatement(sql)) {
                int index = 1;
                for (PerguntaSeguranca p : cadastro.getPerguntasSeguranca()) {
                    stmt.setLong(index++, p.getId());
                    stmt.setLong(index++, usuario.getIdUsuario());
                    stmt.setString(index++, p.getResposta());
                }
                stmt.execute();
                mensagem.setCodigo(100);
                mensagem.setDescricao("Cadastro concluído");
            }

        } catch (SQLException | NoSuchAlgorithmException | UnsupportedEncodingException e) {
            e.printStackTrace();
            throw new DAOException(e, 200);
        }
        return mensagem;
    }

    public Cliente getCliente(Usuario usuario) throws DAOException {

        Cliente cliente = null;
        String sql = "SELECT * FROM cliente WHERE id_usuario=?";
        try (PreparedStatement stmt = getConexao().prepareStatement(sql)) {
            stmt.setLong(1, usuario.getIdUsuario());
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                cliente = new Cliente();
                cliente.setId(rs.getLong("id_cliente"));
            }
        } catch (SQLException e) {
            throw new DAOException(200);
        }
        return cliente;
    }

    public List<PerguntaSeguranca> getPerguntasSeguranca() throws DAOException {
        List<PerguntaSeguranca> perguntas = new ArrayList<>();
        String sql = "SELECT * FROM pergunta_seguranca";
        try (PreparedStatement stmt = getConexao().prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                PerguntaSeguranca p = new PerguntaSeguranca();
                p.setId(rs.getLong("id_pergunta_seguranca"));
                p.setPergunta(rs.getString("pergunta"));
                perguntas.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new DAOException(e, 200);
        }
        return perguntas;
    }

    public MensagemCadastro verificarNumeroRedefinirSenha(String telefone) throws DAOException {
        MensagemCadastro mensagem = new MensagemCadastro();
        if (!telefone.matches("^\\+{1}55[0-9]{2}[0-9]{9}$")) {
            return new MensagemCadastro(101, "Número de telefone inválido", null);
        } else {
            try {
                String sql = "SELECT nome, ativo, verificado, token_cadastro, token_cadastro_data, "
                        + " (MINUTE(TIMEDIFF(now(), token_cadastro_data)) * 60 + SECOND(TIMEDIFF(now(), token_cadastro_data))) tempo_atual "
                        + " FROM usuario WHERE nome=?";
                PreparedStatement stmt = getConexao().prepareStatement(sql);
                stmt.setString(1, telefone);
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    if (rs.getBoolean("ativo")) {
                        if (rs.getInt("tempo_atual") / 60 < 10) {
                            mensagem.setCodigo(102);
                            mensagem.setDescricao(String.valueOf(rs.getInt("tempo_atual")));
                            mensagem.setOpcional(String.valueOf(60 * 10));
                        } else {
                            mensagem.setCodigo(103);
                            mensagem.setDescricao("Pode enviar sms");
                        }
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

    public MensagemCadastro enviarCodigoRedefinirSenha(Cadastro cadastro) throws DAOException {

        MensagemCadastro mensagem = null;
        try {
            mensagem = this.verificarNumeroRedefinirSenha(cadastro.getTelefone());
            String sql = "";
            switch (mensagem.getCodigo()) {
                case 103:
                    sql = "UPDATE usuario set token_cadastro=?, token_cadastro_data=now() WHERE nome=?";
                    try (PreparedStatement stmt = getConexao().prepareStatement(sql)) {
                        String token = ServicoGeracaoToken.gerarToken(cadastro.getTelefone(), 6);
                        stmt.setString(1, token);
                        stmt.setString(2, cadastro.getTelefone());
                        stmt.execute();
                        mensagem.setCodigo(100);
                        mensagem.setDescricao(token);
                        mensagem.setOpcional(String.valueOf(60 * 10));
                    }
                    break;
            }

        } catch (UnsupportedEncodingException | NoSuchAlgorithmException | SQLException e) {
            e.printStackTrace();
            throw new DAOException(e, 200);
        }
        return mensagem;
    }

    public Mensagem redefinirSenha(RedefinicaoSenha redefinicaoSenha) throws DAOException {
        Mensagem mensagem = new Mensagem();
        if (!redefinicaoSenha.getTelefone().matches("^\\+{1}55[0-9]{2}[0-9]{9}$")) {
            return null;
        }
        mensagem = this.verificarNumeroRedefinirSenha(redefinicaoSenha.getTelefone());
        if (mensagem.getCodigo() == 102) {
            String sql = "SELECT id_usuario FROM usuario WHERE nome=? AND token_cadastro=?";
            try (PreparedStatement stmt = getConexao().prepareStatement(sql)) {
                stmt.setString(1, redefinicaoSenha.getTelefone());
                stmt.setString(2, redefinicaoSenha.getCodigo().toUpperCase());
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    int perguntaRespondias = 0;
                    for (PerguntaSeguranca p : redefinicaoSenha.getPerguntas()) {
                        sql = "SELECT 1 FROM pergunta_seguranca_usuario WHERE id_usuario=? AND id_pergunta_seguranca=? AND resposta=?";
                        try (PreparedStatement stmt2 = getConexao().prepareStatement(sql)) {
                            stmt2.setLong(1, rs.getLong("id_usuario"));
                            stmt2.setLong(2, p.getId());
                            stmt2.setString(3, p.getResposta());
                            ResultSet rs2 = stmt2.executeQuery();
                            if (rs2.next()) {
                                perguntaRespondias++;
                            }
                        }
                    }
                    if (perguntaRespondias == 2) {
                        sql = "UPDATE usuario SET senha=? WHERE id_usuario=?";
                        try (PreparedStatement stmt2 = getConexao().prepareStatement(sql)) {
                            stmt2.setString(1, redefinicaoSenha.getSenha());
                            stmt2.setLong(2, rs.getLong("id_usuario"));
                            stmt2.execute();
                            mensagem.setCodigo(100);
                            mensagem.setDescricao("Senha alterada com sucesso");
                            return mensagem;
                        }
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
                throw new DAOException(e, 200);
            }
        }
        mensagem.setCodigo(101);
        mensagem.setDescricao("Erro ao alterar senha");
        return mensagem;
    }

}
