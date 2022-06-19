<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Article Lecture</title>
		<%@include file="includes/css/header.html"%>
		<style>
			<%@include file="includes/css/styles.css"%>
		</style>
	</head>
	<body>
		<%@include file="../includes/navbar.jsp"%>
		<div class="container mt-5 pt-5">
    		<div class="d-flex justify-content-between align-items-center">
    			<h5>Actualités</h5>
                <h6>
               		<a href="index.jsp" class="blog-link">Home </a>/
               		<a href="actualités.jsp" class="blog-link">Actualités </a>/
               		<a href="#" class="home-link">Titre de l'article</a>
           		</h6>
           	</div>
        </div>
        <div class="container mt-3">
            <div class="row">
                <div class="col-md-8">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card mt-3 border-0">
                                <h2 class="pt-3 pl-4">Titre de l'article</h2>
                                <p style="color:#BBBBBB" class="pl-4"><i class="fas fa-clock py-3"></i><span> Publié le: date</span></p>
                                <div class="text-center mb-3">
                                    <img src="images/views/library.jpg" alt="" class="img-fluid img-article">
                                </div>
                                <p class="pt-3 px-3 text-justify bg-text">
									Nulla porttitor accumsan tincidunt. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. 
            						Quisque velit nisi, pretium ut lacinia in, elementum id enim.
								</p>
                            </div>
                        </div>
                        <div class="col-md-12 mt-3">
                            <h2 class="pl-4 text-center">Les Commentaires</h2>
                            <hr class="hr-width">
                            <div class="pl-5 bg-white py-3">  
                                <h4 class=""> Commentaires</h4>
                                <div id="list_comments">
                                    <p class="pl-4 mt-3">
                                        <b>Nom et prénom</b> <br>
                                        <span style="color:#BBBBBB">date</span> <br>
                                        <span class="pl-3">
                                        	Nulla porttitor accumsan tincidunt. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. 
            								Quisque velit nisi, pretium ut lacinia in, elementum id enim.
                                        </span>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 mt-3">
                        	<div class="text-center pt-3 text-color">
                            	<h2 class="text-center">Laissez un commentaire</h2>
                            	<hr class="hr-width">
                        	</div>
                        	<div class="container bg-white py-3">
                            	<div class="row justify-content-center">
                                	<div class="col-md-8">
                                    	<div class="row">
                                        	<div class="col">
                                            	<div class="form-group">
                                                	<label for="exampleInputSuje1">Votre Prénom</label>
                                                	<div class="d-flex">
                                                    	<i class="fas fa-user position-awesome"></i>
                                                    	<input type="text" class="form-control pl-5" name="nom" id="contact_noms" placeholder="Votre nom" required>
                                                	</div>
                                            	</div>
                                        	</div>
                                    		<div class="col">
                                        		<div class="form-group">
                                            		<label for="exampleInputSuje1">Votre Nom</label>
                                            		<div class="d-flex">
                                               			<i class="fas fa-user position-awesome"></i>
                                                		<input type="text" class="form-control pl-5" name="prenom" id="contact_prenom" placeholder="Votre prenom" required>
                                            		</div>
                                        		</div>
                                    		</div>
                                		</div>
                                		<div class="form-group">
                                    		<label for="exampleFormControlTextarea1">Votre Commentaire</label>
                                    		<textarea class="form-control" id="comments" name="commentaire" rows="6" required></textarea>
                                		</div>
                                		<div class="text-center">
                                    		<input type="hidden" name="article_id" id="article_id" value="">
                                    		<button class="btn btn-primary" id="submit" name="submit_com" style="border-radius:0 !important">Ecrire votre commentaire</button>
                                		</div>
                            		</div>
                        		</div>
                        	</div>
                    	</div>
                	</div>
            	</div>
            	<div class="col-md-3 bg-white py-3 mt-3">
                	<div class="div-background">
                    	<hr class="hr-thick">
                    	<div class="text-center text-color">
                        	<h2 class="pt-2">Lire aussi</h2>
                        	<hr class="hr-width">
                    	</div>
                    	<div class="row">
                        	<div class="col-md-12">
                            	<div class="pb-2">
                                	<a href="#"><h4 class="pt-3 px-2">Titre de l'article</h4></a>
                                	<p style="color:#BBBBBB"><i class="fas fa-clock pt-3 pl-4"></i><span> Date</span></p> 
                            	</div>
                            	<hr class="w-75">
                        	</div>
                    	</div>
                	</div>
            	</div>
        	</div>
    	</div> 
    	<%@include file="includes/footer.jsp"%> 
	</body>
</html>