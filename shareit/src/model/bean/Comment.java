package model.bean;

import java.sql.Timestamp;

public class Comment {
	private int id;
	private String fullname;
	private String cmt;
	private String date;
	private String email;
	private int idCat;
	private int idNews;
	private String nameNews;
	private String nameCat;
	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Comment(int id, String fullname, String cmt, String date, String email, int idCat, int idNews,
			String nameNews, String nameCat) {
		super();
		this.id = id;
		this.fullname = fullname;
		this.cmt = cmt;
		this.date = date;
		this.email = email;
		this.idCat = idCat;
		this.idNews = idNews;
		this.nameNews = nameNews;
		this.nameCat = nameCat;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getCmt() {
		return cmt;
	}
	public void setCmt(String cmt) {
		this.cmt = cmt;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getIdCat() {
		return idCat;
	}
	public void setIdCat(int idCat) {
		this.idCat = idCat;
	}
	public int getIdNews() {
		return idNews;
	}
	public void setIdNews(int idNews) {
		this.idNews = idNews;
	}
	public String getNameNews() {
		return nameNews;
	}
	public void setNameNews(String nameNews) {
		this.nameNews = nameNews;
	}
	public String getNameCat() {
		return nameCat;
	}
	public void setNameCat(String nameCat) {
		this.nameCat = nameCat;
	}

	

}