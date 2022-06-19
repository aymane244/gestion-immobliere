<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="mobilierModel.Agent"%>
<%@page import="mobilierModel.Achat"%>
<%@page import="mobilierModel.AchatProgramme"%>
<%@page import="mobilierModel.AchatProjet"%>
<%@page import="mobilierDao.AchatDao"%>
<%@page import="Database.ConnectionDB"%>
<%@page import="java.util.List"%>
<%
	AchatDao db = new AchatDao(ConnectionDB.getConnection());
	List <Achat> countBiensAll = db.countBiensAll();
	List <Achat> countCommercesAll = db.countCommercesAll();
	List <Achat> countTerrainsAll = db.countTerrainsAll();
	List <AchatProgramme> countProgrammeAll = db.countProgrammeAll();
	List <AchatProjet> countProjetAll = db.countProjetAll();
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
			if(agent == null){
				response.sendRedirect("connexion.jsp");
			}else{
		%>
		<div class="container mt-5 pt-5">
			<%
        		if(session.getAttribute("sucess_agt_profile") != null){
       		%>
       		<div class='container alert alert-success text-center w-50' role='alert'>
				<%= session.getAttribute("sucess_agt_profile")%>
			</div>
			<%
        		}
			%>
			<h2 class="text-center mt-3">Bienvenue sur votre profile <%= agent.getPrenom() %></h2>
			<div class="row my-5">
				<div class="col-lg-4 border-right">
					<h3 class="text-center">Information personnelle</h3>
					<div class="d-flex align-items-center justify-content-between">
						<%
							if(agent.getImage() == null){
						%>
						<img src="../images/unknown_person.jpg" class="card-image mt-3">
						<%
							}else{
						%>
						<img src="../images/agent/<%=agent.getImage()%>" class="card-image mt-3">
						<%	
							}
						%>
						<a href="modifier-profile.jsp" class="btn btn-info">Modifier mon profile</a>
					</div>
					<div class="mt-3 pl-3">
						<p>
							Nom: <%= agent.getNom() %> <br>
							Prénom: <%= agent.getPrenom() %> <br>
							Email: <%= agent.getEmail() %>
						</p>
					</div>
				</div>
				<div class="col-lg-8">
					<div class="d-flex justify-content-between">
						<h3 class="text-center">Voir les clients <a href="clients.jsp">ICI</a></h3>
						<h3 class="text-center">Voir les réservations <a href="reservations.jsp">ICI</a></h3>
						<h3 class="text-center">Voir les réclamations <a href="reclamations.jsp">ICI</a></h3>
					</div>
					<div class="row align-items-center text-center">
						<div class="col-lg-4 mt-4">
							<h4>Biens vendus</h4>
							<div style="width:100%; height:100%;" class="rounded p-5 bg-footer">
								<%
									for(Achat count : countBiensAll){
								%>
								<h5><%= count.getCount() %> Biens</h5>
								<%
									}
								%>
							</div>
						</div>
						<div class="col-lg-4 mt-4">
							<h4>Terrains vendus</h4>
							<div style="width:100%; height:100%" class="rounded p-5 bg-footer">
								<%
									for(Achat count : countTerrainsAll){
								%>
								<h5><%= count.getCount() %> Terrains</h5>
								<%
									}
								%>
							</div>
						</div>
						<div class="col-lg-4 mt-4">
							<h4>Bureaux & c. vendus</h4>
							<div style="width:100%; height:100%;" class="rounded py-5 bg-footer">
								<%
									for(Achat count : countCommercesAll){
								%>
								<h5><%= count.getCount() %> Bureaux & Comm.</h5>
								<%
									}
								%>
							</div>
						</div>
						<div class="col-lg-6 mt-4">
							<h4>App.t programme. vendues</h4>
							<div style="width:100%; height:100%;" class="rounded p-5 bg-footer">
								<%
									for(AchatProgramme count : countProgrammeAll){
								%>
								<h5><%= count.getCount() %> Appartements</h5>
								<%
									}
								%>
							</div>
						</div>
						<div class="col-lg-6 mt-4">
							<h4>Appartement projets vendues</h4>
							<div style="width:100%; height:100%;" class="rounded p-5 bg-footer">
								<%
									for(AchatProjet count : countProjetAll){
								%>
								<h5><%= count.getCount() %> Appartements</h5>
								<%
									}
								%>
							</div>
						</div>
					</div>
				</div>		
			</div>
		</div>
		<% 
	     	}
	    %>
	</body>
</html>