<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>inscription</title>
		<%@include file="../includes/css/header.html"%>
		<style>
		<%@include file="../includes/css/styles.css"%>
		</style>
	</head>
	<body>
		<%@include file="../includes/navbar-admins.jsp"%>
		<div class="container my-5 pt-5 pb-5">
			<div class="row">
				<div class="col-lg-12 col-md-12">
					<%
        				if(session.getAttribute("fail_pro") != null){
       				%>
   					<div class='container alert alert-danger text-center w-50' role='alert'>
						<%= session.getAttribute("fail_pro")%>
					</div>
					<%
       					}
					%>
					<div class="card">
						<div class="card-header text-center link-font">
                            <h3><i class="fas fa-edit"></i> Inscription</h3>
                        </div>
                        <div class="card-body py-5">
                        	<form action="<%= request.getContextPath() %>/PromoteurInscription" method="post" enctype="multipart/form-data">
                        		<div class="row">
                        			<div class="col-lg-4">
                                        <div class="row mb-3">
                                            <label for="nom" class="col-md-12 col-form-label text-md-end">Nom</label>
                                            <div class="col-md-12">
                                                <div class="d-flex">
                                                    <i class="fas fa-user position-awesome"></i>
                                                    <input id="nom" type="text" class="form-control pl-5" name="nom" autocomplete="nom" placeholder="Votre nom" autofocus required>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="row mb-3">
                                            <label for="prenom" class="col-md-12 col-form-label text-md-end">Prénom</label>
                                            <div class="col-md-12">
                                                <div class="d-flex">
                                                    <i class="fas fa-user position-awesome"></i>
                                                    <input id="prenom" type="text" class="form-control pl-5" name="prenom" autocomplete="prenom" placeholder="Votre prénom" autofocus required>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="row mb-3">
                                            <label for="cin" class="col-md-12 col-form-label text-md-end">CIN</label>
                                            <div class="col-md-12">
                                                <div class="d-flex">
                                                    <i class="fas fa-file-alt position-awesome"></i>
                                                    <input id="cin" type="text" class="form-control pl-5" name="cin" autocomplete="CIN" placeholder="Votre CIN" autofocus required>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                	<div class="col-lg-4">
                                		<div class="row mb-3">
                                    		<label for="phone" class="col-md-12 col-form-label text-md-end">Téléphone</label>
                                            <div class="col-md-12">
                                               	<div class="d-flex">
                                               	    <i class="fas fa-phone position-awesome"></i>
                                                   	<input id="phone" type="text" class="form-control pl-5" name="phone" autocomplete="phone" placeholder="Votre Numéro de téléphone" autofocus required>
                                               	</div>
                                           	</div>
                                       	</div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="row mb-3">
                                            <label for="email" class="col-md-12 col-form-label text-md-end">Email</label>
                                            <div class="col-md-12">
                                                <div class="d-flex">
                                                    <i class="fas fa-envelope position-awesome"></i>
                                                    <input id="email" type="email" class="form-control pl-5" name="email" autocomplete="email" placeholder="Votre email" autofocus required>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="row mb-3">
                                            <label for="motdepasse" class="col-md-12 col-form-label text-md-end">Mot de passe</label>
                                            <div class="col-md-12">
                                                <div class="d-flex">
                                                    <i class="fas fa-lock position-awesome"></i>
                                                    <input id="motdepasse" type="password" class="form-control pl-5" name="motdepasse" placeholder="Votre mot de passe" autofocus required>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-3 align-items-center">
                                    <label for="image" class="col-md-12 col-form-label">Image de profile (optionnelle)</label>
                                    <div class="col-md-6">
                                        <div class="d-flex">
                                            <i class="fas fa-camera position-awesome-image"></i>
                                            <input id="image" type="file" class="form-control-file pl-5" name="image" onchange="affichage()" autofocus>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-0 text-center">
                                    <div class="col-md-12">
                                        <button type="submit" class="btn btn-primary">S'inscrire</button>
                                    </div>
                                </div>
                        	</form>
                        </div>
					</div>
				</div>
			</div>
		</div>
		<%@include file="../includes/footer.jsp"%>
	</body>
</html>