<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.*"%>


<div class="row">

	<%
	Thread.sleep(1000);
	User user = (User) session.getAttribute("currentUser");
	if (user == null) {
		response.sendRedirect("loginPage.jsp");
	}
	
	PostDao d = new PostDao(ConnectionProvider.getConnection());
	int cid = Integer.parseInt(request.getParameter("cid"));
	List<Posts> post = null;
	if (cid == 0) {
		post = d.getAllPosts();
	} else {
		post = d.getPostByCatId(cid);
	}

	if (post.size() == 0) {
		out.print("<h3 class='display-3 text-center'>No post in this Category</h3>");
		return;
	}

	for (Posts p : post) {
	%>
	<div class="col-md-6 mt-2">
		<div class="card">
			<img class="card-img-top" src="blog_pics/<%=p.getpPic()%>"
				alt="Card image cap">
			<div class="card-body postBox py-2">
				<b><%=p.getpTitle()%></b>
				<p><%=p.getpContent()%></p>
				<pre><%=p.getpCode()%></pre>
			</div>
			<div class="card-footer text-center primary-background">
				<%
				LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
				%>
				<a href="#!" onclick="doLike(<%=p.getPid()%>,<%=user.getId()%>)"
					class="btn btn-outline-primary btn-sm text-white"><i
					class="fa fa-thumbs-o-up text-white"></i><span class="like-count"><%=ld.countLikeOnPost(p.getPid())%></span></a>
				<a href="#!" class="btn btn-outline-primary btn-sm text-white"><i
					class="fa fa-commenting-o text-white"></i><span>20</span></a> <a
					href="showBlog.jsp?pid=<%=p.getPid()%>"
					class="btn btn-outline-primary btn-sm text-white">Read more...</a>

			</div>

		</div>

	</div>
	<%
	}
	%>
</div>