<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Sign Up</title>
<link href="/FoodBox/resources/css/login.css" rel="stylesheet">
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1" >
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@900&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/da37389ee8.js" crossorigin="anonymous"></script>
<style type="text/css">
.button
	{
		padding:6px 12px;
		text-decoration:none;
		color:black;
		margin:0 10px;
	}
	#container .btn
	{
		margin-bottom:0;
	}
	@media only screen and (max-width:700px)
	{
		#imagebox #container
		{
		padding:0;
		}
		#container form
		{
		padding:100px 0;
		}
		#container form input
		{
		margin-bottom:20px;
		}
	}
</style>
</head>
<body>
<div id="title">Sign Up</div>
	<div id="imagebox">
		<div id="container">
		<form action="signup" method="post">
			<input type="text" class="form-control" placeholder="username" name="name">
			<input type="email" class="form-control" placeholder="mail" name="mail">
			<input type="number" class="form-control" placeholder="mobile" name="mobile">
			<input type="text" class="form-control" placeholder="address" name="address">
			<input type="password" class="form-control" placeholder="password" name="password">
			
			<input type="submit" class="btn btn-dark" value="Sign Up">
			<a href="signin.jsp" class="btn btn-warning button">Back</a>
		</form>
		</div>
	</div>
</body>
</html>