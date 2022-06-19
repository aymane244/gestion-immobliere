<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="mobilierModel.Achat"%>
<%@page import="mobilierModel.AchatProgramme"%>
<%@page import="mobilierModel.AchatProjet"%>
<%@page import="Database.ConnectionDB"%>
<%@page import="java.util.List"%>
<%@page import="mobilierDao.AchatDao"%>
<%
	AchatDao db = new AchatDao(ConnectionDB.getConnection());
	List <Achat> achats = db.selectAll();
	List <AchatProgramme> programmes = db.selectProgrammes();
	List <AchatProjet> projets = db.selectProjet();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Achats</title>
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
			<h2 class="text-center">Page Achats</h2>
			<%
        		if(session.getAttribute("success_achat") != null){
       		%>
   			<div class='container alert alert-success text-center w-50' role='alert'>
				<%= session.getAttribute("success_achat")%>
			</div>
			<%
       			}
			%>
			<%
        		if(session.getAttribute("success_achat_mod") != null){
       		%>
   			<div class='container alert alert-success text-center w-50' role='alert'>
				<%= session.getAttribute("success_achat_mod")%>
			</div>
			<%
       			}
			%>
			<%
        		if(session.getAttribute("success_achat_projet") != null){
       		%>
   			<div class='container alert alert-success text-center w-50' role='alert'>
				<%= session.getAttribute("success_achat_projet")%>
			</div>
			<%
       			}
			%>
			<%
        		if(session.getAttribute("success_achatprojet_mod") != null){
       		%>
   			<div class='container alert alert-success text-center w-50' role='alert'>
				<%= session.getAttribute("success_achatprojet_mod")%>
			</div>
			<%
       			}
			%>
			<%
        		if(session.getAttribute("success_achat_programme") != null){
       		%>
   			<div class='container alert alert-success text-center w-50' role='alert'>
				<%= session.getAttribute("success_achat_programme")%>
			</div>
			<%
       			}
			%>
			<%
        		if(session.getAttribute("success_achatprogramme_mod") != null){
       		%>
   			<div class='container alert alert-success text-center w-50' role='alert'>
				<%= session.getAttribute("success_achatprogramme_mod")%>
			</div>
			<%
       			}
			%>
			<div class="my-4 text-center">
				<a href="ajouter-achat.jsp" class="btn btn-primary"><i class="fas fa-plus-square"></i> Ajouter un achat</a>
			</div>
			<div class="text-center my-3">
				<button class="btn btn-primary" onclick="biens()">Achats des biens</button>
				<button class="btn btn-primary" onclick="pogramme()">Achats des programmes</button>
				<button class="btn btn-primary" onclick="projet()">Achats des projets</button>
			</div>
			<div id="biens">
				<h1 class="text-center">Achats des biens</h1>
				<table class="table table-bordered mt-5 bg-white">
        			<thead class="text-center">
                		<tr>
                			<th scope="col">#</th>
                    		<th scope="col">Nom du client</th>
                    		<th scope="col">Nom du bien</th>
                    		<th scope="col">Type du bien</th>
                    		<th scope="col">Date</th>
                    		<th scope="col">Confirmation</th>
                    		<th scope="col">Actions</th>
               			</tr>
          			</thead>
           			<tbody class="text-center">
          				<%
          					int j =1;
							for(Achat item : achats){
						%>
             			<tr>
                			<td><%= j++ %></td>          
                    		<td><%= item.getClientPrenom() %> <%= item.getClientNom() %></td>
                    		<td><%= item.getBienNom() %></td>
                    		<td><%= item.getBienType() %></td>
                    		<td><%= item.getDate() %></td>
                    		<td>
                    			<%
                    				if(item.getConfirmation() == null){
                    			%>
                    			Pas encore de confirmation, si le client à payer veuillez le confirmé
                    			<%
                    				}else{
                    			%>
                    			<%= item.getConfirmation() %>
                    			<%
                    				}
                    			%>
                    		</td>
                    		<td class="row-style"> 
                    			<div class="row">
                        			<div class="col-md-6">
                        				<a href="modifier-achat.jsp?id=<%=item.getId() %>" target="_blank"> 
                                			<i class="fas fa-edit text-success awesome-size"></i>
                                		</a>
                           			</div>
                           			<div class="col-md-6">
                    					<form action="<%= request.getContextPath() %>/SupprimerAchatBien" method="POST">
                        					<input type="hidden" name="id" value="<%=item.getId() %>">
                          					<button type="submit" class="btn-style" name="submit" onclick='return confirm("Voulez-vous supprimer ce bien")'>
                            					<i class="fas fa-trash-alt text-danger awesome-size"></i>
                            				</button>
                      					</form>
                    				</div>
                   				</div>
                 			</td>
              			</tr>
              			<% 
	            			}
	            		%>
           			</tbody>    
     			</table>
			</div>
			<div id="projet" style="display:none;">
				<h1 class="text-center">Achats des projets</h1>
				<table class="table table-bordered mt-5 bg-white">
        			<thead class="text-center">
                		<tr>
                			<th scope="col">#</th>
                    		<th scope="col">Nom du client</th>
                    		<th scope="col">Nom du projet</th>
                    		<th scope="col">Nom du résidence</th>
                    		<th scope="col">Date</th>
                    		<th scope="col">Confirmation</th>
                    		<th scope="col">Actions</th>
               			</tr>
          			</thead>
           			<tbody class="text-center">
          				<%
          					int i =1;
							for(AchatProjet item : projets){
						%>
             			<tr>
                			<td><%= i++ %></td>          
                    		<td><%= item.getClientPrenom() %> <%= item.getClientNom() %></td>
                    		<td><%= item.getProjetNom() %></td>
                    		<td><%= item.getBienNom() %></td>
                    		<td><%= item.getDate() %></td>
                    		<td>
                    			<%
                    				if(item.getConfirmation() == null){
                    			%>
                    			Pas encore de confirmation, si le client à payer veuillez le confirmé
                    			<%
                    				}else{
                    			%>
                    			<%= item.getConfirmation() %>
                    			<%
                    				}
                    			%>
                    		</td>
                    		<td class="row-style"> 
                    			<div class="row">
                        			<div class="col-md-6">
                        				<a href="modifier-achat-projet.jsp?id=<%=item.getId() %>" target="_blank"> 
                                			<i class="fas fa-edit text-success awesome-size"></i>
                                		</a>
                           			</div>
                           			<div class="col-md-6">
                    					<form action="<%= request.getContextPath() %>/SupprimerAchatProjet" method="POST">
                        					<input type="hidden" name="id" value="<%=item.getId() %>">
                          					<button type="submit" class="btn-style" name="submit" onclick='return confirm("Voulez-vous supprimer ce projet")'>
                            					<i class="fas fa-trash-alt text-danger awesome-size"></i>
                            				</button>
                      					</form>
                    				</div>
                   				</div>
                 			</td>
              			</tr>
              			<% 
	            			}
	            		%>
           			</tbody>    
     			</table>
			</div>
			<div id="programme" style="display:none;">
				<h1 class="text-center">Achats des programmes</h1>
				<table class="table table-bordered mt-5 bg-white">
        			<thead class="text-center">
                		<tr>
                			<th scope="col">#</th>
                    		<th scope="col">Nom du client</th>
                    		<th scope="col">Nom du programme</th>
                    		<th scope="col">Nom du résidence</th>
                    		<th scope="col">Date</th>
                    		<th scope="col">Confirmation</th>
                    		<th scope="col">Actions</th>
               			</tr>
          			</thead>
           			<tbody class="text-center">
          				<%
          					int k =1;
							for(AchatProgramme item : programmes){
						%>
             			<tr>
                			<td><%= k++ %></td>          
                    		<td><%= item.getClientPrenom() %> <%= item.getClientNom() %></td>
                    		<td><%= item.getProgrammeNom() %></td>
                    		<td><%= item.getBienNom() %></td>
                    		<td><%= item.getDate() %></td>
                    		<td>
                    			<%
                    				if(item.getConfirmation() == null){
                    			%>
                    			Pas encore de confirmation, si le client à payer veuillez le confirmé
                    			<%
                    				}else{
                    			%>
                    			<%= item.getConfirmation() %>
                    			<%
                    				}
                    			%>
                    		</td>
                    		<td class="row-style"> 
                    			<div class="row">
                        			<div class="col-md-6">
                        				<a href="modifier-achat-programme.jsp?id=<%=item.getId() %>" target="_blank"> 
                                			<i class="fas fa-edit text-success awesome-size"></i>
                                		</a>
                           			</div>
                           			<div class="col-md-6">
                    					<form action="<%= request.getContextPath() %>/SupprimerAchatProgramme" method="POST">
                        					<input type="hidden" name="id" value="<%=item.getId() %>">
                          					<button type="submit" class="btn-style" name="submit" onclick='return confirm("Voulez-vous supprimer ce programme")'>
                            					<i class="fas fa-trash-alt text-danger awesome-size"></i>
                            				</button>
                      					</form>
                    				</div>
                   				</div>
                 			</td>
              			</tr>
              			<% 
	            			}
	            		%>
           			</tbody>    
     			</table>
			</div>
		</div>
	</body>
</html>