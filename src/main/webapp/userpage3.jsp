<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%
    	String msg=request.getParameter("msg");
    	HttpSession ses1=request.getSession();
    	String name=(String)ses1.getAttribute("Name");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=1.0">
<!--  <link href="/FoodBox/resources/css/page3.css" rel="stylesheet" type="text/css"> -->
<title>page3</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@900&display=swap" rel="stylesheet"> 
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet"> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
		#logo{
	font-family:'Montserrat',sans-serif;
	padding:10px;
}
.row{
	margin:0px;
}
#navbar
{
	padding:10px;
	margin:0px;
	box-shadow:0 2px 12px -4px;
}
#searchcontainer
{
	padding:10px;
}
#searchbar
{
	width:300px;
}
.form-inline
{
	padding:0px 0px 0px 50px;
	float:right;	
	margin:auto;
}
#itembox
{
	padding:2%;
	height:500px;
	box-shadow:0 2px 12px -4px;
}
#itemboxmsg
{
	padding:2% 5%;	
}
#itemboximg
{
	background-position:center;
	background-size:cover;
}
#boxed
{
	padding:5%;
}
@media only screen and (max-width:700px)
{
	#searchcontainer
	{
		width:200px;
		position:absolute;
		top:7px;
		right:0;
	}
	#boxed
	{
		padding:50px 40px;
	}
	#itemboximg
	{
		height:200px;
	}
	#itembox
	{
		padding:0px;
	}
	.foodtitle
	{
		text-align:center;
		font-size:24px;
		padding:20px;
	}
}
</style>
</head>
<body>
	<div>
		<div id="navbar" class="row">
				<a href="userhome.jsp?msg=<%=name %>"  class="col-md-2 col-sm-12" style="text-decoration:none;color:black;"><div id="logo">FoodBox</div></a>
				<div class="col-md-10 col-sm-12" id="searchcontainer">
			<!--  <form action="notuser2" method="post" class="form-inline">
					<input placeholder="search" type="search" name="search" id="searchbar" class="form-control"  style="display:inline-block; ">
					<button type="submit" class="btn" style="display:inline-block;padding-top:5px "><i class="fa fa-search"></i></button>
					</form> -->	
					<a href="kart.jsp" style="padding:0 20px;color:#dc3545;float:right"><i class="fa fa-cart-plus" style="font-size:30px"></i></a>
					<a href="userpage2.jsp" style="padding:0 20px;color:#dc3545;float:right;"><i class="fa fa-arrow-left" style="font-size:30px"></i></a>	
					
				</div>
				
		</div>
		<div id="boxed">
		<div class="row" id="itembox">
			<%
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://awsdb.cg2a3l4mwr3i.ap-south-1.rds.amazonaws.com:3306/foodbox","root","rootraja");
		//	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/foodbox","root","rootraja");
		//	Connection con=DriverManager.getConnection("jdbc:mysql://awsdb.cg2a3l4mwr3i.ap-south-1.rds.amazonaws.com:3306/medicare","root","rootraja");
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from fooditems_table where Id='"+msg+"'");
			while(rs.next()){
			%>
			
			<div class="col-md-5 col-sm-12" id="itemboximg" style="background-image:url('/FoodBox/resources/img/<%=rs.getString("ImgName") %>');">
			</div>
		
			<div class="col-md-7 col-sm-12" id="itemboxmsg">
						<div class="foodtitle" style="font-family:'Montserrat',sans-serif;"><%=rs.getString("FoodName") %></div>
						<h3><%=rs.getString("Cousines") %> (<%=rs.getString("Category") %>)</h3>
						<p>Description: <%=rs.getString("Description") %><br>
						<div>Discount<%=rs.getString("DiscountPercentage") %></div>
						<div>Price: Rs.<%=rs.getString("Price") %></div>
					<div style="padding:20px 0px;">
					<span><a href="kartpayment.jsp?msg=<%=rs.getString("Id") %>" style="display:inline-block;"><button class="btn btn-primary" style="margin-right:20px;">Buy</button></a>
						<form action="userkart" method="post" style="display:inline-block;"><button type="submit" name="addcart" value="<%=rs.getString("Id") %>" class="btn btn-warning" onclick="kart()">Add to kart</button></form>
					</span>	
					</div>
			</div>
			<%
			}
			%>
		</div>
		</div>
	</div>
	<script>
		function kart()
		{
			alert("Item added to Cart");
		}
	</script>
</body>
</html>