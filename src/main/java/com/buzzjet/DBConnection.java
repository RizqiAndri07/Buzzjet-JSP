package com.buzzjet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	public static final String URL = "jdbc:mysql://localhost:3306/buzzjet_jsp";
    private static final String USER = "root";
    private static final String PASSWORD = ""; // Sesuaikan dengan password MySQL Anda

    public static Connection getConnection() {
        Connection connection = null;
        try {
            // Load JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Database Connected Successfully!");
        } catch (ClassNotFoundException e) {
            System.out.println("JDBC Driver not found!GOKK DLOGOKK");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Failed to connect to the database!");
            e.printStackTrace();
        }
        return connection;
    }
    public static void main(String[] args) {
		getConnection();
	}
}
