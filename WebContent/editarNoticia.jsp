<%@page import="model.Noticia"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8"/>
	
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous"/>
	<link href="https://fonts.googleapis.com/css?family=Alfa+Slab+One" rel="stylesheet"/>    
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<title>Editar Notícia</title>
</head>
<body>
	<% Noticia noticia = ((Noticia)request.getAttribute("modelo")); %>
	
	<h3>Editar Notícia</h3>
	<form action="EditarNoticia.do" method="post">
		<input type="hidden" id="idNoticia" name="idNoticia" value="<%=noticia.getId()%>">
		<label for="descricao" >descricao:</label>  
		<input type="text" id="descricao" name="descricao" value="<%=noticia.getDescricao()%>">
		<br /> 
		<label for="titulo">titulo:</label>
		<input type="text" id="titulo" name="titulo" value="<%=noticia.getTitulo()%>">
		<br />
		<label for="texto">texto:</label>
		<textarea rows="15" cols="40" id="texto" name="texto"><%=noticia.getTexto()%></textarea>
		<br /> 
		<br />
		<input type="submit" value="Editar" class="btn btn-primary col-3">
	</form>
</body>
</html>