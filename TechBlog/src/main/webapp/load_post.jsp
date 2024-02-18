<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Posts"%>

<div class="row">

<%
	PostDao d = new PostDao(ConnectionProvider.getConnection());
	List<Posts> post = d.getAllPosts();
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