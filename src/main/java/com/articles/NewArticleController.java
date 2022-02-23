package com.articles;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;

public class NewArticleController extends HttpServlet {
  public void service(HttpServletRequest req, HttpServletResponse res) throws IOException {
	  res.sendRedirect("newArticle.jsp");
  }
}
