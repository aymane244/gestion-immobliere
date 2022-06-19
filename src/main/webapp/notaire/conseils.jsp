<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="mobilierModel.Notaire"%>
<%@page import="mobilierModel.Conseil"%>
<%@page import="mobilierModel.ConseilProjet"%>
<%@page import="mobilierModel.ConseilProgramme"%>
<%@page import="Database.ConnectionDB"%>
<%@page import="java.util.List"%>
<%@page import="mobilierDao.ConseilDao"%>
<%@page import="mobilierDao.NotaireDao"%>
<%
	ConseilDao db = new ConseilDao(ConnectionDB.getConnection());
	NotaireDao dbNotaire = new NotaireDao(ConnectionDB.getConnection());
	List <Conseil> conseils = db.selectAll();
	List <ConseilProjet> conseilsprojet = db.selectAllProjet();
	List <ConseilProgramme> conseilsprogramme = db.selectAllProgramme();
	List <Notaire> notaires = dbNotaire.selectAll();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Conseils reçus</title>
		<%@include file="../includes/css/header.html"%>
		<style>
			<%@include file="../includes/css/styles.css"%>
		</style>
		<script>
    		<%@include file="../includes/scripts/main.js"%>
    	</script>
	</head>
	<body>
		<%@include file="../includes/navbar-admins.jsp"%>
		<div class="container-fluid mt-5 pt-5">
			<h2 class="text-center">Page Conseil</h2>
			<%
        		if(session.getAttribute("success_not_conseil_prog") != null){
       		%>
   			<div class='container alert alert-success text-center' role='alert'>
				<%= session.getAttribute("success_not_conseil_prog")%>
			</div>
			<%
       			}
			%>
			<%
        		if(session.getAttribute("success_not_conseil_proj") != null){
       		%>
   			<div class='container alert alert-success text-center' role='alert'>
				<%= session.getAttribute("success_not_conseil_proj")%>
			</div>
			<%
       			}
			%>
			<%
        		if(session.getAttribute("success_not_conseil") != null){
       		%>
   			<div class='container alert alert-success text-center' role='alert'>
				<%= session.getAttribute("success_not_conseil")%>
			</div>
			<%
       			}
			%>
			<div class="text-center my-3">
				<button class="btn btn-primary" onclick="biens()">Biens</button>
				<button class="btn btn-primary" onclick="pogramme()">Programmes</button>
				<button class="btn btn-primary" onclick="projet()">Projets</button>
			</div>
			<div id="biens">
				<h1 class="text-center">Biens</h1>
				<table class="table table-bordered mt-5 bg-white">
        			<thead class="text-center">
                		<tr>
                			<th scope="col">#</th>
                    		<th scope="col">Nom du client</th>
                    		<th scope="col">Nom du bien</th>
                    		<th scope="col">Conseil</th>
                    		<th scope="col">Ecrire conseil</th>
                    		<th scope="col">Action</th>
               			</tr>
          			</thead>
           			<tbody class="text-center">
          				<%
          					int j =1;
							for(Conseil item : conseils){
								if(item.getNotaireId() == notaire.getId()){
						%>
             			<tr>
                			<td><%= j++ %></td>          
                    		<td><%= item.getClientPrenom() %> <%= item.getClientNom() %></td>
                    		<td><%= item.getBienNom() %></td>
                    		<td>
                    			<%
                    				if(item.getConseil() == null){
                    			%>
                    			<h4>Pas de conseil donner</h4>
                    			<%
                    				}else{
                    			%>
                    			<%= item.getConseil() %>
                    			<%
                    				}
                    			%>
                    		</td>
                    		<td>
                    			<%
                    				if(item.getConseil() == null && item.getId() == item.getId()){
                    			%>
                    			<a href="ecrire-conseil.jsp?id=<%= item.getId() %>" class="btn btn-info">Ecrire votre conseil</a>
                    			<%
                    				}else{
                    			%>
                    			<button class="btn btn-info" disabled>Message envoyé</button>
                    			<%
                    				}
                    			%>
                    		</td>
                    		<td>
                   				<form action="<%= request.getContextPath() %>/SupprimerBienConseil" method="POST">
	                            	<input type="hidden" name="id" value="<%= item.getId() %>">
	                                <button type="submit" class="btn-style" name="submit" onclick='return confirm("Voulez-vous supprimer cette demande ?")'>
	                        	   		<i class="fas fa-trash-alt text-danger awesome-size"></i>
	                              	</button>
	                         	</form>
                    		</td>
              			</tr>
              			<% 
								}
	            			}
	            		%>
           			</tbody>    
     			</table>
			</div>
			<div id="projet" style="display:none;">
				<h1 class="text-center">Projets</h1>
				<table class="table table-bordered mt-5 bg-white">
        			<thead class="text-center">
                		<tr>
                			<th scope="col">#</th>
                    		<th scope="col">Nom du client</th>
                    		<th scope="col">Nom du projet</th>
                    		<th scope="col">Nom du bien</th>
                    		<th scope="col">Message</th>
                    		<th scope="col">Ecrire message</th>
                    		<th scope="col">Actions</th>
               			</tr>
          			</thead>
           			<tbody class="text-center">
          				<%
          					int i =1;
						for(ConseilProjet item : conseilsprojet){
							if(item.getNotaire() == notaire.getId()){
						%>
             			<tr>
                			<td><%= i++ %></td>          
                    		<td><%= item.getClientPrenom() %> <%= item.getClientNom() %></td>
                    		<td><%= item.getProjetNom() %></td>
                    		<td><%= item.getProjetBien() %></td>
                    		<td>
                    			<%
                    				if(item.getMessage() == null){
                    			%>
                    			<h4>Pas de conseil donner</h4>
                    			<%
                    				}else{
                    			%>
                    			<%= item.getMessage() %>
                    			<%
                    				}
                    			%>
                    		</td>
                    		<td>
                    			<%
                    				if(item.getMessage() == null && item.getId() == item.getId()){
                    			%>
                    			<a href="ecrire-conseil-projet.jsp?id=<%= item.getId() %>" class="btn btn-info">Ecrire votre conseil</a>
                    			<%
                    				}else{
                    			%>
                    			<button class="btn btn-info" disabled>Message envoyé</button>
                    			<%
                    				}
                    			%>
                    		</td>
                    		<td>
                   				<form action="<%= request.getContextPath() %>/SupprimerProjetConseil" method="POST">
	                            	<input type="hidden" name="id" value="<%= item.getId() %>">
	                                <button type="submit" class="btn-style" name="submit" onclick='return confirm("Voulez-vous supprimer cette demande ?")'>
	                        	   		<i class="fas fa-trash-alt text-danger awesome-size"></i>
	                              	</button>
	                         	</form>
                    		</td>
              			</tr>
              			<% 
								}
	            			}
	            		%>
           			</tbody>    
     			</table>
			</div>
			<div id="programme" style="display:none;">
				<h1 class="text-center">Programmes</h1>
				<table class="table table-bordered mt-5 bg-white">
        			<thead class="text-center">
                		<tr>
                			<th scope="col">#</th>
                    		<th scope="col">Nom du client</th>
                    		<th scope="col">Nom du projet</th>
                    		<th scope="col">Nom du bien</th>
                    		<th scope="col">Message</th>
                    		<th scope="col">Ecrire message</th>
                    		<th scope="col">Actions</th>
               			</tr>
          			</thead>
           			<tbody class="text-center">
          				<%
          					int k =1;
						for(ConseilProgramme item : conseilsprogramme){
							if(item.getNotaire() == notaire.getId()){
						%>
             			<tr>
                			<td><%= k++ %></td>          
                    		<td><%= item.getClientPrenom() %> <%= item.getClientNom() %></td>
                    		<td><%= item.getProgrammeNom() %></td>
                    		<td><%= item.getBienNom() %></td>
                    		<td>
                    			<%
                    				if(item.getMessage() == null){
                    			%>
                    			<h4>Pas de conseil donner</h4>
                    			<%
                    				}else{
                    			%>
                    			<%= item.getMessage() %>
                    			<%
                    				}
                    			%>
                    		</td>
                    		<td>
                    			<%
                    				if(item.getMessage() == null && item.getId() == item.getId()){
                    			%>
                    			<a href="ecrire-conseil-programme.jsp?id=<%= item.getId() %>" class="btn btn-info">Ecrire votre conseil</a>
                    			<%
                    				}else{
                    			%>
                    			<button class="btn btn-info" disabled>Message envoyé</button>
                    			<%
                    				}
                    			%>
                    		</td>
                    		<td>
                   				<form action="<%= request.getContextPath() %>/SupprimerProgrameeConseil" method="POST">
	                            	<input type="hidden" name="id" value="<%= item.getId() %>">
	                                <button type="submit" class="btn-style" name="submit" onclick='return confirm("Voulez-vous supprimer cette demande ?")'>
	                        	   		<i class="fas fa-trash-alt text-danger awesome-size"></i>
	                              	</button>
	                         	</form>
                    		</td>
              			</tr>
              			<% 
								}
	            			}
	            		%>
           			</tbody>    
     			</table>
			</div>
		</div>
	</body>
</html>