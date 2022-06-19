<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="mobilierModel.Client"%>
<%@page import="mobilierModel.Agent"%>
<%@page import="mobilierModel.Notaire"%>
<%@page import="mobilierModel.Promoteur"%>
<%
	Client clients  = (Client) session.getAttribute("clientlogin");
	Agent agent  = (Agent) session.getAttribute("agentlogin");
	Notaire  notaire = (Notaire) session.getAttribute("notairelogin");
	Promoteur  promoteur = (Promoteur) session.getAttribute("promoteurlogin");
%>
<nav class="navbar navbar-expand-lg navbar-light bg-white pl-5 nav-style fixed-top">
	<a class="navbar-brand" href="#">GP</a>
  	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    	<span class="navbar-toggler-icon"></span>
  	</button>
  	<div class="collapse navbar-collapse" id="navbarSupportedContent">
    	<ul class="navbar-nav mx-auto">
      		<li class="nav-item">
        		<a class="nav-link text-color" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      		</li>
      		<li class="nav-item">
        		<a class="nav-link px-lg-4 text-color" href="entreprise.jsp">A propos de nous</a>
      		</li>
      		<li class="nav-item dropdown">
        		<a class="nav-link dropdown-toggle text-color" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
          			Biens immobiliers
        		</a>
        		<div class="dropdown-menu" aria-labelledby="navbarDropdown">
          			<a class="dropdown-item" href="biens.jsp">Biens</a>
          			<div class="dropdown-divider"></div>
          			<a class="dropdown-item" href="terrains.jsp">Terrains</a>
          			<div class="dropdown-divider"></div>
          			<a class="dropdown-item" href="commerces.jsp">Bureaux & commerces</a>
        		</div>
      		</li>
      		<li class="nav-item">
        		<a class="nav-link px-lg-4 text-color" href="projets.jsp">Projets</a>
      		</li>
      		<li class="nav-item">
        		<a class="nav-link px-lg-4 text-color" href="programmes.jsp">Programmes</a>
      		</li>
      		<li class="nav-item">
        		<a class="nav-link text-color" href="#contact">Contacez-nous</a>
      		</li>
      	</ul>
      	<ul class="navbar-nav">
      		<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle text-color btn-espace ml-lg-5" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
          			<i class="fa-solid fa-user"></i> Votre espace
        		</a>
        		<div class="dropdown-menu" aria-labelledby="navbarDropdown">
        			<a class="dropdown-item" href="agent/dashboard.jsp">Agent</a>
        			<a class="dropdown-item" href="client/dashboard.jsp">Client</a>
        			<a class="dropdown-item" href="notaire/dashboard.jsp">Notaire</a>
          			<a class="dropdown-item" href="promoteur/dashboard.jsp">Promoteur</a>
        		</div>
      		</li>
    	</ul>
  	</div>
</nav>