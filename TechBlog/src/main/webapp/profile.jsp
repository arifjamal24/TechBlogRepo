<%@page errorPage="error.jsp"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.*, java.util.*"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>


<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("loginPage.jsp");
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">

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

.postBox{
height:200px;
}
</style>
<title>login page</title>

<title>Insert title here</title>
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

	<%
	Message msg = (Message) session.getAttribute("msg");
	if (msg != null) {
	%>
	<div class="alert <%=msg.getCssClass()%>" role="alert"><%=msg.getContent()%></div>
	<%
	session.removeAttribute("msg");
	}
	%>

<!-- main body of the page -->

<main>
<div class="container">
<div class="row mt-4">
<!-- first col -->

<div class="col-md-4">
<!-- categories part -->
<div class="list-group">
  <a href="#" onclick="getAllPost(0,this)" class="c-link list-group-item list-group-item-action active">
	All Posts
  </a>
  <%
  	PostDao p = new PostDao(ConnectionProvider.getConnection());
  	ArrayList<Category> list1 = p.getAllCategories();
  	for(Category c:list1){
  %>
  <a href="#" onclick="getAllPost(<%=c.getCid() %>,this)" class="c-link list-group-item list-group-item-action"><%=c.getCname() %></a>
<%} %>
</div>
</div>

<!-- second col -->
<div class="col-md-8">
<!-- posts part -->
<div class="container text-center" id="loader">
<i class="fa fa-refresh fa-4x fa-spin"></i>
<h3 class="mt-3">loading...</h3>
</div>
<div class="container-fluid" id="post-container">

</div>
</div>
</div>
</div>

</main>

<!-- end main body of the page -->

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
								PostDao pd = new PostDao(ConnectionProvider.getConnection());
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