<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" import="java.util.ArrayList" %>
    <%
    
    HttpSession detail=request.getSession();
    String name=(String)detail.getAttribute("Name");
    String mail=(String)detail.getAttribute("Mail");
    String mobile=(String)detail.getAttribute("Mobile");
    String address=(String)detail.getAttribute("Address");
    String itemid=(String)detail.getAttribute("Itemid");
    
  //  System.out.println(name+" "+mail+" "+mobile+" "+address+" "+itemid);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Receipt Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@900&display=swap" rel="stylesheet"> 
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet"> 
<link href="https://fonts.googleapis.com/css2?family=Squada+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=MonteCarlo&family=Squada+One&family=Titillium+Web:wght@200&display=swap" rel="stylesheet">
<style type="text/css">
@charset "ISO-8859-1";	
	#title
	{
		font-family: 'Squada One', cursive;
		font-size:32px;
		border-bottom:solid 1px gray;
		text-align:center;
	}
	#container
	{
		padding:2% 5%;
	}
	#wish
	{
		font-family: 'Titillium Web', sans-serif;
		font-size:40px;
		text-align:center;
		padding:20px;
	}
	.row{
	margin:0px;
	padding:2% 5% 6% 5%;
	}
	h5{
	text-align:center;
	}
	#itembox
	{
	height:540px;padding:40px 50px;margin:0px;
	}
	#itemboximg
	{
		
		background-size:cover;background-repeat:no-repeat;background-position:center;
	}
	#itemboxmsg
	{
		padding:5%;
	}
	
@media only screen and (max-width:700px)
{
	#itembox
	{
	 padding:5%;
	}
	#itemboximg
	{
		height:300px;	
	}
	#itemboxmsg
	{
		padding:8% 5%;
	}
	.data
	{
		padding:5%;
	}
}
</style>
</head>
<body>
<div id="container">
	<div id="title">FoodBox</div>
	<div id="wish">Thank you for purchase</div>
	<div>
		<%
	
		Class.forName("com.mysql.jdbc.Driver");
			Connection con1=DriverManager.getConnection("jdbc:mysql://awsdb.cg2a3l4mwr3i.ap-south-1.rds.amazonaws.com:3306/foodbox","root","rootraja");
    //	Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3307/foodbox","root","rootraja");
	//	Connection con1=DriverManager.getConnection("jdbc:mysql://awsdb.cg2a3l4mwr3i.ap-south-1.rds.amazonaws.com:3306/medicare","root","rootraja");
    	Statement st1=con1.createStatement();
    	ResultSet rs1=st1.executeQuery("select * from fooditems_table where Id='"+itemid+"'");
    	while(rs1.next())
    	{
		%>
		<div class="row">
			<div class="col-md-4 col-sm-12" id="itemboximg" style="background-image:url('/FoodBox/resources/img/<%=rs1.getString("ImgName") %>');"></div>
			<div class="col-md-8 col-sm-12" id="itemboxmsg" >
				<div class="" style="font-family:'Montserrat',sans-serif;"><%=rs1.getString("FoodName") %></div>
							<span><%=rs1.getString("Cousines") %>(<%=rs1.getString("Category") %>)</span>
							<p>Description:<br><%=rs1.getString("Description") %></p>
							<div>Discount: <%=rs1.getString("DiscountPercentage") %></div>
							<div id="order" style="padding:10px 0px; font-family:'Montserrat',sans-serif; border-radius:5px;">Price: Rs.<%=rs1.getString("Price") %></div>
			</div>
		</div>
		<%
    	}
    		
		%>
	</div>
	<div id="sec2">
		<div class="row">
		
			<div class="col-md-6 col-sm-12 data">
				<h5>Customer Details</h5>
				<div>
					<div style="font-family:'Montserrat',sans-serif;"><%=name%></div>
					<div>Mail: <%=mail%></div>
					<div>Mobile: <%=mobile%></div>
				</div>	
			</div>
			<div class="col-md-6 col-sm-12 data">
				<h5>Shipping Address</h5>
				<div>
					<div><span style="font-family:'Montserrat',sans-serif;">Address:</span> <%=address %></div>
					<div style="margin:20px 0px;"><button class="btn btn-warning" onclick="window.print()">Print</button></div>
				</div>
			</div>
			
		</div>
		<a href="page2.jsp"><button class="btn btn-primary" style="width:100%;">Return to Purchase</button></a>
		
	</div>
	</div>
</body>
</html>