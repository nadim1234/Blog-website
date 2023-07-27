package com.articles;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

public class ReadMoreController extends HttpServlet {

	public void service(HttpServletRequest req,HttpServletResponse res) {
		String articleId=req.getParameter("id");
		try {
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/articles","root",""); 
			Statement stmt=con.createStatement();  
			ResultSet rs=stmt.executeQuery("select * from article where id="+articleId);
			JSONObject article=new JSONObject();
			while(rs.next())  {
				article.put("title", rs.getString(1));
				article.put("description", rs.getString(2));
				article.put("markdown", rs.getString(3));
				article.put("date", rs.getString(4));
				article.put("id", rs.getInt(5));
		
			}
			
			con.close();  
			req.setAttribute("article", article);
			RequestDispatcher rd= req.getRequestDispatcher("ReadMore.jsp");
			rd.forward(req, res);
			
		}
		catch(Exception e) {
			
		}
		
	}
}
