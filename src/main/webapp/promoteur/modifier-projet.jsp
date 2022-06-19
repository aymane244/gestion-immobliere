<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="mobilierModel.ProjetBien"%>
<%@page import="mobilierDao.ProjetDao"%>
<%@page import="Database.ConnectionDB"%>
<%
	int id =Integer.parseInt(request.getParameter("id"));
	ProjetDao db = new ProjetDao(ConnectionDB.getConnection());
	ProjetBien projet = db.selectBiens(id);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Modifier un projet</title>
		<%@include file="../includes/css/header.html"%>
		<style>
			<%@include file="../includes/css/styles.css"%>
		</style>
	</head>
	<body>
		<%@include file="../includes/navbar-admins.jsp"%>
		<div class="container mt-5 pt-5">
			<%
        		if(session.getAttribute("fail_pro_mod_proj") != null){
       		%>
   			<div class='container alert alert-danger text-center w-50' role='alert'>
				<%= session.getAttribute("fail_pro_mod_proj")%>
			</div>
			<%
       			}
			%>
			<div class="text-center py-3">
            	<h2><i class="fas fa-plus-square"></i> Modifier un projet</h2>
          	</div>
          	<form action="<%= request.getContextPath() %>/ModifierProjet" method="POST" enctype="multipart/form-data">
          		<input type="hidden" value="<%= projet.getId() %>" name="id">
             	<div class="row">
                	<div class="col-md-12 my-5">
                    	<div class="card card-position">
                        	<div class="card-header text-center link-font align-items-center">
                            	<i class="fas fa-plus-square"></i> Modifier un projet
                           	</div>
                           	<div class="card-body py-5 w-100">
                            	<div class="row mb-3">
                                	<label for="titre" class="col-md-12 col-form-label text-md-end">Nom du projet</label>
                                  	<div class="col-md-12">
                              	    	<div class="d-flex">
                           	            	<i class="fas fa-tag position-awesome"></i>
                                            <input id="titre" type="text" class="form-control pl-5" name="titre" value="<%= projet.getNomProjet() %>">
          	                           </div>
           	                     	</div>
                                 </div>
                                 <div class="row mb-3">
                                 	<div class="col-md-4">
     	                             	<label for="nom" class="col-md-12 col-form-label text-md-end">Nom du bien</label>
         	                         	<div class="col-md-12">
            	                  	    	<div class="d-flex">
                	           	            	<i class="fas fa-tag position-awesome"></i>
                    	                        <input id="nom" type="text" class="form-control pl-5" name="nom" value="<%= projet.getNom() %>">
          	            	               </div>
           	                	     	</div>
                                 	</div>
                                 	<div class="col-md-4">
     	                             	<label for="prix" class="col-md-12 col-form-label text-md-end">Prix</label>
         	                         	<div class="col-md-12">
            	                  	    	<div class="d-flex">
                	           	            	<i class="fas fa-tag position-awesome"></i>
                    	                        <input id="prix" type="number" min="10000"  step="1000" class="form-control pl-5" name="prix" value="<%= projet.getPrix() %>">
          	            	               </div>
           	                	     	</div>
                                 	</div>
                                 	<div class="col-md-4">
     	                             	<label for="prix_metre" class="col-md-12 col-form-label text-md-end">Prix par m²</label>
         	                         	<div class="col-md-12">
            	                  	    	<div class="d-flex">
                	           	            	<i class="fas fa-tag position-awesome"></i>
                    	                        <input id="prix_metre" type="number" min="3000" step="100" class="form-control pl-5" name="prix_metre" value="<%= projet.getPrixMetre() %>">
          	            	               </div>
           	                	     	</div>
                                 	</div>
                                 	<div class="col-md-4">
     	                             	<label for="chambre" class="col-md-12 col-form-label text-md-end">chambres</label>
         	                         	<div class="col-md-12">
            	                  	    	<div class="d-flex">
                	           	            	<i class="fas fa-tag position-awesome"></i>
                    	                        <input id="chambre" type="number" min="3" max="10" class="form-control pl-5" name="chambre" value="<%= projet.getChambre() %>">
          	            	               </div>
           	                	     	</div>
                                 	</div>
                                 	<div class="col-md-4">
     	                             	<label for="titre" class="col-md-12 col-form-label text-md-end">Type de bien</label>
         	                         	<div class="col-md-12">
            	                  	    	<div class="d-flex">
                	           	            	<i class="fas fa-tag position-awesome"></i>
												<select class="custom-select px-5" name="type">
													<option value="<%= projet.getType() %>"><%= projet.getType() %></option>
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
                                 	<div class="col-md-4">
     	                             	<label for="date" class="col-md-12 col-form-label text-md-end">Date de livraison</label>
         	                         	<div class="col-md-12">
            	                  	    	<div class="d-flex">
												<i class="fas fa-calendar position-awesome"></i>
                    	                        <input id="date" type="date" class="form-control pl-5" name="date" value="<%= projet.getDate() %>">
          	            	               </div>
           	                	     	</div>
                                 	</div>
                                 	<div class="col-md-4">
     	                             	<label for="etat" class="col-md-12 col-form-label text-md-end">Etat de construction</label>
         	                         	<div class="col-md-12">
            	                  	    	<div class="d-flex">
                	           	            	<i class="fas fa-tag position-awesome"></i>
												<select class="custom-select px-5" name="etat">
													<option value="<%= projet.getEtat() %>"><%= projet.getEtat() %></option>
													<option value="">--Etat de construction--</option>
													<option value="En cours">En cours</option>
													<option value="Livré">Livré</option>
												</select>
          	            	               </div>
           	                	     	</div>
                                 	</div>
                                 	<div class="col-md-6">
     	                             	<label for="unite" class="col-md-12 col-form-label text-md-end">Unités</label>
         	                         	<div class="col-md-12">
            	                  	    	<div class="d-flex">
                	           	            	<i class="fas fa-tag position-awesome"></i>
                    	                        <input id="unite" type="number" min="100" max="1000" step="10" class="form-control pl-5" name="unite"  value="<%= projet.getUnite() %>">
          	            	               </div>
           	                	     	</div>
                                 	</div>
                                 	<div class="col-md-6">
     	                             	<label for="ville" class="col-md-12 col-form-label text-md-end">Ville</label>
         	                         	<div class="col-md-12">
            	                  	    	<div class="d-flex">
                	           	            	<i class="fas fa-tag position-awesome"></i>
                    	                        <input id="ville" type="text" class="form-control pl-5" name="ville"  value="<%= projet.getVille() %>">
          	            	               </div>
           	                	     	</div>
                                 	</div>
                                 </div>
                                 <div class="row mb-3">
                         	          <label for="presentation" class="col-md-12 col-form-label text-md-end">Description</label>
                                      <div class="col-md-12">
                    	                  <textarea id="editor"rows="10" class="form-control position-text-area" name="description" ><%= projet.getDescription() %></textarea>
                                      </div>
                 	              </div>
                               	  <div class="row mb-3 align-items-center">
                                   <label for="prof" class="col-md-12 col-form-label text-md-end">Image</label>
                                   	<div class="col-md-6">
                                    	<div class="d-flex">
                                       		<i class="fas fa-camera position-awesome-image"></i>
                                           	<input id="image_input" type="file" class="form-control-file pl-5" name="image">
                                      	</div>
                                  	</div>
                                    <div class="col-md-6">
                                    	<img src="../images/promoteur/assets/<%= projet.getImage() %>" style="max-width:20rem">
                        	            <div id="display_image" class="display_image" style="background-size:100% 100%; background-repeat:no-repeat"></div>
                  	                </div>
                                </div>
                               	<div class="row mb-0 text-center">
                                  	<div class="col-md-12">
                                      	<button type="submit" name="submit" class="btn btn-primary">Modifier le projet</button>
                                    </div>
                  	        	</div>
                          	</div>
                       	</div>
                   	</div>
             	</div>
           	</form>
		</div>
		<script>
            CKEDITOR.replace('editor');
        </script>
	</body>
</html>