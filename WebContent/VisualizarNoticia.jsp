<%@page import="model.Noticia"%>
<%@page import="model.Comentario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8"/>
	
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous"/>
	<link href="https://fonts.googleapis.com/css?family=Alfa+Slab+One" rel="stylesheet"/>    
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<title>Real News</title>

<style>
	hr{
		border-top: 2px solid rgb(0,0,0);
	}
</style>
</head>
<body>
<div class="row" style="margin-left: 5px; margin-right: 5px;">
	<% Noticia noticia = ((Noticia)request.getAttribute("modelo")); %>
	<div class="col-md-12">
		<h1>Real News</h1>
		<hr />
	</div>
	<div class="col-md-12" style="margin-left: 10px;">
		<h3><%=noticia.getTitulo()%></h3>
	</div>
	<div class="col-md-12" style="margin-left: 10px;">
		<label><%=noticia.getTexto()%></label>
	</div>
	<br />
	<br />
	<div class="col-md-12">
		<h2>Comentários</h2>
	
		<br />
		<% 
			for (Comentario item: noticia.getComentarios()) {
		%>
			<h5 style="margin-left: 5px;"> <%=item.getNome() %></h5><br />
			<label style="margin-left: 15px;"><%=item.getTexto() %></label>
			<hr />
		<% 
			}
		%>		
	</div>	
	<br />
	<br />
</div>
<form action="CriarComentario.do" method="post" style="margin-left: 10px;">
	<div class="row">
		<input type="hidden" id="idNoticia" name="idNoticia" value="<%=noticia.getId()%>">
		<div class="col-md-12">
			<label>Adicionar Comentário:</label>
		</div>
	</div>
	<div class="row">
		<div class="col-md-2">
			<label for="nome" >nome:</label>
		</div>  
		<div class="col-md-10">
			<input type="text" id="nome" name="nome">
		</div>
	</div>
	<div class="row">
		<div class="col-md-2">
			<label for="texto">Comentário:</label>
		</div>
		<div class="col-md-10">
			<textarea rows="3" cols="40" id="texto" name="texto"></textarea>
		</div>
	</div>		
	<div class="row">
		<div class="col-md-2 offset-md-4">
			<input type="submit" value="Enviar" class="btn btn-primary bt-block">
		</div>
	</div>
</form>
</body>
</html>