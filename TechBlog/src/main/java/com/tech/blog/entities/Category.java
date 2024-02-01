package com.tech.blog.entities;

public class Category {

	private int cid;
	private String cname;
	private String description;
	
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Category(int cid, String cname, String description) {
		super();
		this.cid = cid;
		this.cname = cname;
		this.description = description;
	}
	
	public Category(String cname, String description) {
		super();
		this.cname = cname;
		this.description = description;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "Category [cid=" + cid + ", cname=" + cname + ", description=" + description + "]";
	}


	
	
}
