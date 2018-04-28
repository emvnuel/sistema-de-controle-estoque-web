package br.edu.ifba.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {

    private final String URL = "jdbc:mysql://localhost:3306/sistema_estoque?useSSL=false";
    private final String USER = "root";
    private final String PASSWORD = "";
    
    public Connection getConnection() {
        try {
            new com.mysql.jdbc.Driver();
            return DriverManager.getConnection(this.URL, this.USER, this.PASSWORD);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
