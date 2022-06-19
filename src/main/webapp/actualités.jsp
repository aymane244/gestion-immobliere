<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Actualités</title>
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
    <div class="container mt-5 pt-5">
    	<div class="d-flex justify-content-between align-items-center">
        	<h5>Actualités</h5>
            <h6>
    	        <a href="index.jsp" class="blog-link">Home </a>/
                <a href="#" class="home-link">Actualités</a>
            </h6>
       	</div>
	</div>
   	<div class="container bg-white py-3 mt-3">
    	<hr class="hr-thick">
            <div class="row">
                <div class="col-md-8">
                    <div class="card mt-3 border-0">
                        <div class="row align-items-center">
                            <div class="col-md-8 col-sm-8">
                                <div class="card-body">
                                    <h5 class="card-title pl-4"><a href="article.jsp" style="border-radius:0 !important">Titre de l'article </a></h5>
                                    <p class="pt-3 pl-4 text-length text-justify">
                                    	Nulla porttitor accumsan tincidunt. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. 
            							Quisque velit nisi, pretium ut lacinia in, elementum id enim.
                                    </p>
                                    <div class="d-flex">
                                        <p style="color:#BBBBBB"><i class="fas fa-clock pt-3 pl-4"></i><span> date</span></p> 
                                        <p style="color:#BBBBBB"><i class="fas fa-comment-dots pt-3 pl-4"></i><span> Commentaire</span></p> 
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-4">
                                <a href="article.jsp" style="border-radius:0 !important"><img src="images/views/library.jpg" class="img-fluid" alt="..." style="height:150px;"></a>
                            </div>
                        </div>
                    </div>
                    <hr>
                </div>
                <div class="col-md-3 ml-5">
                    <div class="div-background">
                        <hr class="hr-thick">
                        <div class="text-center">
                            <h2 class="pt-2">Lire aussi</h2>
                            <hr class="hr-style">
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