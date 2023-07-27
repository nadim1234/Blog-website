package com.articles;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SaveArticleController extends HttpServlet{
	public void service(HttpServletRequest req, HttpServletResponse res) {
		String title=req.getParameter("title");
		String description=req.getParameter("description");
		String markdown=req.getParameter("markdown");
		String articleId=req.getParameter("id");
		System.out.println("article id"+articleId);
		 if(articleId!=null) {
			try {
				Class.forName("com.mysql.jdbc.Driver");  
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/articles","root","");
				PreparedStatement stmt=con.prepareStatement("update article set title=?, description=?, markdown=? where id=?");  
				stmt.setString(1, title);
				stmt.setString(2, description);
				stmt.setString(3, markdown);
				stmt.setString(4, articleId);
				stmt.executeUpdate();  
				System.out.print("updated title:"+title+" description:"+description);
				res.sendRedirect("/blogweb/all");
			}
			catch(Exception e) {
				System.out.println(e);
			}
		}
		else {
	      String date=new SimpleDateFormat ("yyyy-MM-dd").format(new Date());
		try {
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/articles","root","");
			PreparedStatement stmt=con.prepareStatement("insert into article (title,description,markdown,date) values(?,?,?,?)");  
			stmt.setString(1, title);
			stmt.setString(2, description);
			stmt.setString(3, markdown);
			stmt.setString(4, date);
			stmt.executeUpdate();  
			System.out.print("inserted");
			res.sendRedirect("/blogweb/all");
			
		}
		catch(Exception e) {
			System.out.print(e);
		}
		}
	}
}
