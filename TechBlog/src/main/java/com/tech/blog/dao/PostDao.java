package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.*;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Posts;

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
	
	public boolean savePost(Posts p) {
		boolean status = false;
		try {
			String query = "Insert into posts(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, p.getpTitle());
			pstmt.setString(2, p.getpContent());
			pstmt.setString(3, p.getpCode());
			pstmt.setString(4, p.getpPic());
			pstmt.setInt(5, p.getCatId());
			pstmt.setInt(6, p.getUserId());
			
			pstmt.executeUpdate();
			status = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return status;
	}
	
	public List<Posts> getAllPosts(){
		List<Posts> list = new ArrayList<>();
		try {
			PreparedStatement p = con.prepareStatement("SELECT * FROM POSTS ORDER BY pid desc");
			ResultSet set = p.executeQuery();
			while(set.next()) {
				int pid 	    = set.getInt("pid");
				String pTitle   = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode	= set.getString("pCode");
				String pPic		= set.getString("pPic");
				Timestamp pDate	= set.getTimestamp("pDate");
				int catId		= set.getInt("catId");
				int userId		= set.getInt("userId");
				Posts post = new Posts(pid, pTitle, pContent, pCode, pPic, pDate, catId, userId);
				list.add(post);
				
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<Posts> getPostByCatId(int catId){
		List<Posts> list = new ArrayList<>();
		
		try {
			PreparedStatement p = con.prepareStatement("SELECT * FROM POSTS WHERE catId=?");
			p.setInt(1, catId);
			ResultSet set = p.executeQuery();
			while(set.next()) {
				int pid 	    = set.getInt("pid");
				String pTitle   = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode	= set.getString("pCode");
				String pPic		= set.getString("pPic");
				Timestamp pDate	= set.getTimestamp("pDate");
				int userId		= set.getInt("userId");
				Posts post = new Posts(pid, pTitle, pContent, pCode, pPic, pDate, catId, userId);
				list.add(post);
				
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
		
	}
}
