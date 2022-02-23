<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="org.json.JSONObject,org.commonmark.node.Node,org.commonmark.parser.Parser,org.commonmark.renderer.html.HtmlRenderer"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
body{
background-color: rgba(243,244,246,0.5);
}
.title{
    font-size: 50px;
    font-weight: bold;
}
.date{
    color: grey;
    font-size: 20px;
    margin: 5px 0px;
}
.description{
    margin: 5px 0px;
    font-size: 25px;
}

.markdown{
	font-size:25px;
}

.allBtn{
border-radius: 12px;
    color: white;
    background-color: grey;
    padding: 8px;
    width: 90px;
    height: 40px;
}

.editBtn{
    color: white;
    background-color: lightblue;
    height: 40px;
    width: 90px;
    border-radius: 12px;
    padding: 8px;
}


.buttons{

    margin: 10px 0px;
    }
</style>
</head>
<body>
<%
JSONObject article=(JSONObject)request.getAttribute("article");

Parser parser = Parser.builder().build();
Node document = parser.parse(article.getString("markdown"));
HtmlRenderer renderer = HtmlRenderer.builder().build();
%>
<div class="title"><%=article.getString("title")%></div>
<div class="date"><%=article.getString("date") %></div>
<div class="buttons">
<button class="allBtn">All Articles</button>
<button class="editBtn" id=<%="edit"+article.getInt("id") %> onclick="editClick(this)">Edit</button>
</div>
<div class="description"><%=article.getString("description") %></div>
 <div class="markdown"><%=renderer.render(document) %></div>

<script>
document.getElementsByClassName('allBtn')[0].addEventListener('click',()=>{
	window.location='http://192.168.1.10:8080/blogweb/all';
})

function editClick(e){
	var articleId=e.id.slice(4);
	window.location='http://192.168.1.10:8080/blogweb/edit?id='+articleId;
}

</script>
</body>
</html>