<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="mobilierModel.Client"%>
<%@page import="mobilierModel.Bien"%>
<%@page import="mobilierModel.Achat"%>
<%@page import="mobilierDao.BiensDao"%>
<%@page import="mobilierDao.AchatDao"%>
<%@page import="Database.ConnectionDB"%>
<%@page import="java.util.List"%>
<%
	int id =Integer.parseInt(request.getParameter("id")); 
	BiensDao db = new BiensDao(ConnectionDB.getConnection());
	Bien bien = db.selectBien(id);		
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title><%= bien.getNom() %></title>
		<%@include file="includes/css/header.html"%>
		<style>
			<%@include file="includes/css/styles.css"%>
		</style>
		<script>
        	$(document).ready(function (){
            	$(".fancybox").fancybox({
		        	maxWidth: 1200,
		        	maxHeight: 600,
		        	width: '70%',
		        	height: '70%',
	        	});
        	})
    	</script>
    	<script>
        	$(document).ready(function(){
            	$(".fancybox").fancybox({
                	openEffect: "none",
                	closeEffect: "none"
            	});
            	$(".zoom").hover(function(){
                	$(this).addClass('transition');
            	},	
            	function(){
                	$(this).removeClass('transition');
            	});
        	});
    	</script>
	</head>
	<body>
		<%@include file="includes/navbar.jsp"%>
		<main>
			<div class="container">
				<%
        			if(session.getAttribute("reservation_success") != null){
       			%>
   				<div class='container alert alert-success text-center w-50' role='alert'>
					<%= session.getAttribute("reservation_success")%>
				</div>
				<%
       				}
				%>
				<%
        			if(session.getAttribute("reservation_fail") != null){
       			%>
   				<div class='container alert alert-danger text-center w-50' role='alert'>
					<%= session.getAttribute("reservation_fail")%>
				</div>
				<%
       				}
				%>
				<div class="col-lg-12 mt-5 pt-5">
                	<h2 class="text-center"><%= bien.getNom() %></h2>
                	<hr class="hr-style">
                </div>
				<div class="row justify-content-center">
					<div class="col-md-6">
						<img src="images/promoteur/assets/<%= bien.getImage() %>" class="img-fluid">
					</div>
				</div>
				<div class="row justify-content-center">
					<div class="col-lg-12 mt-4 text-center">
						<h1><i class="fas fa-tags"></i> <%= bien.getPrix() %></h1>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="mt-5">
                			<h2 class="text-center">Détail du bien</h2>
                			<hr class="hr-style">
                		</div>
                		<div class="d-flex justify-content-between">
                			<h4><b>Adresse:</b></h4>
                			<h4><b><%= bien.getAdresse() %> </b></h4>
                		</div>
                		<div class="d-flex py-2 justify-content-between">
                			<h4><b>Type de bien:</b></h4>
                			<h4><b><%= bien.getType() %></b></h4>
                		</div>
                		<div class="d-flex py-2 justify-content-between">
                			<h4><b>Supérficie:</b></h4>
                			<h4><b><%= bien.getSuperficie() %></b></h4>
                		</div>
                		<div class="d-flex justify-content-between">
                			<h4><b>Chambres:</b></h4>
                			<h4><b><%= bien.getChambres() %></b></h4>
                		</div>
                		<div class="d-flex py-2 justify-content-between">
                			<h4><b>Syndique:</b></h4>
                			<h4><b><%= bien.getSyndic() %></b></h4>
                		</div>
                		<div class="d-flex justify-content-between">
                			<h4><b>Garage:</b></h4>
                			<h4><b><%= bien.getGarage() %></b></h4>
                		</div>
					</div>
					<div class="col-md-6">
						<div class="mt-5">
                			<h2 class="text-center">Déscription du bien</h2>
                			<hr class="hr-style">
                		</div>
						<p class="text-color">
							<%= bien.getDescription() %>
						</p>
					</div>
				</div>
				<div id="gallery" class="Gallery">
            		<div class="text-center pt-3 mb-3">
                		<h2 class="pt-4">Images du bien</h2>
                		<hr class="hr-style">
            		</div>
            		<div class="row">
                		<div class="col-xl-3 col-lg-3 col-md-3 col-sm-12">
                    		<div class="Gallery-box">
                        		<figure>
                            		<a href="#" class="fancybox" rel="ligthbox">
                                		<img src="images/views/library.jpg" alt="" class="img-fluid img-width">
                            		</a>
                            		<span class="hoverle">
                                		<a href="images/views/library.jpg" class="fancybox" rel="ligthbox">View</a>
                            		</span>
                        		</figure>
                    		</div>
                		</div>
                		<div class="col-xl-3 col-lg-3 col-md-3 col-sm-12 thumb">
                    		<div class="Gallery-box">
                        		<figure>
                            		<a href="#" class="fancybox" rel="ligthbox">
                                		<img src="images/views/library.jpg" alt="" class="img-fluid img-width">
                            		</a>
                            		<span class="hoverle">
                                		<a href="images/views/library.jpg" class="fancybox" rel="ligthbox">View</a>
                            		</span>
                        		</figure>
                    		</div>
                		</div>
                		<div class="col-xl-3 col-lg-3 col-md-3 col-sm-12 thumb">
                    		<div class="Gallery-box">
                        		<figure>
                            		<a href="#" class="fancybox" rel="ligthbox">
                                		<img src="images/views/library.jpg" alt="" class="img-fluid img-width">
                            		</a>
                            		<span class="hoverle">
                                		<a href="images/views/library.jpg" class="fancybox" rel="ligthbox">View</a>
                            		</span>
                        		</figure>
                    		</div>
                		</div>
                		<div class="col-xl-3 col-lg-3 col-md-3 col-sm-12 thumb">
                    		<div class="Gallery-box">
                        		<figure>
                            		<a href="#" class="fancybox" rel="ligthbox">
                                		<img src="images/views/library.jpg" alt="" class="img-fluid img-width">
                            		</a>
                            		<span class="hoverle">
                                		<a href="images/library.jpg" class="fancybox" rel="ligthbox">View</a>
                            		</span>
                        		</figure>
                    		</div>
                		</div>
            		</div>
        		</div>
        		<div class="text-center pt-3 mb-3">
                	<h2 class="pt-4">Achat du bien</h2>
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
            			<form action="<%= request.getContextPath() %>/AjouterReservation" method="post">
            				<div class="form-group">
	            	   			<label for="exampleInputSuje1">Votre nom</label>
	        	           		<div class="d-flex">
	                           		<i class="fas fa-user position-awesome"></i>
	                           		<input type="text" class="form-control pl-5" name="nom_res" id="contact_nom" placeholder="Nom complet" required>
	                       		</div>
	                       	</div>
	                       	<div class="form-group">
	                       		<div class="row">
	                       			<div class="col-md-6">
	                       	        	<label for="exampleInputSuje1">Votre email</label>
	                   					<div class="d-flex">
	                       					<i class="fas fa-envelope position-awesome-email"></i>
	                               			<input type="email" class="form-control pl-5" name="email" id="contact_email" placeholder="email" required>
	                           			</div>
	                       			</div>
	                       			<div class="col-md-6">
	                       	        <label for"phone">Votre numéro de téléphone</label>
	                   					<div class="d-flex">
	                       					<i class="fas fa-phone position-awesome"></i>
	                               			<input type="text" class="form-control pl-5" name="phone" id="contact_phone" placeholder="Votre numéro de téléphone" required>
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
	                               			<input type="date" class="form-control pl-5" name="date" id="contact_date" required>
	                           			</div>
	                       			</div>
	                       			<div class="col-md-6">
	                       	        <label for ="heure">Choisir l'heure</label>
	                   					<div class="d-flex">
	                                        <i class="fas fa-clock position-awesome"></i>
	                                        <select class="custom-select pl-5" id="heure" name="heure">
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
	               				<input type="hidden" name='id_reservation' value="<%= bien.getId() %>">
	                   			<button type="submit" class="btn btn-primary" id="submit" name="submit">Effectuer un rendez-vous</button>
	               			</div>
            			</form>	
            			<%
            				}else{	
            					AchatDao dbAchat = new AchatDao(ConnectionDB.getConnection());
            					List <Achat> achats = dbAchat.selectAchatCompare();
            					if(!achats.isEmpty()){
            						for(Achat achat : achats){
                						if(clients.getId() == achat.getClient() && bien.getId() == achat.getBien()){
                        %>	
                        <h3 class="text-center">Bonjour <%= clients.getPrenom() %> <%= clients.getNom() %></h3>
            			<div class='text-center my-4'>
							<button class="btn btn-primary rounded-0" disabled>Bien acheté</button>
						</div>
               			<%	
                						}else{
                		%>
                		<h3 class="text-center">Bonjour <%= clients.getPrenom() %> <%= clients.getNom() %></h3>
						<form action="<%= request.getContextPath() %>/AjouterAchat" method="post">
            				<div class='text-center my-4'>
            					<input type="hidden" name='id_bien' value="<%= bien.getId() %>">
            					<input type="hidden" name='id_client' value="<%= clients.getId() %>">
            					<button type="submit" class="btn btn-primary rounded-0">Veuillez achetez <%= bien.getNom() %> maintenant</button>	
            				</div>
            			</form>
          				<%	
                						}
            						}
            					}else{
            			%>
           				<form action="<%= request.getContextPath() %>/AjouterAchat" method="post">
            				<div class='text-center my-4'>
            					<input type="hidden" name='id_bien' value="<%= bien.getId() %>">
            					<input type="hidden" name='id_client' value="<%= clients.getId() %>">
            					<button type="submit" class="btn btn-primary rounded-0">Veuillez achetez <%= bien.getNom() %> maintenant</button>	
            				</div>
            			</form>
            			<%	
            					}
            				}
            			%>
            		</div>
            	</div>
			</div>
		</main>
		<%@include file="includes/footer.jsp"%>
	</body>
</html>