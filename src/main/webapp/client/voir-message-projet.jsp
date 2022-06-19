<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="mobilierModel.ConseilProjet"%>
<%@page import="mobilierDao.ConseilDao"%>
<%@page import="Database.ConnectionDB"%>
<%
	int id =Integer.parseInt(request.getParameter("id"));
	ConseilDao db = new ConseilDao(ConnectionDB.getConnection());
	ConseilProjet conseil = db.selectConseilProjet(id);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Conseil <%=conseil.getProjetBien() %></title>
	<%@include file="../includes/css/header.html"%>
	<style>
		<%@include file="../includes/css/styles.css"%>
	</style>
</head>
<body>
	<%@include file="../includes/navbar-admins.jsp"%>
	<div class="container pt-5 mt-5">
		<div class="text-center py-3">
			<h3>Conseil du <%=conseil.getProjetBien() %></h3>
		</div>
		<div class="text-center">
			<textarea id="nom" rows=10 cols=10 class="form-control" name="conseil" required><%= conseil.getMessage() %></textarea>
		</div>
	</div>
</body>
</html>