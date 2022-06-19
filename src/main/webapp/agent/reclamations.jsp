<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="mobilierModel.Contact"%>
<%@page import="Database.ConnectionDB"%>
<%@page import="java.util.List"%>
<%@page import="mobilierDao.ContactDao"%>
<%
	ContactDao db = new ContactDao(ConnectionDB.getConnection());
	List <Contact> contacts = db.selectAll();
	List <Contact> countContacts = db.countContact();
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
			<h2 class="text-center">Page Réclamation</h2>
				<%
					for(Contact count : countContacts){
				%>
        		<h5><%= count.getCount() %> réclamations trouvés</h5>
        		<%
					}
				%>
				<table class="table table-bordered mt-5 bg-white">
        			<thead class="text-center">
                		<tr>
                			<th scope="col">#</th>
                    		<th scope="col">Nom</th>
                    		<th scope="col">Email</th>
                    		<th scope="col">Sujet</th>
                    		<th scope="col">Message</th>
                    		<th scope="col">Date</th>
                    		<th scope="col">Actions</th>
               			</tr>
          			</thead>
           			<tbody class="text-center">
          				<%
          					int j =1;
							for(Contact item : contacts){
						%>
             			<tr>
                			<td><%= j++ %></td>          
                    		<td><%= item.getNom() %></td>
                    		<td><%= item.getEmail() %></td>
                    		<td><%= item.getSujet() %></td>
                    		<td><%= item.getMessage() %></td>
                    		<td><%= item.getDate() %></td>
                    		<td class="row-style"> 
                    			<form action="<%= request.getContextPath() %>/SupprimerMessage" method="POST">
                        			<input type=hidden name="id" value="<%=item.getId() %>">
                          			<button type="submit" class="btn-style" name="submit" onclick='return confirm("Voulez-vous supprimer cette réclamation")'>
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
	</body>
</html>