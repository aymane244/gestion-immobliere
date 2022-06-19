<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="mobilierModel.ProgrammeBien"%>
<%@page import="java.util.List"%>
<%@page import="mobilierDao.ProgrammeDao"%>
<%@page import="Database.ConnectionDB"%>
<%
	ProgrammeDao db = new ProgrammeDao(ConnectionDB.getConnection());
	ProgrammeBien count = db.countAllBiens();
	List<ProgrammeBien> programmes = db.selectAllProgramme();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Programmes</title>
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
					<h3><%= count.getId() %> programmes trouvés</h3>
				</div>
			</div>
			<div class="row justify-content-center">
				<%
       				for(ProgrammeBien programme: programmes){
				%>
				<div class="col-md-8 border rounded py-2 my-2">
					<div class="row">
						<div class="col-md-4">
							<img src="images/promoteur/assets/<%= programme.getImage()%>" width="210rem">
						</div>
						<div class="col-md-8">
							<p>Nom du programme: <%= programme.getNomProgramme() %></p>
							<p>Etat de construction: <%= programme.getEtat() %></p>
							<p><a href="programme.jsp?id=<%= programme.getId() %>">Nom: <%= programme.getNom() %></a></p>
							<p>Type: <%= programme.getType() %></p>
							<p><i class="fas fa-map-marker-alt"></i> Ville: <%= programme.getVille() %></p>
							<p>Unités : <%= programme.getUnite() %> unités</p>
							<div class="d-flex justify-content-between align-items-center">
								<h5>A partir de: <%= programme.getPrix() %> MAD</h5>
								<a href="programme.jsp?id=<%= programme.getId() %>" class="btn btn-success">En savoir plus</a>
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