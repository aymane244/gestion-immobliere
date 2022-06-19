<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="mobilierModel.Reservation"%>
<%@page import="mobilierModel.ReservationProgramme"%>
<%@page import="mobilierModel.ReservationProjet"%>
<%@page import="Database.ConnectionDB"%>
<%@page import="java.util.List"%>
<%@page import="mobilierDao.ReservationDao"%>
<%
	ReservationDao db = new ReservationDao(ConnectionDB.getConnection());
	List <Reservation> reservations = db.selectAll();
	List <Reservation> countRes = db.countreservation();
	List <ReservationProgramme> resProgarmme = db.selectAllProgramme();
	List <ReservationProgramme> countProgramme = db.countResProgramme();
	List <ReservationProjet> resProjet = db.selectAllProjet();
	List <ReservationProjet> countProjet = db.countResProjet();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Réservations</title>
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
			<h2 class="text-center">Page Réservations</h2>
			<div class="text-center my-3">
				<button class="btn btn-primary" onclick="biensRes()">Biens</button>
				<button class="btn btn-primary" onclick="pogrammesRes()">Programmes</button>
				<button class="btn btn-primary" onclick="projetsRes()">Projets</button>
			</div>
			<div id="biens">
				<%
					for(Reservation count : countRes){
				%>
        		<h5><%= count.getCount() %> réservations de biens trouvés</h5>
        		<%
					}
				%>
				<table class="table table-bordered mt-5 bg-white">
        			<thead class="text-center">
                		<tr>
                			<th scope="col">#</th>
                			<th scope="col">Nom du bien</th>
                    		<th scope="col">Nom</th>
                    		<th scope="col">Email</th>
                    		<th scope="col">Téléphone</th>
                    		<th scope="col">Date</th>
                    		<th scope="col">Heure</th>
                    		<th scope="col">Actions</th>
               			</tr>
          			</thead>
           			<tbody class="text-center">
          				<%
          					int j =1;
							for(Reservation item : reservations){
						%>
             			<tr>
                			<td><%= j++ %></td>    
                			<td><%= item.getBienNom() %></td>      
                    		<td><%= item.getNom() %></td>
                    		<td><%= item.getEmail() %></td>
                    		<td><%= item.getPhone() %></td>
                    		<td><%= item.getDate() %></td>
                    		<td><%= item.getHeure() %></td>
                    		<td class="row-style"> 
                    			<form action="<%= request.getContextPath() %>/SupprimerReservation" method="POST">
                        			<input type="hidden" name="id" value="<%=item.getId() %>">
                          			<button type="submit" class="btn-style" name="submit" onclick='return confirm("Voulez-vous supprimer cette réservation")'>
                            			<i class="fas fa-trash-alt text-danger awesome-size"></i>
                            		</button>
                      			</form>
                 			</td>
              			</tr>
              			<% 
	            			}
	            		%>
           			</tbody>    
     			</table>
			</div>
			<div id="programmes" style="display:none;">
				<%
					for(ReservationProgramme count : countProgramme){
				%>
        		<h5><%= count.getCount() %> réservations de programmes trouvés</h5>
        		<%
					}
				%>
				<table class="table table-bordered mt-5 bg-white">
        			<thead class="text-center">
                		<tr>
                			<th scope="col">#</th>
                			<th scope="col">Nom du programme</th>
                    		<th scope="col">Nom</th>
                    		<th scope="col">Email</th>
                    		<th scope="col">Téléphone</th>
                    		<th scope="col">Date</th>
                    		<th scope="col">Heure</th>
                    		<th scope="col">Actions</th>
               			</tr>
          			</thead>
           			<tbody class="text-center">
          				<%
          					int i =1;
							for(ReservationProgramme item : resProgarmme){
						%>
             			<tr>
                			<td><%= i++ %></td> 
                			<td><%= item.getProgrammeNom() %></td>         
                    		<td><%= item.getNom() %></td>
                    		<td><%= item.getEmail() %></td>
                    		<td><%= item.getPhone() %></td>
                    		<td><%= item.getDate() %></td>
                    		<td><%= item.getHeure() %></td>
                    		<td class="row-style"> 
                    			<form action="<%= request.getContextPath() %>/SupprimerReservationprogramme" method="POST">
                        			<input type="hidden" name="id" value="<%=item.getId() %>">
                          			<button type="submit" class="btn-style" name="submit" onclick='return confirm("Voulez-vous supprimer cette réservation")'>
                            			<i class="fas fa-trash-alt text-danger awesome-size"></i>
                            		</button>
                      			</form>
                 			</td>
              			</tr>
              			<% 
	            			}
	            		%>
           			</tbody>    
     			</table>
			</div>
			<div id="projets" style="display:none;">
				<%
					for(ReservationProjet count : countProjet){
				%>
        		<h5><%= count.getCount() %> réservations de projets trouvés</h5>
        		<%
					}
				%>
				<table class="table table-bordered mt-5 bg-white">
        			<thead class="text-center">
                		<tr>
                			<th scope="col">#</th>
                			<th scope="col">Nom du projet</th>
                    		<th scope="col">Nom</th>
                    		<th scope="col">Email</th>
                    		<th scope="col">Téléphone</th>
                    		<th scope="col">Date</th>
                    		<th scope="col">Heure</th>
                    		<th scope="col">Actions</th>
               			</tr>
          			</thead>
           			<tbody class="text-center">
          				<%
          					int k =1;
							for(ReservationProjet item : resProjet){
						%>
             			<tr>
                			<td><%= k++ %></td>  
                			<td><%= item.getProjetNom() %></td>        
                    		<td><%= item.getNom() %></td>
                    		<td><%= item.getEmail() %></td>
                    		<td><%= item.getPhone() %></td>
                    		<td><%= item.getDate() %></td>
                    		<td><%= item.getHeure() %></td>
                    		<td class="row-style"> 
                    			<form action="<%= request.getContextPath() %>/SupprimerReservationProjet" method="POST">
                        			<input type="hidden" name="id" value="<%=item.getId() %>">
                          			<button type="submit" class="btn-style" name="submit" onclick='return confirm("Voulez-vous supprimer cette réservation")'>
                            			<i class="fas fa-trash-alt text-danger awesome-size"></i>
                            		</button>
                      			</form>
                 			</td>
              			</tr>
              			<% 
	            			}
	            		%>
           			</tbody>    
     			</table>
			</div>
		</div>
	</body>
</html>