<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" import="java.util.ArrayList" %>
    <%
    HttpSession ses1=request.getSession();
	String name=(String)ses1.getAttribute("Name");
	String Id=null;
	ArrayList<String> foodlist=new ArrayList<String>();
	Class.forName("com.mysql.jdbc.Driver");
//	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/foodbox","root","rootraja");
	Connection con=DriverManager.getConnection("jdbc:mysql://awsdb.cg2a3l4mwr3i.ap-south-1.rds.amazonaws.com:3306/foodbox","root","rootraja");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select UserId from userdetail_table where Name='"+name+"'");
	while(rs.next())
	{
		Id=rs.getString("UserId");
		 HttpSession ses2=request.getSession(); //----------------------------------------ses2 for userid(UserId)/ ses1 for username(Name)----//
		 ses2.setAttribute("UserId", Id);
	}
	ResultSet rs1=st.executeQuery("select FoodId from kart_table where UserId='"+Id+"'");
	while(rs1.next())
	{
		foodlist.add(rs1.getString("FoodId"));
	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=1.0">
<!--  <link href="/Medicare/resources/CSS/style.css" rel="stylesheet" type="text/css"> -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@900&display=swap" rel="stylesheet"> 
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet"> 
<title>My Kart</title>
<style type="text/css">
@charset "ISO-8859-1";

	
#displaynone
{
	
}
.row
{
	margin:0px;padding:0px;
}
#order
{
	padding:10px; font-family:'Montserrat',sans-serif; border-radius:5px; width:100px;
}
#calculation
{
	position:fixed;right:1px;
	boder:solid 1px black;
}
#itemmsg
{
	padding:20px 40px;
}
#item
{
	margin:0px;
	padding:1rem;
}
#itemimg
{
	height:250px;
	background-size:cover;
	background-repeat:no-repeat;
	background-position:center;
}
#navbar
{
	font-family:'Montserrat',sans-serif;
	font-weight:900;
	font-size:20px;
	padding:2%;
}
#removebtn
{
padding:5% 0;
}
#content
{
padding:20px 50px;
}
#item.row
{
	margin-bottom:50px;
	box-shadow:0 2px 12px -4px;
}
@media only screen and (max-width:700px)
{
	#displaynone
	{
		border-right:none;
	}
	#calculation
	{
		position:relative;
		bottom:0;
	}
		#itemmsg
		{
			padding:8% 5%;
		}
		#itemimg
		{
			height:300px;
		}
		#item
		{
			padding:5%;
		}
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
		#calculation
	{
		padding:20px 20px 40px 20px;
	}
	#item
	{
		padding:0;
	}
	.foodtitle
	{
		text-align:center;
		font-size:24px;
		padding-bottom:20px;
	}
	#removebtn
	{
		padding:14px 35%;
	}
	#content
	{
		padding:20px;
	}
	#content #order
	{
	padding:0;
	width:300px;
	}
}
</style>
</head>
<body>
		<div id="navbar" class="row">
				<a href="home.jsp"  class="col-md-2 col-sm-12" style="text-decoration:none;color:black;"><div id="logo">FoodBox</div></a>
				<div class="col-md-10 col-sm-12" id="searchcontainer">
					<a href="#" style="padding:0 20px;color:#dc3545;float:right"><i class="fa fa-cart-plus" style="font-size:30px"></i></a>
					<a href="page2.jsp" style="padding:0 20px;color:#dc3545;float:right;"><i class="fa fa-arrow-left" style="font-size:30px"></i></a>	
				</div>
		</div>
	
	
	<div class="row">
		<div class="col-lg-8 col-md-8 col-sm-12" style="padding:40px">
			<div id="displaynone">
		<% 
		int total=0;
		
	//	Class.forName("com.mysql.jdbc.Driver");
	//	Connection con2=DriverManager.getConnection("jdbc:mysql://localhost:3307/foodbox","root","rootraja");
	//		Connection con1=DriverManager.getConnection("jdbc:mysql://awsdb.cg2a3l4mwr3i.ap-south-1.rds.amazonaws.com:3306/medicare","root","rootraja");
	//	Statement st2=con2.createStatement();
		for(int i=0;i<foodlist.size();i++)
		{
		ResultSet rs2=st.executeQuery("select * from fooditems_table where Id='"+foodlist.get(i)+"'");
		while(rs2.next())
			{
				total=total+Integer.parseInt(rs2.getString("Price"));
			%>
					<a href="userpage3.jsp?msg=<%=rs2.getString("Id") %>" style="text-decoration:none;color:black;">
					<div id="item" class="row">
						<div class="col-md-4 col-sm-12" id="itemimg" style="background-image:url('/FoodBox/resources/img/<%=rs2.getString("ImgName") %>');">
						</div>
						<div class="col-md-6 col-sm-12" id="content">
							<div class="foodtitle" style="font-family:'Montserrat',sans-serif;"><%=rs2.getString("FoodName") %></div>
							<span><%=rs2.getString("Cousines") %>(<%=rs2.getString("Category") %>)</span>
							<div style="color:red;">Discount<%=rs2.getString("DiscountPercentage") %></div>
							<div id="order" style="padding:10px; font-family:'Montserrat',sans-serif;">Price: Rs.<%=rs2.getString("Price") %></div>
						</div>			
						<div class="col-md-2 col-sm-12" id="removebtn">
							<form action="removekart" method="post"><button type="submit" class="btn btn-danger" name="removekart" value="<%=rs2.getString("Id")%>">Remove</button></form>
						</div>
					</div></a>
			    <%
			
			}
		}
		%>
		</div>
		</div>
			
		<div class="col-lg-4 col-md-4 col-sm-6" id="calculation">
			<div style="boder:solid 1px black;">
				<div style="font-family:'Montserrat',sans-serif;text-align:center;padding:20px;">Bill Amount</div>
				<div style="padding:10px;border:solid 1px;border-radius:5px;margin-bottom:10px;">
					<h5>Subtotal = Rs.<%=total %></h5>
				</div>
				
			<span>	<a href="kartpayment.jsp"  style="display:inline-block;margin-right:20px;"><button onclick="proceed()" class="btn btn-primary">Proceed</button></a>
					<a href="userpage2.jsp"  style="display:inline-block;"><button class="btn btn-primary">Back</button></a> </span>	
			</div>
		</div>
		
	</div>
	<script>
	count();
	function count(){
		var count=<%=total%>
		if(count==0){
			alert("No Item Added")
			var list=document.getElementById('displaynone');
			list.innerHTML='Item Not Added!';
			list.style.textAlign='center';
			list.style.fontFamily='Montserrat',sans-serif;
		}
	}
	
	function proceed()
	{
		confirm("Can we Proceed with this Items!");
	}
	</script>
</body>
</html>
