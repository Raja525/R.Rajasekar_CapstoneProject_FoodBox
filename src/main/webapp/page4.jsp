<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%
    	//String amount=request.getParameter("msg");
    //HttpSession ses3=request.getSession();
    //ses3.setAttribute("amount", amount);
 //   String msg=request.getParameter("msg");
    
    String id=request.getParameter("msg");
    System.out.println(id+" ");
    HttpSession delivery=request.getSession();
    delivery.setAttribute("itemid", id);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=1.0">
<!--  <link href="/Medicare/resources/CSS/style.css" rel="stylesheet" type="text/css"> -->
<title>page3</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@900&display=swap" rel="stylesheet"> 
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet"> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
#item
{
	padding:2%;
	box-shadow:0 2px 12px -4px;
}
#box
{
	height:auto;padding:40px 50px;margin:0px;
}
#itemimg
{
	
	background-size:cover;
	background-repeat:no-repeat;
	background-position:center;
}
#content
{
	padding:20px 40px 60px 40px;
}
#form1,#form2,#form3,#form4,#form5{
	margin-bottom:10px;
}
#formcontainer input
{
	margin-bottom:10px;
}
#box1,#formcontainer
{
	padding:40px;
	box-shadow:0 2px 12px -4px;
}
@media only screen and (max-width:700px)
{
	#boxed
	{
		padding:50px 40px;
	}
	#itemimg
	{
		height:200px;
	}
	#item
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
	<div style="background-color:#64C9CF;box-shadow:2px 6px 12px -4px;font-family:'Montserrat',sans-serif;font-size:32px;padding:20px;text-align:center;color:white;">Payment</div>
	<div style="position:absolute;top:0;left:10px;padding:30px 20px;"><a href="page3.jsp?msg=<%=id %>" style="color:white;text-decoration:none;"><i class="fa fa-arrow-left" style="font-size:30px"></i></a></div>
	<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://awsdb.cg2a3l4mwr3i.ap-south-1.rds.amazonaws.com:3306/foodbox","root","rootraja");
//	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/foodbox","root","rootraja");
//	Connection con=DriverManager.getConnection("jdbc:mysql://awsdb.cg2a3l4mwr3i.ap-south-1.rds.amazonaws.com:3306/medicare","root","rootraja");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from fooditems_table where Id='"+id+"'");
	while(rs.next()){
	%>
	<div id="box">
			
					<div class="row" id="item">
						<div class="col-md-4 col-sm-12" id="itemimg" style="background-image:url('/FoodBox/resources/img/<%=rs.getString("ImgName") %>');">
			
						</div>
						<div class="col-md-8 col-sm-12" id="content">
							<div class="foodtitle" style="font-family:'Montserrat',sans-serif;"><%=rs.getString("FoodName") %></div>
							<span><%=rs.getString("Cousines") %>(<%=rs.getString("Category") %>)</span>
		
							<div>Discount: <%=rs.getString("DiscountPercentage") %></div>
							<div id="order" style="padding:10px 0px; font-family:'Montserrat',sans-serif; border-radius:5px;">Price: Rs.<%=rs.getString("Price") %></div>
						</div>			
						
					</div>
	</div>
	<%} %>
	<div class="row" style="margin:0px;">
		<div style="padding:0px 40px;font-family:'Montserrat',sans-serif;">Payment Details</div>
	<div class="col-md-6 col-sm-12" style="padding:30px;">
			<div id="box1">
			<input type="number" name="cardnumber" placeholder="card number" class="form-control" id="form1" required>
			<input type="text" name="ownername" placeholder="owner name" class="form-control" id="form2" required>
			<input type="number" name="cvv" placeholder="cvv" class="form-control" id="form3" required>
			<input type="date" name="expdate" placeholder="exp date" class="form-control" id="form4" required>
			</div>
	</div>
	<div class="col-md-6 col-sm-12" style="padding:30px;">
		<div id="formcontainer">
				<form action="receipt" method="post">
	  				<input type="text" class="form-control" placeholder="Name" name="name" required>
	  				<input type="email" class="form-control" placeholder="Mail Id" name="mail" required>
	  				<input type="number" class="form-control" placeholder="Mobile No" name="mobile" required>
	  				<input type="text" class="form-control" placeholder="Address" name="address" required>
	  				<button type="submit" class="btn btn-primary" name="itemid" value="<%=id %>" >Submit</button>
	  			</form>
    	</div>
	</div>
	</div>
	<script>
	function payment()
	{
		confirm("Can we Proceed with this Items!");
	}
	</script>
</body>
</html>