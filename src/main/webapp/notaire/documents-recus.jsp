<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="mobilierModel.Achat"%>
<%@page import="mobilierModel.AchatProgramme"%>
<%@page import="mobilierModel.AchatProjet"%>
<%@page import="Database.ConnectionDB"%>
<%@page import="java.util.List"%>
<%@page import="mobilierDao.AchatDao"%>
<%
	AchatDao db = new AchatDao(ConnectionDB.getConnection());
	List <Achat> achats = db.selectAll();
	List <AchatProgramme> programmes = db.selectProgrammes();
	List <AchatProjet> projets = db.selectProjet();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Documents reçus</title>
		<%@include file="../includes/css/header.html"%>
		<style>
			<%@include file="../includes/css/styles.css"%>
		</style>
		<script>
    		<%@include file="../includes/scripts/main.js"%>
    	</script>
	</head>
	<body>
		<%@include file="../includes/navbar-admins.jsp"%>
		<div class="container-fluid mt-5 pt-5">
			<h2 class="text-center">Page Document</h2>
			<div class="text-center my-3">
				<button class="btn btn-primary" onclick="biens()">Biens</button>
				<button class="btn btn-primary" onclick="pogramme()">Programmes</button>
				<button class="btn btn-primary" onclick="projet()">Projets</button>
			</div>
			<div id="biens">
				<h1 class="text-center">Biens</h1>
				<table class="table table-bordered mt-5 bg-white">
        			<thead class="text-center">
                		<tr>
                			<th scope="col">#</th>
                    		<th scope="col">Nom du client</th>
                    		<th scope="col">Nom du bien</th>
                    		<th scope="col">Type du bien</th>
                    		<th scope="col">Document</th>
                    		<th scope="col">Date</th>
                    		<th scope="col">Actions</th>
               			</tr>
          			</thead>
           			<tbody class="text-center">
          				<%
          					int j =1;
							for(Achat item : achats){
								if(item.getDocument() != null){
						%>
             			<tr>
                			<td><%= j++ %></td>          
                    		<td><%= item.getClientPrenom() %> <%= item.getClientNom() %></td>
                    		<td><%= item.getBienNom() %></td>
                    		<td><%= item.getBienType() %></td>
                    		<td><a href="../client/documents/<%= item.getDocument() %>" download> <%= item.getDocument() %></a></td>
                    		<td><%= item.getDate() %></td>
              			</tr>
              			<% 
								}
	            			}
	            		%>
           			</tbody>    
     			</table>
			</div>
			<div id="projet" style="display:none;">
				<h1 class="text-center">Achats des projets</h1>
				<table class="table table-bordered mt-5 bg-white">
        			<thead class="text-center">
                		<tr>
                			<th scope="col">#</th>
                    		<th scope="col">Nom du client</th>
                    		<th scope="col">Nom du projet</th>
                    		<th scope="col">Nom du résidence</th>
                    		<th scope="col">Documents</th>
                    		<th scope="col">Date</th>
                    		<th scope="col">Actions</th>
               			</tr>
          			</thead>
           			<tbody class="text-center">
          				<%
          					int i =1;
							for(AchatProjet item : projets){
								if(item.getDocument() != null){
						%>
             			<tr>
                			<td><%= i++ %></td>          
                    		<td><%= item.getClientPrenom() %> <%= item.getClientPrenom() %></td>
                    		<td><%= item.getProjetNom() %></td>
                    		<td><%= item.getBienNom() %></td>
                    		<td><a href="../client/documents/<%= item.getDocument() %>" download><%= item.getDocument() %> </a></td>
                    		<td><%= item.getDate() %></td>
              			</tr>
              			<% 
								}
	            			}
	            		%>
           			</tbody>    
     			</table>
			</div>
			<div id="programme" style="display:none;">
				<h1 class="text-center">Achats des programmes</h1>
				<table class="table table-bordered mt-5 bg-white">
        			<thead class="text-center">
                		<tr>
                			<th scope="col">#</th>
                    		<th scope="col">Nom du client</th>
                    		<th scope="col">Nom du programme</th>
                    		<th scope="col">Nom du résidence</th>
                    		<th scope="col">Documents</th>
                    		<th scope="col">Date</th>
                    		<th scope="col">Actions</th>
               			</tr>
          			</thead>
           			<tbody class="text-center">
          				<%
          					int k =1;
							for(AchatProgramme item : programmes){
								if(item.getDocument() != null){
						%>
             			<tr>
                			<td><%= k++ %></td>          
                    		<td><%= item.getClientPrenom() %> <%= item.getClientNom() %></td>
                    		<td><%= item.getProgrammeNom() %></td>
                    		<td><%= item.getProgrammeId() %></td>
                    		<td><a href="../client/documents/<%= item.getDocument() %>" download><%= item.getDocument() %> </a></td>
                    		<td><%= item.getDate() %></td>
              			</tr>
              			<% 
								}
	            			}
	            		%>
           			</tbody>    
     			</table>
			</div>
		</div>
	</body>
</html>