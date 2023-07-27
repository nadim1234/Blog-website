package com.articles;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import javax.servlet.http.HttpServletRequest;

public class NewArticleController extends HttpServlet {
  public void service(HttpServletRequest req, HttpServletResponse res) throws IOException {
	  res.sendRedirect("newArticle.jsp");
  }
}
