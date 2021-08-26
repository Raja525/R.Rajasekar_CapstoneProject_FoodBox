<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>adminedit</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=1.0">
<!--  <link href="/Medicare/resources/CSS/style.css" rel="stylesheet" type="text/css"> -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@900&display=swap" rel="stylesheet"> 
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet"> 
<style>
@charset "ISO-8859-1";
#title
{
	text-align:center;
	font-family:'Montserrat',sans-serif;
}
#updateform input,#updateform select
{
	margin-bottom:10px;
}
</style>
</head>
<body>
	<div style="padding:100px;">
	 <%
    	String id=request.getParameter("msg");
    	HttpSession update=request.getSession();
    	update.setAttribute("Id", id);
    Class.forName("com.mysql.jdbc.Driver");
//	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/foodbox","root","rootraja");
	Connection con=DriverManager.getConnection("jdbc:mysql://awsdb.cg2a3l4mwr3i.ap-south-1.rds.amazonaws.com:3306/foodbox","root","rootraja");
//		Connection con=DriverManager.getConnection("jdbc:mysql://awsdb.cg2a3l4mwr3i.ap-south-1.rds.amazonaws.com:3306/medicare","root","rootraja");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from fooditems_table where Id='"+id+"'");
	while(rs.next())
	{	
    %>
	<div class="row" style="padding:20px;margin-bottom:50px;border-radius:10px;box-shadow:0px 2px 12px -2px black;">
				<div id="title">Update Products</div>
				<div style="padding:50px 20%;">
					<form action="updatefood" method="post" id="updateform">
						<input type="text" class="form-control" name="foodname" value="<%=rs.getString("FoodName") %>" placeholder="FoodName">
						<input type="text" class="form-control" name="price"  value="<%=rs.getString("Price") %>" placeholder="Price">
						<input type="text" class="form-control" name="description" placeholder="Description"  value="<%=rs.getString("Description") %>">
						<input type="text" class="form-control" name="imgname" placeholder="ImgName"  value="<%=rs.getString("ImgName") %>">
						<input type="text" class="form-control" name="cousines" placeholder="ProductType"  value="<%=rs.getString("Cousines") %>">
						<input type="text" class="form-control" name="disprice" placeholder="Brand"  value="<%=rs.getString("DiscountPercentage") %>">
						<select name="category" class="form-control">
							<option value="NonVeg" selected>NonVeg</option>
							<option value="Veg">Veg</option>
						</select>
						<select name="status" class="form-control">
							<option value="enable" selected>Enable</option>
							<option value="disable">Disable</option>
						</select>
						<input type="submit" id="btn" class="btn btn-primary" value="Update">
					</form>
				</div>
			</div>
			  <%} %>
	</div>		
</body>
</html>