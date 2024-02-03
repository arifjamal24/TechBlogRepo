package com.tech.blog.servlets;

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

import com.tech.blog.entities.User;

/**
 * Servlet implementation class AddNewPost
 */
@WebServlet("/newPost")
@MultipartConfig
public class AddNewPost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddNewPost() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		String   title = request.getParameter("title");
		int	     catId = Integer.parseInt(request.getParameter("catId"));
		String content = request.getParameter("content");
		String    code = request.getParameter("code");
		Part	  part = request.getPart("imgFile");
		String fileName = part.getSubmittedFileName();
		
		HttpSession	session = request.getSession();
		User user = (User) session.getAttribute("currentUser");
		
		out.print(fileName);
	}

}
