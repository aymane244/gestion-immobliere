<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="mobilierModel.Bien"%>
<%@page import="java.util.List"%>
<%@page import="mobilierDao.BiensDao"%>
<%@page import="Database.ConnectionDB"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Terrain</title>
		<%@include file="includes/css/header.html"%>
		<style>
			<%@include file="includes/css/styles.css"%>
		</style>
	</head>
	<body>
		<%@include file="includes/navbar.jsp"%>
		<div class="container pt-5">
			<div class="row mt-5 justify-content-center">
				<div class="col-md-8">
				<%
					BiensDao db = new BiensDao(ConnectionDB.getConnection());
					Bien count = db.countAllTerrains();
				%>
					<h3><%= count.getCount() %> Terrains trouvés</h3>
				</div>
			</div>
			<div class="row justify-content-center">
				<%
	  				List<Bien> biens = db.selectAllTerrains();
       				for(Bien bien: biens){
				%>
				<div class="col-md-8 border rounded py-2 my-4">

					<div class="row">
						<div class="col-md-4">
							<img src="images/promoteur/assets/<%=bien.getImage()%>" class="img-fluid">
						</div>
						<div class="col-md-8">
							
							<p><%= bien.getType() %></p>
							<a href="bien.jsp?id=<%= bien.getId() %>"><%= bien.getNom() %></a>
							<p><i class="fas fa-map-marker-alt"></i> <%= bien.getAdresse() %></p>
							<p>Chambres : <%= bien.getChambres() %></p>
							<p>Syndique : <%= bien.getSyndic() %></p>
							<p>Supérficie : <%= bien.getSuperficie() %></p>
							<p>Garage : <%= bien.getGarage() %></p>
							<div class="d-flex justify-content-between align-items-center">
								<h5>Prix: <%= bien.getPrix() %> Dhs</h5>
								<button class="btn btn-success">En savoir plus</button>
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