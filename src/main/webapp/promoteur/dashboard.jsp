<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="mobilierModel.Promoteur"%>
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
			if(promoteur == null){
				response.sendRedirect("connexion.jsp");
			}else{
		%>
		<div class="container mt-5 pt-5">
			<%
        		if(session.getAttribute("success_pro_mod") != null){
       		%>
   			<div class='container alert alert-success text-center' role='alert'>
				<%= session.getAttribute("success_pro_mod")%>
			</div>
			<%
       			}
			%>
			<h2 class="text-center mt-3">Bienvenue sur votre profile <%= promoteur.getPrenom() %></h2>
			<div class="row my-5">
				<div class="col-lg-4 border-right">
					<h3 class="text-center">Information personnelle</h3>
					<div class="d-flex align-items-center justify-content-between">
						<%
							if(promoteur.getImage() == null){
						%>
						<img src="../images/unknown_person.jpg" class="card-image mt-3">
						<%
							}else{
						%>
						<img src="../images/promoteur/<%=promoteur.getImage()%>" class="card-image mt-3">
						<%	
							}
						%>
						<a href="modifier-profile.jsp" class="btn btn-info">Modifier mon profile</a>
					</div>
					<div class="mt-3 pl-3">
						<p>
							Nom: <%= promoteur.getNom() %> <br>
							Prénom: <%= promoteur.getPrenom() %> <br>
							Téléphone: <%= promoteur.getTelephone() %> <br>
							Email: <%= promoteur.getEmail() %>
						</p>
					</div>
				</div>
				<div class="col-lg-8">
					<h3 class="text-center">Vos actions immobilères</h3>
					<div class="row align-items-center text-center">
						<div class="col-lg-4 mt-4">
							<h4>Les biens</h4>
							<a href="biens.jsp"><img src="../images/promoteur/assets/biens.webp" class="mt-4 img-fluid img-thumbnail img-hover" style="width:100%; height:153px"></a>
						</div>
						<div class="col-lg-4 mt-4">
							<h4>Les projets</h4>
							<a href="projets.jsp"><img src="../images/promoteur/assets/programmes.jpeg" class="mt-4 img-fluid img-thumbnail img-hover" style="width:100%;"></a>
						</div>
						<div class="col-lg-4 mt-4">
							<h4>Les programmes</h4>
							<a href="programmes.jsp"><img src="../images/promoteur/assets/projets.jpg" class="mt-4 img-fluid img-thumbnail img-hover" style="width:100%;"></a>
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