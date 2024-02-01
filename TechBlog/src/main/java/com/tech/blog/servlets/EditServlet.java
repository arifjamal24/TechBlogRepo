package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

/**
 * Servlet implementation class EditServlet
 */
@WebServlet("/edit")
@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
//		fetch all data
		String name  	= request.getParameter("username");
		String email 	= request.getParameter("email");
		String password = request.getParameter("password");
		String about	= request.getParameter("about");
		String gender   = request.getParameter("gender");
		
		Part part = request.getPart("profileImg");
		String imgName	= part.getSubmittedFileName();
		
//		get user from session
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("currentUser");
		user.setName(name);
		user.setEmail(email);
		user.setPassword(password);
		user.setGender(gender);
		user.setAbout(about);
		
		String oldImgName = user.getProfile();
		user.setProfile(imgName);
		
		
//		update user
		UserDao ud = new UserDao(ConnectionProvider.getConnection());
		boolean status = ud.updateUser(user);
		if(status) {		
			String path = request.getRealPath("/")+"pics"+File.separator+user.getProfile();	
			
//			delete old file
			String pathOldFile = request.getRealPath("/")+"pics"+File.separator+oldImgName;	
			if(!oldImgName.equals("default.png"))
			Helper.deleteFile(pathOldFile);
			
				if(Helper.saveFile(part.getInputStream(), path)) {
					Message msg = new Message("Profile details is updated successfully.....","success","alert-success");
					session.setAttribute("msg", msg);
				}
				else {
					Message msg = new Message("Something went wrong.....","error","alert-danger");
					session.setAttribute("msg", msg);
				}
			
			
		}
		else {
			Message msg = new Message("Something went wrong.....","error","alert-danger");
			session.setAttribute("msg", msg);
		}
		
		
		
		response.sendRedirect("profile.jsp");
	}

}
