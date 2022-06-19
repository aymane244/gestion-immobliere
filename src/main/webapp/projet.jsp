<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="mobilierModel.Client"%>
<%@page import="mobilierModel.ProjetBien"%>
<%@page import="mobilierModel.AchatProjet"%>
<%@page import="mobilierDao.ProjetDao"%>
<%@page import="mobilierDao.AchatDao"%>
<%@page import="Database.ConnectionDB"%>
<%@page import="java.util.List"%>
<%
	int id =Integer.parseInt(request.getParameter("id"));
	ProjetDao db = new ProjetDao(ConnectionDB.getConnection());
	ProjetBien projet = db.selectBiens(id);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title><%= projet.getNom() %></title>
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
					<b><%= projet.getEtat() %></b> <br>
				    <b><%= projet.getNomProjet() %></b> <br>
				    <b>A partir de <%= projet.getPrix() %></b>
				</p>
			</div>
		</div>
		<div style="margin-top:200px; margin-left:190px"></div>
		<div class="container">
			<%
        		if(session.getAttribute("achat_projet") != null){
       		%>
   			<div class='container alert alert-success text-center w-50' role='alert'>
				<%= session.getAttribute("achat_projet")%>
			</div>
			<%
       			}
			%>
			<%
        		if(session.getAttribute("reservation_success_projet") != null){
       		%>
   			<div class='container alert alert-success text-center w-50' role='alert'>
				<%= session.getAttribute("reservation_success_projet")%>
			</div>
			<%
       			}
			%>
			<%
        		if(session.getAttribute("reservation_fail_projet") != null){
       		%>
   			<div class='container alert alert-danger text-center w-50' role='alert'>
				<%= session.getAttribute("reservation_fail_projet")%>
			</div>
			<%
       			}
			%>
			<div class="text-center pb-3">
				<h3>A propos du <%= projet.getNom() %> -<%=projet.getType() %>-</h3>
				<hr class="hr-style">
			</div>
			<div class="row justify-content-center">
				<div class="col-md-6">
					<div class="d-flex justify-content-between">
						<p>
							Prix à partir de <br>
							<b><%= projet.getPrix() %> dhs</b>
						</p>
						<p>
							Prix par m² <br>
							<b><%= projet.getPrixMetre() %> dhs</b>
						</p>
						<p>
							Etat <br>
							<b><%= projet.getEtat() %></b>
						</p>
					</div>
					<div class="d-flex justify-content-around">
						<p>
							Date de livraison <br>
							<b><%= projet.getDate() %></b>
						</p>
						<p>
							Taille de projet en unité <br>
							<b><%= projet.getUnite() %> unités</b>
						</p>
						<p>
							Chambres <br>
							<b><%= projet.getChambre() %></b>
						</p>
					</div>
				</div>
			</div>
			<div class="mt-3">
				<div class="text-center pb-3">
					<h4>Déscription</h4>
					<hr class="hr-style">
				</div>
				<h5 class="ml-4"><%= projet.getDescription() %></h5>
			</div>
			<div class="text-center pt-3 mb-3">
      	    	<h3>Achat d'un bien</h3>
               	<hr class="hr-style">
            </div>
            	<div class="row justify-content-center">
            		<div class="col-md-8">
            			<% 
            				if(clients == null){
            			%>
            			<div class="text-center pt-3 mb-3">
                			<h4 class="pt-4">Prendre un rendez-vous ou pour effectuer une réservation <a href="client/connexion.jsp">connectez-vous ici</a></h4>
            			</div>
            			<form action="<%= request.getContextPath() %>/AjouterReservationProjet" method="post">
            				<div class="form-group">
	            	   			<label for="exampleInputSuje1">Votre nom</label>
	        	           		<div class="d-flex">
	                           		<i class="fas fa-user position-awesome"></i>
	                           		<input type="text" class="form-control pl-5" name="nom_res_projet" id="contact_nom" placeholder="Nom complet" required>
	                       		</div>
	                       	</div>
	                       	<div class="form-group">
	                       		<div class="row">
	                       			<div class="col-md-6">
	                       	        	<label for="exampleInputSuje1">Votre email</label>
	                   					<div class="d-flex">
	                       					<i class="fas fa-envelope position-awesome-email"></i>
	                               			<input type="email" class="form-control pl-5" name="email_projet" id="contact_email" placeholder="email" required>
	                           			</div>
	                       			</div>
	                       			<div class="col-md-6">
	                       	        <label for"phone">Votre numéro de téléphone</label>
	                   					<div class="d-flex">
	                       					<i class="fas fa-phone position-awesome"></i>
	                               			<input type="text" class="form-control pl-5" name="phone_projet" id="contact_phone" placeholder="Votre numéro de téléphone" required>
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
	                               			<input type="date" class="form-control pl-5" name="date_projet" id="contact_date" required>
	                           			</div>
	                       			</div>
	                       			<div class="col-md-6">
	                       	        <label for ="heure">Choisir l'heure</label>
	                   					<div class="d-flex">
	                                        <i class="fas fa-clock position-awesome"></i>
	                                        <select class="custom-select pl-5" id="heure" name="heure_projet">
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
	               				<input type="hidden" name='id_reservation_projet' value="<%= projet.getId() %>">
	                   			<button type="submit" class="btn btn-primary" id="submit" name="submit">Effectuer un rendez-vous</button>
	               			</div>
            			</form>
            			<%
            				}else{	
            					AchatDao dbAchat = new AchatDao(ConnectionDB.getConnection());
            					List <AchatProjet> achats = dbAchat.selectAchatProjetCompare();
            					if(!achats.isEmpty()){
            						for(AchatProjet achat : achats){
                						if(clients.getId() == achat.getClient() && projet.getId() == achat.getProjet()){
                        %>	
            			<h3 class="text-center">Bonjour <%= clients.getPrenom() %> <%= clients.getNom() %></h3>
            			<div class='text-center my-4'>
							<button class="btn btn-primary rounded-0" disabled>Bien acheté</button>
						</div>
               			<%	
                						}else{
                		%>
            			<h3 class="text-center">Bonjour <%= clients.getPrenom() %> <%= clients.getNom() %></h3>
            			<form action="<%= request.getContextPath() %>/AjouterAchatProjet" method="post">
            				<div class='text-center my-4'>
            				    <input type="hidden" name='id_projet' value="<%= projet.getId() %>">
            					<input type="hidden" name='id_client_projet' value="<%= clients.getId() %>">
            					<button type="submit" class="btn btn-primary rounded-0">Veuillez achetez <%= projet.getNom() %> maintenant</button>	
            				</div>
            			</form>
          				<%	
                						}
            						}
            					}else{
            			%>
            			<h3 class="text-center">Bonjour <%= clients.getPrenom() %> <%= clients.getNom() %></h3>
            			<form action="<%= request.getContextPath() %>/AjouterAchatProjet" method="post">
            				<div class='text-center my-4'>
            				    <input type="text" name='id_projet' value="<%= projet.getId() %>">
            					<input type="text" name='id_client_projet' value="<%= clients.getId() %>">
            					<button type="submit" class="btn btn-primary rounded-0">Veuillez achetez <%= projet.getNom() %> maintenant</button>	
            				</div>
            			</form>
            			<%	
            					}
            				}
            			%>
            		</div>
            	</div>
			</div>
		<%@include file="includes/footer.jsp"%>
	</body>
</html>