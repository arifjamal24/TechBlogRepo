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
		class="primary-background p-5"
		style="height: 100%;">
		<div class="container">
			<div class="row">
				<div class="col-md-6 offset-md-3">
					<div class="card" style="box-shadow: 3px 3px 8px #666666;">
						<div class="card-header primary-background text-white text-center">
							<span class="fa fa-user-plus fa-3x"></span> <br>
							<p>signup here</p>
						</div>
						<div class="card-body">
							<form id="reg-form" action="signup" method="post">
								<div class="form-group">
									<label for="username">User Name</label> <input type="text" name="username"
										class="form-control" placeholder="username">
								</div>

								<div class="form-group">
									<label>Select Gender:</label> 
									<label for="male">Male</label> 
									<input type="radio" id="male" value="male" name="gender">	
									<label for="female">Female</label>	 							
									<input type="radio" id="female" value="female" name="gender" >
								</div>

								<div class="form-group">
								
								<textarea class="form-control" name="about" rows="5" placeholder="Enter something about yourself"></textarea>
								</div>

								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input
										type="email" class="form-control" id="exampleInputEmail1" name="email"
										aria-describedby="emailHelp" placeholder="Enter email">
									<small id="emailHelp" class="form-text text-muted">We'll
										never share your email with anyone else.</small>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										type="password" class="form-control" name="password"
										id="exampleInputPassword1" placeholder="Password">
								</div>
								<div class="form-check">
									<input type="checkbox" class="form-check-input" name="check"
										id="exampleCheck1"> <label class="form-check-label"
										for="exampleCheck1">agree terms and condition</label>
								</div>
								<div class="container text-center" id="loader" style="display:none;">
								<span class="fa fa-refresh fa-spin fa-4x"></span>
								<h4>please wait...</h4>
								</div>
								<br>
								<button id="submit-btn" type="submit" class="btn btn-primary">signup</button>
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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" type="text/javascript"></script>
	
	
	<script type="text/javascript">
	$(document).ready(function(){
		
    $("#reg-form").on('submit',function(event){    	
    	event.preventDefault();
    	
		function emptyFormFields() {
		//	$('form :input').val('');
			$('form :input, form :checkbox, form :radio').val('');

		}
		
		
    	let form = new FormData(this);
    	$('#submit-btn').hide();
    	$('#loader').show();
    	$.ajax({
    		url:"signup",
    		type:'POST',
    		data:form,
    		success:function(data){
    		//	console.log("this is data",data);
    	    	$('#submit-btn').show();
    	    	$('#loader').hide();
    	    	
    	    	if(data.trim() == 'done'){
    	    	swal({
    	    		  icon: "success",
    	    		  title:"saved successfully"	  
    	    		}).then((value) => { window.location = "loginPage.jsp"});
    	    	emptyFormFields();
    	    	
    	    	} // if data == done
    	    	else { swal(data); }
    	    	
    		},
    		error:function(error){
    		//	console.log(error);
    	    	$('#submit-btn').show();
    	    	$('#loader').hide();
    	    	swal({
    	    		  text: error,
    	    		});
    		},
    		processData:false,
    		contentType:false
    	});
    	
    });
    
		
	})
	
	</script>
</body>
</html>