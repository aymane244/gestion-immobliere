<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Ajouter un bien</title>
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
          	<form action="<%= request.getContextPath() %>/AjouterBien" method="POST" enctype="multipart/form-data">
             	<div class="row">
                	<div class="col-md-12 my-5">
                    	<div class="card card-position">
                        	<div class="card-header text-center link-font align-items-center">
                            	<i class="fas fa-plus-square"></i> Ajouter un bien
                           	</div>
                           	<div class="card-body py-5 w-100">
                            	<div class="row mb-3">
                                	<label for="titre" class="col-md-12 col-form-label text-md-end">Nom du bien</label>
                                  	<div class="col-md-12">
                              	    	<div class="d-flex">
                           	            	<i class="fas fa-tag position-awesome"></i>
                                            <input id="titre" type="text" class="form-control pl-5" name="titre">
          	                           </div>
           	                     	</div>
                                 </div>
                                 <div class="row mb-3">
                                 	<div class="col-md-4">
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
                                 	<div class="col-md-4">
     	                             	<label for="adresse" class="col-md-12 col-form-label text-md-end">Adresse</label>
         	                         	<div class="col-md-12">
            	                  	    	<div class="d-flex">
                	           	            	<i class="fas fa-tag position-awesome"></i>
                    	                        <input id="adresse" type="text" class="form-control pl-5" name="adresse">
          	            	               </div>
           	                	     	</div>
                                 	</div>
                                 	<div class="col-md-4">
     	                             	<label for="superficie" class="col-md-12 col-form-label text-md-end">Superficie</label>
         	                         	<div class="col-md-12">
            	                  	    	<div class="d-flex">
                	           	            	<i class="fas fa-tag position-awesome"></i>
                    	                        <input id="superficie" type="number" min="70" max="8000" step="10" class="form-control pl-5" name="superficie">
          	            	               </div>
           	                	     	</div>
                                 	</div>
                                 	<div class="col-md-4">
     	                             	<label for="chambre" class="col-md-12 col-form-label text-md-end">chambres</label>
         	                         	<div class="col-md-12">
            	                  	    	<div class="d-flex">
                	           	            	<i class="fas fa-tag position-awesome"></i>
                    	                        <input id="chambre" type="number" min="3" max="10" class="form-control pl-5" name="chambre">
          	            	               </div>
           	                	     	</div>
                                 	</div>
                                 	<div class="col-md-4">
     	                             	<label for="syndique" class="col-md-12 col-form-label text-md-end">Syndique</label>
         	                         	<div class="col-md-12">
            	                  	    	<div class="d-flex">
                	           	            	<i class="fas fa-tag position-awesome"></i>
                    	                        <input id="syndique" type="number" min="100" max="1000" step="50" class="form-control pl-5" name="syndique">
          	            	               </div>
           	                	     	</div>
                                 	</div>
                                 	<div class="col-md-4">
     	                             	<label for="garage" class="col-md-12 col-form-label text-md-end">Garage</label>
         	                         	<div class="col-md-12">
            	                  	    	<div class="d-flex">
                	           	            	<i class="fas fa-tag position-awesome"></i>
												<select class="custom-select px-5" name="garage">
													<option value="Oui">Oui</option>
													<option value="Non">Non</option>
												</select>
          	            	               </div>
           	                	     	</div>
                                 	</div>
                                 	<div class="col-md-4">
     	                             	<label for="prix" class="col-md-12 col-form-label text-md-end">Prix</label>
         	                         	<div class="col-md-12">
            	                  	    	<div class="d-flex">
                	           	            	<i class="fas fa-tag position-awesome"></i>
                    	                        <input id="prx" type="number" min="200000" max="10000000" step="10000" class="form-control pl-5" name="prix">
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
                                      	<button type="submit" name="submit" class="btn btn-primary">Ajouter le bien</button>
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