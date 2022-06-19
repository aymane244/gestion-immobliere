<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="mobilierModel.Programme"%>
<%@page import="mobilierModel.ProgrammeBien"%>
<%@page import="mobilierDao.ProgrammeDao"%>
<%@page import="java.util.List"%>
<%@page import="Database.ConnectionDB"%>
<%
	ProgrammeDao db = new ProgrammeDao(ConnectionDB.getConnection());
	List<Programme> programmes = db.selectAll();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Ajouter biens</title>
		<%@include file="../includes/css/header.html"%>
		<style>
			<%@include file="../includes/css/styles.css"%>
		</style>
	</head>
<body>
	<%@include file="../includes/navbar-admins.jsp"%>
	<div class="container mt-5 pt-5">
		<div class="text-center py-3">
        	<h2><i class="fas fa-plus-square"></i> Ajouter un bien</h2>
        </div>
		<%= session.getAttribute("msg")%>
		<form action="<%= request.getContextPath() %>/AjouterBienProgramme" method="POST">
        	<div class="row">
        		<div class="col-md-12 my-5">
            		<div class="card card-position">
                		<div class="card-header text-center link-font align-items-center">
                    		<i class="fas fa-plus-square"></i> Ajouter un bien
                   		</div>
                    	<div class="card-body py-5 w-100">
                    		<div class="col-md-12">
     							<label for="titre" class="col-md-12 col-form-label text-md-end">Nom du programme</label>
         						<div class="col-md-12">
            						<div class="d-flex">
               							<i class="fas fa-tag position-awesome"></i>
										<select class="custom-select px-5" name="projet">
											<%
												for(Programme projet: programmes){
											%>
											<option value="<%= projet.getId() %>"><%= projet.getNom() %></option>
											<%
          										}
											%>
										</select>
          	   						</div>
       							</div>
    						</div>
                 			<div class="row mb-3">
                        		<div class="col-md-4">
     	                    		<label for="nom" class="col-md-12 col-form-label text-md-end">Nom du bien</label>
         	                    	<div class="col-md-12">
            	               			<div class="d-flex">
                	           	    		<i class="fas fa-tag position-awesome"></i>
                    	              		<input id="nom" type="text" class="form-control pl-5" name="nom">
          	            	      		</div>
           	              			</div>
                        		</div>
                            	<div class="col-md-4">
     	                    		<label for="prix" class="col-md-12 col-form-label text-md-end">Prix</label>
         	                    	<div class="col-md-12">
            	                		<div class="d-flex">
                	           	    		<i class="fas fa-tag position-awesome"></i>
                    	              		<input id="prix" type="number" min="10000"  step="1000" class="form-control pl-5" name="prix">
          	            	      		</div>
           	               			</div>
                          		</div>
                            	<div class="col-md-4">
     	                    		<label for="prix_metre" class="col-md-12 col-form-label text-md-end">Prix par m²</label>
         	                		<div class="col-md-12">
            	           				<div class="d-flex">
                		   					<i class="fas fa-tag position-awesome"></i>
                                			<input id="prix_metre" type="number" min="1000" step="100" class="form-control pl-5" name="prix_metre">
          	           	   				</div>
           	               			</div>
                   				</div>
          	                	<div class="col-md-6">
     	                    		<label for="chambre" class="col-md-12 col-form-label text-md-end">Chambres</label>
         	                    	<div class="col-md-12">
            	                		<div class="d-flex">
                	           	    		<i class="fas fa-tag position-awesome"></i>
                    	               		<input id="chambre" type="number" min="3" max="10" class="form-control pl-5" name="chambre">
          	            	      		</div>
           	                		</div>
                            	</div>
                            	<div class="col-md-6">
     	          	      	 		<label for="titre" class="col-md-12 col-form-label text-md-end">Type de bien</label>
         	                    	<div class="col-md-12">
            	        	  			<div class="d-flex">
                	           	   			<i class="fas fa-tag position-awesome"></i>
											<select class="custom-select px-5" name="type">
												<option value="">--Choisir le type--</option>
												<option value="Maisons">Maisons</option>
												<option value="Appartement">Appartement</option>
												<option value="Riyads">Riyads</option>
												<option value="Villas">Villas</option>
												<option value="Terrain">Terrain</option>
												<option value="Bureaux & commerce">Bureaux & commerce</option>
											</select>
          	            	      		</div>
           	              			</div>
                        		</div>
                       		</div>
                       		<div class="row mb-0 text-center">
        	           			<div class="col-md-12">
                	          		<button type="submit" name="submit" class="btn btn-primary">Ajouter le bien</button>
                         		</div>
                  	 		</div>
                		</div>
              		</div>
        		</div>
     		</div>
		</form>
	</div>
</body>
</html>