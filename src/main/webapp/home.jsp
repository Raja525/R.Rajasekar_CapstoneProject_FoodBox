<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" import="java.util.ArrayList" %>
<%
	String msg=request.getParameter("msg");
%>
<!DOCTYPE html>
<html>
<head>
	<link href="/FoodBox/resources/css/home.css" rel="stylesheet">
	<title>Home</title>
	<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1" >
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@900&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/da37389ee8.js" crossorigin="anonymous"></script>
<style>
#section4 a
{
	text-decoration:none;
	color:black;
	padding:none;
	margin:none;
}
#imagecontainer
{
	background-image:linear-gradient(rgba(0,0,0,0.5),rgba(0,0,0,0.5),rgba(0,0,0,0.5)),url('/FoodBox/resources/img/home2.jpg');
		background-size:cover;
		background-position:center;
		background-repeat:no-repeat;	
}
#sec2title
{
	padding:1% 1% 2% 1%;
	font-family:'Montserrat',sans-serif;
	font-weight:900;
	text-align:center;
	font-size:32px;
}
#sec3title
{
	padding:1% 1% 2% 1%;
	font-family:'Montserrat',sans-serif;
	font-weight:900;
	text-align:center;
	font-size:32px;
}
.msg
{
	opacity:0;
	width:100%;
	height:300px;
}
.msg:hover
{
	opacity:1;
	transition:0.5s ease;
	transition-duration:1s;
	background-image:linear-gradient(rgba(0,0,0,0.5),rgba(0,0,0,0.5),rgba(0,0,0,0.5)),url('/FoodBox/resources/img/French.jpg');
		background-size:cover;
		background-position:center;
		background-repeat:no-repeat;
}
#section2 .img
{
	background-size:cover;
	background-position:center;
	height:300px;
	padding:0;
}
#section2 .row
{
	padding:0;
}
#section2 .msg
{
	padding: 6% 20%;
	color:white;
}
.cardtitle
{
	font-family:'Montserrat',sans-serif;
	font-size:20px;
}
.card-text
{
	text-align:center;
	color:red;
	font-weight:bold;
}
#section4 .row
{
padding:6% 0;
}
#section4 .card
{
	margin:auto;
	box-shadow:10px 10px 12px -5px;
}
#section4 .card:hover
{
	transform:rotateZ(5deg);
	transition-duration:1s;
	transition:0.5s ease-in-out;
}
#section4
{
	background-color:#0CECDD;
	padding:5%;
}
#options .links
{
	padding:1% 2%;
}
#options .links:hover
{
	padding:1% 5%;
	transition-duration:1s;
	transition:0.5s ease;
}
@media only screen and (max-width:700px)
{
	.row
	{
		margin:0px;
	}
	#slogn
	{
		font-size:70px;
		font-weight:900;
		font-family:'Montserrat',sans-serif;
		line-height:80px;
		padding:120px 20px 40px 20px;
	}
	#options
	{
		width:100%;
		padding: 20px 30px;
	}
	#options .links
	{
	padding:1% 5%;
	}
	.box
	{
	padding:20px;
	}
	#section3 .sectitle
	{
		padding:3rem 20px;
	}
	#section3 .container
	{
		padding:20px 10px 48px 10px;
	}
	#sec2title
	{
		padding:3rem 20px;
	}
	#section2 .msg
	{
		padding:8% 10%;
		opacity:1;
	}
	#section2
	{
	padding: 5% 5% 20% 5%;
	}
	#section5
	{
		padding:1%;
		padding-bottom:5%;
	}
	#sec1,#sec2,#sec3
	{
		height:auto;
		padding:5%;
	}
	#sec1
	{
		text-align:center;
	}
	#img1,#img2,#img3,#img4
	{
		background-size:cover;
	background-position:center;
	height:300px;
	}
	
}
</style>
</head>

<body>
        <!-- image section -->
        <div id="imagecontainer">
         	<div id="logo">FoodBox</div>
       
        	<div id="options" class="nav-bar">
            <a href="page2.jsp" class="links">Search</a>
            <a href="signup.jsp" class="links">Sign Up</a>
             <a href="signin.jsp" class="links" id="signin">Sign In</a>
        	</div>
        	<div id="slogn">Eat <br>What <br>You <span style="color:#f54748">Love!</span></div>
         
         	<div id="searchcontainer">
         		<a href="page2.jsp"><button class="btn">Search Your Fav Food!</button></a>
         	</div>
         </div>
               
    
<!--------------------------------------- Page body section -------------------------------------------->

<div id="section4">
<div id="sec3title">Discouts For U!</div>
	<div class="row">
		<a href="page2.jsp?msg=1" class="col-md-4 col-lg-4 box"><div>
			<div class="card" style="width: 18rem;">
  				<img class="card-img-top" src="/FoodBox/resources/img/ChickenBiryani.jpg" alt="Card image cap">
  				<div class="card-body">
  					<center class="cardtitle">Chicken Biryani</center>
    			<div class="card-text">
    				Discount - 10% 
    			</div>
  				</div>
			</div>
		</div></a>
		<a href="page2.jsp?msg=6" class="col-md-4 col-lg-4 box"><div >
			<div class="card" style="width: 18rem;">
  				<img class="card-img-top" src="/FoodBox/resources/img/GrillChicken.jpg" alt="Card image cap">
  				<div class="card-body">
  					<center class="cardtitle">Grill Chicken</center>
    			<div class="card-text">
    				Discount - 5% 
    			</div>
  				</div>
			</div>
		</div></a>
		<a href="page2.jsp?msg=2" class="col-md-4 col-lg-4 box"><div >
			<div class="card" style="width: 18rem;">
  				<img class="card-img-top" src="/FoodBox/resources/img/ChickenTikka.jpg" alt="Card image cap">
  				<div class="card-body">
  					<center class="cardtitle">Chicken Tikka</center>
    			<p class="card-text">
    				Discount - 5% 
    			</p>
  				</div>
			</div>
		</div></a>
	</div>
		<div class="row">
		<a href="page2.jsp?msg=3" class="col-md-4 col-lg-4 box"><div >
			<div class="card" style="width: 18rem;">
  				<img class="card-img-top" src="/FoodBox/resources/img/ChickFriedRice.jpg" alt="Card image cap">
  				<div class="card-body">
    			<div class="card-text">
    				Discount - 12% 
    			</div>
  				</div>
			</div>
		</div></a>
		<a href="page2.jsp?msg=12" class="col-md-4 col-lg-4 box"><div >
			<div class="card" style="width: 18rem;">
  				<img class="card-img-top" src="/FoodBox/resources/img/Poori.jpg" alt="Card image cap">
  				<div class="card-body">
  					<center class="cardtitle"></center>
    			<div class="card-text">
    				Discount - 4% 
    			</div>
  				</div>
			</div>
		</div></a>
		<a href="page2.jsp?msg=8" class="col-md-4 col-lg-4 box"><div >
			<div class="card" style="width: 18rem;">
  				<img class="card-img-top" src="/FoodBox/resources/img/MuttonBiryani.jpg" alt="Card image cap">
  				<div class="card-body">
  					<center class="cardtitle">Mutton Biryani</center>
    			<p class="card-text">
    				Discount - 15% 
    			</p>
  				</div>
			</div>
		</div></a>
	</div>
</div>

<div id="section3">
	<div class="sectitle">Some Fav Dishes around world</div>
	
	<div id="container">
	<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
     <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="3" aria-label="Slide 4"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="/FoodBox/resources/img/biryanicarosal.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>Indian Biryani</h5>
        <p>Famous Indian Dish.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="/FoodBox/resources/img/chickenrollcarsal.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>Chinese Chicken kob</h5>
        <p>Famous Chinese Dish.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="/FoodBox/resources/img/maxicancarosal.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>Mexican Fry</h5>
        <p>Famous Mexican Dish.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="/FoodBox/resources/img/pancakescarosal.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>American Pancake</h5>
        <p>Famous American Dish.</p>
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
	</div>	
</div>


<div id="section2">
<div id="sec2title">Historical Foods</div>
	<div id="imgcontainer">
	<a href="page2.jsp?msg=Indian"><div class="row">
		<div id="img1" class="col-md-12 col-lg-12 img" style="background-image:url('/FoodBox/resources/img/indian.jpg');">
			<div class="msg">
				<div class="title">Indian</div>
				<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
			</div>
		</div>
		
	</div></a>
	<a href="page2.jsp?msg=Chineese"><div class="row">
		<div id="img2" class="col-md-12 col-lg-12 img" style="background-image:url('/FoodBox/resources/img/Chinese.jpg');">
				<div class="msg">
			<div class="title">Chineese</div>
				<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>	</div>
		
			</div>
	</div></a>
	<a href="page3.jsp?msg=Italian"><div class="row">
		<div id="img3" class="col-md-12 col-lg-12 img" style="background-image:url('/FoodBox/resources/img/Italian.jpg');">
				<div class="msg">
			<div class="title">Italian</div>
				<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p></div>
		</div>
		</div></a>
	<a href="page2.jsp?msg=French"><div class="row">
		<div id="img4" class="col-md-12 col-lg-12 img" style="background-image:url('/FoodBox/resources/img/Franch.jpg');">
				<div class="msg">
			<div class="title">French</div>
				<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p></div>
		</div>
	</div></a>
	</div>
</div>


<div id="section5">
	<div class="row">
			<div class="col-md-4 col-sm-12"><div id="sec1"> &copy Medicare 2021,pvt.</div></div>
			<div class="col-md-4 col-sm-12"><div id="sec2">
			<div style="font-family:'Montserrat',sans-serif;">Follow us</div>
				<p>Insta: rajasekar6667</p>
				<p>Facebook: rajasekar</p>
				<p>What's app: 8220743247</p>
			</div>
			</div>
			<div class="col-md-4 col-sm-12"><div id="sec3">
				<div style="font-family:'Montserrat',sans-serif;">Contact Us</div>
					<p>Mail id: rajasekar.rs525@gmail.com</p>
					<p>Phone no: 8220743247</p>
					<p>Address: FoodBox,rajapalayum road,<br>Adaiyar,<br>chennai-600028</p>
			</div></div>
		</div>
<div>

</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
	<script>
function additems(id)
{
	//arr.push(id);
	//alert("Clicked");
	document.getElementById("btn"+id).setAttribute("style","background-color:#f54748; color:black; border:none");
	document.getElementById("btn"+id).innerHTML="Added";
	//for(var i=0;i<arr.length;i++)
	//	{
		//console.log(arr);
		//}
}
</script>
</body>
</html>