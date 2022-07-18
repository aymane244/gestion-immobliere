<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Gestion immobilère</title>
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
		<header>
			<div class="div-header text-white">
				<h1>Hello</h1>
				<p class="para-header">
					Bienvenue dans notre website <br> 
					Vous trouvrez les meilleurs offres
				</p>
			</div>
			
			<div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel" style="position:relative">
  				<div class="carousel-inner">
    				<div class="carousel-item active">
    					<div style="background-color: black;opacity: 0.5;top: 0;left: 0;width: 100%;height: 100%;position: absolute;"></div>
        				<img src="images/views/gueliz_0.jpg" class="d-block img-fluid" alt="..." style="width:90rem; height:625px;">
    				</div>
    				<div class="carousel-item">
    					<div style="background-color: black;opacity: 0.5;top: 0;left: 0;width: 100%;height: 100%;position: absolute;"></div>
      					<img src="images/views/istockphoto-866547370-170667a.jpg" class="d-block img-fluid" alt="..." style="width:90rem; height:625px;">
    				</div>
    				<div class="carousel-item">
    					<div style="background-color: black;opacity: 0.5;top: 0;left: 0;width: 100%;height: 100%;position: absolute;"></div>
      					<img src="images/views/mohammed-vi-football-academy-a010513-c2.jpg" class="d-block img-fluid" alt="..." style="width:90rem; height:625px;">
    				</div>
  				</div>
			</div>
		</header>
		<main>
			<div class="container mt-4">
				<div class="text-center pb-3">
					<h1>Nos services</h1>
					<hr class="hr-style">
				</div>
				<div class="row">
					<div class="col-md-6 col-lg-4">
						<div class="services text-center">
							<i class="fa-solid fa-house awesome-font pt-5"></i>
							<h3 class="px-2">Biens à vendre</h3>
						</div>
						<p class="text-justify px-2 mt-3 text-color">
							Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
							Fusce eleifend tempus condimentum. Pellentesque magna turpis, 
						</p>
					</div>	
					<div class="col-md-6 col-lg-4">
						<div class="services text-center">
							<i class="fa-solid fa-hotel awesome-font pt-5"></i>
							<h3 class="px-2">Terrains</h3>
						</div>
						<p class="text-justify px-2 mt-3 text-color">
							Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
							Fusce eleifend tempus condimentum. Pellentesque magna turpis, 
						</p>
					</div>		
					<div class="col-md-6 col-lg-4">
						<div class="services text-center">
							<i class="fa-solid fa-briefcase awesome-font pt-5"></i>
							<h3 class="px-2">Bureaux & Commerces</h3>
						</div>
						<p class="text-justify px-2 mt-3 text-color">
							Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
							Fusce eleifend tempus condimentum. Pellentesque magna turpis, 
						</p>
					</div>	
				</div>
				<div class="text-center pb-3 mt-4">
					<h1>Biens à vendre</h1>
					<hr class="hr-style">
				</div>
				<div class="row">
					<div class="col-md-4">
						<div onmouseover="afficher()" onmouseout="cacher()">
					 		<img src="images/views/gueliz_0.jpg" class="d-block img-fluid" alt="..." style="width:92rem; height:350px;">
  							<div class="text-serivces" id="show-text">
  								<table class="text-center">
  									<tr>
  										<td><b>Supérficie</b></td>
  										<td class="px-3"><b>Chambres</b></td>
  										<td><b>Syndique</b></td>
  										<td class="pl-2"><b>Garage</b></td>
  									</tr>
  									<tr>
  										<td class="pt-3 pb-2 text-white text-center"><b>100 m²</b></td>
  										<td class="pt-3 pb-2 text-white text-center"><b>4</b></td>
  										<td class="pt-3 pb-2 text-white text-center"><b>180Dhs</b></td>
  										<td class="pt-3 pb-2 text-white text-center"><b>Oui</b></td>
  									</tr>
  								</table>
  							</div>
						</div>
						<div class="text-serivces-small">
							<div class="d-flex justify-content-center pt-2">
								<p><b>Supérficie: <span class="text-white">100m²</span></b></p>
								<p class="pl-3"><b>Chambres: <span class="text-white">4</span></b></p>
							</div>
							<div class="d-flex justify-content-center">
								<p><b>Syndique: <span class="text-white">180Dhs</span></b></p>
								<p class="pl-3"><b>Garage: <span class="text-white">Oui</span></b></p>
							</div>
  						</div>
					</div>
					<div class="col-md-4 space-small">
  						<div onmouseover="afficher2()" onmouseout="cacher2()">
					 		<img src="images/views/mohammed-vi-football-academy-a010513-c2.jpg" class="d-block img-fluid" alt="..." style="width:90rem; height:350px;">
  							<div class="text-serivces" id="show-text-2">
  								<table class="text-center">
  									<tr>
  										<td><b>Supérficie</b></td>
  										<td class="px-3"><b>Chambres</b></td>
  										<td><b>Syndique</b></td>
  										<td class="pl-2"><b>Garage</b></td>
  									</tr>
  									<tr>
  										<td class="pt-3 pb-2 text-white text-center"><b>100 m²</b></td>
  										<td class="pt-3 pb-2 text-white text-center"><b>4</b></td>
  										<td class="pt-3 pb-2 text-white text-center"><b>180Dhs</b></td>
  										<td class="pt-3 pb-2 text-white text-center"><b>Oui</b></td>
  									</tr>
  								</table>
  							</div>
						</div>
						<div class="text-serivces-small">
							<div class="d-flex justify-content-center pt-2">
								<p><b>Supérficie: <span class="text-white">100m²</span></b></p>
								<p class="pl-3"><b>Chambres: <span class="text-white">4</span></b></p>
							</div>
							<div class="d-flex justify-content-center">
								<p><b>Syndique: <span class="text-white">180Dhs</span></b></p>
								<p class="pl-3"><b>Garage: <span class="text-white">Oui</span></b></p>
							</div>
  						</div>
					</div>
					<div class="col-md-4">
  						<div onmouseover="afficher3()" onmouseout="cacher3()">
					 		<img src="images/views/mohammed-vi-football-academy-a010513-c2.jpg" class="d-block img-fluid" alt="..." style="width:90rem;  height:350px;">
  							<div class="text-serivces" id="show-text-3">
  								<table class="text-center">
  									<tr>
  										<td><b>Supérficie</b></td>
  										<td class="px-3"><b>Chambres</b></td>
  										<td><b>Syndique</b></td>
  										<td class="pl-2"><b>Garage</b></td>
  									</tr>
  									<tr>
  										<td class="pt-3 pb-2 text-white text-center"><b>100 m²</b></td>
  										<td class="pt-3 pb-2 text-white text-center"><b>4</b></td>
  										<td class="pt-3 pb-2 text-white text-center"><b>180Dhs</b></td>
  										<td class="pt-3 pb-2 text-white text-center"><b>Oui</b></td>
  									</tr>
  								</table>
  							</div>
						</div>
						<div class="text-serivces-small">
							<div class="d-flex justify-content-center pt-2">
								<p><b>Supérficie: <span class="text-white">100m²</span></b></p>
								<p class="pl-3"><b>Chambres: <span class="text-white">4</span></b></p>
							</div>
							<div class="d-flex justify-content-center">
								<p><b>Syndique: <span class="text-white">180Dhs</span></b></p>
								<p class="pl-3"><b>Garage: <span class="text-white">Oui</span></b></p>
							</div>
  						</div>
					</div>
				</div>
				<div class="text-center pb-3 mt-5 pt-5">
					<h1>Terrains</h1>
					<hr class="hr-style">
				</div>
				<div class="row">
					<div class="col-md-4">
  						<div onmouseover="afficher4()" onmouseout="cacher4()">
					 		<img src="images/views/mohammed-vi-football-academy-a010513-c2.jpg" class="d-block img-fluid" alt="..." style="width:90rem; height:350px;">
  							<div class="text-serivces" id="show-text-4">
  								<table class="text-center">
  									<tr>
  										<td><b>Supérficie</b></td>
  										<td class="px-3"><b>Chambres</b></td>
  										<td><b>Syndique</b></td>
  										<td class="pl-2"><b>Garage</b></td>
  									</tr>
  									<tr>
  										<td class="pt-3 pb-2 text-white text-center"><b>100 m²</b></td>
  										<td class="pt-3 pb-2 text-white text-center"><b>4</b></td>
  										<td class="pt-3 pb-2 text-white text-center"><b>180Dhs</b></td>
  										<td class="pt-3 pb-2 text-white text-center"><b>Oui</b></td>
  									</tr>
  								</table>
  							</div>
						</div>
						<div class="text-serivces-small">
							<div class="d-flex justify-content-center pt-2">
								<p><b>Supérficie: <span class="text-white">100m²</span></b></p>
								<p class="pl-3"><b>Chambres: <span class="text-white">4</span></b></p>
							</div>
							<div class="d-flex justify-content-center">
								<p><b>Syndique: <span class="text-white">180Dhs</span></b></p>
								<p class="pl-3"><b>Garage: <span class="text-white">Oui</span></b></p>
							</div>
  						</div>
					</div>
					<div class="col-md-4 space-small">
  						<div onmouseover="afficher5()" onmouseout="cacher5()">
					 		<img src="images/views/mohammed-vi-football-academy-a010513-c2.jpg" class="d-block img-fluid" alt="..." style="width:90rem; height:350px;">
  							<div class="text-serivces" id="show-text-5">
  								<table class="text-center">
  									<tr>
  										<td><b>Supérficie</b></td>
  										<td class="px-3"><b>Chambres</b></td>
  										<td><b>Syndique</b></td>
  										<td class="pl-2"><b>Garage</b></td>
  									</tr>
  									<tr>
  										<td class="pt-3 pb-2 text-white text-center"><b>100 m²</b></td>
  										<td class="pt-3 pb-2 text-white text-center"><b>4</b></td>
  										<td class="pt-3 pb-2 text-white text-center"><b>180Dhs</b></td>
  										<td class="pt-3 pb-2 text-white text-center"><b>Oui</b></td>
  									</tr>
  								</table>
  							</div>
						</div>
						<div class="text-serivces-small">
							<div class="d-flex justify-content-center pt-2">
								<p><b>Supérficie: <span class="text-white">100m²</span></b></p>
								<p class="pl-3"><b>Chambres: <span class="text-white">4</span></b></p>
							</div>
							<div class="d-flex justify-content-center">
								<p><b>Syndique: <span class="text-white">180Dhs</span></b></p>
								<p class="pl-3"><b>Garage: <span class="text-white">Oui</span></b></p>
							</div>
  						</div>
					</div>
					<div class="col-md-4">
  						<div onmouseover="afficher6()" onmouseout="cacher6()">
					 		<img src="images/views/mohammed-vi-football-academy-a010513-c2.jpg" class="d-block img-fluid" alt="..." style="width:90rem; height:350px;">
  							<div class="text-serivces" id="show-text-6">
  								<table class="text-center">
  									<tr>
  										<td><b>Supérficie</b></td>
  										<td class="px-3"><b>Chambres</b></td>
  										<td><b>Syndique</b></td>
  										<td class="pl-2"><b>Garage</b></td>
  									</tr>
  									<tr>
  										<td class="pt-3 pb-2 text-white text-center"><b>100 m²</b></td>
  										<td class="pt-3 pb-2 text-white text-center"><b>4</b></td>
  										<td class="pt-3 pb-2 text-white text-center"><b>180Dhs</b></td>
  										<td class="pt-3 pb-2 text-white text-center"><b>Oui</b></td>
  									</tr>
  								</table>
  							</div>
						</div>
						<div class="text-serivces-small">
							<div class="d-flex justify-content-center pt-2">
								<p><b>Supérficie: <span class="text-white">100m²</span></b></p>
								<p class="pl-3"><b>Chambres: <span class="text-white">4</span></b></p>
							</div>
							<div class="d-flex justify-content-center">
								<p><b>Syndique: <span class="text-white">180Dhs</span></b></p>
								<p class="pl-3"><b>Garage: <span class="text-white">Oui</span></b></p>
							</div>
  						</div>
					</div>
				</div>
				<div class="text-center mt-5 pt-5">
					<h1>Bureaux & commerces</h1>
					<hr class="hr-style">
				</div>
				<div class="row">
					<div class="col-md-4">
  						<div onmouseover="afficher10()" onmouseout="cacher10()">
					 		<img src="images/views/mohammed-vi-football-academy-a010513-c2.jpg" class="d-block img-fluid" alt="..." style="width:90rem; height:350px;">
  							<div class="text-serivces" id="show-text-10">
  								<table class="text-center">
  									<tr>
  										<td><b>Supérficie</b></td>
  										<td class="px-3"><b>Chambres</b></td>
  										<td><b>Syndique</b></td>
  										<td class="pl-2"><b>Garage</b></td>
  									</tr>
  									<tr>
  										<td class="pt-3 pb-2 text-white text-center"><b>100 m²</b></td>
  										<td class="pt-3 pb-2 text-white text-center"><b>4</b></td>
  										<td class="pt-3 pb-2 text-white text-center"><b>180Dhs</b></td>
  										<td class="pt-3 pb-2 text-white text-center"><b>Oui</b></td>
  									</tr>
  								</table>
  							</div>
						</div>
						<div class="text-serivces-small">
							<div class="d-flex justify-content-center pt-2">
								<p><b>Supérficie: <span class="text-white">100m²</span></b></p>
								<p class="pl-3"><b>Chambres: <span class="text-white">4</span></b></p>
							</div>
							<div class="d-flex justify-content-center">
								<p><b>Syndique: <span class="text-white">180Dhs</span></b></p>
								<p class="pl-3"><b>Garage: <span class="text-white">Oui</span></b></p>
							</div>
  						</div>
					</div>
					<div class="col-md-4 space-small">
  						<div onmouseover="afficher11()" onmouseout="cacher11()">
					 		<img src="images/views/mohammed-vi-football-academy-a010513-c2.jpg" class="d-block img-fluid" alt="..." style="width:90rem; height:350px;">
  							<div class="text-serivces" id="show-text-11">
  								<table class="text-center table-width">
  									<tr>
  										<td><b>Supérficie</b></td>
  										<td class="px-3"><b>Chambres</b></td>
  										<td><b>Syndique</b></td>
  										<td class="pl-2"><b>Garage</b></td>
  									</tr>
  									<tr>
  										<td class="pt-3 pb-2 text-white text-center"><b>100 m²</b></td>
  										<td class="pt-3 pb-2 text-white text-center"><b>4</b></td>
  										<td class="pt-3 pb-2 text-white text-center"><b>180Dhs</b></td>
  										<td class="pt-3 pb-2 text-white text-center"><b>Oui</b></td>
  									</tr>
  								</table>
  							</div>
						</div>
						<div class="text-serivces-small">
							<div class="d-flex justify-content-center pt-2">
								<p><b>Supérficie: <span class="text-white">100m²</span></b></p>
								<p class="pl-3"><b>Chambres: <span class="text-white">4</span></b></p>
							</div>
							<div class="d-flex justify-content-center">
								<p><b>Syndique: <span class="text-white">180Dhs</span></b></p>
								<p class="pl-3"><b>Garage: <span class="text-white">Oui</span></b></p>
							</div>
  						</div>
					</div>
					<div class="col-md-4">
  						<div onmouseover="afficher12()" onmouseout="cacher12()">
					 		<img src="images/views/mohammed-vi-football-academy-a010513-c2.jpg" class="d-block img-fluid" alt="..." style="width:90rem; height:350px;">
  							<div class="text-serivces" id="show-text-12">
  								<table class="text-center">
  									<tr>
  										<td><b>Supérficie</b></td>
  										<td class="px-3"><b>Chambres</b></td>
  										<td><b>Syndique</b></td>
  										<td class="pl-2"><b>Garage</b></td>
  									</tr>
  									<tr>
  										<td class="pt-3 pb-2 text-white text-center"><b>100 m²</b></td>
  										<td class="pt-3 pb-2 text-white text-center"><b>4</b></td>
  										<td class="pt-3 pb-2 text-white text-center"><b>180Dhs</b></td>
  										<td class="pt-3 pb-2 text-white text-center"><b>Oui</b></td>
  									</tr>
  								</table>
  							</div>
						</div>
						<div class="text-serivces-small">
							<div class="d-flex justify-content-center pt-2">
								<p><b>Supérficie: <span class="text-white">100m²</span></b></p>
								<p class="pl-3"><b>Chambres: <span class="text-white">4</span></b></p>
							</div>
							<div class="d-flex justify-content-center">
								<p><b>Syndique: <span class="text-white">180Dhs</span></b></p>
								<p class="pl-3"><b>Garage: <span class="text-white">Oui</span></b></p>
							</div>
  						</div>
					</div>
				</div>
				<div class="text-center mt-5 pt-5">
					<h1>Actualités</h1>
					<hr class="hr-style">
				</div>
				<div class="owl-carousel">
  					<div class="px-4">
                    	<a href="#"><img src="images/views/mohammed-vi-football-academy-a010513-c2.jpg" alt="" class="img-fluid img-etudiant"></a>
                    	<h5 class="mt-2"><b><a href="#">Titre de l'article</a></b></h5>
                    	<p class="text-length text-justify">
                    		Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
							Fusce eleifend tempus condimentum. Pellentesque magna turpis, 
                    	</p>
                	</div>
                	<div class="px-4">
                    	<a href="#"><img src="images/views/mohammed-vi-football-academy-a010513-c2.jpg" alt="" class="img-fluid img-etudiant"></a>
                    	<h5 class="mt-2"><b><a href="#">Titre de l'article</a></b></h5>
                    	<p class="text-length text-justify">
                    		Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
							Fusce eleifend tempus condimentum. Pellentesque magna turpis, 
                    	</p>
                	</div>
				</div>
				<div class="text-center mt-5 pt-5">
					<h1>Avis des clients</h1>
					<hr class="hr-style">
				</div>
				<div class="row">
					<div class="col-md-4">
						<div class="text-center">
							<i class="fas fa-comment font-awesome-size mb-3"></i>
							<p class="bg-para-avis p-4">
								Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
								Fusce eleifend tempus condimentum. Pellentesque magna turpis, 
							</p>
						</div>
					</div>
					<div class="col-md-4 space">
						<div class="text-center">
							<i class="fas fa-comment font-awesome-size mb-3"></i>
							<p class="bg-para-avis p-4">
								Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
								Fusce eleifend tempus condimentum. Pellentesque magna turpis, 
							</p>
						</div>
					</div>
					<div class="col-md-4">
						<div class="text-center">
							<i class="fas fa-comment font-awesome-size mb-3"></i>
							<p class="bg-para-avis p-4">
								Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
								Fusce eleifend tempus condimentum. Pellentesque magna turpis, 
							</p>
						</div>
					</div>
				</div>
			</div>
		</main>
		<%@include file="includes/footer.jsp"%>
	</body>
</html>