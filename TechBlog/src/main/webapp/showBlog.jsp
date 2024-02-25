<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Posts"%>
<%@page import="com.tech.blog.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page errorPage="error.jsp"%>
<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("loginPage.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link href="css/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.banner-background {
	clip-path: polygon(20% 0%, 80% 0%, 100% 0, 100% 99%, 65% 87%, 34% 100%, 0 95%, 0 0);
}
.post-title{
font-weight:100;
font-size:30px;
}
.post-content{
font-weight:100;
font-size:25px;
}
.post-date{
font-style:italic;
font-weight:bold;
}
.post-userInfo{
font-size:20px;
font-weight:normal;
}
.row-user{
border: 1px solid #e2e2e2;
padding: 15px;
}

body{
background:url(img/wave.jpg);
background-size:cover;
background-attachment:fixed;
}

.position-sticky{
position:sticky;
top:0px;
z-index:100;
}
</style>

<%
int pid = Integer.parseInt(request.getParameter("pid"));
PostDao pd = new PostDao(ConnectionProvider.getConnection());
Posts p = pd.getPostByPostId(pid);
%>

<title><%=p.getpTitle()%> || by TechBlog</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark primary-background position-sticky">
		<a class="navbar-brand" href="index.jsp"><span
			class="fa fa-asterisk"></span> TechBlog</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="profile.jsp"><span class="fa fa-home"></span> Home <span
						class="sr-only">(current)</span></a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <span class="fa fa-laptop"></span>
						Catagories
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Android Development</a> <a
							class="dropdown-item" href="#">Advance Java</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Data Structure and
							Alogrithem</a>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="#"><span
						class="fa fa-address-book-o"></span> Contact</a></li>
				<li class="nav-item"><a class="nav-link" href="#!"
					data-toggle="modal" data-target="#add-post-modal"><span
						class="fa fa-file-o"></span> New Post</a></li>
			</ul>

			<ul class="navbar-nav mr-right">
				<li class="nav-item"><a class="nav-link" href="#!"
					data-toggle="modal" data-target="#profile-modal"><span
						class="fa fa-user-circle"></span> <%=user.getName()%></a></li>

				<li class="nav-item"><a class="nav-link" href="logout"><span
						class="fa fa-power-off"></span> logout</a></li>

			</ul>
		</div>
	</nav>

	<!-- end of navbar -->

	<!-- main content of body of read post start -->
	<div class="container">
		<div class="row my-4">
			<div class="col-md-6 offset-md-2">
				<div class="card">
					<div class="card-header primary-background text-white">
						<h4 class="post-title"><%=p.getpTitle()%></h4>
					</div>
					<div class="card-body">
					<img class="card-img-top my-3" src="blog_pics/<%=p.getpPic() %>" alt="Card image cap">
					<div class="row my-3 row-user">
					<div class="col-md-6">
					<%
					UserDao ud = new UserDao(ConnectionProvider.getConnection());					
					%>
					<p class="post-userInfo"><a href="#!"><%=ud.getUserByUserId(p.getUserId()).getName() %></a> has posted:</p>
					</div>
					<div class="col-md-6">
					<p class="post-date"><%=DateFormat.getDateTimeInstance().format(p.getpDate()) %></p>
					</div>
					</div>
						<p class="post-content"><%=p.getpContent()%></p>
						<br>
						<br>
						<%
						String code = (p.getpCode() == null) ? "NA" : p.getpCode();
						%>
						<div class="post-code">
						<pre><%=code%></pre>
						</div>
					</div>
					<div class="card-footer primary-background">
						<a href="#!" onclick="doLike(<%=p.getPid()%>,<%=user.getId()%>)" class="btn btn-outline-primary btn-sm text-white"><i
							class="fa fa-thumbs-o-up text-white"></i><span>10</span></a> <a href="#!"
							class="btn btn-outline-primary btn-sm text-white"><i
							class="fa fa-commenting-o text-white"></i><span>20</span></a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- main content of body of read post start -->
	<!-- profile modal -->
	<!-- Modal -->
	<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background text-white text-center">
					<h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img src="pics/<%=user.getProfile()%>" class="img-fluid"
							style="border-radius: 50%, max-width:150px; max-height: 150px;">
						<br>
						<h5 class="modal-title mt-3" id="exampleModalLabel"><%=user.getName()%></h5>
						<!-- profile details -->
						<div id="profile-details">
							<table class="table">
								<tbody>
									<tr>
										<th scope="row">ID:</th>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<th scope="row">Registered on:</th>
										<td><%=user.getDatetime()%></td>
									</tr>
									<tr>
										<th scope="row">Email:</th>
										<td><%=user.getEmail()%></td>
									</tr>
									<tr>
										<th scope="row">Gender:</th>
										<td><%=user.getGender()%></td>
									</tr>
									<tr>
										<th scope="row">Status:</th>
										<td><%=user.getAbout()%></td>
									</tr>
								</tbody>
							</table>
						</div>

						<!-- edit profile start -->
						<div id="profile-edit" style="display: none">
							<h5 class="mt-2">Please Edit Carefully</h5>
							<form action="edit" method="post" enctype="multipart/form-data">
								<table class="table">
									<tbody>
										<tr>
											<th scope="row">ID:</th>
											<td><%=user.getId()%></td>
										</tr>
										<tr>
											<th scope="row">Registered on:</th>
											<td><%=user.getDatetime()%></td>
										</tr>
										<tr>
											<th scope="row">Name:</th>
											<td><input type="text" name="username"
												class="form-control" value="<%=user.getName()%>"></td>
										</tr>
										<tr>
											<th scope="row">Email:</th>
											<td><input type="email" name="email"
												class="form-control" value="<%=user.getEmail()%>"></td>
										</tr>
										<tr>
											<th scope="row">Password:</th>
											<td><input type="password" name="password"
												class="form-control" value="<%=user.getPassword()%>"></td>
										</tr>
										<tr>
											<th scope="row">Password:</th>
											<td><input type="text" name="gender"
												class="form-control"
												value="<%=user.getGender().toUpperCase()%>"></td>
										</tr>
										<tr>
											<th scope="row">About:</th>
											<td><textarea rows="5" name="about" class="form-control"><%=user.getAbout()%>
											</textarea></td>
										</tr>
										<tr>
											<th scope="row">change profile:</th>
											<td><input type="file" class="form-control-file"
												name="profileImg" value="<%=user.getProfile()%>"></td>
										</tr>

									</tbody>
								</table>
								<div class="container">
									<button type="submit" class="btn btn-outline-primary">save</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" id="edit-profile-btn" class="btn btn-primary">Edit</button>
				</div>
			</div>
		</div>
	</div>
	<!-- end of profile modal -->

	<!-- add post modal start -->
	<!-- Modal -->
	<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background text-white">
					<h5 class="modal-title" id="exampleModalLabel">Provide the
						post details...</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="add-post-form" action="" method="post">
						<div class="form-group">
							<label for="catId">Category</label> <select class="form-control"
								id="catId" name="catId">
								<option selected disabled>---select category---</option>
								<%
								ArrayList<Category> list = pd.getAllCategories();
								for (Category c : list) {
								%>
								<option value=<%=c.getCid()%>><%=c.getCname()%></option>
								<%
								}
								%>
							</select>
						</div>


						<div class="form-group">
							<input type="text" name="title" class="form-control"
								placeholder="Enter post Title">
						</div>
						<div class="form-group">
							<textarea name="content" class="form-control"
								placeholder="Enter post Content" style="height: 200px;"></textarea>
						</div>
						<div class="form-group">
							<textarea name="code" class="form-control"
								placeholder="Enter your program (if any)" style="height: 100px;"></textarea>
						</div>
						<div class="form-group">
							<label>select image (if any)</label> <input type="file"
								name="imgFile" class="form-control-file">
						</div>
						<div class="container text-center">
							<button type="submit" class="btn btn-outline-primary">post</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- add post modal end -->

	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"
		type="text/javascript"></script>
	<script src="js/myjs.js" type="text/javascript"></script>
</body>
</html>