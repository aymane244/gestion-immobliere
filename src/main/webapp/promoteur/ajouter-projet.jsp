<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Ajouter un projet</title>
		<%@include file="../includes/css/header.html"%>
		<style>
			<%@include file="../includes/css/styles.css"%>
		</style>
	</head>
	<body>
		<%@include file="../includes/navbar-admins.jsp"%>
		<div class="container mt-5 pt-5">
			<div class="text-center py-3">
            	<h2><i class="fas fa-plus-square"></i> Ajouter un projet</h2>
          	</div>
          	<form action="<%= request.getContextPath() %>/AjouterProjet" method="POST" enctype="multipart/form-data">
             	<div class="row">
                	<div class="col-md-12 my-5">
						<%
        					if(session.getAttribute("fail_pro_proj") != null){
       					%>
   						<div class='container alert alert-danger text-center w-50' role='alert'>
							<%= session.getAttribute("fail_pro_proj")%>
						</div>
						<%
       						}
						%>
                    	<div class="card card-position">
                        	<div class="card-header text-center link-font align-items-center">
                            	<i class="fas fa-plus-square"></i> Ajouter un projet
                           	</div>
                           	<div class="card-body py-5 w-100">
                            	<div class="row mb-3">
                                	<label for="titre" class="col-md-12 col-form-label text-md-end">Nom du projet</label>
                                  	<div class="col-md-12">
                              	    	<div class="d-flex">
                           	            	<i class="fas fa-tag position-awesome"></i>
                                            <input id="titre" type="text" class="form-control pl-5" name="titre">
          	                           </div>
           	                     	</div>
                                 </div>
                                 <div class="row mb-3">
                                 	<div class="col-md-4">
     	                             	<label for="etat" class="col-md-12 col-form-label text-md-end">Etat de construction</label>
         	                         	<div class="col-md-12">
            	                  	    	<div class="d-flex">
                	           	            	<i class="fas fa-tag position-awesome"></i>
												<select class="custom-select px-5" name="etat">
													<option value="">--Etat de construction--</option>
													<option value="En cours">En cours</option>
													<option value="Livré">Livré</option>
												</select>
          	            	               </div>
           	                	     	</div>
                                 	</div>
                                 	<div class="col-md-4">
     	                             	<label for="date" class="col-md-12 col-form-label text-md-end">Date de livraison</label>
         	                         	<div class="col-md-12">
            	                  	    	<div class="d-flex">
												<i class="fas fa-calendar position-awesome"></i>
                    	                        <input id="date" type="date" class="form-control pl-5" name="date">
          	            	               </div>
           	                	     	</div>
                                 	</div>
                                 	<div class="col-md-6">
     	                             	<label for="unite" class="col-md-12 col-form-label text-md-end">Unités</label>
         	                         	<div class="col-md-12">
            	                  	    	<div class="d-flex">
                	           	            	<i class="fas fa-tag position-awesome"></i>
                    	                        <input id="unite" type="number" min="100" max="1000" step="50" class="form-control pl-5" name="unite">
          	            	               </div>
           	                	     	</div>
                                 	</div>
                                 	<div class="col-md-6">
     	                             	<label for="ville" class="col-md-12 col-form-label text-md-end">Ville</label>
         	                         	<div class="col-md-12">
            	                  	    	<div class="d-flex">
                	           	            	<i class="fas fa-tag position-awesome"></i>
                    	                        <input id="ville" type="text" class="form-control pl-5" name="ville">
          	            	               </div>
           	                	     	</div>
                                 	</div>
                                 </div>
                                 <div class="row mb-3">
                         	          <label for="presentation" class="col-md-12 col-form-label text-md-end">Description</label>
                                      <div class="col-md-12">
                    	                  <textarea id="editor"rows="10" class="form-control position-text-area" name="description" ></textarea>
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
                        	            <div id="display_image" class="display_image" style="background-size:100% 100%; background-repeat:no-repeat"></div>
                  	                </div>
                                </div>
                               	<div class="row mb-0 text-center">
                                  	<div class="col-md-12">
                                      	<button type="submit" name="submit" class="btn btn-primary">Ajouter le projet</button>
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