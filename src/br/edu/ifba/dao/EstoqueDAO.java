package br.edu.ifba.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import br.edu.ifba.jdbc.ConnectionFactory;
import br.edu.ifba.model.Estoque;
import br.edu.ifba.model.Mercadoria;

public class EstoqueDAO {

    private Connection connection;

    public EstoqueDAO() {
        this.connection = new ConnectionFactory().getConnection();
    }

    public void adicionar(Estoque estoque) {
        try {
            String sql = "INSERT INTO estoques(id_mercadoria, quantidade) VALUES (?,?)";
            PreparedStatement stmt = this.connection.prepareStatement(sql);
            stmt.setLong(1, estoque.getMercadoria().getId());
            stmt.setInt(2, estoque.getQuantidade());

            stmt.execute();

            stmt.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private void atualizarQuantidade(Estoque estoque) {
        try {
            String sql = "UPDATE estoques SET quantidade=? WHERE id_estoque=?";
            PreparedStatement stmt = this.connection.prepareStatement(sql);
            stmt.setInt(1, estoque.getQuantidade());
            stmt.setLong(2, estoque.getId());

            stmt.execute();
            stmt.close();

            if (estoque.getQuantidade() <= 0) {
                this.excluir(estoque);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public void entradaQuantidade(Estoque estoque, Integer quantidade) {
        estoque.setQuantidade(estoque.getQuantidade() + quantidade);
        this.atualizarQuantidade(estoque);

    }
    public void remocaoQuantidade(Estoque estoque, Integer quantidade) {
        estoque.setQuantidade(estoque.getQuantidade() - quantidade);
        this.atualizarQuantidade(estoque);
    }

    private void excluir(Estoque estoque) {
        try {
            String sql = "DELETE FROM estoques WHERE id_estoque=?";
            PreparedStatement stmt = this.connection.prepareStatement(sql);
            stmt.setLong(1, estoque.getId());
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Estoque> get() {
        List<Estoque> estoques = new ArrayList<Estoque>();
        try {
            String sql = "SELECT mercadorias.id_mercadoria, mercadorias.codigo, mercadorias.descricao, mercadorias.preco_unitario, estoques.quantidade, estoques.id_estoque\n" +
                    "FROM mercadorias INNER JOIN estoques ON mercadorias.id_mercadoria = estoques.id_mercadoria ORDER BY estoques.id_estoque ASC";
            PreparedStatement stmt = this.connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Mercadoria mercadoria = new Mercadoria();
                mercadoria.setId(rs.getLong("id_mercadoria"));
                mercadoria.setCodigo(rs.getString("codigo"));
                mercadoria.setDescricao(rs.getString("descricao"));
                mercadoria.setPrecoUnitario(rs.getBigDecimal("preco_unitario"));
                Estoque estoque = new Estoque();
                estoque.setId(rs.getLong("id_estoque"));
                estoque.setMercadoria(mercadoria);
                estoque.setQuantidade(rs.getInt("quantidade"));

                estoques.add(estoque);
            }
            stmt.close();
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return Collections.unmodifiableList(estoques);

    }

    public Estoque get(Long id) {
        Estoque estoque = new Estoque();
        try {
            String sql = "SELECT mercadorias.id_mercadoria, mercadorias.codigo, mercadorias.descricao, mercadorias.preco_unitario, estoques.quantidade, estoques.id_estoque\n" +
                    "FROM mercadorias INNER JOIN estoques ON mercadorias.id_mercadoria = estoques.id_mercadoria WHERE id_estoque=?";
            PreparedStatement stmt = this.connection.prepareStatement(sql);
            stmt.setLong(1, id);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Mercadoria mercadoria = new Mercadoria();
                mercadoria.setId(rs.getLong("id_mercadoria"));
                mercadoria.setCodigo(rs.getString("codigo"));
                mercadoria.setDescricao(rs.getString("descricao"));
                mercadoria.setPrecoUnitario(rs.getBigDecimal("preco_unitario"));
                estoque.setId(rs.getLong("id_estoque"));
                estoque.setMercadoria(mercadoria);
                estoque.setQuantidade(rs.getInt("quantidade"));
                
                stmt.close();
                rs.close();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return estoque;
    }
    
}
