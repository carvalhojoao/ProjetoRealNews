<%@page import="java.util.ArrayList"%>
<%@page import="model.Noticia"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8"/>
	
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous"/>
	<link href="https://fonts.googleapis.com/css?family=Alfa+Slab+One" rel="stylesheet"/>    
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<title>Lista Notícias</title>
</head>
<body>

<form action="EditarExcluir.do" method="post" class="container-fluid">
	<div class="text-center">
		<br />
		<h3>Lista de Notícias</h3>
		<hr>
	</div>
	<br />
	<table class="table table-striped">
		<tr>
			<th></th>
			<th>Descrição</th>
			<th>Título</th>
			<th></th>
			<th></th>
		</tr>
		
		<% 
			ArrayList<Noticia> noticias = (ArrayList<Noticia>) request.getAttribute("lista");
			for (Noticia item: noticias) {
		%>
			<tr>
				<td>
					<button type="submit" name="action" value="<%=item.getId() + "_abrir"%>" class="btn btn-primary btn-block btn" title="Abrir"> Visualizar Notícia </button>
				</td>
				<td><%=item.getDescricao() %></td>
				<td><%=item.getTitulo()%></td>
				<td>
					<button type="submit" name="action" value="<%=item.getId() + "_excluir"%>" class="btn-danger btn-block btn" title="Excluir">
						<span class="fas fa-times"></span>
					</button>
				</td>
				<td>
					<button type="submit" name="action" value="<%=item.getId() + "_editar"%>" class="btn btn-primary btn-block btn" title="Editar">
					<span class="fas fa-pen"></span></button>
				</td>
			</tr>
		<% 
			}
		%>				
	 </table>
</form>
</body>
</html>