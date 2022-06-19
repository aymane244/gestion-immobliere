<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="mobilierModel.ProjetBien"%>
<%@page import="java.util.List"%>
<%@page import="mobilierDao.ProjetDao"%>
<%@page import="Database.ConnectionDB"%>
<%
	ProjetDao db = new ProjetDao(ConnectionDB.getConnection());
	ProjetBien count = db.countAll();
	List<ProjetBien> projets = db.selectAll();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Projets</title>
		<%@include file="includes/css/header.html"%>
		<style>
			<%@include file="includes/css/styles.css"%>
		</style>
	</head>
	<body>
		<%@include file="includes/navbar.jsp"%>
		<div class="container pt-5 mb-4">
			<div class="row mt-5 justify-content-center">
				<div class="col-md-8">
					<h3><%= count.getId() %> projets trouvés</h3>
				</div>
			</div>
			<div class="row justify-content-center">
				<%
					for(ProjetBien projet: projets){
				%>
				<div class="col-md-8 border rounded py-2 my-2">
					<div class="row align-center">
						<div class="col-md-4">
							<img src="images/promoteur/assets/<%= projet.getImage()%>" width="210rem">
						</div>
						<div class="col-md-8">
							<p>Nom du projet: <%= projet.getNomProjet() %></p>
							<p>Etat de construction: <%= projet.getEtat() %></p>
							<p><a href="projet.jsp?id=<%= projet.getId() %>">Nom: <%= projet.getNom() %></a><p>
							<p>Type: <%= projet.getType() %></p>
							<p><i class="fas fa-map-marker-alt"></i> Ville: <%= projet.getVille() %></p>
							<p>Unités : <%= projet.getUnite() %> unités</p>
							<div class="d-flex justify-content-between align-items-center">
								<h5>A partir de <%= projet.getPrix() %> Dhs</h5>
								<a href="projet.jsp?id=<%= projet.getId() %>" class="btn btn-success">En savoir plus</a>
							</div>
						</div>
					</div>
				</div>
                <%
					}
				%>
			</div>
		</div>
		<%@include file="includes/footer.jsp"%>
	</body>
</html>