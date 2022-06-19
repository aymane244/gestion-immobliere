<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<foot>
	<div  id="contact">
    	<h2 class="text-center">Contactez-nous</h2>
        <hr class="hr-style">
	</div>
	<div class="bg-footer">
		<div class="container">
			<div class="row pt-5">
				<div class="col-md-4">
					<h1>L'entreprise</h1>
					<p>Enim minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip exea commodo consequat duis sed aute irure.</p>
					<p>
						Téléphone: 2125555555 <br>
						Mail: example@example.com
					</p>
				</div>
				<div class="col-md-4 space">
					<h1>Nos services</h1>
					<div class="ml-4">
						<p><i class="fas fa-angle-right font-awesome-color mr-2"></i> Bien à vendre</p>
						<p><i class="fas fa-angle-right font-awesome-color mr-2"></i> Bien à louer</p>
						<p><i class="fas fa-angle-right font-awesome-color mr-2"></i> Location vacances</p>
						<p><i class="fas fa-angle-right font-awesome-color mr-2"></i> Bureaux & Commerces</p>
					</div>
				</div>
				<div class="col-md-4">
					<h1>Les villes</h1>
					<div class="ml-4">
						<p><i class="fas fa-angle-right font-awesome-color mr-2"></i> Rabat</p>
						<p><i class="fas fa-angle-right font-awesome-color mr-2"></i> Casablnca</p>
						<p><i class="fas fa-angle-right font-awesome-color mr-2"></i> Marrakech</p>
						<p><i class="fas fa-angle-right font-awesome-color mr-2"></i> Tanger</p>
					</div>
				</div>
			</div>
			<hr>
			<div class="text-center">
				<h1>Contactez-nous</h1>
			</div>
			<div class="row">
            	<div class="col-lg-6 py-2">
                	<div class="text-center">
                    	<h2 class="pt-4 pb-2">Comment nous trouver</h2>
                	</div>
                	<div>
                    	<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1618.496397530596!2d-5.806634243149613!3d35.77555333239981!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd0c7f57d96a4d39%3A0xa8bf6236db39c3a3!2s12%20Rue%20El%20Hariri%2C%20Tanger!5e0!3m2!1sfr!2sma!4v1646222682302!5m2!1sfr!2sma" style="border:0; width:100%; height:450px" allowfullscreen="" loading="lazy" class="img-fluid"></iframe>
                	</div>
            	</div>
            	<div class="col-lg-6 py-2">
                	<div class="text-center">
                    	<h2 class="pt-4 pb-2">Envoyez-nous un message</h2>
                	</div>
					<%
        				if(session.getAttribute("message") != null){
       				%>
   					<div class='container alert alert-success text-center w-50' role='alert'>
						<%= session.getAttribute("message")%>
					</div>
					<%
       					}
					%>
                	<form action="<%= request.getContextPath() %>/AjouterMessage" method="post">
	                	<div class="row">
	                    	<div class="col">	
	                        	<div class="form-group">
	                            	<label for="exampleInputSuje1">Votre nom</label>
	                            	<div class="d-flex">
	                                	<i class="fas fa-user position-awesome"></i>
	                                	<input type="text" class="form-control pl-5" name="nom" id="contact_nom" placeholder="Nom complet" required>
	                            	</div>
	                        	</div>
	                    	</div>
	                    	<div class="col">
	                        	<div class="form-group">
	                            	<label for="exampleInputSuje1">Votre email</label>
	                            	<div class="d-flex">
	                                	<i class="fas fa-envelope position-awesome-email"></i>
	                                	<input type="email" class="form-control pl-5" name="email" id="contact_email" placeholder="email" required>
	                            	</div>
	                        	</div>
	                    	</div>
	                	</div>
	                	<div class="form-group">
	                    	<label for="exampleInputSuje1">Sujet</label>
	                    	<div class="d-flex">
	                        	<i class="fas fa-book-open position-awesome-sujet"></i>
	                        	<input type="text" class="form-control pl-5" id="exampleInputSuje1" name ="sujet" aria-describedby="emailSujet" placeholder="Sujet" required>
	                    	</div>
	                	</div>
	                	<div class="form-group">
	                    	<label for="exampleFormControlTextarea1">Votre message</label>
	                    	<textarea class="form-control" id="exampleFormControlTextarea1" name="message" rows="6" required></textarea>
	                	</div>
	                	<div class="text-center">
	                    	<button type="submit" class="btn btn-primary" id="submit" name="submit">Envoyer votre message</button>
	                	</div>
                	</form>
            	</div>
        	</div>
        	<hr>
        	<div class="d-flex justify-content-center awesome-text-size py-3">
        		<i class="fab fa-facebook"></i>
        		<i class="fab fa-twitter px-4"></i>
        		<i class="fab fa-instagram"></i>
        		<i class="fab fa-linkedin pl-4"></i>
			</div>
		</div>
	</div>
</foot>