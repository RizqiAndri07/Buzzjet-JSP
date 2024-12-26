package com.buzzjet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class PackageModel {
    private final Connection con;
    ResultSet rs;
    PreparedStatement ps;
    Statement st;
    ArrayList<Package> listPackages;

    public PackageModel() {
        this.con = DBConnection.getConnection();
        this.listPackages = new ArrayList<>();
    }

    public ArrayList<Package> getAllPackages() {
        String query = "SELECT * FROM packages";
        try {
            st = con.createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                Package pkg = new Package();
                pkg.setId(rs.getInt("id"));
                pkg.setName(rs.getString("name"));
                pkg.setDescription(rs.getString("description"));
                pkg.setPrice(rs.getDouble("price"));
                pkg.setDestinationId(rs.getInt("destination_id"));
                listPackages.add(pkg);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listPackages;
    }

    public boolean insertPackage(Package pkg) {
        String query = "INSERT INTO packages (name, description, price, destination_id) VALUES (?, ?, ?, ?)";
        try {
            ps = con.prepareStatement(query);
            ps.setString(1, pkg.getName());
            ps.setString(2, pkg.getDescription());
            ps.setDouble(3, pkg.getPrice());
            ps.setInt(4, pkg.getDestinationId());
            int add = ps.executeUpdate();
            ps.close();
            return add > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updatePackage(Package pkg) {
        String query = "UPDATE packages SET name = ?, description = ?, price = ?, destination_id = ? WHERE id = ?";
        try {
            ps = con.prepareStatement(query);
            ps.setString(1, pkg.getName());
            ps.setString(2, pkg.getDescription());
            ps.setDouble(3, pkg.getPrice());
            ps.setInt(4, pkg.getDestinationId());
            ps.setInt(5, pkg.getId());
            int edit = ps.executeUpdate();
            ps.close();
            return edit > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deletePackage(int id) {
        String query = "DELETE FROM packages WHERE id = ?";
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