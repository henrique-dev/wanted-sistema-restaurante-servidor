/*
 * Copyright (C) Paulo Henrique Goncalves Bacelar, Inc - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Paulo Henrique Gonacalves Bacelar <henrique.phgb@gmail.com>, Dezembro 2018
 */
package com.br.phdev.srs.daos;

import com.br.phdev.srs.exceptions.DAOException;
import com.br.phdev.srs.exceptions.DAOIncorrectData;
import com.br.phdev.srs.exceptions.StorageException;
import com.br.phdev.srs.models.Arquivo;
import com.br.phdev.srs.models.Cliente;
import com.br.phdev.srs.models.Complemento;
import com.br.phdev.srs.models.CupomDesconto;
import com.br.phdev.srs.models.Endereco;
import com.br.phdev.srs.models.FormaPagamento;
import com.br.phdev.srs.models.Foto;
import com.br.phdev.srs.models.Genero;
import com.br.phdev.srs.models.GrupoVariacao;
import com.br.phdev.srs.models.Ingrediente;
import com.br.phdev.srs.models.Item;
import com.br.phdev.srs.models.Item2;
import com.br.phdev.srs.models.ItemPedido;
import com.br.phdev.srs.models.ItemPedidoFacil;
import com.br.phdev.srs.models.Notificacao;
import com.br.phdev.srs.models.Pedido;
import com.br.phdev.srs.models.Pedido2;
import com.br.phdev.srs.models.Pedido3;
import com.br.phdev.srs.models.Tipo;
import com.br.phdev.srs.models.TipoCupomDesconto;
import com.br.phdev.srs.models.Usuario;
import com.br.phdev.srs.models.Variacao;
import com.br.phdev.srs.utils.ServicoArmazenamento;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

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
        String sql = "SELECT genero.id_genero, genero.nome FROM genero "
                + " ORDER BY genero.nome";
        try (PreparedStatement stmt = this.conexao.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Genero genero = new Genero();
                genero.setId(rs.getLong("id_genero"));
                genero.setNome(rs.getString("nome"));
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

    public List<Pedido3> getPedidos() throws DAOException {
        List<Pedido3> pedidos = null;
        String sql = "SELECT * FROM pedido "
                + " LEFT JOIN pedido_estado ON pedido.estado = pedido_estado.id_pedido_estado "
                + " LEFT JOIN cliente ON pedido.id_cliente = cliente.id_cliente "
                + " LEFT JOIN endereco ON pedido.id_endereco = endereco.id_endereco " 
                + " WHERE pedido.estado IN (4,8,9,10,11)";
        try (PreparedStatement stmt = this.conexao.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            pedidos = new ArrayList<>();
            while (rs.next()) {
                Pedido3 pedido = new Pedido3();
                pedido.setId(rs.getLong("id_pedido"));
                pedido.setPrecoTotal(rs.getDouble("precototal"));
                pedido.setStatus(rs.getString("pedido_estado.descricao"));
                
                Cliente cliente = new Cliente();
                cliente.setNome(rs.getString("cliente.nome"));
                cliente.setTelefone(rs.getString("cliente.telefone"));
                pedido.setCliente(cliente);
                
                Endereco endereco = new Endereco();
                endereco.setLogradouro(rs.getString("logradouro"));
                endereco.setBairro(rs.getString("bairro"));
                endereco.setDescricao(rs.getString("endereco.descricao"));
                pedido.setEndereco(endereco);
                
                ObjectMapper mapeador = new ObjectMapper();
                List<ItemPedido> itens = mapeador.readValue(rs.getString("itens"), new TypeReference<List<ItemPedido>>() {
                });
                pedido.setItens(itens);
                
                ObjectMapper objectMapper = new ObjectMapper();
                String json = objectMapper.writeValueAsString(pedido);
                pedido.setJson(json);
                
                pedidos.add(pedido);
            }
        } catch (SQLException | JsonProcessingException e) {
            e.printStackTrace();
            throw new DAOException(200);
        } catch (IOException e) {
            e.printStackTrace();
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
            sql = "SELECT id_cliente, estado, pedido_estado.descricao, pedido_estado.controle, id_cupomdesconto FROM pedido "
                    + " LEFT JOIN pedido_estado ON pedido.estado = pedido_estado.id_pedido_estado "
                    + " WHERE id_pedido=? ";
            try (PreparedStatement stmt2 = this.conexao.prepareStatement(sql)) {
                stmt2.setLong(1, pedido.getId());
                ResultSet rs = stmt2.executeQuery();
                if (rs.next()) {                    
                    if (rs.getInt("estado") == 11 && rs.getObject("id_cupomdesconto") != null) {
                        sql = "UPDATE cupomdesconto_cliente SET usado = true, proxima_compra = false WHERE id_cliente = ? AND id_cupomdesconto = ?";
                        try (PreparedStatement stmt3 = this.conexao.prepareStatement(sql)) {
                            stmt3.setLong(1, rs.getLong("id_cliente"));
                            stmt3.setLong(2, rs.getLong("id_cupomdesconto"));
                            stmt3.execute();
                        }
                    }
                    
                    Notificacao notificacao = new Notificacao();
                    notificacao.setCliente(new Cliente(rs.getLong("id_cliente")));
                    notificacao.setMensagem("{\"id\":\"?\", \"tipo\":\"atualizacao_estado_pedido\", \"id_pedido\":" + pedido.getId() + ", "
                            + " \"estado_id\":" + rs.getInt("estado") + ", "
                            + " \"estado_descricao\" : \"" + rs.getString("pedido_estado.descricao") + "\", "
                            + " \"estado_controle\" : \"" + rs.getString("pedido_estado.controle") + "\"}");
                    this.adicionarNotificacao(notificacao);
                }
            }            
        } catch (SQLException e) {
            throw new DAOException(e, 200);
        }
    }

    public void adicionarItem(Item2 item) throws DAOException {
        String sql = "INSERT INTO item (id_item, nome, descricao, preco, id_genero, modificavel, modificavel_ingrediente, tempo_preparo) "
                + " values (?,?,?,?,?,?,?,?) ON DUPLICATE KEY UPDATE nome=?, descricao=?, preco=?, id_genero=?, modificavel=?, modificavel_ingrediente=?, tempo_preparo=?";
        try (PreparedStatement stmt = this.conexao.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setLong(1, item.getId());
            stmt.setString(2, item.getNome());
            stmt.setString(3, item.getDescricao());
            stmt.setDouble(4, item.getPreco());
            stmt.setLong(5, item.getGenero().getId());
            stmt.setBoolean(6, item.isModificavel());
            stmt.setBoolean(7, item.isModificavelIngrediente());
            stmt.setString(8, item.getTempoPreparo());

            stmt.setString(9, item.getNome());
            stmt.setString(10, item.getDescricao());
            stmt.setDouble(11, item.getPreco());
            stmt.setLong(12, item.getGenero().getId());
            stmt.setBoolean(13, item.isModificavel());
            stmt.setBoolean(14, item.isModificavelIngrediente());
            stmt.setString(15, item.getTempoPreparo());
            stmt.execute();
            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next() || item.getId() != 0) {
                Long idItem;
                if (item.getId() != 0) {
                    idItem = item.getId();
                } else {
                    idItem = rs.getLong(1);
                }
                sql = "DELETE FROM item_tipo WHERE id_item=?";
                try (PreparedStatement stmt2 = this.conexao.prepareStatement(sql)) {
                    stmt2.setLong(1, idItem);
                    stmt2.execute();
                }
                for (Tipo t : item.getTipos()) {
                    sql = "INSERT INTO item_tipo VALUES (?,?)";
                    try (PreparedStatement stmt2 = this.conexao.prepareStatement(sql)) {
                        stmt2.setLong(1, idItem);
                        stmt2.setLong(2, t.getId());
                        stmt2.execute();
                    }
                }
                sql = "DELETE FROM item_complemento WHERE id_item=?";
                try (PreparedStatement stmt2 = this.conexao.prepareStatement(sql)) {
                    stmt2.setLong(1, idItem);
                    stmt2.execute();
                }
                for (Complemento c : item.getComplementos()) {
                    sql = "INSERT INTO item_complemento VALUES (?,?)";
                    try (PreparedStatement stmt2 = this.conexao.prepareStatement(sql)) {
                        stmt2.setLong(1, idItem);
                        stmt2.setLong(2, c.getId());
                        stmt2.execute();
                    }
                }
                sql = "DELETE FROM item_ingrediente WHERE id_item=?";
                try (PreparedStatement stmt2 = this.conexao.prepareStatement(sql)) {
                    stmt2.setLong(1, idItem);
                    stmt2.execute();
                }
                for (Ingrediente i : item.getIngredientes()) {
                    sql = "INSERT INTO item_ingrediente VALUES (?,?)";
                    try (PreparedStatement stmt2 = this.conexao.prepareStatement(sql)) {
                        stmt2.setLong(1, idItem);
                        stmt2.setLong(2, i.getId());
                        stmt2.execute();
                    }
                }

                ServicoArmazenamento sa = new ServicoArmazenamento();

                for (Arquivo arquivo : item.getFotos()) {
                    if (arquivo.getId() == 0) {
                        sql = "INSERT INTO arquivo VALUES (default, null)";
                        try (PreparedStatement stmt2 = this.conexao.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                            stmt2.execute();
                            ResultSet rs2 = stmt2.getGeneratedKeys();
                            if (rs2.next()) {
                                sa.salvar(arquivo.getMultipartFile(), rs2.getLong(1));
                                sql = "INSERT INTO item_arquivo VALUES (?,?)";
                                try (PreparedStatement stmt3 = this.conexao.prepareCall(sql)) {
                                    stmt3.setLong(1, idItem);
                                    stmt3.setLong(2, rs2.getLong(1));
                                    stmt3.execute();
                                }
                            }
                        }
                    } else if (arquivo.getId() < 0) {
                        sql = "DELETE FROM item_arquivo WHERE id_item=? AND id_arquivo=?";
                        try (PreparedStatement stmt2 = this.conexao.prepareStatement(sql)) {
                            stmt2.setLong(1, idItem);
                            stmt2.setLong(2, arquivo.getId() * -1);
                            stmt2.execute();
                        }
                        sql = "DELETE FROM arquivo WHERE id_arquivo=?";
                        try (PreparedStatement stmt2 = this.conexao.prepareStatement(sql)) {
                            stmt2.setLong(1, arquivo.getId() * -1);
                            stmt2.execute();
                        }
                        sa.excluir(arquivo.getId() * -1);
                    } else {
                        sa.salvar(arquivo.getMultipartFile(), arquivo.getId());
                    }
                }
            }
        } catch (SQLException | StorageException e) {
            e.printStackTrace();
            throw new DAOException(e, 200);
        }
    }

    public Item getItem(Item item) throws DAOException {
        if (item == null) {
            throw new DAOIncorrectData(300);
        }
        if (item.getId() == 0) {
            throw new DAOIncorrectData(301);
        }
        // get_item
        String sql = "SELECT item.id_item, item.nome, item.preco, item.descricao, genero.id_genero, genero.nome genero, "
                + " item.modificavel, item.modificavel_ingrediente, item.tempo_preparo "
                + " FROM item "
                + " LEFT JOIN genero ON item.id_genero = genero.id_genero "
                + " WHERE item.id_item = ? ";
        try (PreparedStatement stmt = this.conexao.prepareStatement(sql)) {
            stmt.setLong(1, item.getId());
            ResultSet rs = stmt.executeQuery();
            Set<Ingrediente> ingredientes = new HashSet<>();
            Set<Complemento> complementos = new HashSet<>();
            List<GrupoVariacao> variacoes = new ArrayList<>();
            while (rs.next()) {
                item.setId(rs.getLong("id_item"));
                item.setNome(rs.getString("nome"));
                item.setDescricao(rs.getString("descricao"));
                item.setPreco(rs.getDouble("preco"));
                item.setTempoPreparo(rs.getString("tempo_preparo"));
                item.setModificavel(rs.getBoolean("modificavel"));
                item.setModificavelIngrediente(rs.getBoolean("modificavel_ingrediente"));
                item.setGenero(new Genero(rs.getLong("id_genero"), rs.getString("genero")));

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

                sql = "SELECT tipo.id_tipo, tipo.nome FROM item_tipo "
                        + " LEFT JOIN tipo ON item_tipo.id_tipo = tipo.id_tipo "
                        + " WHERE item_tipo.id_item = ?";
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
                if (item.isModificavel()) {
                    // get_lista_complementos_item
                    sql = "SELECT complemento.id_complemento, complemento.nome, complemento.preco, complemento.id_arquivo "
                            + " FROM complemento "
                            + " LEFT JOIN item_complemento ON complemento.id_complemento = item_complemento.id_complemento "
                            + " WHERE item_complemento.id_item = ?";
                    try (PreparedStatement stmt2 = this.conexao.prepareStatement(sql)) {
                        stmt2.setLong(1, item.getId());
                        ResultSet rs2 = stmt2.executeQuery();
                        complementos = new HashSet<>();
                        while (rs2.next()) {
                            complementos.add(new Complemento(
                                    rs2.getLong("id_complemento"),
                                    rs2.getString("nome"),
                                    rs2.getDouble("preco"),
                                    new Foto(rs2.getLong("id_arquivo"), null, 0)));
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                if (item.isModificavelIngrediente()) {
                    // get_lista_ingredientes_item
                    sql = "SELECT ingrediente.id_ingrediente, ingrediente.nome "
                            + " FROM ingrediente "
                            + " LEFT JOIN item_ingrediente ON ingrediente.id_ingrediente = item_ingrediente.id_ingrediente "
                            + " WHERE item_ingrediente.id_item = ?";
                    try (PreparedStatement stmt2 = this.conexao.prepareStatement(sql)) {
                        stmt2.setLong(1, item.getId());
                        ResultSet rs2 = stmt2.executeQuery();
                        ingredientes = new HashSet<>();
                        while (rs2.next()) {
                            ingredientes.add(new Ingrediente(
                                    rs2.getLong("id_ingrediente"),
                                    rs2.getString("nome")));
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                // get_lista_variacoes_item
                sql = "SELECT variacao.id_variacao, variacao.nome, variacao.preco, variacao.ordem, "
                        + " grupo_variacao.id_item, grupo_variacao.nome nome_grupo, grupo_variacao.max, grupo_variacao.grupo "
                        + " FROM variacao "
                        + " LEFT JOIN grupo_variacao ON variacao.id_grupo_variacao = grupo_variacao.id_grupo_variacao "
                        + " WHERE id_item = ? ORDER BY grupo, ordem ASC";
                try (PreparedStatement stmt2 = this.conexao.prepareStatement(sql)) {
                    stmt2.setLong(1, item.getId());
                    ResultSet rs2 = stmt2.executeQuery();
                    variacoes = new ArrayList<>();
                    while (rs2.next()) {
                        if (variacoes.size() > rs2.getInt("grupo")) {
                            GrupoVariacao gv = variacoes.get(rs2.getInt("grupo"));
                            gv.getVariacoes().add(new Variacao(rs2.getLong("id_variacao"), rs2.getString("nome"), rs2.getDouble("preco"), rs2.getInt("ordem")));
                            gv.setMax(rs2.getInt("max"));
                        } else {
                            GrupoVariacao gv = new GrupoVariacao();
                            Set<Variacao> v = new HashSet<>();
                            v.add(new Variacao(rs2.getLong("id_variacao"), rs2.getString("nome"), rs2.getDouble("preco"), rs2.getInt("ordem")));
                            gv.setMax(rs2.getInt("max"));
                            gv.setNome(rs2.getString("nome_grupo"));
                            gv.setVariacoes(v);
                            variacoes.add(gv);

                        }
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                item.setComplementos(complementos);
                item.setIngredientes(ingredientes);
                item.setVariacoes(variacoes);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new DAOException("Erro ao recuperar informações", e, 200);
        }
        return item;
    }

    public List<TipoCupomDesconto> getTipoCupomDescontos() throws DAOException {
        List<TipoCupomDesconto> tipoCupomDescontos = new ArrayList<>();
        String sql = "SELECT id_cupomdesconto_tipo, descricao FROM cupomdesconto_tipo";
        try (PreparedStatement stmt = this.conexao.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                TipoCupomDesconto tipo = new TipoCupomDesconto();
                tipo.setId(rs.getLong("id_cupomdesconto_tipo"));
                tipo.setDescricao(rs.getString("descricao"));
                tipoCupomDescontos.add(tipo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new DAOException(e, 200);
        }

        return tipoCupomDescontos;
    }

    public boolean checarExistenciaCupomCodigo(String codigo) throws DAOException {
        String sql = "SELECT 1 FROM cupomdesconto WHERE codigo=?";
        try (PreparedStatement stmt = this.conexao.prepareStatement(sql)) {
            stmt.setString(1, codigo);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new DAOException(e, 200);
        }
        return false;
    }
    
    public List<CupomDesconto> getCupomDescontos() throws DAOException {
        List<CupomDesconto> cupomDescontos = new ArrayList<>();
        String sql = "SELECT * FROM cupomdesconto "
                + "LEFT JOIN cupomdesconto_tipo ON cupomdesconto.id_cupomdesconto_tipo = cupomdesconto_tipo.id_cupomdesconto_tipo ";
        try (PreparedStatement stmt = this.conexao.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                CupomDesconto cupom = new CupomDesconto();
                cupom.setId(rs.getLong("id_cupomdesconto"));
                cupom.setTipo(new TipoCupomDesconto(rs.getLong("cupomdesconto_tipo.id_cupomdesconto_tipo"), rs.getString("cupomdesconto_tipo.descricao"), rs.getString("cupomdesconto_tipo.controle")));                
                cupom.setCodigo(rs.getString("codigo"));
                cupom.setDescricao(rs.getString("descricao"));
                cupom.setQuantidade(rs.getLong("quantidade"));
                cupom.setValidade(rs.getTimestamp("validade"));
                cupom.setAtivo(rs.getBoolean("ativo"));
                cupom.setPercentual(rs.getBoolean("percentual"));
                cupom.setValor(rs.getDouble("valor"));
                cupomDescontos.add(cupom);
            }
        } catch (SQLException e)  {
            e.printStackTrace();
            throw new DAOException(e, 200);
        }
        return cupomDescontos;
    }

    public void inserirCupom(CupomDesconto cupom) throws DAOException {
        String sql = "INSERT INTO cupomdesconto (id_cupomdesconto_tipo, codigo, descricao, quantidade, validade, ativo, percentual, valor) "
                + " VALUES (?,?,?,?,?,?,?,?)";
        try (PreparedStatement stmt = this.conexao.prepareStatement(sql)) {
            stmt.setLong(1, cupom.getTipo().getId());
            stmt.setString(2, cupom.getCodigo());
            stmt.setString(3, cupom.getDescricao());
            stmt.setLong(4, cupom.getQuantidade());
            stmt.setObject(5, cupom.getValidade());
            stmt.setBoolean(6, cupom.getAtivo());
            stmt.setBoolean(7, cupom.getPercentual());
            stmt.setDouble(8, cupom.getValor());
            stmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
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
            e.printStackTrace();
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
            e.printStackTrace();
            throw new DAOException(e, 200);
        }
    }

}
