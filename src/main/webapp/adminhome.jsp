<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%
    	String result=request.getParameter("msg");
    	String sort=request.getParameter("message");
    	//System.out.println(result);
    	if(result==null)
    	{
    		result="1";
    	}
    //	System.out.println(result);
    %>
<!DOCTYPE html>
<html>
<head>
<link href="/FoodBox/resources/css/adminhome.css" rel="stylesheet">
	<title>Admin Home</title>
	<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1" >
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@900&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/da37389ee8.js" crossorigin="anonymous"></script>
<style>
#content
{
	padding:20px 40px;
}
#compress
{
	padding:5%;
}
#foodlist input
{
	margin-bottom:20px;
}
#sidebar form
{
	box-shadow:0 2px 12px -4px;
	padding:2rem 1rem;
}
#sidebar
{
border:none;
padding:4rem 1rem;
}
#item
{
margin:3rem 2rem;
padding:20px 20px;
box-shadow:0px 2px 12px -4px;
}
#item.row
{
padding:20px;
margin:3rem 1rem;
}
#itemimg
{
	heigth:100%;
	background-size:cover;
	background-repeat:no-repeat;
	background-position:center;
}
#itemlist
{
	padding:10px 20px;
}
#title
{
	box-shadow:0 2px 12px -4px;
	border:none;
}
#status
{
font-family:'Montserrat',sans-serif;
padding:10px 20px;
float:right;
}
a{
	color:black;
	text-decoration:none;
}
a:hover
{
color:black;
	text-decoration:none;
}
</style>
</head>
<body>
	<div id="title">
		<div class="row">
			<div class="col-md-6">FoodBox</div>
			<a href="home.jsp" class="col-md-6 user"><div>Admin</div></a>
		</div>
	</div>
	<div class="row" id="bodybox">
	<div id="sidebar" class="col-md-3">
	<form action="adminhome" method="post">
	<ul>
		<li><button type="submit" name="select" value="1" style="background-color:transparent;border:none">Dashboard</button></li>
		<li><button type="submit" name="select" value="2" style="background-color:transparent;border:none">Add Food</button></li>
		<li><button type="submit" name="select" value="3" style="background-color:transparent;border:none">Update Food</button></li>
		<li><button type="submit" name="select" value="4" style="background-color:transparent;border:none">Delete Food</button></li>
		<li><button type="submit" name="select" value="5" style="background-color:transparent;border:none">Enable/Disable</button></li>
	</ul>
	</form>
	</div>
	<div id="foodlist" class="col-md-9">
		<div class="content">
		
		<%
	
		if(result.equals("1")) //msg loop1
		{
		
%>
		
			<div id="container">
			<div id="sort">Sort By : 
			<span>
				<form action="adminsort" method="post" style="display:inline-block;padding:0px 10px;"><input type="submit" class="btn btn-danger" name="sort" value="Price"></form>
				<form action="adminsort" method="post" style="display:inline-block;padding:0px 10px;"><input type="submit" name="sort" value="Category" class="btn btn-danger"></form>
				<form action="adminsort" method="post" style="display:inline-block;padding:0px 10px;"><input type="submit" value="Id" name="sort" class="btn btn-danger"></form>
			</span>
			</div>	
			
<%
	Class.forName("com.mysql.jdbc.Driver");
//	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/foodbox","root","rootraja");	
	Connection con=DriverManager.getConnection("jdbc:mysql://awsdb.cg2a3l4mwr3i.ap-south-1.rds.amazonaws.com:3306/foodbox","root","rootraja");
	//Connection con=DriverManager.getConnection("jdbc:mysql://awsdb.c1dzwtudyvfv.us-east-2.rds.amazonaws.com:3306/phase4db","root","rootraja");
	Statement st=con.createStatement();
	ResultSet rs;
	if(sort!=null){
		 rs=st.executeQuery("select * from fooditems_table order by "+sort+" ASC");
	}else
	{
		rs=st.executeQuery("select * from fooditems_table");
	}
	while(rs.next())
	{
%>
					<div id="item" class="row">
						<div class="col-md-4 col-sm-12" id="itemimg" style="background-image:url('/FoodBox/resources/img/<%=rs.getString("ImgName") %>');">
						</div>
						<div class="col-md-8 col-sm-12" id="content">
							<div style="font-family:'Montserrat',sans-serif;"><%=rs.getString("FoodName") %></div>
							<span><%=rs.getString("Cousines") %>(<%=rs.getString("Category") %>)</span>
							<div style="background-color:#dc3545;padding:6px 4px;color:white;border-radius:5px;width:120px;text-align:center;">Discount <%=rs.getString("DiscountPercentage") %>%</div>
							<div id="order" style="padding:10px 0;text-decoration:line-through;color:red; font-family:sans-serif; border-radius:5px; width:100px;">Price: Rs.<%=rs.getString("Price") %></div>
							<%
								String dis=rs.getString("DiscountPercentage");
								String pri=rs.getString("Price");
								int discount=100-Integer.valueOf(dis);
								int price=Integer.valueOf(pri);
								float amount=(discount*price)/100;
								int amt= (int)amount;
							%>
							<div id="order" style="padding:0px 0; font-family:'Montserrat',sans-serif; border-radius:5px;">Price: Rs.<%=amt %></div>
					</div>			
						
					</div>
<%		
	}
	%>
	</div>
	<%
		} //if closed
		else if(result.equals("2"))
		{
			%>
				<div style="text-align:center;font-family:'Montserrat',sans-serif;">Add Food</div>
				<div id="compress">
					<form action="addfood" method="post">
						<input type="text" name="foodname" class="form-control" placeholder="Food Name">
						<input type="number" name="price" class="form-control" placeholder="Price">
						<input type="text" name="cousines" class="form-control" placeholder="Cousines">
						<input type="text" name="description" class="form-control" placeholder="Description">
						<input type="text" name="imgname" class="form-control" placeholder="ImgName">
						<input type="number" name="disprice" class="form-control" placeholder="Discount Price">
						<select name="status" class="form-control">
								<option value="enable" selected>Enable</option>
								<option value="disable">Disable</option>
							</select><br>
						<select name="category" class="form-control">
								<option value="NonVeg" selected>NonVeg</option>
								<option value="Veg">Veg</option>
							</select><br>
						<input type="submit" class="btn btn-dark">
					</form>
				</div>
			<%
		}
		else if(result.equals("3"))
		{
			%>
				<div id="container">
				<div id="sort">Sort By : 
				<span>
				<form action="adminsort" method="post" style="display:inline-block;padding:0px 10px;"><input type="submit" class="btn btn-danger" name="sort" value="Price"></form>
				<form action="adminsort" method="post" style="display:inline-block;padding:0px 10px;"><input type="submit" name="sort" value="Category" class="btn btn-danger"></form>
				<form action="adminsort" method="post" style="display:inline-block;padding:0px 10px;"><input type="submit" value="Id" name="sort" class="btn btn-danger"></form>
				</span>
				</div>
<%
	Class.forName("com.mysql.jdbc.Driver");
//	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/foodbox","root","rootraja");	
	Connection con=DriverManager.getConnection("jdbc:mysql://awsdb.cg2a3l4mwr3i.ap-south-1.rds.amazonaws.com:3306/foodbox","root","rootraja");
	//Connection con=DriverManager.getConnection("jdbc:mysql://awsdb.c1dzwtudyvfv.us-east-2.rds.amazonaws.com:3306/phase4db","root","rootraja");
	Statement st=con.createStatement();
	ResultSet rs;
	if(sort!=null){
		 rs=st.executeQuery("select * from fooditems_table order by "+sort+" ASC");
	}else
	{
		rs=st.executeQuery("select * from fooditems_table");
	}
	while(rs.next())
	{
%>
				<div id="item" class="row">
					<div class="col-md-4">
						<img class="foodlist" alt="" src="/FoodBox/resources/img/<%=rs.getString("ImgName") %>" />
					</div>
					<div class="content col-md-8">
						<div class="style" style="font-family:'Montserrat',sans-serif;">Dish: <%=rs.getString("FoodName") %> (<%=rs.getString("Cousines") %>)</div>
				
						<div style="background-color:#dc3545;padding:6px 4px;color:white;border-radius:5px;width:120px;text-align:center;">Discount <%=rs.getString("DiscountPercentage") %>%</div>
							<div id="order" style="padding:10px 0;text-decoration:line-through;color:red; font-family:sans-serif; border-radius:5px; width:100px;">Price: Rs.<%=rs.getString("Price") %></div>
							<%
								String dis=rs.getString("DiscountPercentage");
								String pri=rs.getString("Price");
								int discount=100-Integer.valueOf(dis);
								int price=Integer.valueOf(pri);
								float amount=(discount*price)/100;
								int amt= (int)amount;
							%>
							<div id="order" style="padding:0px 0; font-family:'Montserrat',sans-serif; border-radius:5px;">Price: Rs.<%=amt %></div>
				
						<br>
						<a href="adminupdate.jsp?msg=<%=rs.getString("Id") %>"><button type="submit" name="update" class="btn btn-danger">Update</button></a></div>
				</div>	
				
		  	
<%
		}
	%></div><%
		}
		else if(result.equals("4"))
		{
			%>
		
			<div id="container">
				<div id="sort">Sort By : 
				<span>
				<form action="adminsort" method="post" style="display:inline-block;padding:0px 10px;"><input type="submit" class="btn btn-danger" name="sort" value="Price"></form>
				<form action="adminsort" method="post" style="display:inline-block;padding:0px 10px;"><input type="submit" name="sort" value="Category" class="btn btn-danger"></form>
				<form action="adminsort" method="post" style="display:inline-block;padding:0px 10px;"><input type="submit" value="Id" name="sort" class="btn btn-danger"></form>
				</span>
				</div>
<%
	Class.forName("com.mysql.jdbc.Driver");
//	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/foodbox","root","rootraja");	
	Connection con=DriverManager.getConnection("jdbc:mysql://awsdb.cg2a3l4mwr3i.ap-south-1.rds.amazonaws.com:3306/foodbox","root","rootraja");
	//Connection con=DriverManager.getConnection("jdbc:mysql://awsdb.c1dzwtudyvfv.us-east-2.rds.amazonaws.com:3306/phase4db","root","rootraja");
	Statement st=con.createStatement();
	ResultSet rs;
	if(sort!=null){
		 rs=st.executeQuery("select * from fooditems_table order by "+sort+" ASC");
	}else
	{
		rs=st.executeQuery("select * from fooditems_table");
	}
	while(rs.next())
	{
%>
				<div id="item" class="row">
					<div class="col-md-4">
						<img class="foodlist" alt="" src="/FoodBox/resources/img/<%=rs.getString("ImgName") %>" />
					</div>
					<div class="content col-md-8">
						<div class="style" style="font-family:'Montserrat',sans-serif;">Dish: <%=rs.getString("FoodName") %> (<%=rs.getString("Cousines") %>)</div>
				
						<div style="background-color:#dc3545;padding:6px 4px;color:white;border-radius:5px;width:120px;text-align:center;">Discount <%=rs.getString("DiscountPercentage") %>%</div>
							<div id="order" style="padding:10px 0;text-decoration:line-through;color:red; font-family:sans-serif; border-radius:5px; width:100px;">Price: Rs.<%=rs.getString("Price") %></div>
							<%
								String dis=rs.getString("DiscountPercentage");
								String pri=rs.getString("Price");
								int discount=100-Integer.valueOf(dis);
								int price=Integer.valueOf(pri);
								float amount=(discount*price)/100;
								int amt= (int)amount;
							%>
							<div id="order" style="padding:0px 0; font-family:'Montserrat',sans-serif; border-radius:5px;">Price: Rs.<%=amt %></div>
				
						<br>
						<form action="deletefood" method="post"><button type="submit" name="deletefood" value="<%=rs.getString("Id") %>" class="btn btn-danger">Delete</button></form></div>
				</div>		
		  	
<%
		}
	%></div><%
		}
		else if(result.equals("5")) //5
			{%>
			
			<div id="container">
				<div id="sort">Sort By : 
				<span>
				<form action="adminsort" method="post" style="display:inline-block;padding:0px 10px;"><input type="submit" class="btn btn-danger" name="sort" value="Price"></form>
				<form action="adminsort" method="post" style="display:inline-block;padding:0px 10px;"><input type="submit" name="sort" value="Category" class="btn btn-danger"></form>
				<form action="adminsort" method="post" style="display:inline-block;padding:0px 10px;"><input type="submit" value="Id" name="sort" class="btn btn-danger"></form>
				</span>
				</div>
<%
	Class.forName("com.mysql.jdbc.Driver");
//	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/foodbox","root","rootraja");	
	Connection con=DriverManager.getConnection("jdbc:mysql://awsdb.cg2a3l4mwr3i.ap-south-1.rds.amazonaws.com:3306/foodbox","root","rootraja");
	//Connection con=DriverManager.getConnection("jdbc:mysql://awsdb.c1dzwtudyvfv.us-east-2.rds.amazonaws.com:3306/phase4db","root","rootraja");
	Statement st=con.createStatement();
	ResultSet rs;
	if(sort!=null){
		 rs=st.executeQuery("select * from fooditems_table order by "+sort+" ASC");
	}else
	{
		rs=st.executeQuery("select * from fooditems_table");
	}
	while(rs.next())
	{
%>
				<div id="item" class="row">
					<div class="col-md-4">
						<img class="foodlist" alt="" src="/FoodBox/resources/img/<%=rs.getString("ImgName") %>" />
					</div>
					<div class="content col-md-8">
						<div class="style" style="font-family:'Montserrat',sans-serif;">Dish: <%=rs.getString("FoodName") %> (<%=rs.getString("Cousines") %>)</div>
				
						<div style="background-color:#dc3545;padding:6px 4px;color:white;border-radius:5px;width:120px;text-align:center;">Discount <%=rs.getString("DiscountPercentage") %>%</div>
							<div id="order" style="padding:10px 0;text-decoration:line-through;color:red; font-family:sans-serif; border-radius:5px; width:100px;">Price: Rs.<%=rs.getString("Price") %></div>
							<%
								String dis=rs.getString("DiscountPercentage");
								String pri=rs.getString("Price");
								int discount=100-Integer.valueOf(dis);
								int price=Integer.valueOf(pri);
								float amount=(discount*price)/100;
								int amt= (int)amount;
							%>
							<div id="order" style="padding:0px 0; font-family:'Montserrat',sans-serif; border-radius:5px;">Price: Rs.<%=amt %></div>
				
						<br>	
						<div id="status"><%=rs.getString("Status") %></div>
						
						<form action="changestatus" method="post"><button type="submit" name="change" value="<%=rs.getString("Id") %> <%=rs.getString("Status")%>" class="btn btn-danger">Change Status</button></form></div>
				</div>		
		  	
<%
				
	}
	%></div><%
			}
%>
	
		</div>
	</div>
		
	</div>
	<script type="text/javascript">
	
	fadding();
		function fadding()
		{
			var status=document.getElementById("status").innerText;
			console.log(status);
			if(status.equals("enable"))
				{
					document.getElementById("item").style.;
				}
			else if(status.equals("disable"))
				{
				document.getElementById("item").style.opacity="0.5";
				}
			
		}
	</script>
</body>
</html>