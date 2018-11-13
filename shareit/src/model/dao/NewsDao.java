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
import model.bean.News;

public class NewsDao {
	private Connection conn;
	private LibraryConnectDb connectDb;
	private Statement st;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public NewsDao(){
		connectDb = new LibraryConnectDb();
	}
	
	public ArrayList<News> getListNews() {
		ArrayList<News> listNews = new ArrayList<>();
		conn = connectDb.getConnectMySql();
		
		String sql = "SELECT id_news,n.name AS nname,preview,detail,date_create,picture,c.id_cat,c.name AS cname,id_status,is_slide,created_by "
				+ " FROM cat AS c "
				+ " INNER JOIN news AS n "
				+ " ON c.id_cat = n.id_cat";

		
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			
			while(rs.next()){
				News item = new News(rs.getInt("id_news"), rs.getString("nname"), rs.getString("preview"), rs.getString("detail"), rs.getString("picture"), rs.getTimestamp("date_create"), rs.getInt("c.id_cat"), rs.getString("cname"), rs.getInt("is_slide"), rs.getInt("id_status"), rs.getInt("created_by"));
				listNews.add(item);
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
		return listNews;
	}
	
	public ArrayList<News> getListNewsSide() {
		ArrayList<News> listNews = new ArrayList<>();
		conn = connectDb.getConnectMySql();
		
		String sql = "SELECT id_news,n.name AS nname,preview,detail,date_create,picture,c.id_cat,c.name AS cname,id_status,is_slide,created_by "
				+ " FROM cat AS c "
				+ " INNER JOIN news AS n "
				+ " ON c.id_cat = n.id_cat"
				+ " LIMIT 3";

		
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			
			while(rs.next()){
				News item = new News(rs.getInt("id_news"), rs.getString("nname"), rs.getString("preview"), rs.getString("detail"), rs.getString("picture"), rs.getTimestamp("date_create"), rs.getInt("c.id_cat"), rs.getString("cname"), rs.getInt("is_slide"), rs.getInt("id_status"), rs.getInt("created_by"));
				listNews.add(item);
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
		return listNews;
	}
	
	public ArrayList<News> getListNewsSlide() {
		ArrayList<News> listNews = new ArrayList<>();
		conn = connectDb.getConnectMySql();
		
		String sql = "SELECT id_news,n.name AS nname,preview,detail,date_create,picture,c.id_cat,c.name AS cname,id_status,is_slide,created_by "
				+ " FROM cat AS c "
				+ " INNER JOIN news AS n "
				+ " ON c.id_cat = n.id_cat"
				+ " ORDER BY RAND()"
				+ " LIMIT 3";

		
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			
			while(rs.next()){
				News item = new News(rs.getInt("id_news"), rs.getString("nname"), rs.getString("preview"), rs.getString("detail"), rs.getString("picture"), rs.getTimestamp("date_create"), rs.getInt("c.id_cat"), rs.getString("cname"), rs.getInt("is_slide"), rs.getInt("id_status"), rs.getInt("created_by"));
				listNews.add(item);
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
		return listNews;
	}

	public int addNews(News item) {
		conn = connectDb.getConnectMySql();
		int result = 0;
		String sql = "INSERT INTO news(name,id_cat,picture,preview,detail,date_create,is_slide,created_by) VALUES(?,?,?,?,?,?,?,?)";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, item.getName());
			pst.setInt(2, item.getCatId());
			pst.setString(3, item.getPicture());
			pst.setString(4, item.getPreview());
			pst.setString(5, item.getDetail());
			pst.setTimestamp(6, item.getDate());
			pst.setInt(7, item.getIsSlide());
			pst.setInt(8, item.getCreated());
			
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
	
	public News getItem(int id) {
		News item = null;
		conn = connectDb.getConnectMySql();
		
		String sql = "SELECT id_news,n.name AS nname,preview,detail,date_create,picture,c.id_cat,c.name AS cname,id_status,is_slide,created_by "
				+ " FROM cat AS c "
				+ " INNER JOIN news AS n "
				+ " ON c.id_cat = n.id_cat"
				+ " WHERE id_news = ?";
		
		try {
			
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			
			rs = pst.executeQuery();
			
			if(rs.next()){
				item = new News(rs.getInt("id_news"), rs.getString("nname"), rs.getString("preview"), rs.getString("detail"), rs.getString("picture"), rs.getTimestamp("date_create"), rs.getInt("c.id_cat"), rs.getString("cname"), rs.getInt("is_slide"), rs.getInt("id_status"), rs.getInt("created_by"));
				return item;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(pst != null && conn != null && rs != null){
				try {
					rs.close();
					pst.close();
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return item;
	}

	public int editNews(News item) {
		conn = connectDb.getConnectMySql();
		int result = 0;
		String sql = "UPDATE news SET name = ?, preview = ?, detail = ?, id_cat = ?, picture = ?, is_slide = ?"
				+ " WHERE id_news = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, item.getName());
			pst.setString(2, item.getPreview());
			pst.setString(3, item.getDetail());
			pst.setInt(4, item.getCatId());
			pst.setString(5, item.getPicture());
			pst.setInt(6, item.getIsSlide());
			pst.setInt(7, item.getId());
			
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

	public int delItem(int id) {
		conn = connectDb.getConnectMySql();
		int result = 0;
		
		String sql = "DELETE FROM news WHERE id_news = ? ";
		
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			
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

	public ArrayList<News> getListNewsPagination(int offset) {
		ArrayList<News> list = new ArrayList<>();
		conn = connectDb.getConnectMySql();
		
		String sql = "SELECT id_news,n.name AS nname,preview,detail,date_create,picture,is_slide,id_status,created_by,c.id_cat AS catID,c.name AS cname"
						+" FROM cat AS c INNER JOIN news AS n"
						+" ON c.id_cat = n.id_cat ORDER BY id_news DESC"
						+" LIMIT ?,? ";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, offset);
			pst.setInt(2, Define.ROW_COUNT_ADMIN);
			
			rs = pst.executeQuery();
			while(rs.next()){
				News item = new News(rs.getInt("id_news"), rs.getString("nname"), rs.getString("preview"), rs.getString("detail"), rs.getString("picture"), rs.getTimestamp("date_create"), rs.getInt("catID"), rs.getString("cname"), rs.getInt("is_slide"), rs.getInt("id_status"), rs.getInt("created_by"));
				list.add(item);
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
		return list;
	}
	
	public int countNews(){
		conn = connectDb.getConnectMySql();
		int result = 0;
		String sql = "SELECT COUNT(*) AS sumNews "
				+" FROM cat AS c INNER JOIN news AS n"
				+" ON c.id_cat = n.id_cat";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()){
				result = rs.getInt("sumNews");
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
	
	public News getItemNewsById(int did) {
		conn = connectDb.getConnectMySql();
		News item = null;
		String sql = "SELECT * FROM news WHERE id_news = ? ";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, did);
			rs = pst.executeQuery();
			if(rs.next()){
				item = new News(rs.getInt("id_news"), rs.getString("name"), rs.getString("preview"), rs.getString("detail"), rs.getString("picture"), rs.getTimestamp("date_create"), rs.getInt("id_cat"), "", rs.getInt("is_slide"), rs.getInt("id_status"), rs.getInt("created_by"));
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
		
		return item;
	}
	
	public int countNewsById(int cid) {
		conn = connectDb.getConnectMySql();
		int result = 0;
		String sql = "SELECT COUNT(*) AS sumNewsById "
				+" FROM cat AS c INNER JOIN news AS n"
				+" ON c.id_cat = n.id_cat"
				+" WHERE c.id_cat = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, cid);
			rs = pst.executeQuery();
			if(rs.next()){
				result = rs.getInt("sumNewsById");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  finally {
			if(rs != null && st != null && conn != null){
				try {
					rs.close();
					pst.close();
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return result;
	}
	
	public ArrayList<News> getItemByIdPagination(int cid,int offset) {
		conn = connectDb.getConnectMySql();
		ArrayList<News> list = new ArrayList<>();
		
		String sql = "SELECT id_news,n.name AS nname,preview,detail,date_create,picture,c.id_cat,c.name AS cname,id_status,is_slide,created_by "
				+ " FROM cat AS c "
				+ " INNER JOIN news AS n "
				+ " ON c.id_cat = n.id_cat"
				+ " WHERE c.id_cat = ?"
				+ " ORDER BY id_news DESC"
				+ " LIMIT ?,?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, cid);
			pst.setInt(2, offset);
			pst.setInt(3, Define.ROW_COUNT_ADMIN);
			rs = pst.executeQuery();
			while(rs.next()){
				News item = new News(rs.getInt("id_news"), rs.getString("nname"), rs.getString("preview"), rs.getString("detail"), rs.getString("picture"), rs.getTimestamp("date_create"), rs.getInt("c.id_cat"), rs.getString("cname"), rs.getInt("is_slide"), rs.getInt("id_status"), rs.getInt("created_by"));
				list.add(item);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null &&pst != null && conn != null){
				try {
					rs.close();
					pst.close();
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return list;
	}
	
	public ArrayList<News> getListSeach(News search) {
		ArrayList<News> listNews = new ArrayList<>();
		conn = connectDb.getConnectMySql();
		
		String sql = "SELECT * FROM news WHERE name LIKE '%"+search.getName()+"%' ";

		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			
			while(rs.next()){
				News item = new News(rs.getInt("id_news"), rs.getString("name"), rs.getString("preview"), rs.getString("detail"), rs.getString("picture"), rs.getTimestamp("date_create"), rs.getInt("id_cat"),"", rs.getInt("is_slide"), rs.getInt("id_status"), rs.getInt("created_by"));
				listNews.add(item);
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
		return listNews;
	}

	

	public int activeNews(int id, int i) {
		int result = 0;
		String sql ="UPDATE news SET id_status = ? WHERE id_news = ? ";
		conn = connectDb.getConnectMySql();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, i);
			pst.setInt(2, id);
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try{
				pst.close();
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return result;
	}






}
