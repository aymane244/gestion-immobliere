<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="mobilierModel.Admin"%>
<%@page import="mobilierModel.Role"%>
<%@page import="mobilierModel.Client"%>
<%@page import="mobilierModel.Promoteur"%>
<%@page import="mobilierModel.Agent"%>
<%@page import="mobilierModel.Notaire"%>
<%@page import="Database.ConnectionDB"%>
<%@page import="java.util.List"%>
<%@page import="mobilierDao.RoleDao"%>
<%@page import="mobilierDao.ClientDao"%>
<%@page import="mobilierDao.PromoteurDao"%>
<%@page import="mobilierDao.AgentDao"%>
<%@page import="mobilierDao.NotaireDao"%>
<%
	RoleDao db = new RoleDao(ConnectionDB.getConnection());
	ClientDao dbClient = new ClientDao(ConnectionDB.getConnection());
	PromoteurDao dbPromoteur = new PromoteurDao(ConnectionDB.getConnection());
	AgentDao dbAgent = new AgentDao(ConnectionDB.getConnection());
	NotaireDao dbNotaire = new NotaireDao(ConnectionDB.getConnection());
	List <Role> roles = db.selectAll();
	List <Client> counts = dbClient.countClient();
	List <Promoteur> countsPro = dbPromoteur.countPromoteur();
	List <Agent> countsAgent = dbAgent.countAgent();
	List <Notaire> countsNotaire = dbNotaire.countNotaire();
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
			if(admin == null){
				request.getRequestDispatcher("connexion.jsp").include(request, response);
			}else{
		%>
		<div class="container mt-5 py-5">
			<%
        		if(session.getAttribute("msgdash") != null){
       		%>
       		<div class='container alert alert-success text-center w-50' role='alert'>
				<%= session.getAttribute("msgdash")%>
			</div>
			<%
        		}
			%>
			<%
        		if(session.getAttribute("success_role") != null){
       		%>
       		<div class='container alert alert-success text-center w-50' role='alert'>
				<%= session.getAttribute("success_role")%>
			</div>
			<%
        		}
			%>
			<h2 class="text-center mt-3">Bienvenue sur votre profile <%= admin.getPrenom() %></h2>
			<div class="row my-5">
				<div class="col-lg-4 border-right">
					<h3 class="text-center">Information personnelle</h3>
					<div class="d-flex align-items-center justify-content-between">
						<%
							if(admin.getImage() == null){
						%>
						<img src="../images/unknown_person.jpg" class="card-image mt-3">
						<%
							}else{
						%>
						<img src="../images/admin/<%=admin.getImage()%>" class="card-image mt-3">
						<%	
							}
						%>
						<a href="modifier-profile.jsp" class="btn btn-info">Modifier mon profile</a>
					</div>
					<div class="mt-3 pl-3">
						<p>
							Nom: <%= admin.getNom() %> <br>
							Prénom: <%= admin.getPrenom() %> <br>
							Date: <%= admin.getDate() %> <br>
							Email: <%= admin.getEmail() %> <br>
							Role: <%= admin.getRoleId() %> <br>
							
						</p>
					</div>
				</div>
				<div class="col-lg-8">
					<div class="d-flex justify-content-center">
						<h3 class="mr-3">Liste des rôles <a href="roles.jsp">ICI</a></h3>
						<h3>Liste des administrateurs <a href="admins.jsp">ICI</a></h3>
					</div>
					<div class="row align-items-center text-center">
						<div class="col-lg-6 mt-4">
							<h4>Les clients sur la platforme</h4>
							<div style="width:100%; height:100%;" class="rounded p-5 bg-footer">
								<%
									for(Client count : counts){
								%>
								<h5><%= count.getCount() %> Clients</h5>
								<%
									}
								%>
								<a href="clients.jsp" class="btn btn-info">Voir tous</a>
							</div>
						</div>
						<div class="col-lg-6 mt-4">
							<h4>Les promoteurs sur la platforme</h4>
							<div style="width:100%; height:100%" class="rounded px-3 py-5 bg-footer">
								<%
									for(Promoteur count : countsPro){
								%>
								<h5><%= count.getId() %> Promoteurs</h5>
								<%
									}
								%>
								<a href="promoteurs.jsp" class="btn btn-info">Voir tous</a>
							</div>
						</div>
						<div class="col-lg-6 mt-4">
							<h4>Les agents sur la platforme</h4>
							<div style="width:100%; height:100%;" class="rounded p-5 bg-footer">
								<%
									for(Agent count : countsAgent){
								%>
								<h5><%= count.getId() %> Agents</h5>
								<%
									}
								%>
								<a href="agents.jsp" class="btn btn-info">Voir tous</a>
							</div>
						</div>
						<div class="col-lg-6 mt-4">
							<h4>Les notaires sur la platforme</h4>
							<div style="width:100%; height:100%;" class="rounded p-5 bg-footer">
								<%
									for(Notaire count : countsNotaire){
								%>
								<h5><%= count.getId() %> Notaires</h5>
								<%
									}
								%>
								<a href="notaires.jsp" class="btn btn-info">Voir tous</a>
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