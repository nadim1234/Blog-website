<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="org.json.JSONObject"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
body{
background-color: rgba(243,244,246,0.5);
}
.heading{
font-size:50px;
font-weight:bold;
}
input{
    display: block;
    width: 98%;
    height: 28px;
    margin-top: 5px;
    padding: 5px;
    border-radius: 12px;
    outline: none;
    margin-bottom:10px;
}

textarea{

width: 1322px;
    height: 91px;
    padding: 5px;
    border-radius: 12px;
    border: 2px solid black;

 }
 
 button{
 color:white;
border-radius:12px;
    margin-top:10px;
     padding: 10px;
    width: 80px;
    margin-right:15px;
 }
 
 #cancel{
    background-color: grey;

 }
 
 .save{

    background-color: blue;
 }

</style>
</head>
<body>
<%

JSONObject article=(JSONObject)request.getAttribute("article");
%>
<div class="heading">Edit Article</div>
<p>Title<p>
<input type="text" id="title" name="title" value=<%=article.getString("title") %>/>
<p>Description<p>
<textarea id="description" name="description" ><%=article.getString("description") %></textarea>
<p>markdown<p>
<textarea id="markdown" name="markdown" ><%=article.getString("markdown") %></textarea>
<button id="cancel">Cancel</button>
<button class="save" id=<%=article.getInt("id") %>  onclick="saveClick(this)">Save</button>
 
<script>


document.getElementById('cancel').addEventListener('click',(e)=>{
	window.location= "http://192.168.1.10:8080/blogweb/all";
})

function saveClick(e){
	var title=document.getElementById('title').value;
	var description=document.getElementById('description').value;
	var markdown=document.getElementById('markdown').value;
	window.location= "http://192.168.1.10:8080/blogweb/save?title="+encodeURIComponent(title)+"&description="+encodeURIComponent(description)+"&markdown="+encodeURIComponent(markdown)+"&id="+e.id;
}
</script>

</body>
</html>