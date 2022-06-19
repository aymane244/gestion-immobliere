<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="mobilierModel.Notaire"%>
<%@page import="mobilierModel.Bien"%>
<%@page import="Database.ConnectionDB"%>
<%@page import="java.util.List"%>
<%@page import="mobilierDao.NotaireDao"%>
<%@page import="mobilierDao.BiensDao"%>
<%
	NotaireDao db = new NotaireDao(ConnectionDB.getConnection());
	BiensDao dbBien = new BiensDao(ConnectionDB.getConnection());
	List <Notaire> notaires = db.selectAll();
	List<Bien> biens = dbBien.selectAll();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Notaires</title>
		<%@include file="../includes/css/header.html"%>
		<style>
			<%@include file="../includes/css/styles.css"%>
		</style>
	</head>
	<body>
		<%@include file="../includes/navbar-admins.jsp"%>
		<div class="container-fluid mt-5 pt-5">
			<h2 class="text-center">Page Notaires</h2>
			<table class="table table-bordered mt-5 bg-white">
        	<thead class="text-center">
                <tr>
                	<th scope="col">#</th>
                    <th scope="col">Nom</th>
                    <th scope="col">Prénom</th>
                    <th scope="col">Email</th>
                    <th scope="col">Téléphone</th>
                    <th scope="col">Image</th>
                    <th scope="col">Actions</th>
               	</tr>
          	</thead>
           	<tbody class="text-center">
          		<%
          			int j =1;
					for(Notaire item : notaires){
				%>
             	<tr>
                	<td><%= j++ %></td>          
                    <td><%= item.getNom() %></td>
                    <td><%= item.getPrenom() %></td>
                    <td><%= item.getEmail() %></td>
                    <td><%= item.getTelephone() %></td>
                    <td>
                   		<%
							if(item.getImage() == null){
						%>
						<img src="../images/unknown_person.jpg" style='max-width: 5rem'>
						<%
							}else{
						%>
                    	<img src="../images/client/<%=item.getImage()%>" style='max-width: 5rem'>
                    	<%	
							}
						%>
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