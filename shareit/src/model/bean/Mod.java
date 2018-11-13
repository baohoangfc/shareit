package model.bean;

public class Mod {
	private int idMod;
	private String nameMod;
	public Mod() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Mod(int idMod, String nameMod) {
		super();
		this.idMod = idMod;
		this.nameMod = nameMod;
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
