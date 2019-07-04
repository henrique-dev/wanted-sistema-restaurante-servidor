/*
 * Copyright (C) Paulo Henrique Goncalves Bacelar, Inc - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Paulo Henrique Gonacalves Bacelar <henrique.phgb@gmail.com>, Dezembro 2018
 */
package com.br.phdev.srs.daos;

import com.br.phdev.srs.exceptions.DAOException;
import com.br.phdev.srs.models.Complemento;
import com.br.phdev.srs.models.Foto;
import com.br.phdev.srs.models.Genero;
import com.br.phdev.srs.models.GrupoVariacao;
import com.br.phdev.srs.models.Ingrediente;
import com.br.phdev.srs.models.Item;
import com.br.phdev.srs.models.ListaItens;
import com.br.phdev.srs.models.Tipo;
import com.br.phdev.srs.models.Variacao;
import com.br.phdev.srs.utils.ServicoArmazenamento;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 *
 * @author Paulo Henrique Gonçalves Bacelar <henrique.phgb@gmail.com>
 */
public class GerenciadorDAO extends BasicDAO {

    public GerenciadorDAO(Connection conexao) {
        super(conexao);
    }

    public List<Genero> getGeneros() throws DAOException {
        List<Genero> generos = null;
        String sql = "CALL gerenciador_get_lista_generos";
        try (PreparedStatement stmt = super.conexao.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            generos = new ArrayList<>();
            while (rs.next()) {
                Genero genero = new Genero();
                genero.setId(rs.getLong("id_genero"));
                genero.setNome(rs.getString("nome"));
                generos.add(genero);
            }
        } catch (SQLException e) {
            throw new DAOException(e, 200);
        }
        return generos;
    }

    public void adicionarGeneros(List<Genero> generos) throws DAOException {
        String sql = "CALL gerenciador_inserir_genero(?)";
        for (Genero genero : generos) {
            try (PreparedStatement stmt = super.conexao.prepareStatement(sql)) {
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
            try (PreparedStatement stmt = super.conexao.prepareStatement(sql)) {
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

    public List<Tipo> getTipos() throws DAOException {
        List<Tipo> tipos = null;
        String sql = "CALL gerenciador_get_lista_tipos";
        try (PreparedStatement stmt = super.conexao.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            tipos = new ArrayList<>();
            while (rs.next()) {
                Tipo tipo = new Tipo();
                tipo.setId(rs.getLong("id_tipo"));
                tipo.setNome(rs.getString("nome"));
                tipos.add(tipo);
            }
        } catch (SQLException e) {
            throw new DAOException(e, 200);
        }
        return tipos;
    }

    public void adicionarTipos(List<Tipo> tipos) throws DAOException {
        String sql = "CALL gerenciador_inserir_tipo(?)";
        for (Tipo tipo : tipos) {
            try (PreparedStatement stmt = super.conexao.prepareStatement(sql)) {
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
            try (PreparedStatement stmt = super.conexao.prepareStatement(sql)) {
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

    public List<Complemento> getComplementos() throws DAOException {
        List<Complemento> complementos = null;
        String sql = "CALL gerenciador_get_lista_complementos";
        try (PreparedStatement stmt = super.conexao.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            complementos = new ArrayList<>();
            while (rs.next()) {
                Complemento complemento = new Complemento();
                complemento.setId(rs.getLong("id_complemento"));
                complemento.setNome(rs.getString("nome"));
                complemento.setPreco(rs.getDouble("preco"));
                Foto foto = new Foto();
                foto.setId(rs.getLong("id_arquivo"));
                complemento.setFoto(ServicoArmazenamento.setTamanho(foto));
                complementos.add(complemento);
            }
        } catch (SQLException e) {
            throw new DAOException(e, 200);
        }
        return complementos;
    }

    public void adicionarComplemento(Complemento complemento) throws DAOException {
        String sql = "CALL gerenciador_inserir_complemento(?,?,?)";
        try (PreparedStatement stmt = super.conexao.prepareStatement(sql.toString())) {
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
                PreparedStatement stmt = super.conexao.prepareStatement(sql);
                stmt.setLong(1, complemento.getFoto().getId());
                stmt.execute();
                stmt.close();
                sql = "CALL gerenciador_remover_arquivo(?)";
                stmt = super.conexao.prepareStatement(sql);
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

    public List<Ingrediente> getIngredientes() throws DAOException {
        List<Ingrediente> ingredientes = null;
        String sql = "CALL gerenciador_get_lista_ingredientes";
        try (PreparedStatement stmt = super.conexao.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            ingredientes = new ArrayList<>();
            while (rs.next()) {
                Ingrediente ingrediente = new Ingrediente();
                ingrediente.setId(rs.getLong("id_ingrediente"));
                ingrediente.setNome(rs.getString("nome"));
                ingredientes.add(ingrediente);
            }
        } catch (SQLException e) {
            throw new DAOException(e, 200);
        }
        return ingredientes;
    }

    public void adicionarIngrediente(List<Ingrediente> ingredientes) throws DAOException {
        String sql = "CALL gerenciador_inserir_ingrediente(?)";
        for (Ingrediente ingrediente : ingredientes) {
            try (PreparedStatement stmt = super.conexao.prepareStatement(sql)) {
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
            try (PreparedStatement stmt = super.conexao.prepareStatement(sql)) {
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

    public List<Item> getItens() throws DAOException {
        List<Item> itens = null;
        try (PreparedStatement stmt = super.conexao.prepareStatement("CALL gerenciador_get_lista_itens")) {
            ResultSet rs = stmt.executeQuery();
            itens = new ArrayList<>();
            Set<Tipo> tipos = new HashSet<>();
            Set<Foto> fotos = null;
            Set<Complemento> complementos = null;
            Item item = new Item();
            long pratoAtual = -1;
            while (rs.next()) {
                long idPrato = rs.getLong("id_item");
                if (idPrato != pratoAtual) {
                    if (pratoAtual != -1) {
                        item.setTipos(tipos);

                        try (PreparedStatement stmt2 = super.conexao.prepareStatement("CALL gerenciador_get_lista_arquivos(?)")) {
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

                        try (PreparedStatement stmt2 = super.conexao.prepareStatement("CALL gerenciador_get_lista_complementos_item(?)")) {
                            stmt2.setLong(1, idPrato);
                            ResultSet rs2 = stmt2.executeQuery();
                            complementos = new HashSet<>();
                            while (rs2.next()) {
                                complementos.add(new Complemento(
                                        rs2.getLong("id_complemento"),
                                        rs2.getString("nome"),
                                        0,
                                        null));
                            }
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                        item.setComplementos(complementos);
                        item.setFotos(fotos);
                        itens.add(item);
                    }
                    pratoAtual = idPrato;
                    item = new Item();
                    tipos = new HashSet<>();
                    fotos = new HashSet<>();
                    item.setId(rs.getLong("id_item"));
                    item.setNome(rs.getString("nome"));
                    item.setPreco(rs.getDouble("preco"));
                    item.setDescricao(rs.getString("descricao"));
                    item.setModificavel(rs.getBoolean("modificavel"));
                    Genero genero = new Genero(rs.getLong("id_genero"), rs.getString("genero"));
                    item.setGenero(genero);
                }
                tipos.add(new Tipo(rs.getLong("id_tipo"), rs.getString("tipo_nome")));
            }
            if (pratoAtual != -1) {
                item.setTipos(tipos);

                try (PreparedStatement stmt2 = super.conexao.prepareStatement("CALL gerenciador_get_lista_arquivos(?)")) {
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
                try (PreparedStatement stmt2 = super.conexao.prepareStatement("CALL gerenciador_get_lista_complementos_item(?)")) {
                    stmt2.setLong(1, item.getId());
                    ResultSet rs2 = stmt2.executeQuery();
                    complementos = new HashSet<>();
                    while (rs2.next()) {
                        complementos.add(new Complemento(
                                rs2.getLong("id_complemento"),
                                rs2.getString("nome"),
                                0,
                                null));
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                item.setComplementos(complementos);
                item.setFotos(fotos);

                itens.add(item);
            }
        } catch (SQLException e) {
            throw new DAOException("Erro ao recuperar informações", e, 200);
        }
        return itens;
    }

    public void adicionarItem(Item item) throws DAOException {
        try (PreparedStatement stmt = super.conexao.prepareStatement("CALL gerenciador_inserir_item(?,?,?,?,?,?)")) {
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
                    try (PreparedStatement stmt2 = super.conexao.prepareStatement("CALL gerenciador_inserir_item_tipo(?,?)")) {
                        stmt2.setLong(1, item.getId());
                        stmt2.setLong(2, tipo.getId());
                        stmt2.execute();
                    }
                }
                if (item.isModificavel()) {
                    for (Complemento complemento : item.getComplementos()) {
                        try (PreparedStatement stmt2 = super.conexao.prepareStatement("CALL gerenciador_inserir_item_complemento(?,?)")) {
                            stmt2.setLong(1, item.getId());
                            stmt2.setLong(2, complemento.getId());
                            stmt2.execute();
                        }
                    }
                }
                if (item.isModificavelIngrediente()) {
                    for (Ingrediente ingrediente : item.getIngredientes()) {
                        try (PreparedStatement stmt2 = super.conexao.prepareStatement("CALL gerenciador_inserir_item_ingrediente(?,?)")) {
                            stmt2.setLong(1, item.getId());
                            stmt2.setLong(2, ingrediente.getId());
                            stmt2.execute();
                        }
                    }
                }
                if (item.getVariacoes() != null && !item.getVariacoes().isEmpty()) {
                    for (int i = 0; i < item.getVariacoes().size(); i++) {
                        GrupoVariacao gv = item.getVariacoes().get(i);
                        try (PreparedStatement stmt2 = super.conexao.prepareStatement("CALL gerenciador_inserir_grupo_variacao(?,?,?,?)")) {
                            stmt2.setString(1, gv.getNome());
                            stmt2.setInt(2, i);
                            stmt2.setInt(3, gv.getMax());
                            stmt2.setLong(4, item.getId());;
                            ResultSet rs2 = stmt2.executeQuery();
                            if (rs2.next()) {
                                long idGrupoVariacao = rs2.getLong("id");
                                for (Variacao v : gv.getVariacoes()) {
                                    try (PreparedStatement stmt3 = super.conexao.prepareStatement("CALL gerenciador_inserir_variacao(?,?,?,?)")) {
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
                    try (PreparedStatement stmt2 = super.conexao.prepareStatement("CALL gerenciador_inserir_item_arquivo(?,?)")) {
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
        try (PreparedStatement stmt = super.conexao.prepareStatement(sql)) {
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
        try (PreparedStatement stmt = super.conexao.prepareStatement(sql)) {
            stmt.setLong(1, foto.getId());
            stmt.execute();
        } catch (SQLException e) {
            throw new DAOException(e, 200);
        }
    }

}
