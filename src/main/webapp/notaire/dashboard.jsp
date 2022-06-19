<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="mobilierModel.Notaire"%>
<%@page import="mobilierModel.Conseil"%>
<%@page import="mobilierModel.Document"%>
<%@page import="mobilierDao.AchatDao"%>
<%@page import="mobilierDao.ConseilDao"%>
<%@page import="Database.ConnectionDB"%>
<%@page import="java.util.List"%>
<%
	AchatDao db = new AchatDao(ConnectionDB.getConnection());
	ConseilDao dbConseil = new ConseilDao(ConnectionDB.getConnection());
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Tableau de board</title>
		<%@include file="../includes/css/header.html"%>
		<style>
			<%@include file="../includes/css/styles.css"%>
		</style>
	</head>
	<body>
		<%@include file="../includes/navbar-admins.jsp"%>
		<%
			if(notaire == null){
				response.sendRedirect("connexion.jsp");
			}else{
		%>
		<div class="container mt-5 pt-5">
			<%
        		if(session.getAttribute("success_not_mod") != null){
       		%>
   			<div class='container alert alert-success text-center' role='alert'>
				<%= session.getAttribute("success_not_mod")%>
			</div>
			<%
       			}
			%>
			<h2 class="text-center mt-3">Bienvenue sur votre profile <%= notaire.getPrenom() %></h2>
			<div class="row my-5">
				<div class="col-lg-4 border-right">
					<h3 class="text-center">Information personnelle</h3>
					<div class="d-flex align-items-center justify-content-between">
						<%
							if(notaire.getImage() == null){
						%>
						<img src="../images/unknown_person.jpg" class="card-image mt-3">
						<%
							}else{
						%>
						<img src="../images/notaire/<%=notaire.getImage()%>" class="card-image mt-3">
						<%	
							}
						%>
						<a href="modifier-profile.jsp" class="btn btn-info">Modifier mon profile</a>
					</div>
					<div class="mt-3 pl-3">
						<p>
							Nom: <%= notaire.getNom() %> <br>
							Prénom: <%= notaire.getPrenom() %> <br>
							Téléphone: <%= notaire.getTelephone() %> <br>
							Email: <%= notaire.getEmail() %>
						</p>
					</div>
				</div>
				<div class="col-lg-8">
					<h3 class="text-center">Les documents</h3>
					<div class="row align-items-center text-center">
						<div class="col-lg-4 mt-4">
							<h4>Les documents</h4>
							<div style="width:100%; height:100%;" class="rounded p-4 bg-footer">	
								<h5>Les documents reçus</h5>
								<a href='documents-recus.jsp' class="btn btn-info mt-2">Voir tout</a>
							</div>
						</div>
						<div class="col-lg-4 mt-4">
							<h4>Conseils</h4>
							<div style="width:100%; height:100%;" class="rounded p-4 bg-footer">	
								<h5> Les conseils</h5>
								<a href='conseils.jsp' class="btn btn-info mt-2">Voir tout</a>
							</div>
						</div>
					</div>
				</div>		
			</div>
		</div>
		<%@include file="../includes/footer.jsp"%>
		<% 
	     	}
	    %>
	</body>
</html>