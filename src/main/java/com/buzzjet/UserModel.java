// filepath: /com/buzzjet/UserModel.java
package com.buzzjet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class UserModel {
	private final Connection con;
	ArrayList<User> ListUser;
	ResultSet rs;
	PreparedStatement ps;
	Statement st;

	public UserModel() {
		this.con = DBConnection.getConnection();
		this.ListUser = new ArrayList<>();
	}

	public User validateUser(String username, String password) {
		String query = "SELECT * FROM users WHERE username = ? AND password = ?";
		try (PreparedStatement preparedStatement = con.prepareStatement(query)) {
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, password);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				if (resultSet.next()) {
					User user = new User();
					user.setId(resultSet.getInt("id"));
					user.setUsername(resultSet.getString("username"));
					user.setPassowrd(resultSet.getString("password"));
					user.setRole(resultSet.getString("role"));
					return user;
				}
			}
		} catch (SQLException e) {
			System.out.println("Error validating user: " + e.getMessage());
		}
		return null;
	}

	public ArrayList<User> getAllUsers() {
		String query = "SELECT * FROM users";
		try {
			st = con.createStatement();
			rs = st.executeQuery(query);
			while (rs.next()) {
				User user = new User();
				user.setId(rs.getInt("id"));
				user.setUsername(rs.getString("username"));
				user.setPassowrd(rs.getString("password"));
				user.setRole(rs.getString("role"));
				ListUser.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ListUser;
	}
	public boolean addUser(User user) {
        String query = "INSERT INTO users (username, password, role) VALUES (?, ?, ?)";
        try {
            ps = con.prepareStatement(query);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassowrd());
            ps.setString(3, user.getRole());
            int affectedRows = ps.executeUpdate();
            ps.close();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
	public boolean isUsernameTaken(String username) {
        String query = "SELECT COUNT(*) FROM users WHERE username = ?";
        try {
            ps = con.prepareStatement(query);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}