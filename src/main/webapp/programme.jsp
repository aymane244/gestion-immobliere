<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="mobilierModel.Client"%>
<%@page import="mobilierModel.ProgrammeBien"%>
<%@page import="mobilierModel.AchatProgramme"%>
<%@page import="mobilierDao.ProgrammeDao"%>
<%@page import="mobilierDao.AchatDao"%>
<%@page import="Database.ConnectionDB"%>
<%@page import="java.util.List"%>
<%
	int id =Integer.parseInt(request.getParameter("id"));
	ProgrammeDao db = new ProgrammeDao(ConnectionDB.getConnection());
	ProgrammeBien programme = db.selectBiens(id);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title><%= programme.getNomProgramme() %></title>
		<%@include file="includes/css/header.html"%>
		<style>
			<%@include file="includes/css/styles.css"%>
		</style>
    	<script>
    		<%@include file="includes/scripts/main.js"%>
    	</script>
    	<script>
    		<%@include file="includes/scripts/lib.js"%>
    	</script>
	</head>
	<body>
		<%@include file="includes/navbar.jsp"%>
		<div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel" style="position:relative">
  			<div class="carousel-inner">
    			<div class="carousel-item active">
    				<div style="background-color: black;opacity: 0.5;top: 0;left: 0;width: 100%;height: 100%;position: absolute;"></div>
       				<img src="images/views/gueliz_0.jpg" class="d-block img-fluid" alt="..." style="width:90rem; height:550px;">
    			</div>
    			<div class="carousel-item">
    				<div style="background-color: black;opacity: 0.5;top: 0;left: 0;width: 100%;height: 100%;position: absolute;"></div>
      				<img src="images/views/istockphoto-866547370-170667a.jpg" class="d-block img-fluid" alt="..." style="width:90rem; height:550px;">
    			</div>
   				<div class="carousel-item">
    				<div style="background-color: black;opacity: 0.5;top: 0;left: 0;width: 100%;height: 100%;position: absolute;"></div>
      				<img src="images/views/mohammed-vi-football-academy-a010513-c2.jpg" class="d-block img-fluid" alt="..." style="width:90rem; height:550px;">
    			</div>
  			</div>
		</div>
		<div style="position: absolute; top: 80%; left:15%">
			<div class="d-flex align-items-center">
				<img src="images/views/gueliz_0.jpg" class="img-fluid img-thumbnail" style="width: 18rem;; height: 200px;">
				<p class="mt-5 ml-4">
					<b>Etat du construction: <%= programme.getEtat() %></b> <br>
				    <b>Nom du programme: <%= programme.getNomProgramme() %></b> <br>
				    <b>A partir de: <%= programme.getPrix() %> MAD</b>
				</p>
			</div>
		</div>
		<div style="margin-top:200px; margin-left:190px"></div>
		<div class="container">
			<%
        		if(session.getAttribute("achat_programme") != null){
       		%>
   			<div class='container alert alert-success text-center w-50' role='alert'>
				<%= session.getAttribute("achat_programme")%>
			</div>
			<%
       			}
			%>
			<%
        		if(session.getAttribute("reservation_success_programme") != null){
       		%>
   			<div class='container alert alert-success text-center w-50' role='alert'>
				<%= session.getAttribute("reservation_success_programme")%>
			</div>
			<%
       			}
			%>
			<%
        		if(session.getAttribute("reservation_fail_programme") != null){
       		%>
   			<div class='container alert alert-danger text-center w-50' role='alert'>
				<%= session.getAttribute("reservation_fail_programme")%>
			</div>
			<%
       			}
			%>
			<div class="text-center pb-3">
				<h3>A propos de la résidence: <%= programme.getNom() %></h3>
				<hr class="hr-style">
			</div>
			<div class="row justify-content-center">
				<div class="col-md-6">
					<div class="d-flex justify-content-between">
						<p>
							Prix à partir de <br>
							<b><%= programme.getPrix() %> dhs</b>
						</p>
						<p>
							Prix par m² <br>
							<b><%= programme.getPrixMetre() %> dhs</b>
						</p>
						<p>
							Etat <br>
							<b><%= programme.getEtat() %></b>
						</p>
					</div>
					<div class="d-flex justify-content-between">
						<p>
							Date de livraison <br>
							<b><%= programme.getDate() %></b>
						</p>
						<p>
							Taille de projet en unité <br>
							<b><%= programme.getUnite() %> unités</b>
						</p>
						<p>
							Chambres <br>
							<b><%= programme.getChambre() %></b>
						</p>
					</div>
				</div>
			</div>
			<div class="mt-3">
				<div class="text-center pb-3">
					<h4>Déscription</h4>
					<hr class="hr-style">
				</div>
				<h5 class="ml-4"><%= programme.getDescription() %></h5>
			</div>

   		</div>
   			<div class="text-center pt-3 mb-3">
      	    	<h3>Achat d'un bien</h3>
               	<hr class="hr-style">
            </div>
			<div class="container">
            	<div class="row justify-content-center">
            		<div class="col-md-10">
            			<% 
            				if(clients == null){
            			%>
            			<div class="text-center pt-3 mb-3">
                			<h4 class="pt-4">Prendre un rendez-vous ou pour effectuer un achat <a href="client/connexion.jsp">connectez-vous ici</a></h4>
            			</div>
            			<form action="<%= request.getContextPath() %>/AjouterReservationProgramme" method="post">
            				<div class="form-group">
	            	   			<label for="exampleInputSuje1">Votre nom</label>
	        	           		<div class="d-flex">
	                           		<i class="fas fa-user position-awesome"></i>
	                           		<input type="text" class="form-control pl-5" name="nom_res_programme" id="contact_nom" placeholder="Nom complet" required>
	                       		</div>
	                       	</div>
	                       	<div class="form-group">
	                       		<div class="row">
	                       			<div class="col-md-6">
	                       	        	<label for="exampleInputSuje1">Votre email</label>
	                   					<div class="d-flex">
	                       					<i class="fas fa-envelope position-awesome-email"></i>
	                               			<input type="email" class="form-control pl-5" name="email_programme" id="contact_email" placeholder="email" required>
	                           			</div>
	                       			</div>
	                       			<div class="col-md-6">
	                       	        <label for"phone">Votre numéro de téléphone</label>
	                   					<div class="d-flex">
	                       					<i class="fas fa-phone position-awesome"></i>
	                               			<input type="text" class="form-control pl-5" name="phone_programme" id="contact_phone" placeholder="Votre numéro de téléphone" required>
	                           			</div>
	                       			</div>
	                       		</div>
	                       	</div>
	                		<div class="form-group">
	              				<div class="row">
	                       			<div class="col-md-6">
	                       	        	<label for="date">Choisir la date</label>
	                   					<div class="d-flex">
	                       					<i class="fas fa-calendar position-awesome-email"></i>
	                               			<input type="date" class="form-control pl-5" name="date_programme" id="contact_date" required>
	                           			</div>
	                       			</div>
	                       			<div class="col-md-6">
	                       	        <label for ="heure">Choisir l'heure</label>
	                   					<div class="d-flex">
	                                        <i class="fas fa-clock position-awesome"></i>
	                                        <select class="custom-select pl-5" id="heure" name="heure_programme">
	                                            <option value="08:00">08:00</option>
	                                            <option value="09:00">09:00</option>
	                                            <option value="10:00">10:00</option>
	                                            <option value="11:00">11:00</option>
	                                            <option value="14:00">14:00</option>
	                                            <option value="15:00">15:00</option>
	                                            <option value="16:00">16:00</option>
	                                            <option value="17:00">17:00</option>
	                                        </select>
	                                    </div>
	                       			</div>
	                       		</div>
	               			</div>
	               			<div class="text-center mb-4">
	               				<input type="hidden" name='id_reservation_programme' value="<%= programme.getId() %>">
	                   			<button type="submit" class="btn btn-primary" id="submit" name="submit">Effectuer un rendez-vous</button>
	               			</div>
            			</form>
            			<%
            				}else{	
            					AchatDao dbAchat = new AchatDao(ConnectionDB.getConnection());
            					List <AchatProgramme> achats = dbAchat.selectAchatProgrammeCompare();
            					if(!achats.isEmpty()){
            						for(AchatProgramme achat : achats){
                						if(clients.getId() == achat.getClient() && programme.getId() == achat.getProgramme()){
                        %>	
            			<h3 class="text-center">Bonjour <%= clients.getPrenom() %> <%= clients.getNom() %></h3>
            			<div class='text-center my-4'>
							<button class="btn btn-primary rounded-0" disabled>Bien acheté</button>
						</div>
               			<%	
                						}else{
                		%>
            			<h3 class="text-center">Bonjour <%= clients.getPrenom() %> <%= clients.getNom() %></h3>
            			<form action="<%= request.getContextPath() %>/AjouterAchatProgramme" method="post">
            				<div class='text-center my-4'>
            				    <input type="hidden" name='id_programme' value="<%= programme.getId() %>">
            					<input type="hidden" name='client_id_programme' value="<%= clients.getId() %>">
            					<button type="submit" class="btn btn-primary rounded-0">Veuillez achetez <%= programme.getNom() %> maintenant</button>	
            				</div>
            			</form>
          				<%	
                						}
            						}
            					}else{
            			%>
            			<h3 class="text-center">Bonjour <%= clients.getPrenom() %> <%= clients.getNom() %></h3>
            			<form action="<%= request.getContextPath() %>/AjouterAchatProgramme" method="post">
            				<div class='text-center my-4'>
            				    <input type="hidden" name='id_programme' value="<%= programme.getId() %>">
            					<input type="hidden" name='client_id_programme' value="<%= clients.getId() %>">
            					<button type="submit" class="btn btn-primary rounded-0">Veuillez achetez <%= programme.getNom() %> maintenant</button>	
            				</div>
            			</form>
            			<%	
            					}
            				}
            			%>
            		</div>
            	</div>
			</div>
		</div>
		<%@include file="includes/footer.jsp"%>
	</body>
</html>