<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="mobilierModel.Notaire"%>
<%@page import="mobilierDao.NotaireDao"%>
<%@page import="Database.ConnectionDB"%>
<%@page import="java.util.List"%>
<%
	NotaireDao db = new NotaireDao(ConnectionDB.getConnection());
	List <Notaire> notaires = db.selectAll();
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
			<%
        		if(session.getAttribute("success_not") != null){
       		%>
       		<div class='container alert alert-success text-center w-50' role='alert'>
				<%= session.getAttribute("success_not")%>
			</div>
			<%
        		}
			%>
			<%
        		if(session.getAttribute("success_not_mod") != null){
       		%>
       		<div class='container alert alert-success text-center w-50' role='alert'>
				<%= session.getAttribute("success_not_mod")%>
			</div>
			<%
        		}
			%>
			<div class="mt-4 align-items-center text-center">
                <a href="ajouter-notaire.jsp" target="_blank" class="btn btn-primary">
                    <i class="fas fa-plus-square"></i> Ajouter un notaire
                </a>
            </div>
			<table class="table table-bordered mt-5 bg-white">
        	<thead class="text-center">
                <tr>
                	<th scope="col">#</th>
                    <th scope="col">Prénom</th>
                    <th scope="col">Nom</th>
                    <th scope="col">Email</th>
                    <th scope="col">Téléphone</th>
					<th scope="col">CIN</th>
					<th scope="col">Image</th>
					<th scope="col">Actions</th>
               	</tr>
          	</thead>
           	<tbody class="text-center">
          		<%
          			int i =1;
					for(Notaire item : notaires){
				%>
             	<tr>
                	<td><%= i++ %></td>    
                	<td><%= item.getPrenom() %></td>      
                    <td><%= item.getNom() %></td>
                    <td><%= item.getEmail() %></td>
                    <td><%= item.getTelephone() %></td>
                    <td><%= item.getCin() %></td>
                    <td>
                   		<%
							if(item.getImage() == null){
						%>
						<img src="../images/unknown_person.jpg" style='max-width: 5rem'>
						<%
							}else{
						%>
                    	<img src="../images/agent/<%=item.getImage()%>" style='max-width: 5rem'>
                    	<%	
							}
						%>
                    </td>
                    <td class="row-style"> 
                   		<%
							if(admin.getRoleId().equals("Superviseur")){
						%>
                    	<div class="row justify-content-center">
                    		<div class="col-md-4">
                        		<a href="modifier-notaire.jsp?id=<%=item.getId() %>" target="_blank"> 
                            		<i class="fas fa-edit text-success awesome-size"></i>
                           		</a>
                        	</div>
                        	<div class="col-md-4">
                    			<form action="<%= request.getContextPath() %>/SupprimerNotaire" method="POST">
                       				<input type="hidden" name="id" value="<%=item.getId() %>">
                            		<button type="submit" class="btn-style" name="submit" onclick='return confirm("Voulez-vous supprimer ce notaire")'>
                         				<i class="fas fa-trash-alt text-danger awesome-size"></i>
                           			</button>
                     			</form>
                     		</div>
                   		</div>
                     	<%	
							}else{
						%>
						<h5>Pas d'action pour cet admin</h5>
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