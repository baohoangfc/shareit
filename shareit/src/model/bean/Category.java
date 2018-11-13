package model.bean;

public class Category {
	private int id;
	private int parent;
	private String name;
	public Category() {
		super();
	}
	public Category(int id, int parent, String name) {
		super();
		this.id = id;
		this.parent = parent;
		this.name = name;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getParent() {
		return parent;
	}
	public void setParent(int parent) {
		this.parent = parent;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
