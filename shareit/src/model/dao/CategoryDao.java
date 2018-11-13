package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import constant.Define;
import library.LibraryConnectDb;
import model.bean.Category;
import model.bean.User;

public class CategoryDao {
	private Connection conn;
	private LibraryConnectDb connectDb;
	private Statement st;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public CategoryDao(){
		connectDb = new LibraryConnectDb();
	}
	
	public ArrayList<Category> getListCat() {
		ArrayList<Category> listCat = new ArrayList<>();
		conn = connectDb.getConnectMySql();
		
		String sql = "SELECT id_cat,name,id_parent FROM cat";
		
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			
			while(rs.next()){
				Category category = new Category(rs.getInt("id_cat"), rs.getInt("id_parent"),rs.getString("name"));
				listCat.add(category);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null && st != null && conn != null){
				try {
					rs.close();
					st.close();
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return listCat;
	}
	
	public ArrayList<Category> getListCatNoParent() {
		ArrayList<Category> listCat = new ArrayList<>();
		conn = connectDb.getConnectMySql();
		
		String sql = "SELECT id_cat,name,id_parent FROM cat WHERE id_parent != 0";
		
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			
			while(rs.next()){
				Category category = new Category(rs.getInt("id_cat"), rs.getInt("id_parent"),rs.getString("name"));
				listCat.add(category);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null && st != null && conn != null){
				try {
					rs.close();
					st.close();
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return listCat;
	}
	
	public ArrayList<Category> getListCatPublic() {
		ArrayList<Category> listCat = new ArrayList<>();
		conn = connectDb.getConnectMySql();
		
		String sql = "SELECT id_cat,name,id_parent FROM cat WHERE id_cat != 0";
		
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			
			while(rs.next()){
				Category category = new Category(rs.getInt("id_cat"), rs.getInt("id_parent"),rs.getString("name"));
				listCat.add(category);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null && st != null && conn != null){
				try {
					rs.close();
					st.close();
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return listCat;
	}
	

	
	public ArrayList<Category> getListCatEdit() {
		ArrayList<Category> listCat = new ArrayList<>();
		conn = connectDb.getConnectMySql();
		
		String sql = "SELECT * FROM cat WHERE id_parent = 0";
		
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			
			while(rs.next()){
				Category category = new Category(rs.getInt("id_cat"), rs.getInt("id_parent"),rs.getString("name"));
				listCat.add(category);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null && st != null && conn != null){
				try {
					rs.close();
					st.close();
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return listCat;
	}
	
	public ArrayList<Category> getListCatIndex() {
		ArrayList<Category> listCat = new ArrayList<>();
		conn = connectDb.getConnectMySql();
		
		String sql = "SELECT * FROM cat WHERE id_parent = 0 AND id_cat != 0 ";
		
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			
			while(rs.next()){
				Category category = new Category(rs.getInt("id_cat"), rs.getInt("id_parent"),rs.getString("name"));
				listCat.add(category);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null && st != null && conn != null){
				try {
					rs.close();
					st.close();
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return listCat;
	}
	
	public ArrayList<Category> getListCatAdd() {
		ArrayList<Category> listCat = new ArrayList<>();
		conn = connectDb.getConnectMySql();
		
		String sql = "SELECT id_cat,name,id_parent FROM cat WHERE id_parent = 0";
		
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			
			while(rs.next()){
				Category category = new Category(rs.getInt("id_cat"), rs.getInt("id_parent"),rs.getString("name"));
				listCat.add(category);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null && st != null && conn != null){
				try {
					rs.close();
					st.close();
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return listCat;
	}
	
	public ArrayList<Category> getListCatPagination(int offset) {
		ArrayList<Category> listCat = new ArrayList<>();
		conn = connectDb.getConnectMySql();
		
		String sql = "SELECT id_cat,name,id_parent FROM cat"
				+ " WHERE id_cat != 0"
				+ " LIMIT ?,? ";
		
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, offset);
			pst.setInt(2, Define.ROW_COUNT_ADMIN);
			rs = pst.executeQuery();
			
			while(rs.next()){
				Category category = new Category(rs.getInt("id_cat"), rs.getInt("id_parent"), rs.getString("name"));
				listCat.add(category);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null && pst != null && conn != null){
				try {
					rs.close();
					pst.close();
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return listCat;
	}


	public int countCat() {
		conn = connectDb.getConnectMySql();
		String sql = "SELECT COUNT(*) AS sumCat FROM cat";
		int result = 0;
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			
			while(rs.next()){
				result = rs.getInt("sumCat");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null && st != null && conn != null){
				try {
					rs.close();
					st.close();
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}


	public int addCat(Category item) {
		int result = 0;
		
		conn = connectDb.getConnectMySql();
		
		String sql = "INSERT INTO cat(name,id_parent) VALUES(?,?)";
		
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, item.getName());
			pst.setInt(2, item.getParent());
			
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(pst != null && conn != null){
				try {
					pst.close();
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return result;
	}
	
	public Category getCatParent() {
		Category item = null;
		conn = connectDb.getConnectMySql();
		
		String sql = "SELECT id_cat,name,id_parent FROM cat"
				+ " WHERE id_parent = 0";
		
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			
			while(rs.next()){
				item = new Category(rs.getInt("id_cat"), rs.getInt("id_parent"),rs.getString("name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null && st != null && conn != null){
				try {
					rs.close();
					st.close();
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return item;
	}

	public int delItem(int id) {
		conn = connectDb.getConnectMySql();
		int result = 0;
		String sql = "DELETE FROM cat WHERE id_cat = ?";
		
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(pst != null && conn != null){
				try {
					pst.close();
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return result;
	}

	public Category getItem(int id) {
		conn = connectDb.getConnectMySql();
		
		String sql = "SELECT id_cat,name,id_parent FROM cat WHERE id_cat = ?";
		
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			
			if(rs.next()){
				Category item = new Category(rs.getInt("id_cat"), rs.getInt("id_parent"),rs.getString("name"));
				return item;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null && pst != null && conn != null){
				try {
					rs.close();
					pst.close();
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return null;
	}

	public int editItem(Category item) {
		conn = connectDb.getConnectMySql();
		int result = 0;
		String sql = "UPDATE cat SET name = ?,id_parent = ? WHERE id_cat = ? ";
		
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, item.getName());
			pst.setInt(2, item.getParent());
			pst.setInt(3, item.getId());
			
			result = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if(pst != null && conn != null){
				try {
					pst.close();
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	
		return result;
	}

	public Category checkItem(String name) {
		Category category = null;
		conn = connectDb.getConnectMySql();
		
		String sql = "SELECT * FROM cat"
				+ " WHERE name = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, name);
			
			rs = pst.executeQuery();
			if(rs.next()){
				category = new Category(rs.getInt("id_cat"), rs.getInt("id_parent"),rs.getString("name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}  finally {
			if(rs != null && st != null && conn != null){
				try {
					rs.close();
					st.close();
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return category;
	}

	public int checkItem(int id) {
		Category category = null;
		conn = connectDb.getConnectMySql();
		
		String sql = "SELECT * FROM cat"
				+ " WHERE id_cat = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			
			rs = pst.executeQuery();
			if(rs.next()){
				category = new Category(rs.getInt("id_cat"), rs.getInt("id_parent"),rs.getString("name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}  finally {
			if(rs != null && st != null && conn != null){
				try {
					rs.close();
					st.close();
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return id;
	}
	

}
