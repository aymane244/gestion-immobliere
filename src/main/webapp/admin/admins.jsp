<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="mobilierModel.Admin"%>
<%@page import="mobilierDao.AdminDao"%>
<%@page import="Database.ConnectionDB"%>
<%@page import="java.util.List"%>
<%
	AdminDao db = new AdminDao(ConnectionDB.getConnection());
	List <Admin> admins = db.selectAll();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Administrateurs</title>
		<%@include file="../includes/css/header.html"%>
		<style>
			<%@include file="../includes/css/styles.css"%>
		</style>
	</head>
	<body>
		<%@include file="../includes/navbar-admins.jsp"%>
		<div class="container-fluid mt-5 pt-5">
			<h2 class="text-center">Page Administrateus</h2>
			<%
        		if(session.getAttribute("success_adm") != null){
        	%>
        	<div class='container alert alert-success text-center w-50' role='alert'>
				<%= session.getAttribute("success_adm")%>
			</div>
			<%
        		}
			%>
			<div class="mt-4 align-items-center text-center">
                <a href="ajouter-admin.jsp" target="_blank" class="btn btn-primary">
                    <i class="fas fa-plus-square"></i> Ajouter un administrateur
                </a>
            </div>
			<table class="table table-bordered mt-5 bg-white">
        	<thead class="text-center">
                <tr>
                	<th scope="col">#</th>
                    <th scope="col">Prénom</th>
                    <th scope="col">Nom</th>
                    <th scope="col">Email</th>
                    <th scope="col">Image</th>
                    <th scope="col">Role</th>
                    <th scope="col">Actions</th>
               	</tr>
          	</thead>
           	<tbody class="text-center">
          		<%
          			int i =1;
					for(Admin item : admins){
						if(item.getId() != admin.getId()){
				%>
             	<tr>
                	<td><%= i++ %></td>    
                	<td><%= item.getNom() %></td>      
                    <td><%= item.getPrenom() %></td>
                    <td><%= item.getEmail() %></td>
                    <td>
                   		<%
							if(item.getImage() == null){
						%>
						<img src="../images/unknown_person.jpg" style='max-width: 5rem'>
						<%
							}else{
						%>
                    	<img src="../images/admin/<%=item.getImage()%>" style='max-width: 5rem'>
                    	<%	
							}
						%>
                    </td>
                    <td><%= item.getRoleNom() %></td>
                    <td class="row-style"> 
                   		<%
							if(admin.getRoleId().equals("Superviseur")){
						%>
                    	<div class="row justify-content-center">
                    		<div class="col-md-4">
                        		<a href="modifier-admin.jsp?id=<%=item.getId() %>" target="_blank"> 
                            		<i class="fas fa-edit text-success awesome-size"></i>
                           		</a>
                        	</div>
                        	<div class="col-md-4">
                    			<form action="<%= request.getContextPath() %>/SupprimerAdmin" method="POST">
                       				<input type="hidden" name="id" value="<%=item.getId() %>">
                            		<button type="submit" class="btn-style" name="submit" onclick='return confirm("Voulez-vous supprimer cet admin")'>
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
	            	}
	            %>
           	</tbody>    
     	</table>
		</div>
	</body>
</html>