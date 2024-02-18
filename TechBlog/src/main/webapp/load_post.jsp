<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Posts"%>

<div class="row">

<%
	Thread.sleep(1000);
	PostDao d = new PostDao(ConnectionProvider.getConnection());
int cid = Integer.parseInt(request.getParameter("cid"));
List<Posts> post = null;
if(cid == 0){
	post = d.getAllPosts();
}else{
	post = d.getPostByCatId(cid);
}

if(post.size() == 0){
	out.print("<h3 class='display-3 text-center'>No post in this Category</h3>");
	return;
}

	for(Posts p:post){
%>
<div class="col-md-6 mt-2">
<div class="card">
 <img class="card-img-top" src="blog_pics/<%=p.getpPic() %>" alt="Card image cap">
<div class="card-body">
<b><%=p.getpTitle() %></b>
<p><%=p.getpContent() %></p>
<pre><%=p.getpCode() %></pre>
</div>

</div>

</div>
<%} %>
</div>