<%@ page import="org.json.JSONArray,org.json.JSONObject" %>
<html>
<head>
<style>
body{
background-color: rgba(243,244,246,0.5);
}
*{
padding:0;
margin:0;
}

body{
padding:5px;
}
.article{
background-color:rgba(255,255,255,1);
border:1px solid #000;
padding:15px;
width:92%;
margin:10px;
    box-shadow: 0 4px 6px -1px rgb(0 0 0 / 10%), 0 2px 4px -1px rgb(0 0 0 / 6%);
border-radius:12px;
margin-bottom:25px;
}

.date{
color:grey;
margin-bottom:8px;
}

.heading{
font-size:50px;
font-weight:bold;
margin-bottom:10px;
}

#allArticles{
background-color:green;
color:white;
padding:10px;
margin-bottom:20px;
margin-top:10px;
border-radius:15px;
}

.readMore{
background-color:blue;
color:white;
padding:6px;
border-radius:12px;
}

.edit{
background-color:lightblue;
color:white;
border-radius:12px;
padding:5px;
width:81.95px;
height:31px;
}

.delete{
background-color:red;
color:white;
width:81.95px;
height:31px;
border-radius:12px;
}

.title,.description{
margin-bottom:8px
}
button{
margin-right:8px;
}
</style>
</head>
<body>
<div class="heading">Blog Articles</div>
<button id="allArticles">New Article</button>
<%
JSONArray arr=(JSONArray)request.getAttribute("articles");

for(int i=0;i<arr.length();i++){
	System.out.println("jsp:"+arr.getJSONObject(i).getInt("id"));
%>
	
	<div class="article">
	<h1 class="title"><%=arr.getJSONObject(i).getString("title") %></h1>
	<div class="date"><%=arr.getJSONObject(i).getString("date") %></div>
	<div class="description"><%=arr.getJSONObject(i).getString("description") %></div>
	<p></p>
	<button class="readmore" id=<%="readMore"+arr.getJSONObject(i).getInt("id")%> onclick="readMore(this)">Read More</button>
	
	<button class="edit" id=<%="edit"+arr.getJSONObject(i).getInt("id")%> onclick="edit(this)">Edit</button>
	<button class="delete" id=<%="delete"+arr.getJSONObject(i).getInt("id")%> onclick="deleteArticle(this)">Delete</button>
	</div>	
<%
}
%>

<script>
document.getElementById("allArticles").addEventListener('click',(e)=>{
	window.location = "http://192.168.1.10:8080/blogweb/new";
})

function readMore(e){
	
	var articleId=e.id.slice(8);	
	window.location="http://192.168.1.10:8080/blogweb/readMore?id="+articleId;
}

function edit(e){
	var articleId=e.id.slice(4);
	window.location='http://192.168.1.10:8080/blogweb/edit?id='+articleId;
}

function deleteArticle(e){
	e.parentElement.remove();
	var articleId=e.id.slice(6);
	window.location='http://192.168.1.10:8080/blogweb/delete?id='+articleId;
}

</script>
</body>
</html>