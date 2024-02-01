<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.tech.blog.helper.*"%>
<!doctype html>
<html lang="en">
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

<title>home page</title>
<!-- <link rel="icon" type="image/x-icon" href="fa fa-home"> -->
<style type="text/css">
.banner-background{
clip-path: polygon(20% 0%, 80% 0%, 100% 0, 100% 99%, 65% 87%, 34% 100%, 0 95%, 0 0);
}
</style>
</head>
<body>

	<!-- navbar -->
	<%@ include file="normal_navbar.jsp"%>

	<!-- Banner -->
	<div class="container-fluid p-0 m-0">
		<div class="jumbotron primary-background text-white banner-background">
			<div class="container p-0 m-0">
				<h3 class="display-3">Welcome to TechBlog</h3>
				<p>A programming language is a system of notation for writing
					computer programs. The source code for a simple computer program
					written in the C programming language. The gray lines are comments
					that help explain the program to humans in a natural language. When
					compiled and run, it will give the output "Hello, world!". A
					programming language is usually described in terms of its syntax
					(form) and semantics (meaning). These are usually defined by a
					formal language.[citation needed] A language usually has at least
					one implementation in the form of a compiler or interpreter,
					allowing programs written in the language to be executed.

					Programming language theory is the subfield of computer science
					that studies the design, implementation, analysis,
					characterization, and classification of programming languages.</p>
				<p>The term computer language is sometimes used interchangeably
					with programming language. However, the usage of both terms varies
					among authors, including the exact scope of each. One usage
					describes programming languages as a subset of computer
					languages.Similarly, languages used in computing that have a
					different goal than expressing computer programs are generically
					designated computer languages.</p>

				<button class="btn btn-outline-light btn-lg">
					<span class="fa fa-bullhorn"></span>&nbsp;Start ! It Free
				</button>
				<a href="loginPage.jsp" class="btn btn-outline-light btn-lg ml-2">
					<span class="fa fa-sign-in"></span>&nbsp;Login
				</a>
			</div>
		</div>
	</div>
<br>

	<!-- card -->
	<div class="container">
		<div class="row mb-2">
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java Programming Language</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java Programming Language</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java Programming Language</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java Programming Language</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java Programming Language</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java Programming Language</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>
			</div>
		</div>
	</div>




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