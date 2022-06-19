<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="mobilierModel.Bien"%>
<%@page import="mobilierModel.Client"%>
<%@page import="mobilierModel.ProgrammeBien"%>
<%@page import="mobilierModel.ProjetBien"%>
<%@page import="mobilierDao.BiensDao"%>
<%@page import="mobilierDao.ClientDao"%>
<%@page import="mobilierDao.ProgrammeDao"%>
<%@page import="mobilierDao.ProjetDao"%>
<%@page import="java.util.List"%>
<%@page import="Database.ConnectionDB"%>
<%
	BiensDao dbBien = new BiensDao(ConnectionDB.getConnection());
	ClientDao db = new ClientDao(ConnectionDB.getConnection());
	ProjetDao dbProjet = new ProjetDao(ConnectionDB.getConnection());
	ProgrammeDao dbProgramme = new ProgrammeDao(ConnectionDB.getConnection());
	List<Bien> biens = dbBien.selectAll();
	List<Client> client = db.selectAll();
	List<ProjetBien> projets = dbProjet.selectAll();
	List<ProgrammeBien> programmes = dbProgramme.selectAllProgramme();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Ajouter un achat</title>
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
		<div class="container my-5 pt-5 pb-5">
			<div class="row">
				<div class="col-lg-12 col-md-12">
					<div class="d-flex justify-content-center my-4">
						<button class="btn btn-primary" onclick="achatBien()">Biens</button>
						<button class="btn btn-primary mx-3" onclick="achatProjet()">Projets</button>
						<button class="btn btn-primary" onclick="achatProgramme()">Programmes</button>
					</div>
					<div class="card">
						<div id="biens">
							<div class="card-header text-center link-font">
                            	<h3><i class="fas fa-plus-square"></i> Ajouter Achat bien</h3>
                        	</div>
                        	<div class="card-body py-5">
                        		<form action="<%= request.getContextPath() %>/AjouterAchatAgent" method="post">
                        			<div class="row">
                        				<div class="col-lg-4">
     	                             		<label for="bien" class="col-md-12 col-form-label text-md-end">Nom du bien</label>
         	                         		<div class="col-md-12">
            	                  	    		<div class="d-flex">
                	           	            		<i class="fas fa-tag position-awesome"></i>
													<select class="custom-select px-5" name="id_bien">
														<option value="">--Choisir le nom du bien--</option>
														<%
          													for(Bien bien: biens){
														%>
														<option value="<%= bien.getId() %>"><%= bien.getNom() %></option>
														<%
          													}
														%>
													</select>
          	            	               		</div>
           	                	     		</div>
                                    	</div>
                                    	<div class="col-lg-4">
     	                             		<label for="nom_client" class="col-md-12 col-form-label text-md-end">Nom du client</label>
         	                         		<div class="col-md-12">
            	                  	    		<div class="d-flex">
                	           	            		<i class="fas fa-tag position-awesome"></i>
													<select class="custom-select px-5" name="id_client">
														<option value="">--Nom du client--</option>
														<%
          													for(Client clt: client){
														%>
														<option value="<%= clt.getId() %>"><%= clt.getPrenom() %> <%= clt.getNom() %></option>
														<%
          													}
														%>
													</select>
          	            	               		</div>
           	                	     		</div>
                                    	</div>
                                	</div>
                                	<div class="row mb-0 text-center mt-5">
                                    	<div class="col-md-12">
                                        	<button type="submit" class="btn btn-primary">Ajouter Achat</button>
                                    	</div>
                                	</div>
                        		</form>
                        	</div>				
						</div>
						<div id="projets" style="display:none;">
							<div class="card-header text-center link-font">
                            	<h3><i class="fas fa-plus-square"></i> Ajouter Achat bien projet</h3>
                        	</div>
                        	<div class="card-body py-5">
                        		<form action="<%= request.getContextPath() %>/AjouterAchatProjetAgent" method="post">
                        			<div class="row">
                        				<div class="col-lg-4">
     	                             		<label for="nom_projet" class="col-md-12 col-form-label text-md-end">Nom du projet</label>
         	                         		<div class="col-md-12">
            	                  	    		<div class="d-flex">
                	           	            		<i class="fas fa-tag position-awesome"></i>
													<select class="custom-select px-5" name="id_projet">
														<option value="">--Choisir le nom du projet--</option>
														<%
          													for(ProjetBien bien: projets){
														%>
														<option value="<%= bien.getId() %>"><%= bien.getNom() %></option>
														<%
          													}
														%>
													</select>
          	            	               		</div>
           	                	     		</div>
                                    	</div>
                                    	<div class="col-lg-4">
     	                             		<label for="nom_client_projet" class="col-md-12 col-form-label text-md-end">Nom du client</label>
         	                         		<div class="col-md-12">
            	                  	    		<div class="d-flex">
                	           	            		<i class="fas fa-tag position-awesome"></i>
													<select class="custom-select px-5" name="id_client_projet">
														<option value="">--Nom du client--</option>
														<%
          													for(Client clt: client){
														%>
														<option value="<%= clt.getId()%>"><%= clt.getPrenom() %> <%= clt.getNom() %></option>
														<%
          													}
														%>
													</select>
          	            	               		</div>
           	                	     		</div>
                                    	</div>
                                	</div>
                                	<div class="row mb-0 text-center mt-5">
                                    	<div class="col-md-12">
                                        	<button type="submit" class="btn btn-primary">Ajouter Achat</button>
                                    	</div>
                                	</div>
                        		</form>
                        	</div>				
						</div>
						<div id="programmes" style="display:none;">
							<div class="card-header text-center link-font">
                            	<h3><i class="fas fa-plus-square"></i> Ajouter Achat bien programme</h3>
                        	</div>
                        	<div class="card-body py-5">
                        		<form action="<%= request.getContextPath() %>/AjouterAchatProgrammeAgent" method="post">
                        			<div class="row">
                        				<div class="col-lg-4">
     	                             		<label for="nom_programme" class="col-md-12 col-form-label text-md-end">Nom du programme</label>
         	                         		<div class="col-md-12">
            	                  	    		<div class="d-flex">
                	           	            		<i class="fas fa-tag position-awesome"></i>
													<select class="custom-select px-5" name="id_programme">
														<option value="">--Choisir le nom du programme--</option>
														<%
          													for(ProgrammeBien bien: programmes){
														%>
														<option value="<%= bien.getId() %>"><%= bien.getNom() %></option>
														<%
          													}
														%>
													</select>
          	            	               		</div>
           	                	     		</div>
                                    	</div>
                                    	<div class="col-lg-4">
     	                             		<label for="nom_client_programme" class="col-md-12 col-form-label text-md-end">Nom du client</label>
         	                         		<div class="col-md-12">
            	                  	    		<div class="d-flex">
                	           	            		<i class="fas fa-tag position-awesome"></i>
													<select class="custom-select px-5" name="client_id_programme">
														<option value="">--Nom du client--</option>
														<%
          													for(Client clt: client){
														%>
														<option value="<%= clt.getId() %>"><%= clt.getPrenom() %> <%= clt.getNom() %></option>
														<%
          													}
														%>
													</select>
          	            	               		</div>
           	                	     		</div>
                                    	</div>
                                	</div>
                                	<div class="row mb-0 text-center mt-5">
                                    	<div class="col-md-12">
                                        	<button type="submit" class="btn btn-primary">Ajouter Achat</button>
                                    	</div>
                                	</div>
                        		</form>
                        	</div>				
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>