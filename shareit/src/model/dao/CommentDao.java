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
import model.bean.Comment;

public class CommentDao {
	
	private Connection conn;
	private LibraryConnectDb connectDb;
	private Statement st;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public CommentDao(){
		connectDb = new LibraryConnectDb();
	}
	
	public ArrayList<Comment> getListCommet(){
		ArrayList<Comment> listComment = new ArrayList<>();
		conn = connectDb.getConnectMySql();
		
		String sql = "SELECT comment.id,comment.id_news,news.name,cat.name,email,content,fullname,comment.date_create,comment.id_cat FROM news"
				+ " INNER JOIN comment"
				+ " ON comment.id_news = news.id_news"
				+ " INNER JOIN cat"
				+ " ON cat.id_cat = news.id_cat";
		
		try {
			
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			
			while(rs.next()){
				Comment comment = new Comment(rs.getInt("comment.id"), rs.getString("fullname"), rs.getString("content"), rs.getString("comment.date_create"), rs.getString("email"), rs.getInt("comment.id_cat"), rs.getInt("comment.id_news"), rs.getString("news.name"), rs.getString("cat.name"));
				listComment.add(comment);
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
		return listComment;
	}
	
	public ArrayList<Comment> getListCommetPagination(int offset){
		ArrayList<Comment> listComment = new ArrayList<>();
		conn = connectDb.getConnectMySql();
		
		String sql = "SELECT comment.id,comment.id_news,news.name,cat.name,email,content,fullname,comment.date_create,comment.id_cat FROM news"
				+ " INNER JOIN comment"
				+ " ON comment.id_news = news.id_news"
				+ " INNER JOIN cat"
				+ " ON cat.id_cat = news.id_cat"
				+ " ORDER BY comment.id_news DESC"
				+ " LIMIT ?,?";
		
		try {
			
			pst = conn.prepareStatement(sql);
			pst.setInt(1, offset);
			pst.setInt(2, Define.ROW_COUNT_ADMIN);
			
			rs = pst.executeQuery();
			
			while(rs.next()){
				Comment comment = new Comment(rs.getInt("comment.id"), rs.getString("fullname"), rs.getString("content"), rs.getString("comment.date_create"), rs.getString("email"), rs.getInt("comment.id_cat"), rs.getInt("comment.id_news"), rs.getString("news.name"), rs.getString("cat.name"));
				listComment.add(comment);
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
		return listComment;
	}
	
	
	public int addComment(Comment objCmt) {
		conn = connectDb.getConnectMySql();
		int result = 0;
		String sql = "INSERT INTO comment(content,email,date_create,id_news,id_cat,fullname) VALUES(?,?,?,?,?,?)";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, objCmt.getCmt());
			pst.setString(2, objCmt.getEmail());
			pst.setString(3, objCmt.getDate());
			pst.setInt(4, objCmt.getIdNews());
			pst.setInt(5, objCmt.getIdCat());
			pst.setString(6, objCmt.getFullname());
			
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}  finally {
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

	public ArrayList<Comment> getCmtListByID(int did) {
		ArrayList<Comment> listComment = new ArrayList<>();
		conn = connectDb.getConnectMySql();
		
		String sql = "SELECT * FROM comment WHERE id_news = ?";
		
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, did);
			
			rs = pst.executeQuery();
			
			while(rs.next()){
				Comment comment = new Comment(rs.getInt("id"), rs.getString("fullname"), rs.getString("content"), rs.getString("date_create"), rs.getString("email"), rs.getInt("id_cat"), rs.getInt("id_news"),"","");
				listComment.add(comment);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null && st != null && conn != null){
				try {
					rs.close();
					pst.close();
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return listComment;
	}

	public int countComment() {
		conn = connectDb.getConnectMySql();
		int result = 0;
		String sql = "SELECT COUNT(*) AS sumComment FROM comment";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()){
				result = rs.getInt("sumComment");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
		
		return result;
	}

	public int delItem(Comment item) {
		conn = connectDb.getConnectMySql();
		int result = 0;
		String sql = "DELETE FROM comment WHERE id = ?";
		
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, item.getId());
			
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
	
}
