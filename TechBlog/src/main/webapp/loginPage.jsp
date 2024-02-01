<%@page import="com.tech.blog.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
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
<title>login page</title>
<style type="text/css">
.banner-background {
	clip-path: polygon(20% 0%, 80% 0%, 100% 0, 100% 99%, 65% 87%, 34% 100%, 0 95%, 0 0);
}
</style>
</head>
<body>
	<%@include file="normal_navbar.jsp"%>

	<main
		class="d-flex align-items-center primary-background banner-background"
		style="height: 100vh;">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card" style="box-shadow: 3px 3px 8px #666666;">
						<div class="card-header primary-background text-white text-center">
							<span class="fa fa-user fa-3x"></span> <br>
							<p>login here</p>
						</div>
						<%
						Message msg = (Message) session.getAttribute("msg");
						if (msg != null) {
						%>
						<div class="alert <%=msg.getCssClass() %>" role="alert"><%=msg.getContent()%></div>
						<%
						session.removeAttribute("msg");
						}
						%>
						<div class="card-body">
							<form action="signin" method="post">
								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input
										type="email" class="form-control" id="exampleInputEmail1"
										required aria-describedby="emailHelp"
										placeholder="Enter email" name="email"> <small
										id="emailHelp" class="form-text text-muted">We'll
										never share your email with anyone else.</small>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										type="password" class="form-control" required
										id="exampleInputPassword1" placeholder="Password"
										name="password">
								</div>
								<div class="container text-center">
									<button type="submit" class="btn btn-primary">login</button>
								</div>
							</form>
						</div>




					</div>

				</div>
			</div>

		</div>

	</main>


	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script src="js/myjs.js" type="text/javascript"></script>
</body>
</html>