package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class RegsiterServlet
 */
@WebServlet("/signup")
@MultipartConfig
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		
		String check	= request.getParameter("check");	
		if(check != null) {
			
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String email	= request.getParameter("email");
			String gender	= request.getParameter("gender");
			String about	= request.getParameter("about");

//			create user object and set all data in user object
			User user = new User(username,password,email,gender,about);
			
//			create a User dao object
			UserDao dao = new UserDao(ConnectionProvider.getConnection());
			if(dao.saveUser(user)) {
				out.println("done");
			}else {  out.println("error");  }
			
			
			
			
		} else { out.print("Box is not check"); }
		
		
		
		
		
	}

}
