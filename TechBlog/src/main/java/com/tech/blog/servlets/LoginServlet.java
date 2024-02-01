package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/signin")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
//		fetch user name and password from request
		String username = request.getParameter("email");
		String password = request.getParameter("password");
		
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		User user = dao.getUserByEmailAndPassword(username, password);
		
		if(user != null) {			
			HttpSession session = request.getSession();
			session.setAttribute("currentUser", user);
			response.sendRedirect("profile.jsp");
		}
		else{
//			out.println("Invalid details..... try again");
			Message msg = new Message("Invalid details..... try again","error","alert-danger");
			HttpSession session = request.getSession();
			session.setAttribute("msg", msg);
			response.sendRedirect("loginPage.jsp");
		}
		
	}

}
