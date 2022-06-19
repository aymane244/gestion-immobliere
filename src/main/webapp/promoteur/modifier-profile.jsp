<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="mobilierModel.Promoteur"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Modifier profile</title>
		<%@include file="../includes/css/header.html"%>
		<style>
			<%@include file="../includes/css/styles.css"%>
		</style>
    	<script>
    		<%@include file="../includes/scripts/main.js"%>
    	</script>
    	<script>
    		<%@include file="../includes/scripts/lib.js"%>
    	</script>
	</head>
	<body>
		<%@include file="../includes/navbar-admins.jsp"%>
		<div class="container mt-5 pt-5">
            <div class="row justify-content-center">
                <div class="col-md-10 mt-5">
					<%
        				if(session.getAttribute("fail_pro_mod") != null){
       				%>
   					<div class='container alert alert-danger text-center w-50' role='alert'>
						<%= session.getAttribute("fail_pro_mod")%>
					</div>
					<%
       					}
					%>
                    <div class="card card-position">
                    	<div class="card-header text-center link-font"><i class="fas fa-edit"></i> Editer le profile</div>
                        <div class="card-body py-5">
                            <div class="text-center mb-3">
                                <div id="display_image" class="display_image_profile" style="display:none;background-size:100% 100%; background-repeat:no-repeat"></div>
                                <%
                                    if(promoteur.getImage() == null){
                                %>
                                <img src="../images/unknown_person.jpg"  class='rounded-circle img-fluid' style='max-width: 5rem' id='image_display'>
                                <%
									}else{
								%>
								<img src="../images/promoteur/<%=promoteur.getImage()%>" class='rounded-circle img-fluid' style='max-width: 5rem' id='image_display'>
								<%	
									}
								%>
                            </div>
                            <form action="<%= request.getContextPath() %>/ModifierProfile" method="post" enctype="multipart/form-data">
                            	<div class="row mb-3">
                            		<div class="col-md-6">
                                		<label for="nom" class="col-md-12 col-form-label text-md-end">Nom</label>
                                    	<div class="d-flex">
                            	        	<i class="fas fa-user position-awesome"></i>
                                        	<input id="nom" type="text" class="form-control pl-5" name="nom" autocomplete="nom" value="<%= promoteur.getNom() %>" placeholder="Votre nom" required>
                                    	</div>
                   	            	</div>
                                    <div class="col-md-6">
                                        <label for="prenom" class="col-md-12 col-form-label text-md-end">Prénom</label>
                                        <div class="d-flex">
                                            <i class="fas fa-user position-awesome"></i>
                                            <input id="prenom" type="text" class="form-control pl-5" name="prenom" autocomplete="prenom" value="<%= promoteur.getPrenom() %>" placeholder="Votre prénom" required>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <label for="cin" class="col-md-12 col-form-label text-md-end">CIN</label>
                                        <div class="d-flex">
                                            <i class="fas fa-file-alt position-awesome"></i>
                                            <input id="cin" type="text" class="form-control pl-5" name="cin" autocomplete="cin" value="<%= promoteur.getCin() %>" placeholder="Votre carte d'identité nationale">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="phone" class="col-md-12 col-form-label text-md-end">Téléphone</label>
                                        <div class="d-flex">
                                            <i class="fas fa-phone position-awesome"></i>
                                            <input id="phone" type="text" class="form-control pl-5" name="phone" autocomplete="phone" value="<%= promoteur.getTelephone() %>" placeholder="Votre numéro de téléphone" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="email" class="col-md-12 col-form-label text-md-end">Email</label>
                                        <div class="d-flex">
                                            <i class="fas fa-envelope position-awesome"></i>
                                            <input id="email" type="email" class="form-control pl-5" name="email" autocomplete="email" value="<%=promoteur.getEmail() %>" placeholder="Votre numéro de téléphone" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="image" class="col-md-4 col-form-label text-md-end">Image</label>
                                        <div class="d-flex">
                                            <i class="fas fa-camera position-awesome-image"></i>
                                            <input id="image" type="file" class="form-control-file pl-5" name="image">
                                        </div>
                                    </div>
                                </div>
                                <input type="hidden" value="<%= promoteur.getId() %>" name="id">
                                <div class="row mb-0">
                                    <div class="col-md-12 text-center">
                                        <button type="submit" class="btn btn-primary" name="submit">Modifier</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</body>
</html>