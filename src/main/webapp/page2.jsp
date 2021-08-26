<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
     <%
     	String msg=request.getParameter("msg");
     	System.out.println(msg);
     %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=1.0">
<!--  <link href="/Medicare/resources/CSS/style.css" rel="stylesheet" type="text/css"> -->
<title>Item search</title>
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
#itemlist
{
	padding:10px 20px;
}

#content
{
	padding:20px 40px;
}
span
{
font-family:'Montserrat',sans-serif;	
}
#filter
{
padding:30px 20px;

}
#sort
{
padding:1rem 0 1rem 1rem;
}
#item
{
margin:3rem 2rem;padding:20px 20px;
box-shadow:0px 2px 12px -4px;
}
#itemimg
{
	heigth:100%;
	background-size:cover;
	background-repeat:no-repeat;
	background-position:center;
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
.formtitle
{
	font-family:'Montserrat'sans-serif;
	font-size:18px;
	padding:10px 0;
	text-align:center;
}
#Filter2
{
	padding:1rem;
	margin-top:20px;
	box-shadow:0 5px 12px -4px;
	border-radius:5px;
}
#Filter2 button
{
	margin:10px 0; 
}
#accordionFlushExample
{
	box-shadow:0 5px 12px -4px;
	border-radius:5px;
}
@media only screen and (max-width:700px)
{
	#cart
	{
		position:absolute;
		top:1rem;
		right:2rem;
	}
	.form-inline
	{
		padding:0;
	}
	#searchbar
	{
		width:200px;
	}
	#searchcontainer
	{
		padding:50px 10px 10px 10px;
	}
	.form-inline .btn
	{
		 background-color:#dc3545;
	}
	#itemimg
	{
	height:300px;
	}
	#item.row
	{
		margin:3rem 0;
	}
	#content
	{
		padding:20px;
	}
	#content .itemheading
	{
		text-align:center;
		padding:20px 0;
		font-size:24px;
	}
	#item
	{
		padding:0;
	}
	#itemlist,#filter
	{
	padding:2rem;
	}
}
</style>
</head>
<body id="page2">
	<body>
	<div>
		<div id="navbar" class="row">
				<a href="home.jsp"  class="col-md-2 col-sm-12" style="text-decoration:none;color:black;"><div id="logo">FoodBox</div></a>
				<div class="col-md-10 col-sm-12" id="searchcontainer">
					<form action="search" method="post" class="form-inline">
					<input placeholder="search" type="search" name="search" id="searchbar" class="form-control"  style="display:inline-block; ">
					<button type="submit" class="btn" style="display:inline-block;padding-top:5px "><i class="fa fa-search"></i></button>
					<a href="#" style="padding:0 20px;color:#dc3545"><i  id="cart"  class="fa fa-cart-plus" style="font-size:30px"></i></a>
					</form>
				</div>
				
		</div>
		<div class="row" style="margin:0px;">
			<div class="col-md-3 col-sm-12" id="filter">
			
					
			<div class="accordion accordion-flush" id="accordionFlushExample">
		
  				<div class="accordion-item">
    				<h2 class="accordion-header" id="flush-headingOne">
      				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
        				Cousines
      				</button>
    				</h2>
    				<div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
      					<div class="accordion-body">
      							
						  <span><form action="filter" method="post" style="display:inline-block;padding:5px 0px 0px 0px;"><input class="btn btn-outline-secondary" type="submit" name="checkbox" value="Indian"></form>
      							<form action="filter" method="post" style="display:inline-block;padding:5px 0px 0px 0px;"><input class="btn btn-outline-secondary" type="submit" name="checkbox" value="French"></form>
      							<form action="filter" method="post" style="display:inline-block;padding:5px 0px 0px 0px;"><input class="btn btn-outline-secondary" type="submit" name="checkbox" value="Continental"></form>
      							<form action="filter" method="post" style="display:inline-block;padding:5px 0px 0px 0px;"><input class="btn btn-outline-secondary" type="submit" name="checkbox" value="Italian"></form>
      					  </span>	     							
      					</div>
  					</div>
  				</div>	
  				<div class="accordion-item">
    				<h2 class="accordion-header" id="flush-headingTwo">
      				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
        			Category
      				</button>
    				</h2>
    				<div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
      					<div class="accordion-body">
      					  <span><form action="filter" method="post" style="display:inline-block;padding:5px 0px 0px 0px;"><input class="btn btn-outline-secondary" type="submit" name="checkbox" value="Veg"></form>
      							<form action="filter" method="post" style="display:inline-block;padding:5px 0px 0px 0px;"><input class="btn btn-outline-secondary" type="submit" name="checkbox" value="NonVeg"></form>
      						</span>
      					</div>
  					</div>
  				</div>	
  				<div class="accordion-item">
    				<h2 class="accordion-header" id="flush-headingThree">
      				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
        			Discount
      				</button>
    				</h2>
    				<div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
      					<div class="accordion-body">
      					  <span><form action="filter" method="post" style="display:inline-block;padding:5px 0px 0px 0px;"><button class="btn btn-outline-secondary" type="submit" name="checkbox" value="5">Discount - 5%</button></form>
      							<form action="filter" method="post" style="display:inline-block;padding:5px 0px 0px 0px;"><button class="btn btn-outline-secondary" type="submit" name="checkbox" value="10">Discount - 5% to 10%</button></form>
      							<form action="filter" method="post" style="display:inline-block;padding:5px 0px 0px 0px;"><button class="btn btn-outline-secondary" type="submit" name="checkbox" value="15">Discount - Above 10%</button></form>
      					 </span>	
						</div>
  					</div>
  				</div>	
			</div>
	
					<div id="Filter2">
						<div>
							<form action="filter2" method="post">
							<div class="formtitle">Cousines</div>
								<input type="radio" name="cousine" value="Indian"><label>Indian</label> <br>
								<input type="radio" name="cousine" value="Continental"><label>Continental</label> <br>
								<input type="radio" name="cousine" value="French"><label>French</label><br>
								<input type="radio" name="cousine" value="Italian"><label>Italian</label><br>
								<hr>
							<div class="formtitle">Category</div>			
								<input type="radio" name="category" value="Veg"><label>Veg</label><br>
								<input type="radio" name="category" value="NonVeg"><label>NonVeg</label><br>
								<hr>
								<button type="submit" class="btn btn-dark">Filter</button>
							</form>
						</div>
					</div>
			</div>
			<div class="col-md-9 col-sm-12" id="itemlist">
				<div id="sort">Sort By :<br> <span><form action="sort" method="post" style="display:inline-block;padding:10px 10px;"><input type="submit" class="btn btn-danger" name="sort" value="Price"></form>
				<form action="sort" method="post" style="display:inline-block;padding:0px 10px;"><input type="submit" name="sort" value="Category" class="btn btn-danger"></form>
				<form action="sort" method="post" style="display:inline-block;padding:0px 10px;"><input type="submit" value="Id" name="sort" class="btn btn-danger"></form>
				</span>
				</div>
					<%
					HttpSession filterses=request.getSession();
					String cousine=(String)filterses.getAttribute("cousine");
					String category=(String)filterses.getAttribute("category");
					System.out.println(cousine+" "+category);
						int count=0;
						Class.forName("com.mysql.jdbc.Driver");
						Connection con=DriverManager.getConnection("jdbc:mysql://awsdb.cg2a3l4mwr3i.ap-south-1.rds.amazonaws.com:3306/foodbox","root","rootraja");
					//	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/foodbox","root","rootraja");
					//	Connection con=DriverManager.getConnection("jdbc:mysql://awsdb.cg2a3l4mwr3i.ap-south-1.rds.amazonaws.com:3306/medicare","root","rootraja");
						Statement st=con.createStatement();
						ResultSet rs;
						if(msg==null || msg=="" || msg==" ")
						{
							 rs=st.executeQuery("select * from fooditems_table where Status='enable'");
						}
						else if(msg.equals("combine"))
						{
							rs=st.executeQuery("select * from fooditems_table where Cousines='"+cousine+"' and Category='"+category+"' and Status='enable'");
						}
						else if(msg.equals("Price") || msg.equals("Id") || msg.equals("Category"))
						{
							 rs=st.executeQuery("select * from fooditems_table where Status='enable' order by "+msg+" ASC");
							
						}
						else
						{
							 rs=st.executeQuery("select * from fooditems_table where (Id='"+msg+"' or Cousines='"+msg+"' or Category='"+msg+"' or DiscountPercentage='"+msg+"') and (Status='enable') ");
						}
						while(rs.next()){
								count++;
								
					%>
					<a href="page3.jsp?msg=<%=rs.getString("Id") %>" style="text-decoration:none;color:black;">
					<div id="item" class="row">
						<div class="col-md-4 col-sm-12" id="itemimg" style="background-image:url('/FoodBox/resources/img/<%=rs.getString("ImgName") %>');">
						</div>
						<div class="col-md-8 col-sm-12" id="content">
							<div class="itemheading" style="font-family:'Montserrat',sans-serif;"><%=rs.getString("FoodName") %></div>
							<span><%=rs.getString("Cousines") %>(<%=rs.getString("Category") %>)</span>
							<div style="color:red;">Discount<%=rs.getString("DiscountPercentage") %></div>
							<div id="order" style="padding:10px; font-family:'Montserrat',sans-serif; border-radius:5px; width:100px;">Price: <%=rs.getString("Price") %></div>
						</div>			
						
					</div></a>
						
						<%}
						//System.out.println(count);
					%>
					</div>					
			</div>
</div>			

	<script>
	count();
		function count(){
			var count=<%=count%>
			if(count==0){
			var list=document.getElementById('itemlist');
			list.innerHTML='Data Not Found!';
			list.style.textAlign='center';
			list.style.fontFamily='Montserrat',sans-serif;
			}
		}
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</body>
</html>