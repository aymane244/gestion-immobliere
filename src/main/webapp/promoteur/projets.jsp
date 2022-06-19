<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="mobilierModel.ProjetBien"%>
<%@page import="mobilierDao.ProjetDao"%>
<%@page import="java.util.List"%>
<%@page import="Database.ConnectionDB"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Projets</title>
		<%@include file="../includes/css/header.html"%>
		<style>
			<%@include file="../includes/css/styles.css"%>
		</style>
	</head>
	<body>
		<%@include file="../includes/navbar-admins.jsp"%>
		<div class="container-fluid mt-5 pt-5">
			<div class="text-center py-3">
                <h2><i class="fas fa-school"></i> Page Projets</h2>
            </div>
			<%
        		if(session.getAttribute("success_pro_bienproj") != null){
       		%>
   			<div class='container alert alert-success text-center' role='alert'>
				<%= session.getAttribute("success_pro_bienproj")%>
			</div>
			<%
       			}
			%>
			<%
        		if(session.getAttribute("success_pro_proj") != null){
       		%>
   			<div class='container alert alert-success text-center' role='alert'>
				<%= session.getAttribute("success_pro_proj")%>
			</div>
			<%
       			}
			%>
			<%
        		if(session.getAttribute("success_pro_mod_proj") != null){
       		%>
   			<div class='container alert alert-success text-center' role='alert'>
				<%= session.getAttribute("success_pro_mod_proj")%>
			</div>
			<%
       			}
			%>
            <div class="mt-4 align-items-center text-center">
                <a href="ajouter-projet.jsp" target="_blank" class="btn btn-primary">
                    <i class="fas fa-plus-square"></i> Ajouter un projet
                </a>
                <a href="ajouter-biens-projet.jsp" target="_blank" class="btn btn-primary">
                    <i class="fas fa-plus-square"></i> Ajouter Biens
                </a>
            </div>
            <table class="table table-bordered mt-5 bg-white">
            	<thead class="text-center">
                    <tr>
                    	<th scope="col">#</th>
                        <th scope="col">Nom du projet</th>
                        <th scope="col">Nom de la résidence</th>
                        <th scope="col">Type</th>
                        <th scope="col">Chambres</th>
                       	<th scope="col">Prix</th>
                        <th scope="col">prix par m²</th>
                        <th scope="col">Etat de construction</th>
                        <th scope="col">description du projet</th>
                        <th scope="col">date de livraison</th>
                        <th scope="col">Tailles de projet en unité</th>
                        <th scope="col">Ville</th>
                        <th scope="col">Images</th>
                        <th scope="col">Actions</th>
                    </tr>
				</thead>
                <tbody class="text-center">
					<tr>
						<%
							ProjetDao db = new ProjetDao(ConnectionDB.getConnection());
				  			List<ProjetBien> projets = db.selectAll();
							int i = 1;
          					for(ProjetBien projet: projets){
						%>
	                   	<td class="row-style"><%= i++ %></td>  
	                   	<td class="row-style"><%= projet.getNomProjet() %></td>
	                   	<td class="row-style"><%= projet.getNom() %></td> 
	                   	<td class="row-style"><%= projet.getType() %></td>
	                   	<td class="row-style"><%= projet.getChambre() %></td>
	                   	<td class="row-style"><%= projet.getPrix() %></td>   
	                   	<td class="row-style"><%= projet.getPrixMetre() %></td>     
	                    <td class="row-style"><%= projet.getEtat() %></td>
	                    <td class="w-25  row-style"><%= projet.getDescription() %></td>
	                    <td class="w-25  row-style"><%= projet.getDate() %></td>
	                    <td class="w-25  row-style"><%= projet.getUnite() %></td>
	                    <td class="w-25  row-style"><%= projet.getVille() %></td>
	                    <td class="w-25  row-style"><img src="../images/promoteur/assets/<%= projet.getImage() %>" style="max-width:10rem; height:100px;"></td>
	                   	<td class="row-style"> 
	                    	<div class="row">
	                        	<div class="col-md-6">
	                             	<a href="modifier-projet.jsp?id=<%= projet.getId() %>" target="_blank"> 
	                                 	<i class="fas fa-edit text-success awesome-size"></i>
	                               	</a>
	                           	</div>
	                            <div class="col-md-6">
	                            	<form action="<%= request.getContextPath() %>/SupprimerProjet" method="POST">
	                                	<input type="hidden" name="id" value="<%= projet.getId() %>">
	                                    <button type="submit" class="btn-style" name="submit" onclick='return confirm("Voulez-vous supprimer ce projet")'>
	                                   		<i class="fas fa-trash-alt text-danger awesome-size"></i>
	                                 	</button>
	                            	</form>
	                          	</div>
	                       	</div>
	                	</td>
                   	</tr>
                   	<%
          				}
					%>
            	</tbody>    
          	</table>
		</div>
	</body>
</html>