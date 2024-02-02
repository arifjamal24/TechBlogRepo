package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;

import com.tech.blog.entities.Category;

public class PostDao {
Connection con;
	
	public PostDao(Connection con) {
		this.con = con;
	}
	
	
	public ArrayList<Category> getAllCategories(){
		ArrayList<Category> list = new ArrayList<>();
		try {
			String q = "select * from catagories";
			Statement st = this.con.createStatement();
			ResultSet set = st.executeQuery(q);
			while(set.next()) {
				int cid = set.getInt("cid");
				String name = set.getString("cname");
				String description = set.getString("description");
				
				Category c = new Category(cid,name,description);
				list.add(c);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		 
		return list;
	}
	
	
	
}
