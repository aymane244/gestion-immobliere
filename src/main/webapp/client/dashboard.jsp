<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="mobilierModel.Client"%>
<%@page import="mobilierModel.Achat"%>
<%@page import="mobilierModel.Conseil"%>
<%@page import="mobilierModel.ConseilProgramme"%>
<%@page import="mobilierModel.ConseilProjet"%>
<%@page import="mobilierModel.AchatProgramme"%>
<%@page import="mobilierModel.AchatProjet"%>
<%@page import="mobilierModel.Bien"%>
<%@page import="mobilierDao.BiensDao"%>
<%@page import="mobilierDao.AchatDao"%>
<%@page import="mobilierDao.ConseilDao"%>
<%@page import="Database.ConnectionDB"%>
<%@page import="java.util.List"%>
<%
	AchatDao db = new AchatDao(ConnectionDB.getConnection());
	ConseilDao dbConseil = new ConseilDao(ConnectionDB.getConnection());
	List <Achat> biens = db.selectBiens();
	List <Achat> countBiens = db.countBiens();
	List <Achat> terrains = db.selectTerrains();
	List <Achat> commerces = db.selectCommerces();
	List <AchatProgramme> programmes = db.selectProgrammes();
	List <AchatProjet> projets = db.selectProjet();
	List <Conseil> conseils = dbConseil.selectConseil();

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
			if(clients == null){
				response.sendRedirect("connexion.jsp");
			}else{
		%>
		<div class="container mt-5 pt-5">
			<%
        		if(session.getAttribute("document_success") != null){
       		%>
   			<div class='container alert alert-success text-center' role='alert'>
				<%= session.getAttribute("document_success")%>
			</div>
			<%
       			}
			%>
			<%
        		if(session.getAttribute("document_success_programme") != null){
       		%>
   			<div class='container alert alert-success text-center' role='alert'>
				<%= session.getAttribute("document_success_programme")%>
			</div>
			<%
       			}
			%>
			<%
        		if(session.getAttribute("document_success_projet") != null){
       		%>
   			<div class='container alert alert-success text-center' role='alert'>
				<%= session.getAttribute("document_success_projet")%>
			</div>
			<%
       			}
			%>
			<%
        		if(session.getAttribute("success_clt_conseil") != null){
       		%>
   			<div class='container alert alert-success text-center' role='alert'>
				<%= session.getAttribute("success_clt_conseil")%>
			</div>
			<%
       			}
			%>
			<%
        		if(session.getAttribute("success_clt_conseil_prog") != null){
       		%>
   			<div class='container alert alert-success text-center' role='alert'>
				<%= session.getAttribute("success_clt_conseil_prog")%>
			</div>
			<%
       			}
			%>
			<%
        		if(session.getAttribute("success_clt_conseil_proj") != null){
       		%>
   			<div class='container alert alert-success text-center' role='alert'>
				<%= session.getAttribute("success_clt_conseil_proj")%>
			</div>
			<%
       			}
			%>
			<%
        		if(session.getAttribute("success_clt_mod") != null){
       		%>
   			<div class='container alert alert-success text-center' role='alert'>
				<%= session.getAttribute("success_clt_mod")%>
			</div>
			<%
       			}
			%>
			<%
        		if(session.getAttribute("document_fail") != null){
       		%>
   			<div class='container alert alert-danger text-center w-50' role='alert'>
				<%= session.getAttribute("document_fail")%>
			</div>
			<%
       			}
			%>
			<%
        		if(session.getAttribute("document_fail_programme") != null){
       		%>
   			<div class='container alert alert-danger text-center' role='alert'>
				<%= session.getAttribute("document_fail_programme")%>
			</div>
			<%
       			}
			%>
			<%
        		if(session.getAttribute("document_fail_projet") != null){
       		%>
   			<div class='container alert alert-danger text-center' role='alert'>
				<%= session.getAttribute("document_fail_projet")%>
			</div>
			<%
       			}
			%>
			<h2 class="text-center mt-3">Bienvenue sur votre profile <%= clients.getPrenom() %></h2>
			<div class="row my-5">
				<div class="col-lg-4 border-right">
					<h3 class="text-center">Information personnelle</h3>
					<div class="d-flex align-items-center justify-content-between">
						<%
							if(clients.getImage() == null){
						%>
						<img src="../images/unknown_person.jpg" class="card-image mt-3">
						<%
							}else{
						%>
						<img src="../images/client/<%=clients.getImage()%>" class="card-image mt-3">
						<%	
							}
						%>
						<a href="modifier-profile.jsp" class="btn btn-info">Modifier mon profile</a>
					</div>
					<div class="mt-3 pl-3">
						<p>
							Nom: <%= clients.getNom() %> <br>
							Prénom: <%= clients.getPrenom() %> <br>
							Email: <%= clients.getEmail() %>
						</p>
					</div>
					<hr>
					<h3 class="text-center"><a href="notaires.jsp" target="_blank">Liste des notaires</a></h3>
				</div>
				<div class="col-lg-8">
					<h3 class="text-center">Mes achats</h3>
					<div class="row align-items-center text-center">
						<div class="col-lg-12 mt-4">
							<h4>Achats en détail</h4>
							<div class="row">
								<div class="col-lg-4">
									<div style="width:100%; height:100%;" class="rounded p-4 bg-footer">
										<h5 class="">Vos biens</h5>
										<button type="button" class="btn btn-info mt-2" data-toggle="modal" data-target="#biens"> Détails</button>
									</div>
								</div>
								<div class="col-lg-4">
									<div style="width:100%; height:100%;" class="rounded p-4 bg-footer">
										<h5 class="">Vos Terrains</h5>
										<button type="button" class="btn btn-info mt-2" data-toggle="modal" data-target="#terrains">Détails</button>
									</div>
								</div>
								<div class="col-lg-4">
									<div style="width:100%; height:100%;" class="rounded p-4 bg-footer">
										<h5 class="">Vos Bureaux & commerces</h5>
										<button type="button" class="btn btn-info mt-2" data-toggle="modal" data-target="#commerce">Détails</button>
									</div>
								</div>
								<div class="col-lg-6">
									<div style="width:100%; height:100%;" class="rounded p-4 bg-footer mt-4">
										<h5 class="">Projets</h5>
										<button type="button" class="btn btn-info mt-2" data-toggle="modal" data-target="#projet">Détails</button>
									</div>
								</div>
								<div class="col-lg-6">
									<div style="width:100%; height:100%;" class="rounded p-4 bg-footer mt-4">
										<h5 class="">Programmes</h5>
										<button type="button" class="btn btn-info mt-2" data-toggle="modal" data-target="#programme">Détails</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>		
			</div>
			<div class="modal fade" id="biens" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  				<div class="modal-dialog">
    				<div class="modal-content">
      					<div class="modal-header">
        					<h5 class="modal-title" id="exampleModalLabel">Vos biens</h5>
        					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          						<span aria-hidden="true">&times;</span>
        					</button>
      					</div>
      					<div class="modal-body">
        					<table class="table table-bordered mt-5 bg-white">
            					<thead class="text-center">
                    				<tr>
                    					<th scope="col">#</th>
                        				<th scope="col">Nom du bien</th>
                        				<th scope="col">Type du bien</th>
                        				<th scope="col">Date d'achat</th>
                        				<th scope="col">Confirmation d'achat</th>
                        				<th scope="col">Documents</th>
                        				<th scope="col">Demande de conseil</th>
                        				<th scope="col">Actions</th>
                    				</tr>
								</thead>
                				<tbody class="text-center">
									<tr>
										<%
											int i = 1;
											for(Achat achat : biens){
												if(achat.getClient() == clients.getId()){
										%>
	                   					<td class="row-style"><%= i++ %></td>  
	                   					<td class="row-style"><%= achat.getBienNom() %></td>          
	                    				<td class="row-style"><%= achat.getBienType() %></td>
	                    				<td class="row-style"><%= achat.getDate() %> </td>
	                    				<td class="row-style">
	                    					<% 
	                    						if(achat.getConfirmation() == null){
	                    					%>	
	                    					<h6>En cours de traitement</h6>
	                    					<% 
	                    						}else{
	                    					%>
	                    						<%= achat.getConfirmation() %>
	                    					<% 
	                    						}
	                    					%>
	                    				</td>
	                    				<td class="row-style">
	                    					<% 
	                    						if(achat.getConfirmation() == null){
	                    					%>	
	                    					<h6>Contactez l'agent pour vous confirmer l'achat</h6>
	                    					<% 
	                    						}else if(achat.getDocument() != null){
	                    					%>
	                    					<h6>Document envoyé</h6>
	                    					<% 
	                    						}else{
	                    					%>
	                    					<form action="<%= request.getContextPath() %>/AjouterDocumentBien" method="POST" enctype="multipart/form-data">
	                    						<input type="file" name="document"> 
	                    						<input type="hidden" name="id" value="<%= achat.getId() %>">
	                    						<button type="submit" class="btn btn-primary">Envoyer</button>
	                    					</form>
	                    					<% 
	                    						}
	                    					%>
	                    				</td>
	                    				<td class="row-style">
	                    					<%
	                    						Conseil con = dbConseil.selectConseils(achat.getBienId(), clients.getId());
	                    						if(con.getConseil() == null){
	                    					%>
	                    					<button class="btn btn-info" disabled>Demande envoyée</button>
	                    					<%		
	                    						}else if(con != null){
	                    					%>
	                    					
	                    					<a href="voir-message.jsp?id=<%= con.getId() %>" class="btn btn-info mt-2"> Voir message</a>
	                    					<%		
	                    						}else{
	                    					%>
	                    					<a href="demande-conseil.jsp?id=<%= achat.getId() %>" class="btn btn-info">Demande de conseil</a>
	                    					<%		
	                    						}
	                    					%>
	                    				</td>
	                   					<td>
	                        				<form action="<%= request.getContextPath() %>/SupprimerAchat" method="POST">
	                            				<input type="hidden" name="id" value="<%= achat.getId() %>">
	                                			<button type="submit" class="btn-style" name="submit" onclick='return confirm("Voulez-vous supprimer ce bien ?")'>
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
      					<div class="modal-footer">
        					<button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
      					</div>
    				</div>
  				</div>
			</div>
			<div class="modal fade" id="terrains" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  				<div class="modal-dialog">
    				<div class="modal-content">
      					<div class="modal-header">
        					<h5 class="modal-title" id="exampleModalLabel">Vos terrains</h5>
        					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          						<span aria-hidden="true">&times;</span>
        					</button>
      					</div>
      					<div class="modal-body">
        					<table class="table table-bordered mt-5 bg-white">
            					<thead class="text-center">
                    				<tr>
                    					<th scope="col">#</th>
                        				<th scope="col">Nom du bien</th>
                        				<th scope="col">Type du bien</th>
                        				<th scope="col">Date d'achat</th>
                        				<th scope="col">Confirmation d'achat</th>
                        				<th scope="col">Documents</th>
                        				<th scope="col">Demande de conseil</th>
                        				<th scope="col">Actions</th>
                    				</tr>
								</thead>
                				<tbody class="text-center">
									<tr>
										<%
											int j = 1;
											for(Achat achat : terrains){
												if(achat.getClient() == clients.getId()){
										%>
	                   					<td class="row-style"><%= j++ %></td>  
	                   					<td class="row-style"><%= achat.getBienNom() %></td>          
	                    				<td class="row-style"><%= achat.getBienType() %></td>
	                    				<td class="row-style"><%= achat.getDate() %></td>
	                    				<td class="row-style">
	                    					<% 
	                    							if(achat.getConfirmation() == null){
	                    					%>
	                    					<h6>En cours de traitement</h6>
	                    					<% 
	                    							}else{
	                    					%>
	                    						<%= achat.getConfirmation() %>
	                    					<% 
	                    							}
	                    					%>
	                    				</td>
	                    				<td class="row-style">
	                    					<% 
	                    						if(achat.getConfirmation() == null){
	                    					%>	
	                    					<h6>Contactez l'agent pour vous confirmer l'achat</h6>
	                    					<% 
	                    						}else if(achat.getDocument() != null){
	                    					%>
	                    					<h6>Document envoyé</h6>
	                    					<% 
	                    						}else{
	                    					%>
	                    					<form action="<%= request.getContextPath() %>/AjouterDocumentBien" method="POST" enctype="multipart/form-data">
	                    						<input type="file" name="document"> 
	                    						<input type="hidden" name="id" value="<%= achat.getId() %>">
	                    						<button type="submit" class="btn btn-primary">Envoyer</button>
	                    					</form>
	                    					<% 
	                    						}
	                    					%>
	                    				</td>
	                    				<td class="row-style">
	                    					<%
	                    						Conseil con = dbConseil.selectConseils(achat.getBienId(), clients.getId());
	                    						if(con.getConseil() == null){
	                    					%>
	                    					<button class="btn btn-info" disabled>Demande envoyée</button>
	                    					<%		
	                    						}else if(con != null){
	                    					%>
	                    					
	                    					<a href="voir-message.jsp?id=<%= con.getId() %>" class="btn btn-info mt-2"> Voir message</a>
	                    					<%		
	                    						}else{
	                    					%>
	                    					<a href="demande-conseil.jsp?id=<%= achat.getId() %>" class="btn btn-info">Demande de conseil</a>
	                    					<%		
	                    						}
	                    					%>
	                    				</td>
	                   					<td class="row-style"> 
	                        				<form action="<%= request.getContextPath() %>/SupprimerAchat" method="POST">
	                            				<input type="hidden" name="id" value="<%= achat.getId() %>">
	                                			<button type="submit" class="btn-style" name="submit" onclick='return confirm("Voulez-vous supprimer ce bien ?")'>
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
      					<div class="modal-footer">
        					<button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
      					</div>
    				</div>
  				</div>
			</div>
			<div class="modal fade" id="commerce" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  				<div class="modal-dialog">
    				<div class="modal-content">
      					<div class="modal-header">
        					<h5 class="modal-title" id="exampleModalLabel">Bureaux & commerce</h5>
        					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          						<span aria-hidden="true">&times;</span>
        					</button>
      					</div>
      					<div class="modal-body">
        					<table class="table table-bordered mt-5 bg-white">
            					<thead class="text-center">
                    				<tr>
                    					<th scope="col">#</th>
                        				<th scope="col">Nom du bien</th>
                        				<th scope="col">Type du bien</th>
                        				<th scope="col">Date d'achat</th>
                        				<th scope="col">Confirmation d'achat</th>
                        				<th scope="col">Documents</th>
                        				<th scope="col">Demande de conseil</th>
                        				<th scope="col">Actions</th>
                    				</tr>
								</thead>
                				<tbody class="text-center">
									<tr>
										<%
											int k = 1;
											for(Achat achat : commerces){
												if(achat.getClient() == clients.getId()){
										%>
	                   					<td class="row-style"><%= k++ %></td>  
	                   					<td class="row-style"><%= achat.getBienNom() %></td>          
	                    				<td class="row-style"><%= achat.getBienType() %></td>
	                    				<td class="row-style"><%= achat.getDate() %></td>
	                    				<td class="row-style">
	                    					<% 
	                    						if(achat.getConfirmation() == null){
	                    					%>	
	                    					<h6>En cours de traitement</h6>
	                    					<% 
	                    						}else{
	                    					%>
	                    						<%= achat.getConfirmation() %>
	                    					<% 
	                    						}
	                    					%>
	                    				</td>
	                    				<td class="row-style">
	                    					<% 
	                    						if(achat.getConfirmation() == null){
	                    					%>	
	                    					<h6>Contactez l'agent pour vous confirmer l'achat</h6>
	                    					<% 
	                    						}else if(achat.getDocument() != null){
	                    					%>
	                    					<h6>Document envoyé</h6>
	                    					<% 
	                    						}else{
	                    					%>
	                    					<form action="<%= request.getContextPath() %>/AjouterDocumentBien" method="POST" enctype="multipart/form-data">
	                    						<input type="file" name="document">
	                    						<input type="hidden" name="id" value="<%= achat.getId() %>">
	                    						<button type="submit" class="btn btn-primary">Envoyer</button>
	                    					</form>
	                    					<% 
	                    						}
	                    					%>
	                    				</td>
	                    				<td class="row-style">
	                    					<%
	                    						Conseil con = dbConseil.selectConseils(achat.getBienId(), clients.getId());
	                    						if(con.getConseil() == null){
	                    					%>
	                    					<button class="btn btn-info" disabled>Demande envoyée</button>
	                    					<%		
	                    						}else if(con != null){
	                    					%>
	                    					
	                    					<a href="voir-message.jsp?id=<%= con.getId() %>" class="btn btn-info mt-2"> Voir message</a>
	                    					<%		
	                    						}else{
	                    					%>
	                    					<a href="demande-conseil.jsp?id=<%= achat.getId() %>" class="btn btn-info">Demande de conseil</a>
	                    					<%		
	                    						}
	                    					%>
	                    				</td>
	                   					<td class="row-style"> 
	                        				<form action="<%= request.getContextPath() %>/SupprimerAchat" method="POST">
	                            				<input type="hidden" name="id" value="<%= achat.getId() %>">
	                                			<button type="submit" class="btn-style" name="submit" onclick='return confirm("Voulez-vous supprimer ce bien ?")'>
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
      					<div class="modal-footer">
        					<button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
      					</div>
    				</div>
  				</div>
			</div>
			<div class="modal fade" id="projet" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  				<div class="modal-dialog">
    				<div class="modal-content">
      					<div class="modal-header">
        					<h5 class="modal-title" id="exampleModalLabel">Projets</h5>
        					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          						<span aria-hidden="true">&times;</span>
        					</button>
      					</div>
      					<div class="modal-body">
        					<table class="table table-bordered mt-5 bg-white">
            					<thead class="text-center">
                    				<tr>
                    					<th scope="col">#</th>
                        				<th scope="col">Nom du projet</th>
                        				<th scope="col">Nom du résidence</th>
                        				<th scope="col">Date d'achat</th>
                        				<th scope="col">Confirmation d'achat</th>
                        				<th scope="col">Documents</th>
                        				<th scope="col">Demande de conseil</th>
                        				<th scope="col">Actions</th>
                    				</tr>
								</thead>
                				<tbody class="text-center">
									<tr>
										<%
		      								int f = 1;
											for(AchatProjet achat : projets){
												if(achat.getClient() == clients.getId()){
										%>
	                   					<td class="row-style"><%= f++ %></td> 
	                   					<td class="row-style"><%= achat.getProjetNom() %></td>         
	                    				<td class="row-style"><%= achat.getBienNom() %></td>
	                    				<td class="row-style"><%= achat.getDate() %></td>
	                    				<td class="row-style">
	                    					<% 
	                    						if(achat.getConfirmation() == null){
	                    					%>	
	                    					<h6>En cours de traitement</h6>
	                    					<% 
	                    						}else{
	                    					%>
	                    						<%= achat.getConfirmation() %>
	                    					<% 
	                    						}
	                    					%>
	                    				</td>
	                    				<td class="row-style">
	                    					<% 
	                    						if(achat.getConfirmation() == null){
	                    					%>	
	                    					<h6>Contactez l'agent pour vous confirmer l'achat</h6>
	                    					<% 
	                    						}else if(achat.getDocument() != null){
	                    					%>
	                    					<h6>Document envoyé</h6>
	                    					<% 
	                    						}else{
	                    					%>
	                    					<form action="<%= request.getContextPath() %>/AjouterDocumentProjet" method="POST" enctype="multipart/form-data">
	                    						<input type="file" name="document"> 
	                    						<input type="hidden" name="id" value="<%= achat.getId() %>">
	                    						<button type="submit" class="btn btn-primary">Envoyer</button>
	                    					</form>
	                    					<% 
	                    						}
	                    					%>
	                    				</td>
	                    				<td class="row-style">
	                    					<%
	                    						ConseilProjet con = dbConseil.selectConseilsProjet(achat.getBienId(), achat.getClient());
	                    						if(con.getMessage() == null){
	                    					%>
	                    					<button class="btn btn-info" disabled>Demande envoyée</button>
	                    					<%		
	                    						}else if(con != null){
	                    					%>
	                    					
	                    					<a href="voir-message-projet.jsp?id=<%= con.getId() %>" class="btn btn-info mt-2"> Voir message</a>
	                    					<%		
	                    						}else{
	                    					%>
	                    					<a href="demande-conseil-projet.jsp?id=<%= achat.getId() %>" class="btn btn-info">Demande de conseil</a>
	                    					<%		
	                    						}
	                    					%>
	                    				</td>
	                   					<td class="row-style"> 
	                        				<form action="<%= request.getContextPath() %>/SupprimerAchatProjet" method="POST">
	                            				<input type="hidden" name="id" value="<%= achat.getId() %>">
	                                			<button type="submit" class="btn-style" name="submit" onclick='return confirm("Voulez-vous supprimer ce bien ?")'>
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
      					<div class="modal-footer">
        					<button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
      					</div>
    				</div>
  				</div>
			</div>
			<div class="modal fade" id="programme" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  				<div class="modal-dialog">
    				<div class="modal-content">
      					<div class="modal-header">
        					<h5 class="modal-title" id="exampleModalLabel">Programmes</h5>
        					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          						<span aria-hidden="true">&times;</span>
        					</button>
      					</div>
      					<div class="modal-body">
        					<table class="table table-bordered mt-5 bg-white">
            					<thead class="text-center">
                    				<tr>
                    					<th scope="col">#</th>
                        				<th scope="col">Nom du programme</th>
                        				<th scope="col">Nom du résidence</th>
                        				<th scope="col">Date d'achat</th>
                        				<th scope="col">Confirmation d'achat</th>
                        				<th scope="col">Documents</th>
                        				<th scope="col">Demande de conseil</th>
                        				<th scope="col">Actions</th>
                    				</tr>
								</thead>
                				<tbody class="text-center">
									<tr>
										<%
											int a = 1;
											for(AchatProgramme achat : programmes){
												if(achat.getClient() == clients.getId()){
										%>
	                   					<td class="row-style"><%= a++ %></td>  
	                   					<td class="row-style"><%= achat.getProgrammeNom() %></td>          
	                    				<td class="row-style"><%= achat.getBienNom() %></td>
	                    				<td class="row-style"><%= achat.getDate() %></td>
	                    				<td class="row-style">
	                    					<% 
	                    						if(achat.getConfirmation() == null){
	                    					%>	
	                    					<h6>En cours de traitement</h6>
	                    					<% 
	                    						}else{
	                    					%>
	                    						<%= achat.getConfirmation() %>
	                    					<% 
	                    						}
	                    					%>
	                    				</td>
	                    				<td class="row-style">
	                    					<% 
	                    						if(achat.getConfirmation() == null){
	                    					%>	
	                    					<h6>Contactez l'agent pour vous confirmer l'achat</h6>
	                    					<% 
	                    						}else if(achat.getDocument() != null){
	                    					%>
	                    					<h6>Document envoyé</h6>
	                    					<% 
	                    						}else{
	                    					%>
	                    					<form action="<%= request.getContextPath() %>/AjouterDocumentProgramme" method="POST" enctype="multipart/form-data">
	                    						<input type="file" name="document"> 
	                    						<input type="hidden" name="id" value="<%= achat.getId() %>">
	                    						<button type="submit" class="btn btn-primary">Envoyer</button>
	                    					</form>
	                    					<% 
	                    						}
	                    					%>
	                    				</td>
	                    				<td class="row-style">
	                    					<%
	                    						ConseilProgramme con = dbConseil.selectConseilsProgramme(achat.getBienId(), achat.getClient());
	                    						if(con.getMessage() == null){
	                    					%>
	                    					<button class="btn btn-info" disabled>Demande envoyée</button>
	                    					<%		
	                    						}else if(con != null){
	                    					%>
	                    					
	                    					<a href="voir-message-programme.jsp?id=<%= con.getId() %>" class="btn btn-info mt-2"> Voir message</a>
	                    					<%		
	                    						}else{
	                    					%>
	                    					<a href="demande-conseil-programme.jsp?id=<%= achat.getId() %>" class="btn btn-info">Demande de conseil</a>
	                    					<%		
	                    						}
	                    					%>
	                    				</td>
	                   					<td class="row-style"> 
	                        				<form action="<%= request.getContextPath() %>/SupprimerAchatProgramme" method="POST">
	                            				<input type="hidden" name="id" value="<%= achat.getId() %>">
	                                			<button type="submit" class="btn-style" name="submit" onclick='return confirm("Voulez-vous supprimer ce bien ?")'>
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
      					<div class="modal-footer">
        					<button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
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