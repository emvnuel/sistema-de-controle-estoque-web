package br.edu.ifba.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import br.edu.ifba.jdbc.ConnectionFactory;
import br.edu.ifba.model.Mercadoria;

public class MercadoriaDAO {

    private Connection connection;

    public MercadoriaDAO() {
        this.connection = new ConnectionFactory().getConnection();
    }

    public void adicionar(Mercadoria mercadoria) {
        try {
            String sql = "INSERT INTO mercadorias(codigo, descricao, preco_unitario) VALUES (?,?,?)";
            PreparedStatement stmt = this.connection.prepareStatement(sql);

            stmt.setString(1, mercadoria.getCodigo());
            stmt.setString(2, mercadoria.getDescricao());
            stmt.setBigDecimal(3, mercadoria.getPrecoUnitario());

            stmt.execute();
            stmt.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public void atualizar(Mercadoria mercadoria) {
        try {
            String sql = "UPDATE mercadorias SET descricao=?, preco_unitario=? WHERE id_mercadoria=?";
            PreparedStatement stmt = this.connection.prepareStatement(sql);

            stmt.setString(1, mercadoria.getDescricao());
            stmt.setBigDecimal(2, mercadoria.getPrecoUnitario());
            stmt.setLong(3, mercadoria.getId());
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void excluir(Mercadoria mercadoria) {
        try {
            String sql = "DELETE FROM mercadorias WHERE id_mercadoria=?";
            PreparedStatement stmt = this.connection.prepareStatement(sql);
            stmt.setLong(1, mercadoria.getId());
            stmt.execute();
            stmt.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public List<Mercadoria> get() {
        try {
            List<Mercadoria> mercadorias = new ArrayList<Mercadoria>();
            String sql = "SELECT id_mercadoria, codigo, descricao, preco_unitario FROM mercadorias";
            PreparedStatement stmt = this.connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Mercadoria mercadoria = new Mercadoria();
                mercadoria.setId(rs.getLong("id_mercadoria"));
                mercadoria.setCodigo(rs.getString("codigo"));
                mercadoria.setDescricao(rs.getString("descricao"));
                mercadoria.setPrecoUnitario(rs.getBigDecimal("preco_unitario"));

                mercadorias.add(mercadoria);
            }
            rs.close();
            stmt.close();
            return Collections.unmodifiableList(mercadorias);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public Mercadoria get(Long id) {
        Mercadoria mercadoria = new Mercadoria();
        try {

            String sql = "SELECT id_mercadoria, codigo, descricao, preco_unitario FROM mercadorias WHERE id_mercadoria=?";
            PreparedStatement stmt = this.connection.prepareStatement(sql);
            stmt.setLong(1, id);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                mercadoria.setId(rs.getLong("id_mercadoria"));
                mercadoria.setCodigo(rs.getString("codigo"));
                mercadoria.setDescricao(rs.getString("descricao"));
                mercadoria.setPrecoUnitario(rs.getBigDecimal("preco_unitario"));
            }
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return mercadoria;
    }
    
    public List<Mercadoria> getNaoEstaoNoEstoque() {
        try {
            List<Mercadoria> mercadorias = new ArrayList<Mercadoria>();
            String sql = "SELECT id_mercadoria, codigo, descricao, preco_unitario FROM mercadorias WHERE id_mercadoria NOT IN (SELECT id_mercadoria FROM estoques)";
            PreparedStatement stmt = this.connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Mercadoria mercadoria = new Mercadoria();
                mercadoria.setId(rs.getLong("id_mercadoria"));
                mercadoria.setCodigo(rs.getString("codigo"));
                mercadoria.setDescricao(rs.getString("descricao"));
                mercadoria.setPrecoUnitario(rs.getBigDecimal("preco_unitario"));

                mercadorias.add(mercadoria);
            }
            rs.close();
            stmt.close();
            return Collections.unmodifiableList(mercadorias);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
    
}
