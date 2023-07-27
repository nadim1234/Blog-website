package com.articles;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

public class DeleteController extends HttpServlet {
	public void service(HttpServletRequest req,HttpServletResponse res) {
		System.out.println("dchvs");
		String articleId=req.getParameter("id");
		try {
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/articles","root",""); 
			PreparedStatement stmt=con.prepareStatement("delete from article where id=?");
			stmt.setString(1, articleId);
			stmt.executeUpdate();
			con.close();
			System.out.println("deleted");
			res.sendRedirect("/blogweb/all");
			
		}
		catch(Exception e) {
			
		}
	}
}
