package com.buzzjet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class TransactionModel {
    private final Connection con;
    ResultSet rs;
    PreparedStatement ps;
    Statement st;
    ArrayList<Transaction> listTransactions;

    public TransactionModel() {
        this.con = DBConnection.getConnection();
        this.listTransactions = new ArrayList<>();
    }

    public ArrayList<Transaction> getAllTransactions() {
        String query = "SELECT * FROM transactions";
        try {
            st = con.createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                Transaction transaction = new Transaction();
                transaction.setId(rs.getInt("id"));
                transaction.setUserId(rs.getInt("user_id"));
                transaction.setPackageId(rs.getInt("package_id"));
                transaction.setTransactionDate(rs.getDate("transaction_date"));
                transaction.setQuantity(rs.getInt("quantity"));
                transaction.setTotalAmount(rs.getDouble("total_amount"));
                listTransactions.add(transaction);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listTransactions;
    }

    public boolean insertTransaction(Transaction transaction) {
        String query = "INSERT INTO transactions (user_id, package_id, transaction_date, quantity, total_amount) VALUES (?, ?, ?, ?, ?)";
        System.out.println("transaksi");
        try {
            ps = con.prepareStatement(query);
            ps.setInt(1, transaction.getUserId());
            ps.setInt(2, transaction.getPackageId());
            ps.setDate(3, new java.sql.Date(transaction.getTransactionDate().getTime()));
            ps.setInt(4, transaction.getQuantity());
            ps.setDouble(5, transaction.getTotalAmount());
            int add = ps.executeUpdate();
            ps.close();
            return add > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateTransaction(Transaction transaction) {
        String query = "UPDATE transactions SET user_id = ?, package_id = ?, transaction_date = ?, quantity = ?, total_amount = ? WHERE id = ?";
        try {
            ps = con.prepareStatement(query);
            ps.setInt(1, transaction.getUserId());
            ps.setInt(2, transaction.getPackageId());
            ps.setDate(3, new java.sql.Date(transaction.getTransactionDate().getTime()));
            ps.setInt(4, transaction.getQuantity());
            ps.setDouble(5, transaction.getTotalAmount());
            ps.setInt(6, transaction.getId());
            int edit = ps.executeUpdate();
            ps.close();
            return edit > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteTransaction(int id) {
        String query = "DELETE FROM transactions WHERE id = ?";
        try {
            ps = con.prepareStatement(query);
            ps.setInt(1, id);
            int delete = ps.executeUpdate();
            ps.close();
            return delete > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}