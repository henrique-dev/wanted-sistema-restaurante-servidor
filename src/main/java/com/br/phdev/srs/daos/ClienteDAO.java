/*
 * Copyright (C) Paulo Henrique Goncalves Bacelar, Inc - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Paulo Henrique Gonacalves Bacelar <henrique.phgb@gmail.com>, Dezembro 2018
 */
package com.br.phdev.srs.daos;

import com.br.phdev.srs.exceptions.DAOException;
import com.br.phdev.srs.exceptions.DAOIncorrectData;
import com.br.phdev.srs.models.Cliente;
import com.br.phdev.srs.models.Complemento;
import com.br.phdev.srs.models.ComplementoFacil;
import com.br.phdev.srs.models.ConfirmaPedido;
import com.br.phdev.srs.models.Endereco;
import com.br.phdev.srs.models.FormaPagamento;
import com.br.phdev.srs.models.Foto;
import com.br.phdev.srs.models.Genero;
import com.br.phdev.srs.models.ListaItens;
import com.br.phdev.srs.models.Item;
import com.br.phdev.srs.models.ItemPedido;
import com.br.phdev.srs.models.ItemPedidoFacil;
import com.br.phdev.srs.models.Pedido;
import com.br.phdev.srs.models.Pedido2;
import com.br.phdev.srs.models.Tipo;
import com.br.phdev.srs.models.GrupoVariacao;
import com.br.phdev.srs.models.Ingrediente;
import com.br.phdev.srs.models.Variacao;
import com.br.phdev.srs.utils.ServicoArmazenamento;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 *
 * @author Paulo Henrique Gonçalves Bacelar <henrique.phgb@gmail.com>
 */
public class ClienteDAO extends BasicDAO {

    public ClienteDAO(Connection conexao) {
        super(conexao);
    }

    public void cadastrarTokenAlerta(Cliente cliente, String token) throws DAOException {
        if (cliente == null) {
            throw new DAOException("Erro", 300);
        }
        String sql = "UPDATE usuario SET usuario.token_websocket = ? WHERE usuario.id_usuario = "
                + " (SELECT cliente.id_usuario FROM cliente WHERE cliente.id_cliente = ?)";
        try (PreparedStatement stmt = super.conexao.prepareStatement(sql)) {
            stmt.setString(1, token);
            stmt.setLong(2, cliente.getId());
            stmt.execute();
        } catch (SQLException e) {
            throw new DAOException(e, 200);
        }
    }

    public void getCliente(Cliente cliente) throws DAOException {
        String sql = "SELECT nome, cpf, telefone, email"
                + " FROM cliente"
                + " WHERE cliente.id_cliente = ?";
        try (PreparedStatement stmt = super.conexao.prepareStatement(sql)) {
            stmt.setLong(1, cliente.getId());
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                cliente.setNome(rs.getString("nome"));
                cliente.setCpf(rs.getString("cpf"));
                cliente.setTelefone(rs.getString("telefone"));
                cliente.setEmail(rs.getString("email"));
                cliente.setEnderecos(getEnderecos(cliente));
            } else {
                cliente = null;
            }
        } catch (SQLException e) {
            throw new DAOException(e, 200);
        }
    }

    public ListaItens getItensFavoritos(Cliente cliente) throws DAOException {
        ListaItens listaItens = new ListaItens();
        String sql = "SELECT item.id_item, item.nome, item.preco, item.descricao, genero.id_genero, genero.nome genero, "
                + " item.modificavel, item.modificavel_ingrediente, item.tempo_preparo, tipo.id_tipo, tipo.nome tipo_nome "
                + " FROM itens_favoritos "
                + " LEFT JOIN item ON itens_favoritos.id_item = item.id_item "
                + " LEFT JOIN genero ON item.id_genero = genero.id_genero "
                + " LEFT JOIN item_tipo ON item.id_item = item_tipo.id_item "
                + " LEFT JOIN tipo ON item_tipo.id_tipo = tipo.id_tipo "
                + " WHERE itens_favoritos.id_cliente = ? "
                + " order by item.id_item, genero.nome, tipo.id_tipo";
        try (PreparedStatement stmt = super.conexao.prepareStatement(sql)) {
            stmt.setLong(1, cliente.getId());
            ResultSet rs = stmt.executeQuery();
            List<Item> itens = new ArrayList<>();
            Set<Tipo> tipos = new HashSet<>();
            Set<Genero> generos = new HashSet<>();
            List<Genero> generos2 = new ArrayList<>();
            Set<Foto> fotos = null;
            Item item = new Item();
            long pratoAtual = -1;
            while (rs.next()) {
                long idPrato = rs.getLong("id_item");
                if (idPrato != pratoAtual) {
                    if (pratoAtual != -1) {
                        item.setTipos(tipos);
                        sql = "SELECT arquivo.id_arquivo "
                                + " FROM arquivo "
                                + " LEFT JOIN item_arquivo ON arquivo.id_arquivo = item_arquivo.id_arquivo "
                                + " LEFT JOIN item ON item_arquivo.id_item = item.id_item "
                                + " WHERE item.id_item = ?";
                        try (PreparedStatement stmt2 = super.conexao.prepareStatement(sql)) {
                            stmt2.setLong(1, pratoAtual);
                            ResultSet rs2 = stmt2.executeQuery();
                            fotos = new HashSet<>();
                            while (rs2.next()) {
                                Foto foto = new Foto();
                                foto.setId(rs2.getLong("id_arquivo"));
                                fotos.add(ServicoArmazenamento.setTamanho(foto));
                            }
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }

                        item.setFotos(fotos);
                        itens.add(item);
                    }
                    pratoAtual = idPrato;
                    item = new Item();
                    tipos = new HashSet<>();
                    item.setId(rs.getLong("id_item"));
                    item.setNome(rs.getString("nome"));
                    item.setPreco(rs.getDouble("preco"));
                    item.setTempoPreparo(rs.getString("tempo_preparo"));
                    item.setModificavel(rs.getBoolean("modificavel"));
                    item.setModificavelIngrediente(rs.getBoolean("modificavel_ingrediente"));
                    Genero genero = new Genero(rs.getLong("id_genero"), rs.getString("genero"));
                    item.setGenero(genero);
                    generos.add(genero);
                }
                tipos.add(new Tipo(rs.getLong("id_tipo"), rs.getString("tipo_nome")));
            }
            if (pratoAtual != -1) {
                item.setTipos(tipos);
                // get_lista_arquivos
                sql = "SELECT arquivo.id_arquivo "
                        + " FROM arquivo "
                        + " LEFT JOIN item_arquivo ON arquivo.id_arquivo = item_arquivo.id_arquivo "
                        + " LEFT JOIN item ON item_arquivo.id_item = item.id_item "
                        + " WHERE item.id_item = ?";
                try (PreparedStatement stmt2 = super.conexao.prepareStatement(sql)) {
                    stmt2.setLong(1, pratoAtual);
                    ResultSet rs2 = stmt2.executeQuery();
                    fotos = new HashSet<>();
                    while (rs2.next()) {
                        Foto foto = new Foto();
                        foto.setId(rs2.getLong("id_arquivo"));
                        fotos.add(ServicoArmazenamento.setTamanho(foto));
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }

                item.setFotos(fotos);
                itens.add(item);
                listaItens = new ListaItens();
                generos2.add(new Genero(0, "Todos"));
                generos2.addAll(generos);
                listaItens.setGeneros(generos2);
                listaItens.setItens(itens);
            }
        } catch (SQLException e) {
            throw new DAOException("Erro ao recuperar informações", e, 200);
        }
        return listaItens;
    }

    public void cadastrarItemFavorito(Cliente cliente, Item item) throws DAOException {
        if (cliente == null || item == null) {
            throw new DAOIncorrectData(300);
        }
        if (item.getId() <= 0) {
            throw new DAOIncorrectData(300);
        }
        String sql = "SELECT item.id_item, "
                + " (SELECT id_cliente FROM itens_favoritos i_f WHERE i_f.id_item = ? AND i_f.id_cliente = ?) id_cliente FROM item "
                + " LEFT JOIN itens_favoritos ON item.id_item = itens_favoritos.id_item "
                + " WHERE item.id_item = ?";
        try (PreparedStatement stmt = super.conexao.prepareStatement(sql)) {
            stmt.setLong(1, item.getId());
            stmt.setLong(2, cliente.getId());
            stmt.setLong(3, item.getId());
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                if (rs.getString("id_cliente") == null) {
                    sql = "INSERT INTO itens_favoritos VALUES (?,?)";
                    try (PreparedStatement stmt2 = super.conexao.prepareStatement(sql)) {
                        stmt2.setLong(1, cliente.getId());
                        stmt2.setLong(2, item.getId());
                        stmt2.execute();
                    } catch (SQLException e) {
                        throw new DAOException(e, 200);
                    }
                }
            }
        } catch (SQLException e) {
            throw new DAOException(e, 200);
        }
    }

    public void removerItemFavorito(Cliente cliente, Item item) throws DAOException {
        if (cliente == null || item == null) {
            throw new DAOIncorrectData(300);
        }
        if (item.getId() <= 0) {
            throw new DAOIncorrectData(300);
        }
        String sql = "DELETE FROM itens_favoritos WHERE id_cliente = ? AND id_item = ?";
        try (PreparedStatement stmt = super.conexao.prepareStatement(sql)) {
            stmt.setLong(1, cliente.getId());
            stmt.setLong(2, item.getId());
            stmt.execute();
        } catch (SQLException e) {
            throw new DAOException(e, 200);
        }
    }

    public List<Genero> getGeneros() throws DAOException {
        List<Genero> generos = new ArrayList<>();
        String sql = "SELECT genero.id_genero, genero.nome, item.id_item, item.nome, item_arquivo.id_arquivo FROM item "
                + " RIGHT JOIN item_arquivo ON item.id_item = item_arquivo.id_item "
                + " LEFT JOIN genero ON item.id_genero = genero.id_genero "
                + " GROUP BY id_genero ORDER BY genero.nome";
        System.out.println(sql);
        try (PreparedStatement stmt = super.conexao.prepareStatement(sql)) {
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

    public ListaItens getItens(Cliente cliente, Genero genero, Integer pagina, String buscar) throws DAOException {
        ListaItens listaItens = new ListaItens();
        pagina--;
        if (pagina == null || pagina < 1) {
            pagina = 0;
        } else {
            pagina *= 10;
        }
        String sql = "SELECT item.id_item, item.nome, item.preco, item.descricao, genero.id_genero, genero.nome genero, "
                + " item.modificavel, item.modificavel_ingrediente, item.tempo_preparo, IF(itens_favoritos.id_item IS NULL, 0, 1) favorito "
                + " FROM item "
                + " LEFT JOIN genero ON item.id_genero = genero.id_genero "
                + " LEFT JOIN itens_favoritos ON itens_favoritos.id_item = item.id_item AND itens_favoritos.id_cliente = ? ";
        if (genero != null && genero.getId() > 0) {
            sql += " WHERE item.id_genero = ? ";
            if (buscar != null && !buscar.trim().equals("")) {
                sql += " AND item.nome LIKE ? ";
            }
        } else {
            if (buscar != null && !buscar.trim().equals("")) {
                sql += " WHERE item.nome LIKE ? ";
            }
        }
        sql += " order by item.id_item, genero.nome LIMIT ?, 10";
        try (PreparedStatement stmt = super.conexao.prepareStatement(sql)) {
            int index = 1;
            stmt.setLong(index++, cliente.getId());
            if (genero != null && genero.getId() > 0) {
                stmt.setLong(index++, genero.getId());
                if (buscar != null && !buscar.trim().equals("")) {
                    stmt.setString(index++, "%" + buscar + "%");
                }
                stmt.setInt(index++, pagina);
            } else {
                if (buscar != null && !buscar.trim().equals("")) {
                    stmt.setString(index++, "%" + buscar + "%");
                }
                stmt.setInt(index++, pagina);
            }
            ResultSet rs = stmt.executeQuery();
            System.out.println(rs.getStatement());
            List<Item> itens = new ArrayList<>();
            Set<Genero> generos = new HashSet<>();
            List<Genero> generos2 = new ArrayList<>();
            while (rs.next()) {
                Item item = new Item();
                item.setId(rs.getLong("id_item"));
                item.setNome(rs.getString("nome"));
                item.setPreco(rs.getDouble("preco"));
                item.setTempoPreparo(rs.getString("tempo_preparo"));
                item.setModificavel(rs.getBoolean("modificavel"));
                item.setModificavelIngrediente(rs.getBoolean("modificavel_ingrediente"));
                item.setFavorito(rs.getBoolean("favorito"));
                genero = new Genero(rs.getLong("id_genero"), rs.getString("genero"));
                item.setGenero(genero);
                generos.add(genero);

                sql = "SELECT arquivo.id_arquivo "
                        + " FROM arquivo "
                        + " LEFT JOIN item_arquivo ON arquivo.id_arquivo = item_arquivo.id_arquivo "
                        + " LEFT JOIN item ON item_arquivo.id_item = item.id_item "
                        + " WHERE item.id_item = ?";
                try (PreparedStatement stmt2 = super.conexao.prepareStatement(sql)) {
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
                try (PreparedStatement stmt2 = super.conexao.prepareStatement(sql)) {
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
            listaItens = new ListaItens();
            generos2.add(new Genero(0, "Todos"));
            generos2.addAll(generos);
            listaItens.setGeneros(generos2);
            listaItens.setItens(itens);
        } catch (SQLException e) {
            throw new DAOException("Erro ao recuperar informações", e, 200);
        }
        return listaItens;
    }

    public Item getItem(Item item, Cliente cliente) throws DAOException {
        if (item == null) {
            throw new DAOIncorrectData(300);
        }
        if (item.getId() == 0) {
            throw new DAOIncorrectData(301);
        }
        // get_item
        String sql = "SELECT item.id_item, item.nome, item.preco, item.descricao, genero.id_genero, genero.nome genero, "
                + " item.modificavel, item.modificavel_ingrediente, item.tempo_preparo, IF(itens_favoritos.id_item IS NULL, 0, 1) favorito "
                + " FROM item "
                + " LEFT JOIN genero ON item.id_genero = genero.id_genero "
                + " LEFT JOIN itens_favoritos ON itens_favoritos.id_item = item.id_item AND itens_favoritos.id_cliente = ? "
                + " WHERE item.id_item = ? ";
        try (PreparedStatement stmt = super.conexao.prepareStatement(sql)) {
            stmt.setLong(1, cliente.getId());
            stmt.setLong(2, item.getId());
            ResultSet rs = stmt.executeQuery();
            Set<Ingrediente> ingredientes = new HashSet<>();
            Set<Complemento> complementos = new HashSet<>();
            List<GrupoVariacao> variacoes = new ArrayList<>();
            long itemAtual = -1;
            while (rs.next()) {
                item.setId(rs.getLong("id_item"));
                item.setNome(rs.getString("nome"));
                item.setPreco(rs.getDouble("preco"));
                item.setTempoPreparo(rs.getString("tempo_preparo"));
                item.setModificavel(rs.getBoolean("modificavel"));
                item.setModificavelIngrediente(rs.getBoolean("modificavel_ingrediente"));
                item.setFavorito(rs.getBoolean("favorito"));
                item.setGenero(new Genero(rs.getLong("id_genero"), rs.getString("genero")));

                sql = "SELECT arquivo.id_arquivo "
                        + " FROM arquivo "
                        + " LEFT JOIN item_arquivo ON arquivo.id_arquivo = item_arquivo.id_arquivo "
                        + " LEFT JOIN item ON item_arquivo.id_item = item.id_item "
                        + " WHERE item.id_item = ?";
                try (PreparedStatement stmt2 = super.conexao.prepareStatement(sql)) {
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
                try (PreparedStatement stmt2 = super.conexao.prepareStatement(sql)) {
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
                    try (PreparedStatement stmt2 = super.conexao.prepareStatement(sql)) {
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
                    try (PreparedStatement stmt2 = super.conexao.prepareStatement(sql)) {
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
                try (PreparedStatement stmt2 = super.conexao.prepareStatement(sql)) {
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

    public List<Endereco> getEnderecos(Cliente cliente) throws DAOException {
        if (cliente == null) {
            throw new DAOIncorrectData(300);
        }
        if (cliente.getId() == 0) {
            throw new DAOIncorrectData(301);
        }
        List<Endereco> enderecos = null;
        // get_lista_enderecos
        String sql = "SELECT id_endereco, logradouro, bairro, complemento, numero, cidade, cep, descricao, favorito "
                + " FROM endereco WHERE endereco.id_cliente = ? AND endereco.id_endereco = 0";
        try (PreparedStatement stmt = super.conexao.prepareStatement(sql)) {
            stmt.setLong(1, cliente.getId());
            ResultSet rs = stmt.executeQuery();
            enderecos = new ArrayList<>();
            while (rs.next()) {
                Endereco endereco = new Endereco();
                endereco.setId(rs.getLong("id_endereco"));
                endereco.setLogradouro(rs.getString("logradouro"));
                endereco.setNumero(rs.getString("numero"));
                endereco.setBairro(rs.getString("bairro"));
                endereco.setCidade(rs.getString("cidade"));
                endereco.setComplemento(rs.getString("complemento"));
                endereco.setCep(rs.getString("cep"));
                endereco.setDescricao(rs.getString("descricao"));
                endereco.setFavorito(rs.getBoolean("favorito"));
                enderecos.add(endereco);
            }
        } catch (SQLException e) {
            throw new DAOException("Erro ao recuperar informações", e, 200);
        }
        return enderecos;
    }

    public Endereco getEndereco(Endereco endereco, Cliente cliente) throws DAOIncorrectData, DAOException {
        if (cliente == null) {
            throw new DAOIncorrectData(300);
        }
        if (cliente.getId() == 0) {
            throw new DAOIncorrectData(301);
        }
        Endereco enderecoRetorno = null;
        String sql = "SELECT id_endereco, logradouro, bairro, complemento, numero, cidade, cep, descricao, favorito "
                + " FROM endereco WHERE endereco.id_cliente = ? AND endereco.id_endereco = ?";
        // get_endereco
        try (PreparedStatement stmt = super.conexao.prepareStatement(sql)) {
            stmt.setLong(1, cliente.getId());
            stmt.setLong(2, endereco.getId());
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                enderecoRetorno = new Endereco();
                enderecoRetorno.setId(rs.getLong("id_endereco"));
                enderecoRetorno.setLogradouro(rs.getString("logradouro"));
                enderecoRetorno.setNumero(rs.getString("numero"));
                enderecoRetorno.setBairro(rs.getString("bairro"));
                enderecoRetorno.setCidade(rs.getString("cidade"));
                enderecoRetorno.setComplemento(rs.getString("complemento"));
                enderecoRetorno.setCep(rs.getString("cep"));
                enderecoRetorno.setDescricao(rs.getString("descricao"));
                enderecoRetorno.setFavorito(rs.getBoolean("favorito"));
            }
        } catch (SQLException e) {
            throw new DAOException("Erro ao recuperar informações", e, 200);
        }
        return endereco;
    }

    public List<FormaPagamento> getFormasPagamento(Cliente cliente) throws DAOException {
        if (cliente == null) {
            throw new DAOIncorrectData(300);
        }
        if (cliente.getId() == 0) {
            throw new DAOIncorrectData(301);
        }
        List<FormaPagamento> formaPagamentos = null;
        String sql = "SELECT id_formapagamento, descricao FROM formapagamento";
        // get_lista_formaspagamento
        try (PreparedStatement stmt = super.conexao.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            formaPagamentos = new ArrayList<>();
            while (rs.next()) {
                FormaPagamento formaPagamento = new FormaPagamento();
                formaPagamento.setId(rs.getLong("id_formapagamento"));
                formaPagamento.setDescricao(rs.getString("descricao"));
                formaPagamentos.add(formaPagamento);
            }
        } catch (SQLException e) {
            throw new DAOException("Erro ao recuperar informações", e, 200);
        }
        return formaPagamentos;
    }

    public Foto getPublicFile(int idArquivo) throws DAOException {
        if (idArquivo == 0) {
            throw new DAOIncorrectData(301);
        }
        Foto foto = null;
        String sql = "SELECT arquivo.caminho FROM arquivo WHERE arquivo.id_arquivo = ?";
        // get_arquivo
        try (PreparedStatement stmt = super.conexao.prepareStatement(sql)) {
            stmt.setInt(1, idArquivo);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                foto = new Foto();
                foto.setId(idArquivo);
            }
        } catch (SQLException e) {
            throw new DAOException("Falha ao adquirir informações do arquivo", e, 200);
        }
        return foto;
    }

    public ConfirmaPedido inserirPrecos(ConfirmaPedido confirmaPedido) throws DAOException, DAOIncorrectData {
        if (confirmaPedido.getItens() == null) {
            throw new DAOIncorrectData(300);
        }
        if (confirmaPedido.getItens().isEmpty()) {
            throw new DAOIncorrectData(301);
        }
        RepositorioProdutos repositorioPrecos = RepositorioProdutos.getInstancia();
        repositorioPrecos.carregar(super.conexao);
        BigDecimal valorTotal = new BigDecimal("0.00");
        for (ItemPedido ip : confirmaPedido.getItens()) {
            repositorioPrecos.preencherItem(ip);
            BigDecimal valorItem = new BigDecimal("0.00");
            if (ip.getComplementos() != null) {
                for (Complemento c : ip.getComplementos()) {
                    repositorioPrecos.preencherComplemento(c);
                    valorItem = valorItem.add(new BigDecimal(String.valueOf(c.getPreco())));
                }
            }
            if (ip.getVariacoes() != null) {
                List<GrupoVariacao> variacoes = ip.getVariacoes();
                repositorioPrecos.checarVariacoes(variacoes, ip);
                for (GrupoVariacao gv : variacoes) {
                    if (gv.getVariacoes() != null) {
                        for (Variacao v : gv.getVariacoes()) {
                            repositorioPrecos.preecherVariacao(v);
                            valorItem = valorItem.add(new BigDecimal(String.valueOf(v.getPreco())));
                        }
                    }
                }
            }
            valorItem = valorItem.add(new BigDecimal(String.valueOf(ip.getPreco())));
            valorTotal = valorTotal.add(valorItem.multiply(new BigDecimal(ip.getQuantidade())));
        }
        confirmaPedido.setPrecoTotal(valorTotal.doubleValue());
        return confirmaPedido;
    }

    public List<ItemPedido> recuperarPrePredido(Cliente cliente) throws DAOException {
        List<ItemPedido> itens = null;
        // recuperar_pre_pedido
        try (PreparedStatement stmt = super.conexao.prepareStatement("SELECT itens, precototal FROM pre_pedido WHERE id_cliente = ?")) {
            stmt.setLong(1, cliente.getId());
            ResultSet rs = stmt.executeQuery();
            List<ItemPedidoFacil> itemPedidos = new ArrayList<>();
            if (rs.next()) {
                ObjectMapper mapeador = new ObjectMapper();
                itemPedidos = mapeador.readValue(rs.getString("itens"),
                        new TypeReference<List<ItemPedidoFacil>>() {
                });
            }
            if (!itemPedidos.isEmpty()) {
                RepositorioProdutos.getInstancia().carregar(super.conexao);
                itens = new ArrayList<>();
                for (ItemPedidoFacil ipf : itemPedidos) {
                    ItemPedido ip = new ItemPedido();
                    ip.setId(ipf.getId());
                    ip.setQuantidade(ipf.getQuantidade());
                    ip.setPreco(ipf.getPreco());
                    ip.setVariacoes(ipf.getVariacoes());
                    ip.setIngredientes(ipf.getIngredientes());
                    Set<Complemento> complementos = new HashSet<>();
                    for (ComplementoFacil cf : ipf.getComplementos()) {
                        Complemento complemento = new Complemento();
                        complemento.setId(cf.getId());
                        complemento.setNome(cf.getNome());
                        complemento.setPreco(cf.getPreco());
                        complemento.setCheck(true);
                        complementos.add(complemento);
                    }
                    ip.setComplementos(complementos);
                    RepositorioProdutos.getInstancia().preencherItem(ip);
                    itens.add(ip);
                }
            }
        } catch (SQLException | IOException e) {
            throw new DAOException(e, 200);
        }
        return itens;
    }

    public boolean possuiPrePredido(Cliente cliente) throws DAOException {
        String sql = "SELECT id_pre_pedido FROM pre_pedido WHERE id_cliente = ?";
        // existe_pre_pedido
        try (PreparedStatement stmt = super.conexao.prepareStatement(sql)) {
            stmt.setLong(1, cliente.getId());
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            throw new DAOException(e, 200);
        }
        return false;
    }

    public void removerPrepedido(Cliente cliente) throws DAOException {
        try {
            // invalidar_pre_pedido
            String sql = "SELECT id_pre_pedido FROM pre_pedido WHERE id_cliente = ?";
            PreparedStatement stmt = super.conexao.prepareStatement(sql);
            stmt.setLong(1, cliente.getId());
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                long idPrePedido = rs.getLong("id_pre_pedido");
                stmt.close();
                sql = "DELETE FROM pre_pedido WHERE id_pre_pedido = ?";
                stmt = super.conexao.prepareStatement(sql);
                stmt.setLong(1, idPrePedido);
                stmt.execute();
            }
        } catch (SQLException e) {
            throw new DAOException(e, 200);
        }
    }

    public List<ItemPedido> refazerPedido(Cliente cliente, Pedido pedido) throws DAOException {
        List<ItemPedido> itens = null;
        // recuperar_itens_pedido
        String sql = "SELECT itens, precototal FROM pedido WHERE id_cliente = ? AND id_pedido = ?";
        try (PreparedStatement stmt = super.conexao.prepareStatement(sql)) {
            stmt.setLong(1, cliente.getId());
            stmt.setLong(2, pedido.getId());
            ResultSet rs = stmt.executeQuery();
            List<ItemPedidoFacil> itemPedidos = new ArrayList<>();
            if (rs.next()) {
                ObjectMapper mapeador = new ObjectMapper();
                itemPedidos = mapeador.readValue(rs.getString("itens"),
                        new TypeReference<List<ItemPedidoFacil>>() {
                });
            }
            if (!itemPedidos.isEmpty()) {
                RepositorioProdutos.getInstancia().carregar(super.conexao);
                itens = new ArrayList<>();
                for (ItemPedidoFacil ipf : itemPedidos) {
                    ItemPedido ip = new ItemPedido();
                    ip.setId(ipf.getId());
                    ip.setQuantidade(ipf.getQuantidade());
                    ip.setPreco(ipf.getPreco());
                    ip.setVariacoes(ipf.getVariacoes());
                    ip.setIngredientes(ipf.getIngredientes());
                    Set<Complemento> complementos = new HashSet<>();
                    for (ComplementoFacil cf : ipf.getComplementos()) {
                        Complemento complemento = new Complemento();
                        complemento.setId(cf.getId());
                        complemento.setNome(cf.getNome());
                        complemento.setPreco(cf.getPreco());
                        complemento.setCheck(true);
                        complementos.add(complemento);
                    }
                    ip.setComplementos(complementos);
                    RepositorioProdutos.getInstancia().preencherItem(ip);
                    itens.add(ip);
                }
            }
        } catch (SQLException | IOException e) {
            throw new DAOException(e, 200);
        }
        return itens;
    }

    synchronized public boolean inserirPrePedido(Pedido pedido, Cliente cliente, String token) throws DAOException {
        if (pedido == null || cliente == null) {
            throw new DAOIncorrectData(300);
        }
        // inserir_pre_pedido
        try {
            String sql = "SELECT pre_pedido.id_cliente FROM pre_pedido WHERE pre_pedido.id_cliente = ?";
            PreparedStatement stmt = super.conexao.prepareStatement(sql);
            stmt.setLong(1, cliente.getId());
            ResultSet rs = stmt.executeQuery();
            if (!rs.next()) {
                stmt.close();
                sql = "INSERT INTO pre_pedido values (default, now(), ?, ?, ?, ?, ?, ?, ?)";
                stmt = super.conexao.prepareStatement(sql);
                ObjectMapper objectMapper = new ObjectMapper();
                String json = objectMapper.writeValueAsString(pedido.getItens());
                stmt.setString(1, json);
                stmt.setDouble(2, pedido.getPrecoTotal());
                stmt.setLong(3, pedido.getFormaPagamento().getId());
                stmt.setLong(4, cliente.getId());
                stmt.setLong(5, pedido.getEndereco().getId());
                stmt.setString(6, token);
                stmt.setString(7, pedido.getObservacaoEntrega());
                stmt.execute();
                return true;
            }
        } catch (SQLException e) {
            throw new DAOException(e, 200);
        } catch (JsonProcessingException e) {
            throw new DAOException(e, 307);
        }
        return false;
    }

    synchronized public void inserirPedido(Pedido pedido, Cliente cliente) throws DAOException {
        if (pedido == null || cliente == null) {
            throw new DAOIncorrectData(300);
        }
        String sql = "INSERT INTO pedido VALUES (default, now(), ?, ?, ?, ?, ?, true, 1, ?)";
        // inserir_pedido
        try (PreparedStatement stmt = super.conexao.prepareStatement(sql)) {
            ObjectMapper objectMapper = new ObjectMapper();
            String json = objectMapper.writeValueAsString(pedido.getItens());
            stmt.setString(1, json);
            stmt.setDouble(2, pedido.getPrecoTotal());
            stmt.setLong(3, pedido.getFormaPagamento().getId());
            stmt.setLong(4, cliente.getId());
            stmt.setLong(5, pedido.getEndereco().getId());
            stmt.setString(6, pedido.getObservacaoEntrega());
            stmt.execute();
        } catch (SQLException e) {
            throw new DAOException(e, 200);
        } catch (JsonProcessingException e) {
            throw new DAOException(e, 307);
        }
    }

    synchronized public boolean atualizarTokenPrePedido(String idPagamento, String idComprador) throws DAOException {
        if (idPagamento == null) {
            throw new DAOIncorrectData(300);
        }
        // atualizar_tokem_pre_pedido        
        try {
            String sql = "SELECT id_pre_pedido FROM pre_pedido WHERE pre_pedido.token = ?";
            PreparedStatement stmt = super.conexao.prepareStatement(sql);
            stmt.setString(1, idPagamento);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                long idPrePedido = rs.getLong("id_pre_pedido");
                stmt.close();
                sql = "UPDATE pre_pedido SET token = ? WHERE id_pre_pedido = ?";
                stmt = super.conexao.prepareStatement(sql);
                stmt.setString(1, idComprador);
                stmt.setLong(2, idPrePedido);
                stmt.execute();
            }

        } catch (SQLException e) {
            throw new DAOException(e, 200);
        }
        return false;
    }

    public String recuperarSessaoClienteParaConfirmarCompra(String idComprador) throws DAOException {
        // utils_recuperar_sessao_cliente_pra_pagamento
        String sql = "SELECT usuario.token_websocket FROM usuario "
                + " LEFT JOIN cliente ON usuario.id_usuario = cliente.id_usuario "
                + " LEFT JOIN pre_pedido ON cliente.id_cliente = pre_pedido.id_cliente "
                + " WHERE pre_pedido.token = ?";
        try (PreparedStatement stmt = super.conexao.prepareStatement(sql)) {
            stmt.setString(1, idComprador);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getString("token_websocket");
            }
        } catch (SQLException e) {
            throw new DAOException(e, 200);
        }
        return null;
    }

    synchronized public void inserirPedidoDePrePedido(String idPagamento) throws DAOException {
        if (idPagamento == null) {
            throw new DAOIncorrectData(300);
        }
        // inserir_pedido_de_pre_pedido
        try {
            String sql = "SELECT pre_pedido.id_cliente, pre_pedido.id_pre_pedido FROM pre_pedido WHERE pre_pedido.token = ?";
            PreparedStatement stmt = super.conexao.prepareStatement(sql);
            stmt.setString(1, idPagamento);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                long idCliente = rs.getLong("id_cliente");
                long idPrePedido = rs.getLong("id_pre_pedido");
                stmt.close();
                sql = "INSERT INTO pedido (data, itens, precototal, id_formapagamento, id_cliente, id_endereco, pagamentoefetuado, estado, observacao_entrega) "
                        + " (SELECT datapedido, itens, precototal, id_formapagamento, id_cliente, id_endereco, true, 1, observacao_entrega "
                        + " FROM pre_pedido WHERE pre_pedido.id_cliente = ?)";
                stmt = super.conexao.prepareStatement(sql);
                stmt.setLong(1, idCliente);
                stmt.execute();
                // remover_pre_pedido
                stmt.close();
                sql = "DELETE FROM pre_pedido WHERE id_pre_pedido = ?";
                stmt = super.conexao.prepareStatement(sql);
                stmt.setLong(1, idPrePedido);
                stmt.execute();
            }
            stmt.execute();
        } catch (SQLException e) {
            throw new DAOException(e, 200);
        }
    }

    public List<Pedido2> getPedidos(Cliente cliente, Integer pagina) throws DAOException, IOException {
        List<Pedido2> pedidos = null;
        pagina--;
        if (pagina == null || pagina < 1) {
            pagina = 0;
        } else {
            pagina *= 10;
        }
        String sql = "SELECT pedido.id_pedido, pedido.itens, pedido.data, pedido.precototal, pedido.id_endereco, pedido.estado, "
                + " formapagamento.descricao formapagamento_descricao, endereco.descricao endereco_descricao "
                + " FROM pedido "
                + " LEFT JOIN formapagamento ON pedido.id_formapagamento = formapagamento.id_formapagamento "
                + " LEFT JOIN endereco ON pedido.id_endereco = endereco.id_endereco "
                + " WHERE pedido.id_cliente = ? "
                + " ORDER BY pedido.data DESC LIMIT ?, 10";
        try (PreparedStatement stmt = super.conexao.prepareStatement(sql)) {
            stmt.setLong(1, cliente.getId());
            stmt.setInt(2, pagina);
            ResultSet rs = stmt.executeQuery();
            pedidos = new ArrayList<>();
            while (rs.next()) {
                Pedido2 pedido = new Pedido2();
                pedido.setId(rs.getLong("id_pedido"));
                String time = new SimpleDateFormat("dd/MM/YYYY - HH:mm").format(new Date(((Timestamp) rs.getObject("data", Timestamp.class)).getTime()));
                pedido.setData(time);
                pedido.setPrecoTotal(rs.getDouble("precototal"));
                pedido.setFormaPagamento(new FormaPagamento(0, rs.getString("formapagamento_descricao")));
                Endereco endereco = new Endereco();
                endereco.setId(rs.getObject("id_endereco") != null ? rs.getLong("id_endereco") : -1);
                endereco.setDescricao(rs.getString("endereco_descricao"));
                pedido.setEndereco(endereco);
                switch (rs.getInt("estado")) {
                    case 1:
                        pedido.setStatus("Conferido");
                        break;
                    case 2:
                        pedido.setStatus("Em produção");
                        break;
                    case 3:
                        pedido.setStatus("Saiu pra entrega");
                        break;
                    case 4:
                        pedido.setStatus("Entregue");
                        break;
                }
                ObjectMapper mapeador = new ObjectMapper();
                List<ItemPedidoFacil> itens = mapeador.readValue(rs.getString("itens"), new TypeReference<List<ItemPedidoFacil>>() {
                });
                pedido.setItens(itens);
                pedidos.add(pedido);
            }
        } catch (SQLException e) {
            throw new DAOException(e, 200);
        }
        return pedidos;
    }

    public void getPedido(Pedido2 pedido, Cliente cliente) throws DAOException, IOException {
        String sql = "SELECT pedido.datapedido, pedido.itens, pedido.precototal, pedido.estado, pedido.observacao_entrega, "
                + " formapagamento.descricao formapagamento_descricao, endereco.descricao endereco_descricao "
                + " FROM pedido "
                + " LEFT JOIN formapagamento ON pedido.id_formapagamento = formapagamento.id_formapagamento "
                + " LEFT JOIN endereco ON pedido.id_endereco = endereco.id_endereco "
                + " WHERE pedido.id_cliente = ?AND pedido.id_pedido = ?";
        try (PreparedStatement stmt = super.conexao.prepareStatement(sql)) {
            stmt.setLong(1, cliente.getId());
            stmt.setLong(2, pedido.getId());
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                String time = new SimpleDateFormat("dd/MM/YYYY - HH:mm").format(new Date(((Timestamp) rs.getObject("datapedido", Timestamp.class)).getTime()));
                pedido.setData(time);
                pedido.setPrecoTotal(rs.getDouble("precototal"));
                pedido.setFormaPagamento(new FormaPagamento(0, rs.getString("formapagamento_descricao")));
                pedido.setObservacaoEntrega(rs.getString("observacao_entrega"));
                switch (rs.getInt("estado")) {
                    case 1:
                        pedido.setStatus("Conferido");
                        break;
                    case 2:
                        pedido.setStatus("Em produção");
                        break;
                    case 3:
                        pedido.setStatus("Saiu pra entrega");
                        break;
                    case 4:
                        pedido.setStatus("Entregue");
                        break;
                }
                Endereco endereco = new Endereco();
                endereco.setId(-1);
                endereco.setDescricao(rs.getString("endereco_descricao"));
                pedido.setEndereco(endereco);

                ObjectMapper mapeador = new ObjectMapper();
                List<ItemPedidoFacil> itens = mapeador.readValue(rs.getString("itens"), new TypeReference<List<ItemPedidoFacil>>() {
                });
                pedido.setItens(itens);
            }
        } catch (SQLException e) {
            throw new DAOException(e, 200);
        }
    }

    public void cadastrarEndereco(Cliente cliente, Endereco endereco) throws DAOException {
        if (cliente == null || endereco == null) {
            throw new DAOIncorrectData(300);
        }
        if (endereco.getLogradouro() == null || endereco.getBairro() == null || endereco.getCep() == null
                || endereco.getCidade() == null || endereco.getComplemento() == null || endereco.getDescricao() == null
                || endereco.getNumero() == null) {
            throw new DAOIncorrectData(300);
        }
        if (endereco.getLogradouro().isEmpty() || endereco.getBairro().isEmpty() || endereco.getDescricao().isEmpty()
                || endereco.getNumero().isEmpty() || endereco.getCep().isEmpty() || endereco.getCidade().isEmpty()) {
            throw new DAOIncorrectData(301);
        }
        String sql = "INSERT INTO endereco VALUES (default, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = super.conexao.prepareStatement(sql)) {
            stmt.setLong(1, cliente.getId());
            stmt.setString(2, endereco.getLogradouro());
            stmt.setString(3, endereco.getBairro());
            stmt.setString(4, endereco.getComplemento());
            stmt.setString(5, endereco.getNumero());
            stmt.setString(6, endereco.getCidade());
            stmt.setString(7, endereco.getCep());
            stmt.setString(8, endereco.getDescricao());
            stmt.setBoolean(9, false);
            stmt.execute();
        } catch (SQLException e) {
            throw new DAOException(e, 200);
        }
    }

    public void removerEndereco(Cliente cliente, Endereco endereco) throws DAOException {
        if (cliente == null || endereco == null) {
            throw new DAOIncorrectData(300);
        }
        if (endereco.getId() <= 0) {
            throw new DAOIncorrectData(300);
        }
        String sql = "SELECT COUNT(id_endereco) FROM endereco WHERE endereco.id_endereco = idendereco AND endereco.id_cliente = ?";
        try (PreparedStatement stmt = super.conexao.prepareStatement(sql)) {
            stmt.setLong(1, cliente.getId());
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                sql = "UPDATE pedido SET id_endereco = null WHERE pedido.id_endereco = ?";
                try (PreparedStatement stmt2 = super.conexao.prepareStatement(sql)) {
                    stmt2.setLong(1, endereco.getId());
                    stmt2.execute();
                }
                sql = "DELETE FROM endereco WHERE id_endereco = ?";
                try (PreparedStatement stmt2 = super.conexao.prepareStatement(sql)) {
                    stmt2.setLong(1, endereco.getId());
                    stmt2.execute();
                }
            }
        } catch (SQLException e) {
            throw new DAOException(e, 200);
        }
    }

    public void favoritarEndereco(Cliente cliente, Endereco endereco) throws DAOIncorrectData, DAOException {
        if (cliente == null || endereco == null) {
            throw new DAOIncorrectData(300);
        }
        if (endereco.getId() <= 0) {
            throw new DAOIncorrectData(300);
        }
        String sql = "UPDATE endereco SET favorito = false WHERE id_cliente = ?";
        try (PreparedStatement stmt = super.conexao.prepareStatement(sql)) {
            stmt.setLong(1, cliente.getId());
            stmt.execute();
        } catch (SQLException e) {
            throw new DAOException(e, 200);
        }

        sql = "UPDATE endereco SET favorito = true WHERE id_cliente = ? AND id_endereco = ?";
        try (PreparedStatement stmt = super.conexao.prepareStatement(sql)) {
            stmt.setLong(1, cliente.getId());
            stmt.setLong(2, endereco.getId());
            stmt.execute();
        } catch (SQLException e) {
            throw new DAOException(e, 200);
        }
    }

}
