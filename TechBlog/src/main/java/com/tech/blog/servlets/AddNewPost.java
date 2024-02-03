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

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Posts;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

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
		System.out.println("----------"+catId);
		Posts post = new Posts(title, content, code, fileName, null, catId, user.getId());
		PostDao pd = new PostDao(ConnectionProvider.getConnection());
		if(pd.savePost(post)) {
			String pathFile = request.getRealPath("/")+"blog_pics"+File.separator+fileName;	
			Helper.saveFile(part.getInputStream(), pathFile);
			out.print("done");
		}
		else
			out.print("error");
		
		
	}

}
