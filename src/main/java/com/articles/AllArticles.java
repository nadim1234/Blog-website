package com.articles;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

public class AllArticles extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse res) {

	try{  
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/articles","root","");  
		//here sonoo is database name, root is username and password  
		Statement stmt=con.createStatement();  
		ResultSet rs=stmt.executeQuery("select * from article");  
		JSONArray articles=new JSONArray();
		int count=0;
		while(rs.next())  {
			count++;
			JSONObject temp=new JSONObject();
			temp.put("title", rs.getString(1));
			temp.put("description", rs.getString(2));
			temp.put("markdown", rs.getString(3));
			temp.put("date", rs.getString(4));
			temp.put("id", rs.getInt(5));
			articles.put(temp);
			System.out.println(temp);
		}
		System.out.println(count);
		con.close();  
		req.setAttribute("articles", articles);
		RequestDispatcher rd= req.getRequestDispatcher("index.jsp");
		rd.forward(req, res);
//		PrintWriter out=res.getWriter();
//		out.print(articles.toString());
		}catch(Exception e){ System.out.println(e);}  
	
	
	}
	
}

