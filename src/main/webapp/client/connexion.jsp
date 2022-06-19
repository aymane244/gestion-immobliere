<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Connexion</title>
	<%@include file="../includes/css/header.html"%>
	<style>
		<%@include file="../includes/css/styles.css"%>
	</style>
</head>
<body>
	<%@include file="../includes/navbar-admins.jsp"%>
	<div class="container my-5 pb-4">
		<div class="mt-5 pt-5">
        	<h2 class="text-center">Espace client</h2>
            <hr class="hr-style">
       	</div>
    	<div class="row justify-content-center">
        	<div class="col-md-8">
				<%
        			if(session.getAttribute("success_clt") != null){
       			%>
   				<div class='container alert alert-success text-center w-50' role='alert'>
					<%= session.getAttribute("success_clt")%>
				</div>
				<%
       				}
				%>
				<%
        			if(session.getAttribute("success_clt_log") != null){
       			%>
   				<div class='container alert alert-success text-center w-50' role='alert'>
					<%= session.getAttribute("success_clt_log")%>
				</div>
				<%
       				}
				%>
				<%
        			if(session.getAttribute("success_clt_pwd") != null){
       			%>
   				<div class='container alert alert-success text-center w-50' role='alert'>
					<%= session.getAttribute("success_clt_pwd")%>
				</div>
				<%
       				}
				%>
				<%
        			if(session.getAttribute("fail_clt_log") != null){
       			%>
   				<div class='container alert alert-danger text-center w-50' role='alert'>
					<%= session.getAttribute("fail_clt_log")%>
				</div>
				<%
       				}
				%>
            	<div class="card card-position">
                	<div class="card-header text-center link-font">
                    	<h3><i class="fas fa-user"></i> Connexion</h3>
                	</div>
                	<div class="card-body py-5">
                    	<form action="<%= request.getContextPath() %>/ClientLogin" method="post">
                        	<div class="row mb-3">
                            	<label for="email" class="col-md-4 col-form-label text-md-end">Email</label>
                            	<div class="col-md-6">
                                	<div class="d-flex">
                                    	<i class="fas fa-at position-awesome"></i>
                                    	<input id="Login" type="email" class="form-control pl-5" name="email" autocomplete="email" autofocus placeholder="Votre email" required>
                                	</div>
                            	</div>
                        	</div>
                        	<div class="row mb-3">
                            	<label for="password" class="col-md-4 col-form-label text-md-end">Mot de passe</label>
                            	<div class="col-md-6">
                                	<div class="d-flex">
                                    	<i class="fas fa-key position-awesome"></i>
                                    	<input id="password" type="password" class="form-control pl-5" name="motdepasse" autocomplete="current-password" placeholder="Votre mot de passe" required>
                                	</div>
                            	</div>
                        	</div>
                        	<div class="row mb-0">
                            	<div class="col-md-8 offset-md-4">
                                	<button type="submit" class="btn btn-primary">Connexion</button>
                                	<a href="inscription.jsp" class="px-4">S'inscrire Ici</a>
                            	</div>
                        	</div>
                        	<div class="row text-center mt-3">
                            	<div class="col-md-12">
                                	<a href='motdepasse.jsp' target="blank">Mot de passe oublié</a>
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