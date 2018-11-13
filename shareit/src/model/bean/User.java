package model.bean;

public class User {
	private int id;
	private String username;
	private String password;
	private String fullname;
	private int idMod;
	private String nameMod;
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(int id, String username, String password, String fullname, int idMod, String nameMod) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.idMod = idMod;
		this.nameMod = nameMod;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public int getIdMod() {
		return idMod;
	}
	public void setIdMod(int idMod) {
		this.idMod = idMod;
	}
	public String getNameMod() {
		return nameMod;
	}
	public void setNameMod(String nameMod) {
		this.nameMod = nameMod;
	}
	
	
	
	
	
	
}
