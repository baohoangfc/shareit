package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import library.LibraryConnectDb;
import model.bean.User;

public class UserDao {
	private Connection conn;
	private LibraryConnectDb connectDb;
	private Statement st;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public UserDao(){
		connectDb = new LibraryConnectDb();
	}

	public ArrayList<User> getListUser() {
		ArrayList<User> listUser = new ArrayList<>();
		conn = connectDb.getConnectMySql();
		
		String sql = "SELECT id,username,password,fullname,user.id_mod,name FROM user INNER JOIN mod_user ON user.id_mod = mod_user.id_mod";
		
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			
			while(rs.next()){
				User user = new User(rs.getInt("id"), rs.getString("username"), rs.getString("password"), rs.getString("fullname"), rs.getInt("user.id_mod"),rs.getString("name"));
				listUser.add(user);
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
		return listUser;
	}
	
	public ArrayList<User> getListMod() {
		ArrayList<User> listUser = new ArrayList<>();
		conn = connectDb.getConnectMySql();
		
		String sql = "SELECT * FROM mod_user";
		
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			
			while(rs.next()){
				User user = new User(0, "", "", "", rs.getInt("id_mod"), rs.getString("name"));
				listUser.add(user);
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
		return listUser;
	}

	public User checkUser(String username){
		conn = connectDb.getConnectMySql();
		User objUser = null;
		String sql = "SELECT id,username,password,fullname,user.id_mod,name FROM user INNER JOIN mod_user ON user.id_mod = mod_user.id_mod "
				+ "WHERE username = ? ";
		
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, username);
			rs = pst.executeQuery();
			if(rs.next()){
				objUser = new User(rs.getInt("id"), rs.getString("username"), rs.getString("password"), rs.getString("fullname"), rs.getInt("user.id_mod"),rs.getString("name"));
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
		return objUser;
	}
	
	public int addUser(User user) {
		conn = connectDb.getConnectMySql();
		int result = 0;
		String sql = "INSERT INTO user(username,password,fullname,id_mod) VALUES(?,?,?,?)";
		
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, user.getUsername());
			pst.setString(2, user.getPassword());
			pst.setString(3, user.getFullname());
			pst.setInt(4, user.getIdMod());
			
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

	public User getItem(int id) {
		conn = connectDb.getConnectMySql();
		
		String sql = "SELECT id,username,password,fullname,user.id_mod,name FROM user INNER JOIN mod_user ON user.id_mod = mod_user.id_mod WHERE id = ?";
		
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			
			if(rs.next()){
				User item = new User(rs.getInt("id"), rs.getString("username"), rs.getString("password"), rs.getString("fullname"), rs.getInt("user.id_mod"),rs.getString("name"));
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
	
	public int delUser(int id) {
		conn = connectDb.getConnectMySql();
		int result = 0;
		String sql = "DELETE FROM user WHERE id = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			
			result = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if( pst != null && conn != null){
				try {
					pst.close();
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return result;
	}
	
	public int editUser(User objUser) {
		conn = connectDb.getConnectMySql();
		int result = 0;
		String sql = "UPDATE user SET password = ?,fullname = ? WHERE id = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, objUser.getPassword());
			pst.setString(2, objUser.getFullname());
			pst.setInt(3, objUser.getId());
			
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
	
	public User existUser(String username, String password) {
		User user = null;
		conn = connectDb.getConnectMySql();
		
		String sql = "SELECT id,username,password,fullname,user.id_mod,name FROM user INNER JOIN mod_user ON user.id_mod = mod_user.id_mod"
				+ " WHERE username = ? AND password = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, username);
			pst.setString(2, password);
			
			rs = pst.executeQuery();
			if(rs.next()){
				user = new User(rs.getInt("id"), rs.getString("username"), rs.getString("password"), rs.getString("fullname"), rs.getInt("user.id_mod"),rs.getString("name"));
				return user;
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
		return user;
	}
	
	
}
