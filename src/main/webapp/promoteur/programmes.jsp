<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="mobilierModel.ProgrammeBien"%>
<%@page import="mobilierDao.ProgrammeDao"%>
<%@page import="java.util.List"%>
<%@page import="Database.ConnectionDB"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Programmes</title>
		<%@include file="../includes/css/header.html"%>
		<style>
			<%@include file="../includes/css/styles.css"%>
		</style>
	</head>
	<body>
		<%@include file="../includes/navbar-admins.jsp"%>
		<div class="px-5 mt-5 pt-5">
			<div class="text-center py-3">
                <h2><i class="fas fa-school"></i> Page Programmes</h2>
            </div>
			<%
        		if(session.getAttribute("success_pro_bienprog") != null){
       		%>
   			<div class='container alert alert-success text-center' role='alert'>
				<%= session.getAttribute("success_pro_bienprog")%>
			</div>
			<%
       			}
			%>
			<%
        		if(session.getAttribute("success_pro_prog") != null){
       		%>
   			<div class='container alert alert-success text-center' role='alert'>
				<%= session.getAttribute("success_pro_prog")%>
			</div>
			<%
       			}
			%>
			<%
        		if(session.getAttribute("success_pro_mod_prog") != null){
       		%>
   			<div class='container alert alert-success text-center' role='alert'>
				<%= session.getAttribute("success_pro_mod_prog")%>
			</div>
			<%
       			}
			%>
            <div class="mt-4 align-items-center text-center">
                <a href="ajouter-programme.jsp" target="_blank" class="btn btn-primary">
                    <i class="fas fa-plus-square"></i> Ajouter un programme
                </a>
                <a href="ajouter-biens-programme.jsp" target="_blank" class="btn btn-primary">
                    <i class="fas fa-plus-square"></i> Ajouter Biens
                </a>
            </div>
            <table class="table table-bordered mt-5 bg-white">
            	<thead class="text-center">
                    <tr>
                    	<th scope="col">#</th>
                        <th scope="col">Nom du programme</th>
                        <th scope="col">Etat de construction</th>
                        <th scope="col">description du programme</th>
                        <th scope="col">Prix minmum</th>
                        <th scope="col">prix par m²</th>
                        <th scope="col">date de livraison</th>
                        <th scope="col">Tailles de programme en unité</th>
                        <th scope="col">Chambres</th>
                        <th scope="col">Nom de la résidence</th>
                        <th scope="col">Ville</th>
                        <th scope="col">Images</th>
                        <th scope="col">Actions</th>
                    </tr>
				</thead>
                <tbody class="text-center">
					<tr>
						<%
							ProgrammeDao db = new ProgrammeDao(ConnectionDB.getConnection());
				  			List<ProgrammeBien> programmes = db.selectAllProgramme();
							int i = 1;
          					for(ProgrammeBien programme: programmes){
						%>
	                   	<td><%= i++ %></td>  
	                   	<td><%= programme.getNomProgramme() %></td>          
	                    <td><%= programme.getEtat() %></td>
	                    <td><%= programme.getDescription() %></td>
	                    <td><%= programme.getPrix() %></td>
	                    <td><%= programme.getPrixMetre() %></td>
	                    <td><%= programme.getDate() %></td>
	                    <td><%= programme.getUnite() %></td>
	                    <td><%= programme.getChambre() %></td>
	                    <td><%= programme.getNom() %></td>
	                    <td><%= programme.getVille() %></td>
	                    <td><img src="../images/promoteur/assets/<%= programme.getImage() %>" style="max-width:10rem; height:100px;"></td>
	                   	<td class="row-style"> 
	                    	<div class="row">
	                        	<div class="col-md-6">
	                             	<a href="modifier-programme.jsp?id=<%= programme.getId() %>" target="_blank"> 
	                             	<input type="hidden" value="<%= programme.getId() %>">
	                                 	<i class="fas fa-edit text-success awesome-size"></i>
	                               	</a>
	                           	</div>
	                            <div class="col-md-6">
	                            	<form action="<%= request.getContextPath() %>/SupprimerProgramme" method="POST">
	                                	<input type="hidden" name="id" value="<%= programme.getId() %>">
	                                    <button type="submit" class="btn-style" name="submit" onclick='return confirm("Voulez-vous supprimer ce programme")'>
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