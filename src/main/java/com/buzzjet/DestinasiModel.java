package com.buzzjet;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DestinasiModel {
	private final Connection con;
	ResultSet rs;
	PreparedStatement ps;
	Statement st;
	ArrayList<Destinasi> ListDestinasi;
	
	
	public DestinasiModel() {
		this.con = DBConnection.getConnection();
		this.ListDestinasi = new ArrayList<>();
	}
	
	public ArrayList<Destinasi> getAllDestinasi(){
		String query = "SELECT * FROM destinations";
		try {
			st = con.createStatement();
			rs = st.executeQuery(query);
			while(rs.next()) {
				Destinasi destinasi = new Destinasi();
				destinasi.setId(rs.getInt("id"));
				destinasi.setName(rs.getString("name"));
				destinasi.setDescription(rs.getString("description"));
				ListDestinasi.add(destinasi);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return ListDestinasi;
	}
	public boolean insertDestinasi(Destinasi destinasi) {
		String query = "INSERT INTO destinations (id,name,description) VALUES (?,?,?)";
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, destinasi.getId());
			ps.setString(2, destinasi.getName());
			ps.setString(3,destinasi.getDescription());
			int add = ps.executeUpdate();
			ps.close();
			return add > 0;
		}catch(SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean updateDestinasi(Destinasi destinasi) {
		String query = "UPDATE destinations SET name=? , description=? where id = ?";
		System.out.println("update");
		try {
			ps = con.prepareStatement(query);
			ps.setString(1, destinasi.getName());
			ps.setString(2, destinasi.getDescription());
			ps.setInt(3, destinasi.getId());
			int edit = ps.executeUpdate();
			ps.close();
			return edit > 0;
			
		}catch(SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean deleteDestinasi(int id) {
		String query = "DELETE FROM destinations WHERE id = ?";
		try {
			ps = con.prepareStatement(query);
			ps.setInt(1, id);
			int delete = ps.executeUpdate();
			ps.close();
			return delete > 0;
		}catch(SQLException e ) {
			e.printStackTrace();
			return false;
		}
	}
}
