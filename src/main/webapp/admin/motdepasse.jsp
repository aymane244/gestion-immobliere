<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Mot de passe oublié</title>
	<%@include file="../includes/css/header.html"%>
	<style>
		<%@include file="../includes/css/styles.css"%>
	</style>
	<script>
		<%@include file="../includes/scripts/lib.js"%>
	</script>
</head>
<body>
	<%@include file="../includes/navbar-admins.jsp"%>
	<div class="container my-5 pb-4">
		<div class="mt-5 pt-5">
        	<h2 class="text-center">Mot de passe oublié</h2>
            <hr class="hr-style">
       	</div>
       	<%
        	if(session.getAttribute("fail_pwd") != null){
       	%>
       	<div class='container alert alert-danger text-center w-50' role='alert'>
			<%= session.getAttribute("fail_pwd")%>
		</div>
		<%
        	}
		%>
       	<form action="<%= request.getContextPath() %>/Adminmotedepasse" method="post">
       		<div id="password">
       			<div class="row justify-content-center">
        			<div class="col-md-8">
            			<div class="card card-position">
                			<div class="card-header text-center link-font">
                				<h3><i class="fas fa-lock"></i> Inserez nouveau mot de passe</h3>
                			</div>
                			<div class="card-body py-5">
                				<div class="row mb-3">
                					<label for="motdepasse" class="col-md-4 col-form-label text-md-end">Nouveau Mot de passe</label>
                					<div class="col-md-6">
                						<div class="d-flex">
                    						<i class="fas fa-key position-awesome"></i>
                    						<input type="password" class="form-control pl-5" id="exampleInputPassword" placeholder="Mot de Passe" name="motdepasse" required>
                						</div>
                						<p id="error"></p>
                						<div class="form-group form-check px-4">
                    						<input type="checkbox" class="form-check-input" id="exampleCheck1">
                    						<label class="form-check-label" for="exampleCheck1" id="exampleCheck1">Afficher mot de passe</label>
                						</div>
                						<div class="pt-2">
                    						<input type="button" class="btn btn-primary" value="OK" id="password-btn">
                						</div>
            						</div>
        						</div>
        					</div>
        				</div>
        			</div>
        		</div>
        	</div>
       		<div id="email" style="display:none;">
       			<div class="row justify-content-center">
        			<div class="col-md-8">
            			<div class="card card-position">
                			<div class="card-header text-center link-font">
            					<div class="d-flex">
                					<i class="fa-solid fa-arrow-left"></i>
                					<div class="w-75 mx-auto">
                    					<h3><i class="fas fa-user"></i> Entrez votre email</h3>
                					</div>
            					</div>
            				</div>
            				<div class="card-body py-5">
                				<div class="row mb-3">
                					<label for="email" class="col-md-4 col-form-label text-md-end">Votre email</label>
                					<div class="d-flex">
                    					<i class="fas fa-at position-awesome"></i>
                    					<input type="email" class="form-control pl-5" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Email" name="email" required>
                					</div>
            					</div>
            					<div class="pt-2 text-center">
                					<button type="submit" class="btn btn-primary" id="id-submit"> Envoyer</button>
            					</div>
        					</div>
        				</div>
        			</div>
        		</div>
        	</div>
    	</form>
	</div>
	<%@include file="../includes/footer.jsp"%>
</body>
</html>