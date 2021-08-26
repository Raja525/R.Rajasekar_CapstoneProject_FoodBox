package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class homecontroller {
	ArrayList<String> list=new ArrayList<String>();
	@RequestMapping("/")
	public void home(HttpServletRequest req,HttpServletResponse res) throws IOException, ClassNotFoundException, SQLException
	{
		res.sendRedirect("home.jsp");
	}
	@RequestMapping("/signin")
	public void signin(HttpServletRequest req,HttpServletResponse res) throws IOException, ClassNotFoundException, SQLException
	{
		String username=req.getParameter("username");
		String password=req.getParameter("password");
		
		if(username.equals("admin") && password.equals("123"))
		{
			res.sendRedirect("adminhome.jsp");
		}else {
		int val=0;
		Class.forName("com.mysql.jdbc.Driver");
	//	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/foodbox","root","rootraja");
		Connection con=DriverManager.getConnection("jdbc:mysql://awsdb.cg2a3l4mwr3i.ap-south-1.rds.amazonaws.com:3306/foodbox","root","rootraja");
		
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select Name,Password from userdetail_table");
		while(rs.next())
		{
			if((rs.getString("Name")).equals(username) && (rs.getString("Password")).equals(password))
			{
				val=1;
				
			}
			
		}
		switch(val)
		{
			case 0:
			{
				res.sendRedirect("signin.jsp");
				break;
			}
			case 1:
			{
				res.sendRedirect("userhome.jsp?msg="+username+"");
				break;
			}
		}
		}
		
	}
	@RequestMapping("/signup")
	public void signup(HttpServletRequest req,HttpServletResponse res) throws IOException, ClassNotFoundException, SQLException
	{
		String username=req.getParameter("name");
		String mail=req.getParameter("mail");
		String mobile=req.getParameter("mobile");
		String address=req.getParameter("address");
		String password=req.getParameter("password");
		
		Class.forName("com.mysql.jdbc.Driver");
	//	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/foodbox","root","rootraja");
		Connection con=DriverManager.getConnection("jdbc:mysql://awsdb.cg2a3l4mwr3i.ap-south-1.rds.amazonaws.com:3306/foodbox","root","rootraja");
		PreparedStatement ps=con.prepareStatement("insert into userdetail_table(Name,MailId,MobileNo,Address,Password)values(?,?,?,?,?)");
		ps.setString(1,username);
		ps.setString(2,mail);
		ps.setString(3,mobile);
		ps.setString(4,address);
		ps.setString(5,password);
		ps.executeUpdate();
		
		res.sendRedirect("signin.jsp");
	}
//	@RequestMapping("/signin")
//	public void receipthome(HttpServletRequest req,HttpServletResponse res) throws IOException
//	{
//		String item=req.getParameter("addcart");
//		list.add(item);
//		HttpSession ses=req.getSession();
//		ses.setAttribute("List",item);
//		String item2=(String)ses.getAttribute("List");
//		for(int i=0;i<list.size();i++)
//	  	{
//			System.out.print(list.get(i)+" ");
//	  	}
////		for(int i=0;i<item2.size();i++)
////	  	{
////			System.out.print(item2.get(i)+" ");
////	  	}
//		
//		res.sendRedirect("page3.jsp?msg="+item+"");
//	}
	@RequestMapping("/userkart")
	public void userkart(HttpServletRequest req,HttpServletResponse res) throws IOException, ClassNotFoundException, SQLException
	{
		String itemid=req.getParameter("addcart");
		HttpSession ses1=req.getSession();
		String name=(String)ses1.getAttribute("Name");
		String userid=null;
		
		Class.forName("com.mysql.jdbc.Driver");
	//	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/foodbox","root","rootraja");
		Connection con=DriverManager.getConnection("jdbc:mysql://awsdb.cg2a3l4mwr3i.ap-south-1.rds.amazonaws.com:3306/foodbox","root","rootraja");
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select UserId from userdetail_table where Name='"+name+"'");
		while(rs.next())
		{
			userid=rs.getString("UserId");
		}
		
		Class.forName("com.mysql.jdbc.Driver");
	//	Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3307/foodbox","root","rootraja");
		Connection con1=DriverManager.getConnection("jdbc:mysql://awsdb.cg2a3l4mwr3i.ap-south-1.rds.amazonaws.com:3306/foodbox","root","rootraja");
		PreparedStatement ps=con1.prepareStatement("insert into kart_table(UserId,FoodId)values(?,?)");
		ps.setString(1, userid);
		ps.setString(2, itemid);
		ps.executeUpdate();
		
		System.out.print(itemid);
		System.out.print(userid);
		res.sendRedirect("userpage3.jsp?msg="+itemid+"");
	}
	
	@RequestMapping("/receipt")
	public void receipt(HttpServletRequest req,HttpServletResponse res) throws IOException
	{
		String name=req.getParameter("name");
		String mail=req.getParameter("mail");
		String mobile=req.getParameter("mobile");
		String address=req.getParameter("address");
		String itemid=req.getParameter("itemid");
		System.out.println(itemid);
		HttpSession detail=req.getSession();
		detail.setAttribute("Name", name);
		detail.setAttribute("Mail", mail);
		detail.setAttribute("Mobile", mobile);
		detail.setAttribute("Address", address);
		detail.setAttribute("Itemid", itemid);
		
		res.sendRedirect("receipt.jsp");
	}
	@RequestMapping("/search")
	public void search(HttpServletRequest req,HttpServletResponse res) throws IOException
	{
		String search=req.getParameter("search");
		
		res.sendRedirect("page2.jsp?msg="+search+"");
	}
	@RequestMapping("/filter")
	public void filter(HttpServletRequest req,HttpServletResponse res) throws IOException
	{
		String filter=req.getParameter("checkbox");
		res.sendRedirect("page2.jsp?msg="+filter+"");
	}
	@RequestMapping("/filter2")
	public void filter2(HttpServletRequest req,HttpServletResponse res) throws IOException
	{
		String cousine=req.getParameter("cousine");
		String category=req.getParameter("category");
		HttpSession filterses=req.getSession();
		filterses.setAttribute("cousine", cousine);
		filterses.setAttribute("category", category);
		res.sendRedirect("page2.jsp?msg=combine");
	}
	@RequestMapping("/sort")
	public void sort(HttpServletRequest req,HttpServletResponse res) throws IOException
	{
		String sort=req.getParameter("sort");
		res.sendRedirect("page2.jsp?msg="+sort+"");
	}
	
	@RequestMapping("/usersearch")
	public void usersearch(HttpServletRequest req,HttpServletResponse res) throws IOException
	{
		String search=req.getParameter("search");
		
		res.sendRedirect("userpage2.jsp?msg="+search+"");
	}
	@RequestMapping("/userfilter")
	public void userfilter(HttpServletRequest req,HttpServletResponse res) throws IOException
	{
		String filter=req.getParameter("checkbox");
		res.sendRedirect("userpage2.jsp?msg="+filter+"");
	}
	@RequestMapping("/userfilter2")
	public void userfilter2(HttpServletRequest req,HttpServletResponse res) throws IOException
	{
		String cousine=req.getParameter("cousine");
		String category=req.getParameter("category");
		HttpSession filterses=req.getSession();
		filterses.setAttribute("cousine", cousine);
		filterses.setAttribute("category", category);
		res.sendRedirect("userpage2.jsp?msg=combine");
	}
	@RequestMapping("/usersort")
	public void usersort(HttpServletRequest req,HttpServletResponse res) throws IOException
	{
		String sort=req.getParameter("sort");
		res.sendRedirect("userpage2.jsp?msg="+sort+"");
	}
	@RequestMapping("/adminhome")
	public void adminhome(HttpServletRequest req,HttpServletResponse res) throws IOException
	{
		String option=req.getParameter("select");
		res.sendRedirect("adminhome.jsp?msg="+option+"");
	}
	@RequestMapping("/addfood")
	public void addfood(HttpServletRequest req,HttpServletResponse res) throws IOException, ClassNotFoundException, SQLException
	{
		String foodname=req.getParameter("foodname");
		String price=req.getParameter("price");
		String cousines=req.getParameter("cousines");
		String description=req.getParameter("description");
		String imgname=req.getParameter("imgname");
		String disprice=req.getParameter("disprice");
		String status=req.getParameter("status");
		String category=req.getParameter("category");
		
		Class.forName("com.mysql.jdbc.Driver");
	//	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/foodbox","root","rootraja");
		Connection con=DriverManager.getConnection("jdbc:mysql://awsdb.cg2a3l4mwr3i.ap-south-1.rds.amazonaws.com:3306/foodbox","root","rootraja");
		PreparedStatement ps=con.prepareStatement("insert into fooditems_table(FoodName,Price,Cousines,Description,ImgName,DiscountPercentage,Status,Category)values(?,?,?,?,?,?,?,?)");
		ps.setString(1, foodname);
		ps.setString(2, price);
		ps.setString(3, cousines);
		ps.setString(4, description);
		ps.setString(5, imgname);
		ps.setString(6, disprice);
		ps.setString(7, status);
		ps.setString(8, category);
		ps.executeUpdate();
		res.sendRedirect("adminhome.jsp?msg=2");
	}
	@RequestMapping("/updatefood")
	public void updatefood(HttpServletRequest req,HttpServletResponse res) throws IOException, ClassNotFoundException, SQLException
	{
		String foodname=req.getParameter("foodname");
		String price=req.getParameter("price");
		String cousines=req.getParameter("cousines");
		String description=req.getParameter("description");
		String imgname=req.getParameter("imgname");
		String disprice=req.getParameter("disprice");
		String status=req.getParameter("status");
		String category=req.getParameter("category");
		HttpSession update=req.getSession();
    	String id=(String)update.getAttribute("Id");
		
		Class.forName("com.mysql.jdbc.Driver");
	//	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/foodbox","root","rootraja");
		Connection con=DriverManager.getConnection("jdbc:mysql://awsdb.cg2a3l4mwr3i.ap-south-1.rds.amazonaws.com:3306/foodbox","root","rootraja");
		PreparedStatement ps=con.prepareStatement("update fooditems_table set FoodName='"+foodname+"', Price='"+price+"', Description='"+description+"', Category='"+category+"', ImgName='"+imgname+"', Cousines='"+cousines+"', Status='"+status+"', DiscountPercentage='"+disprice+"' where Id='"+id+"'");
		ps.executeUpdate();
		
		res.sendRedirect("adminhome.jsp?msg=3");
	}
	@RequestMapping("/deletefood")
	public void deletefood(HttpServletRequest req,HttpServletResponse res) throws IOException, ClassNotFoundException, SQLException
	{
		String id=req.getParameter("deletefood");
		Class.forName("com.mysql.jdbc.Driver");
	//		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/foodbox","root","rootraja");
		Connection con=DriverManager.getConnection("jdbc:mysql://awsdb.cg2a3l4mwr3i.ap-south-1.rds.amazonaws.com:3306/foodbox","root","rootraja");
			PreparedStatement ps=con.prepareStatement("delete from fooditems_table where Id='"+id+"'");
			ps.executeUpdate();
		res.sendRedirect("adminhome.jsp?msg=4");
	}
	@RequestMapping("/changestatus")
	public void changestatus(HttpServletRequest req,HttpServletResponse res) throws IOException, ClassNotFoundException, SQLException
	{
		String status=req.getParameter("change");
		String arr[]=status.split(" ");
		if(arr[1].equals("enable"))
		{
		Class.forName("com.mysql.jdbc.Driver");
	//	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/foodbox","root","rootraja");
		Connection con=DriverManager.getConnection("jdbc:mysql://awsdb.cg2a3l4mwr3i.ap-south-1.rds.amazonaws.com:3306/foodbox","root","rootraja");
		PreparedStatement ps=con.prepareStatement("update fooditems_table set Status='disable' where Id='"+arr[0]+"'");
		ps.executeUpdate();
		}
		else
		{
			Class.forName("com.mysql.jdbc.Driver");
	//		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/foodbox","root","rootraja");
			Connection con=DriverManager.getConnection("jdbc:mysql://awsdb.cg2a3l4mwr3i.ap-south-1.rds.amazonaws.com:3306/foodbox","root","rootraja");
			PreparedStatement ps=con.prepareStatement("update fooditems_table set Status='enable' where Id='"+arr[0]+"'");
			ps.executeUpdate();
		}
		res.sendRedirect("adminhome.jsp?msg=5");
	}
	@RequestMapping("/removekart")
	public void removekart(HttpServletRequest req,HttpServletResponse res) throws IOException, ClassNotFoundException, SQLException
	{
		String id=req.getParameter("removekart");
		System.out.print(id);
		Class.forName("com.mysql.jdbc.Driver");
	//	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/foodbox","root","rootraja");
		Connection con=DriverManager.getConnection("jdbc:mysql://awsdb.cg2a3l4mwr3i.ap-south-1.rds.amazonaws.com:3306/foodbox","root","rootraja");
		PreparedStatement ps=con.prepareStatement("delete from kart_table where FoodId='"+id+"'");
		ps.executeUpdate();
	res.sendRedirect("kart.jsp");
		
	}
	
}
