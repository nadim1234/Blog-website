<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
 
 #save{

    background-color: blue;
 }

</style>
</head>
<body>
<div class="heading">New Articles</div>
<p>Title<p>
<input type="text" id="title" name="title" Placeholder="Enter title here"/>
<p>Description<p>
<textarea id="description" name="description" Placeholder="Enter description here"></textarea>
<p>markdown<p>
<textarea id="markdown" name="markdown" Placeholder="Enter markdown here"></textarea>
<button id="cancel">Cancel</button>
<button id="save">Save</button>
<script>


document.getElementById('cancel').addEventListener('click',()=>{
	window.location= "http://localhost:8080/blogweb/all";
})

document.getElementById("save").addEventListener('click',()=>{
	debugger;
	var title=document.getElementById('title').value;
	var description=document.getElementById('description').value;
	var markdown=document.getElementById('markdown').value;
	window.location= "http://localhost:8080/blogweb/save?title="+encodeURIComponent(title)+"&description="+encodeURIComponent(description)+"&markdown="+encodeURIComponent(markdown);
})
</script>
</body>
</html>