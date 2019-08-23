/*
 * Copyright (C) Paulo Henrique Goncalves Bacelar, Inc - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Paulo Henrique Gonacalves Bacelar <henrique.phgb@gmail.com>, Dezembro 2018
 */
package com.br.phdev.srs.daos;

import com.br.phdev.srs.exceptions.DAOException;
import com.br.phdev.srs.models.Cliente;
import com.br.phdev.srs.models.Complemento;
import com.br.phdev.srs.models.Endereco;
import com.br.phdev.srs.models.FormaPagamento;
import com.br.phdev.srs.models.Foto;
import com.br.phdev.srs.models.Genero;
import com.br.phdev.srs.models.GrupoVariacao;
import com.br.phdev.srs.models.Ingrediente;
import com.br.phdev.srs.models.Item;
import com.br.phdev.srs.models.ItemPedidoFacil;
import com.br.phdev.srs.models.Notificacao;
import com.br.phdev.srs.models.Pedido;
import com.br.phdev.srs.models.Pedido2;
import com.br.phdev.srs.models.Tipo;
import com.br.phdev.srs.models.Usuario;
import com.br.phdev.srs.models.Variacao;
import com.br.phdev.srs.utils.ServicoArmazenamento;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Paulo Henrique Gonçalves Bacelar <henrique.phgb@gmail.com>
 */
@Repository
public class GerenciadorDAO {

    private Connection conexao;

    @Autowired
    GerenciadorDAO(BasicDataSource dataSource) {
        try {
            this.conexao = dataSource.getConnection();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Item> getItens() throws DAOException {
        List<Item> itens = new ArrayList<>();
        String sql = "SELECT item.id_item, item.nome, item.preco, item.descricao, genero.id_genero, genero.nome genero, "
                + " item.modificavel, item.modificavel_ingrediente, item.tempo_preparo "
                + " FROM item "
                + " LEFT JOIN genero ON item.id_genero = genero.id_genero order by item.id_item, genero.nome";
        try (PreparedStatement stmt = this.conexao.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Item item = new Item();
                item.setId(rs.getLong("id_item"));
                item.setNome(rs.getString("nome"));
                item.setPreco(rs.getDouble("preco"));
                item.setTempoPreparo(rs.getString("tempo_preparo"));
                item.setModificavel(rs.getBoolean("modificavel"));
                item.setModificavelIngrediente(rs.getBoolean("modificavel_ingrediente"));
                Genero genero = new Genero(rs.getLong("id_genero"), rs.getString("genero"));
                item.setGenero(genero);

                sql = "SELECT arquivo.id_arquivo "
                        + " FROM arquivo "
                        + " LEFT JOIN item_arquivo ON arquivo.id_arquivo = item_arquivo.id_arquivo "
                        + " LEFT JOIN item ON item_arquivo.id_item = item.id_item "
                        + " WHERE item.id_item = ?";
                try (PreparedStatement stmt2 = this.conexao.prepareStatement(sql)) {
                    stmt2.setLong(1, rs.getLong("id_item"));
                    ResultSet rs2 = stmt2.executeQuery();
                    Set<Foto> fotos = new HashSet<>();
                    while (rs2.next()) {
                        Foto foto = new Foto();
                        foto.setId(rs2.getLong("id_arquivo"));
                        fotos.add(ServicoArmazenamento.setTamanho(foto));
                    }
                    item.setFotos(fotos);
                } catch (SQLException e) {
                    e.printStackTrace();
                }

                sql = "SELECT tipo.id_tipo, tipo.nome FROM item "
                        + " LEFT JOIN item_tipo ON item.id_item = item_tipo.id_item "
                        + " LEFT JOIN tipo ON item_tipo.id_tipo = tipo.id_tipo "
                        + " WHERE item.id_item = ?";
                try (PreparedStatement stmt2 = this.conexao.prepareStatement(sql)) {
                    stmt2.setLong(1, rs.getLong("id_item"));
                    ResultSet rs2 = stmt2.executeQuery();
                    Set<Tipo> tipos = new HashSet<>();
                    while (rs2.next()) {
                        Tipo tipo = new Tipo();
                        tipo.setId(rs2.getLong("id_tipo"));
                        tipo.setNome(rs2.getString("nome"));
                        tipos.add(tipo);
                    }
                    item.setTipos(tipos);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                itens.add(item);
            }
        } catch (SQLException e) {
            throw new DAOException("Erro ao recuperar informações", e, 200);
        }
        return itens;
    }

    public List<Genero> getGeneros() throws DAOException {
        List<Genero> generos = new ArrayList<>();
        String sql = "SELECT genero.id_genero, genero.nome, item.id_item, item.nome, item_arquivo.id_arquivo FROM item "
                + " RIGHT JOIN item_arquivo ON item.id_item = item_arquivo.id_item "
                + " LEFT JOIN genero ON item.id_genero = genero.id_genero "
                + " GROUP BY id_genero ORDER BY genero.nome";
        try (PreparedStatement stmt = this.conexao.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Genero genero = new Genero();
                genero.setId(rs.getLong("id_genero"));
                genero.setNome(rs.getString("nome"));
                Foto foto = new Foto();
                foto.setId(rs.getLong("id_arquivo"));
                genero.setFoto(ServicoArmazenamento.setTamanho(foto));
                generos.add(genero);
            }
        } catch (SQLException e) {
            throw new DAOException("Erro ao recuperar informações", e, 200);
        }
        return generos;
    }

    public List<Tipo> getTipos() throws DAOException {
        List<Tipo> tipos = new ArrayList<>();
        String sql = "SELECT * FROM tipo ORDER BY nome";
        try (PreparedStatement stmt = this.conexao.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Tipo tipo = new Tipo();
                tipo.setId(rs.getLong("id_tipo"));
                tipo.setNome(rs.getString("nome"));
                tipos.add(tipo);
            }
        } catch (SQLException e) {
            throw new DAOException("Erro ao recuperar informações", e, 200);
        }
        return tipos;
    }

    public List<Complemento> getComplementos() throws DAOException {
        List<Complemento> complementos = new ArrayList<>();
        String sql = "SELECT * FROM complemento ORDER BY nome";
        try (PreparedStatement stmt = this.conexao.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Complemento complemento = new Complemento();
                complemento.setId(rs.getLong("id_complemento"));
                complemento.setNome(rs.getString("nome"));
                complemento.setPreco(rs.getDouble("preco"));
                complementos.add(complemento);
            }
        } catch (SQLException e) {
            throw new DAOException("Erro ao recuperar informações", e, 200);
        }
        return complementos;
    }

    public List<Ingrediente> getIngredientes() throws DAOException {
        List<Ingrediente> ingredientes = new ArrayList<>();
        String sql = "SELECT * FROM ingrediente ORDER BY nome";
        try (PreparedStatement stmt = this.conexao.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Ingrediente ingrediente = new Ingrediente();
                ingrediente.setId(rs.getLong("id_ingrediente"));
                ingrediente.setNome(rs.getString("nome"));
                ingredientes.add(ingrediente);
            }
        } catch (SQLException e) {
            throw new DAOException("Erro ao recuperar informações", e, 200);
        }
        return ingredientes;
    }

    public List<Cliente> getClientes() throws DAOException {
        List<Cliente> clientes = new ArrayList<>();
        String sql = "SELECT * FROM cliente "
                + " LEFT JOIN usuario ON cliente.id_usuario = usuario.id_usuario "
                + " WHERE cliente.telefone = usuario.nome AND id_cliente != 0"
                + " ORDER BY id_cliente";
        try (PreparedStatement stmt = this.conexao.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Cliente cliente = new Cliente();
                cliente.setId(rs.getLong("id_cliente"));
                cliente.setNome(rs.getString("nome"));
                cliente.setTelefone(rs.getString("telefone"));
                cliente.setEmail(rs.getString("email"));
                clientes.add(cliente);
            }
        } catch (SQLException e) {
            throw new DAOException("Erro ao recuperar informações", e, 200);
        }
        return clientes;
    }

    public List<Pedido2> getPedidos() throws DAOException {
        List<Pedido2> pedidos = null;
        String sql = "SELECT * FROM pedido "
                + " LEFT JOIN pedido_estado ON pedido.estado = pedido_estado.id_pedido_estado "
                + " WHERE pedido_estado.controle != 'FINAL'";
        try (PreparedStatement stmt = this.conexao.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            pedidos = new ArrayList<>();
            while (rs.next()) {
                Pedido2 pedido = new Pedido2();
                pedido.setId(rs.getLong("id_pedido"));
                pedido.setPrecoTotal(rs.getDouble("precototal"));
                pedido.setStatus(rs.getString("pedido_estado.descricao"));
                pedidos.add(pedido);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new DAOException(200);
        }
        return pedidos;
    }

    public Pedido getPedido() throws DAOException, IOException {
        Pedido pedido = null;
        String sql = "SELECT * FROM pedido ped"
                + " LEFT JOIN endereco ende ON ped.id_endereco=ende.id_endereco "
                + " LEFT JOIN cliente cli ON ped.id_cliente=cli.id_cliente "
                + " LEFT JOIN formapagamento pag ON ped.id_formapagamento=pag.id_formapagamento ";
        try (PreparedStatement stmt = this.conexao.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            pedido = new Pedido();
            while (rs.next()) {
                pedido.setId(rs.getLong("id_pedido"));
                pedido.setPrecoTotal(rs.getDouble("precototal"));
                pedido.setEstado(rs.getInt("estado"));
                ObjectMapper mapeador = new ObjectMapper();
                List<ItemPedidoFacil> itens = mapeador.readValue(rs.getString("itens"), new TypeReference<List<ItemPedidoFacil>>() {
                });
                pedido.setItens(itens);
                Cliente cliente = new Cliente();
                cliente.setNome(rs.getString("nome"));
                pedido.setCliente(cliente);
                Endereco endereco = new Endereco();
                endereco.setLogradouro(rs.getString("logradouro"));
                endereco.setBairro(rs.getString("bairro"));
                endereco.setDescricao(rs.getString("ende.descricao"));
                endereco.setNumero(rs.getString("numero"));
                pedido.setEndereco(endereco);
                FormaPagamento formaPagamento = new FormaPagamento();
                formaPagamento.setDescricao(rs.getString("pag.descricao"));
                pedido.setFormaPagamento(formaPagamento);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new DAOException(200);
        }
        return pedido;
    }

    public void removerCliente(Cliente cliente) throws DAOException {
        String sql = "SELECT usuario.id_usuario, usuario.nome, now() data FROM usuario "
                + " LEFT JOIN cliente ON usuario.id_usuario = cliente.id_usuario "
                + " WHERE id_cliente=?";
        try (PreparedStatement stmt = this.conexao.prepareStatement(sql)) {
            stmt.setLong(1, cliente.getId());
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                sql = "UPDATE usuario set nome=? WHERE id_usuario=?";
                try (PreparedStatement stmt2 = this.conexao.prepareStatement(sql)) {
                    String time = LocalDateTime.parse(rs.getString("data"),
                            DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")).format(DateTimeFormatter.ofPattern("dd-MM-yyyy-HH:mm"));
                    stmt2.setString(1, rs.getString("nome") + "?" + time);
                    stmt2.setLong(2, rs.getLong("id_usuario"));
                    stmt2.execute();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new DAOException(200);
        }
    }

    public void cadastrarTokenAlerta(Usuario usuario, String token) throws DAOException {
        if (usuario == null) {
            throw new DAOException("Erro", 300);
        }
        String sql = "UPDATE websocket_admin SET token=? WHERE id_usuario=?";
        try (PreparedStatement stmt = this.conexao.prepareStatement(sql)) {
            stmt.setString(1, token);
            stmt.setLong(2, usuario.getIdUsuario());
            stmt.execute();
        } catch (SQLException e) {
            throw new DAOException(e, 200);
        }
    }

    public void atualizarEstadoPedido2(Pedido pedido) throws DAOException {
        String sql = "UPDATE pedido SET estado=(IF(estado < 11, estado + 1, 11)) WHERE id_pedido=?";
        try (PreparedStatement stmt = this.conexao.prepareStatement(sql)) {
            stmt.setLong(1, pedido.getId());
            stmt.execute();
            sql = "SELECT id_cliente, estado, pedido_estado.descricao, pedido_estado.controle FROM pedido "
                    + " LEFT JOIN pedido_estado ON pedido.estado = pedido_estado.id_pedido_estado "
                    + " WHERE id_pedido=? ";
            try (PreparedStatement stmt2 = this.conexao.prepareStatement(sql)) {
                stmt2.setLong(1, pedido.getId());
                ResultSet rs = stmt2.executeQuery();
                if (rs.next()) {
                    Notificacao notificacao = new Notificacao();
                    notificacao.setCliente(new Cliente(rs.getLong("id_cliente")));
                    notificacao.setMensagem("{\"id\":\"?\", \"tipo\":\"atualizacao_estado_pedido\", \"id_pedido\":" + pedido.getId() 
                            + ", \"estado_id\":" + rs.getInt("estado") 
                            + ", \"estado_descricao\":" + rs.getString("pedido_estado.descricao") 
                            + ", \"estado_controle\":" + rs.getString("pedido_estado.controle") + "}");
                    this.adicionarNotificacao(notificacao);
                }
            }
        } catch (SQLException e) {
            throw new DAOException(e, 200);
        }
    }

    public void adicionarGeneros(List<Genero> generos) throws DAOException {
        String sql = "CALL gerenciador_inserir_genero(?)";
        for (Genero genero : generos) {
            try (PreparedStatement stmt = this.conexao.prepareStatement(sql)) {
                stmt.setString(1, genero.getNome());
                stmt.execute();
            } catch (SQLException e) {
                throw new DAOException(e, 200);
            }
        }
    }

    public void removerGeneros(List<Genero> generos) throws DAOException, SQLIntegrityConstraintViolationException {
        String sql = "CALL gerenciador_remover_genero(?)";
        for (Genero genero : generos) {
            try (PreparedStatement stmt = this.conexao.prepareStatement(sql)) {
                stmt.setLong(1, genero.getId());
                stmt.execute();
            } catch (SQLException e) {
                if (e instanceof SQLIntegrityConstraintViolationException) {
                    throw new SQLIntegrityConstraintViolationException("Algum genero está sendo utilizado e não pode ser excluido.");
                } else {
                    throw new DAOException(e, 200);
                }
            }
        }
    }

    public void adicionarTipos(List<Tipo> tipos) throws DAOException {
        String sql = "CALL gerenciador_inserir_tipo(?)";
        for (Tipo tipo : tipos) {
            try (PreparedStatement stmt = this.conexao.prepareStatement(sql)) {
                stmt.setString(1, tipo.getNome());
                stmt.execute();
            } catch (SQLException e) {
                throw new DAOException(e, 200);
            }
        }
    }

    public void removerTipos(List<Tipo> tipos) throws DAOException, SQLIntegrityConstraintViolationException {
        String sql = "CALL gerenciador_remover_tipo(?)";
        for (Tipo tipo : tipos) {
            try (PreparedStatement stmt = this.conexao.prepareStatement(sql)) {
                stmt.setLong(1, tipo.getId());
                stmt.execute();
            } catch (SQLException e) {
                if (e instanceof SQLIntegrityConstraintViolationException) {
                    throw new SQLIntegrityConstraintViolationException("Algum tipo está sendo utilizado e não pode ser excluido.");
                } else {
                    throw new DAOException(e, 200);
                }
            }
        }
    }

    public void adicionarComplemento(Complemento complemento) throws DAOException {
        String sql = "CALL gerenciador_inserir_complemento(?,?,?)";
        try (PreparedStatement stmt = this.conexao.prepareStatement(sql.toString())) {
            stmt.setString(1, complemento.getNome());
            stmt.setDouble(2, complemento.getPreco());
            stmt.setDouble(3, complemento.getFoto().getId());
            stmt.execute();
        } catch (SQLException e) {
            throw new DAOException(e, 200);
        }
    }

    public void removerComplementos(List<Complemento> complementos) throws DAOException, SQLIntegrityConstraintViolationException {
        List<Complemento> complementosParaApagarFoto = new ArrayList<>();
        for (Complemento complemento : complementos) {
            try {
                String sql = "CALL gerenciador_remover_complemento(?)";
                PreparedStatement stmt = this.conexao.prepareStatement(sql);
                stmt.setLong(1, complemento.getFoto().getId());
                stmt.execute();
                stmt.close();
                sql = "CALL gerenciador_remover_arquivo(?)";
                stmt = this.conexao.prepareStatement(sql);
                stmt.setLong(1, complemento.getId());
                stmt.execute();
                stmt.close();
                complementosParaApagarFoto.add(complemento);
            } catch (SQLException e) {
                if (e instanceof SQLIntegrityConstraintViolationException) {
                    //throw new SQLIntegrityConstraintViolationException("Algum complmento está sendo utilizado e não pode ser excluido.");
                }
                throw new DAOException(e, 200);
            }
        }
        complementos.clear();
        complementos.addAll(complementosParaApagarFoto);
    }

    public void adicionarIngrediente(List<Ingrediente> ingredientes) throws DAOException {
        String sql = "CALL gerenciador_inserir_ingrediente(?)";
        for (Ingrediente ingrediente : ingredientes) {
            try (PreparedStatement stmt = this.conexao.prepareStatement(sql)) {
                stmt.setString(1, ingrediente.getNome());
                stmt.execute();
            } catch (SQLException e) {
                throw new DAOException(e, 200);
            }
        }
    }

    public void removerIngredientes(List<Ingrediente> ingredientes) throws DAOException, SQLIntegrityConstraintViolationException {
        String sql = "CALL gerenciador_remover_ingrediente(?)";
        for (Ingrediente ingrediente : ingredientes) {
            try (PreparedStatement stmt = this.conexao.prepareStatement(sql)) {
                stmt.setLong(1, ingrediente.getId());
                stmt.execute();
            } catch (SQLException e) {
                if (e instanceof SQLIntegrityConstraintViolationException) {
                    throw new SQLIntegrityConstraintViolationException("Algum ingrediente está sendo utilizado e não pode ser excluido.");
                } else {
                    throw new DAOException(e, 200);
                }
            }
        }
    }

    public void adicionarItem(Item item) throws DAOException {
        try (PreparedStatement stmt = this.conexao.prepareStatement("CALL gerenciador_inserir_item(?,?,?,?,?,?)")) {
            stmt.setString(1, item.getNome());
            stmt.setDouble(2, item.getPreco());
            stmt.setString(3, item.getDescricao());
            stmt.setLong(4, item.getGenero().getId());
            stmt.setBoolean(5, item.isModificavel());
            stmt.setBoolean(6, item.isModificavelIngrediente());
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                item.setId(rs.getLong("id"));
                for (Tipo tipo : item.getTipos()) {
                    try (PreparedStatement stmt2 = this.conexao.prepareStatement("CALL gerenciador_inserir_item_tipo(?,?)")) {
                        stmt2.setLong(1, item.getId());
                        stmt2.setLong(2, tipo.getId());
                        stmt2.execute();
                    }
                }
                if (item.isModificavel()) {
                    for (Complemento complemento : item.getComplementos()) {
                        try (PreparedStatement stmt2 = this.conexao.prepareStatement("CALL gerenciador_inserir_item_complemento(?,?)")) {
                            stmt2.setLong(1, item.getId());
                            stmt2.setLong(2, complemento.getId());
                            stmt2.execute();
                        }
                    }
                }
                if (item.isModificavelIngrediente()) {
                    for (Ingrediente ingrediente : item.getIngredientes()) {
                        try (PreparedStatement stmt2 = this.conexao.prepareStatement("CALL gerenciador_inserir_item_ingrediente(?,?)")) {
                            stmt2.setLong(1, item.getId());
                            stmt2.setLong(2, ingrediente.getId());
                            stmt2.execute();
                        }
                    }
                }
                if (item.getVariacoes() != null && !item.getVariacoes().isEmpty()) {
                    for (int i = 0; i < item.getVariacoes().size(); i++) {
                        GrupoVariacao gv = item.getVariacoes().get(i);
                        try (PreparedStatement stmt2 = this.conexao.prepareStatement("CALL gerenciador_inserir_grupo_variacao(?,?,?,?)")) {
                            stmt2.setString(1, gv.getNome());
                            stmt2.setInt(2, i);
                            stmt2.setInt(3, gv.getMax());
                            stmt2.setLong(4, item.getId());;
                            ResultSet rs2 = stmt2.executeQuery();
                            if (rs2.next()) {
                                long idGrupoVariacao = rs2.getLong("id");
                                for (Variacao v : gv.getVariacoes()) {
                                    try (PreparedStatement stmt3 = this.conexao.prepareStatement("CALL gerenciador_inserir_variacao(?,?,?,?)")) {
                                        stmt3.setString(1, v.getNome());
                                        stmt3.setDouble(2, v.getPreco());
                                        stmt3.setInt(3, v.getOrdem());
                                        stmt3.setLong(4, idGrupoVariacao);
                                        stmt3.execute();
                                    }
                                }
                            } else {
                                throw new SQLException();
                            }
                        }
                    }
                }
                for (Foto foto : item.getFotos()) {
                    try (PreparedStatement stmt2 = this.conexao.prepareStatement("CALL gerenciador_inserir_item_arquivo(?,?)")) {
                        stmt2.setLong(1, item.getId());
                        stmt2.setLong(2, foto.getId());
                        stmt2.execute();
                    }
                }
            }
        } catch (SQLException e) {
            throw new DAOException(e, 200);
        }
    }

    public long adicionarArquivo() throws DAOException {
        String sql = "CALL gerenciador_inserir_arquivo";
        try (PreparedStatement stmt = this.conexao.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getLong("id");
            }
            return -1;
        } catch (SQLException e) {
            throw new DAOException(e, 200);
        }
    }

    public void removerArquivo(Foto foto) throws DAOException {
        String sql = "CALL gerenciador_remover_arquivo(?)";
        try (PreparedStatement stmt = this.conexao.prepareStatement(sql)) {
            stmt.setLong(1, foto.getId());
            stmt.execute();
        } catch (SQLException e) {
            throw new DAOException(e, 200);
        }
    }

    public void atualizarEstadoPedido(Pedido pedido) throws DAOException {
        String sql = "UPDATE pedido SET estado=? WHERE id_pedido=?";
        try (PreparedStatement stmt = this.conexao.prepareStatement(sql)) {
            stmt.setInt(1, pedido.getEstado());
            stmt.setLong(2, pedido.getId());
            stmt.execute();

            sql = "SELECT id_cliente FROM pedido WHERE id_pedido=?";
            try (PreparedStatement stmt2 = this.conexao.prepareStatement(sql)) {
                stmt2.setLong(1, pedido.getId());
                ResultSet rs = stmt2.executeQuery();
                if (rs.next()) {
                    Notificacao notificacao = new Notificacao();
                    notificacao.setCliente(new Cliente(rs.getLong("id_cliente")));
                    notificacao.setMensagem("{\"id\":\"?\", \"tipo\":\"atualizacao_estado_pedido\", \"id_pedido\":" + pedido.getId() + ", \"estado\":" + pedido.getEstado() + "}");
                    this.adicionarNotificacao(notificacao);
                }
            }
        } catch (SQLException e) {
            throw new DAOException(e, 200);
        }
    }

    public void adicionarNotificacao(Notificacao notificacao) throws DAOException {
        String sql = "INSERT INTO notificacao VALUES (default, ?, ?, false)";
        try (PreparedStatement stmt = this.conexao.prepareStatement(sql)) {
            stmt.setLong(1, notificacao.getCliente().getId());
            stmt.setString(2, notificacao.getMensagem());
            stmt.execute();
        } catch (SQLException e) {
            throw new DAOException(e, 200);
        }
    }

}
