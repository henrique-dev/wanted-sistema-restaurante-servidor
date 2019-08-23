/*
 * Copyright (C) 2019 Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>, 10-08-2019
 */
package com.br.phdev.srs.daos;

import com.br.phdev.srs.exceptions.DAOException;
import com.br.phdev.srs.models.Cliente;
import com.br.phdev.srs.models.Notificacao;
import com.br.phdev.srs.models.NotificacaoPedido;
import com.br.phdev.srs.models.Pedido;
import com.br.phdev.srs.models.Pedido2;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>
 */
@Repository
public class ServicoDAO {
    
    private Connection conexao;
    
    @Autowired
    ServicoDAO(BasicDataSource dataSource) {
        try {
            this.conexao = dataSource.getConnection();
        } catch (SQLException e) {
            throw new RuntimeException(e); 
        }
    }
    
    public void confirmarRecebimentoNotificacao(Notificacao notificacao) {
        String sql = "UPDATE notificacao SET entregue=1 WHERE id_notificacao=?";
        try (PreparedStatement stmt = this.conexao.prepareStatement(sql)) {
            stmt.setLong(1, notificacao.getId());
            stmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public HashSet<Notificacao> listarNotificacoes() throws DAOException {
        HashSet<Notificacao> notificacoes = new HashSet<>();
        String sql = "SELECT * FROM notificacao "
                + " LEFT JOIN websocket ON notificacao.id_cliente = websocket.id_cliente "
                + " WHERE notificacao.entregue = 0 AND websocket.token != '' AND websocket.token IS NOT NULL";
        try (PreparedStatement stmt = this.conexao.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Notificacao notificacao = new Notificacao();
                notificacao.setId(rs.getLong("id_notificacao"));
                notificacao.setCliente(new Cliente(rs.getLong("id_cliente")));
                String mensagem = rs.getString("mensagem");
                mensagem = mensagem.replace("\"?\"", String.valueOf(notificacao.getId()));
                notificacao.setMensagem(mensagem);
                notificacao.setWebsocketId(rs.getString("token"));
                notificacoes.add(notificacao);
            }
        } catch (SQLException e) {
            throw new DAOException(e, 200);
        }
        return notificacoes;
    }
    
    public NotificacaoPedido listarPedidos() throws DAOException {
        NotificacaoPedido notificacaoPedido = new NotificacaoPedido();
        notificacaoPedido.setTipo("atualizacao");
        String sql = "SELECT * FROM pedido "
                + " LEFT JOIN pedido_estado ON pedido.estado = pedido_estado.id_pedido_estado "
                + " WHERE pedido_estado.controle != 'FINAL'";
        try (PreparedStatement stmt = this.conexao.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            List<Pedido2> pedidos = new ArrayList<>();
            while (rs.next()) {
                Pedido2 pedido = new Pedido2();
                pedido.setId(rs.getLong("id_pedido"));
                pedido.setPrecoTotal(rs.getDouble("precototal"));
                pedido.setStatus(rs.getString("pedido_estado.descricao"));
                pedidos.add(pedido);
            }
            notificacaoPedido.setPedidos(pedidos);
            sql = "SELECT * FROM websocket_admin WHERE id_usuario=1";
            try (PreparedStatement stmt2 = this.conexao.prepareStatement(sql)) {
                ResultSet rs2 = stmt2.executeQuery();                
                if (rs2.next()) {                    
                    notificacaoPedido.setWebsocketId(rs2.getString("token"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new DAOException(200);
        }
        return notificacaoPedido;
    }
    
}
