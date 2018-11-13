package model.bean;

import java.sql.Timestamp;

public class News {
	private int id;
	private String name;
	private String preview;
	private String detail;
	private String picture;
	private Timestamp date;
	private int catId;
	private String catName;
	private int isSlide;
	private int status;
	private int created;

	public News() {
		super();
	}

	public News(int id, String name, String preview, String detail, String picture, Timestamp date, int catId,
			String catName, int isSlide, int status, int created) {
		super();
		this.id = id;
		this.name = name;
		this.preview = preview;
		this.detail = detail;
		this.picture = picture;
		this.date = date;
		this.catId = catId;
		this.catName = catName;
		this.isSlide = isSlide;
		this.status = status;
		this.created = created;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPreview() {
		return preview;
	}

	public void setPreview(String preview) {
		this.preview = preview;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public int getCatId() {
		return catId;
	}

	public void setCatId(int catId) {
		this.catId = catId;
	}

	public String getCatName() {
		return catName;
	}

	public void setCatName(String catName) {
		this.catName = catName;
	}

	public int getIsSlide() {
		return isSlide;
	}

	public void setIsSlide(int isSlide) {
		this.isSlide = isSlide;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getCreated() {
		return created;
	}

	public void setCreated(int created) {
		this.created = created;
	}

}
