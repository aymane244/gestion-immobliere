<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="mobilierModel.Role"%>
<%@page import="mobilierDao.RoleDao"%>
<%@page import="Database.ConnectionDB"%>
<%@page import="java.util.List"%>
<%
	RoleDao db = new RoleDao(ConnectionDB.getConnection());
	List <Role> roles = db.selectAll();
	List <Role> counts = db.countRole();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Roles</title>
		<%@include file="../includes/css/header.html"%>
		<style>
			<%@include file="../includes/css/styles.css"%>
		</style>
	</head>
	<body>
		<%@include file="../includes/navbar-admins.jsp"%>
		<div class="container-fluid mt-5 pt-5">
			<h2 class="text-center">Page Roles</h2>
			<div class="mt-4 align-items-center text-center">
                <a href="ajouter-role.jsp" target="_blank" class="btn btn-primary">
                    <i class="fas fa-plus-square"></i> Ajouter un rôle
                </a>
            </div>
            <%
				for(Role count : counts){
			%>
        	<h5><%= count.getId() %> roles trouvés</h5>
        	<%
				}
			%>
			<table class="table table-bordered mt-5 bg-white">
        	<thead class="text-center">
                <tr>
                	<th scope="col">#</th>
                    <th scope="col">Nom</th>
                    <th scope="col">Actions</th>
               	</tr>
          	</thead>
           	<tbody class="text-center">
          		<%
          			int i =1;
					for(Role item : roles){
				%>
             	<tr>
                	<td><%= i++ %></td>          
                    <td><%= item.getNom() %></td>
                    <td class="row-style">
                   		<%
							if(admin.getRoleId().equals("Superviseur")){
						%>
                    	<div class="row justify-content-center">
                    		<div class="col-md-4">
                        		<a href="modifier-role.jsp?id=<%=item.getId() %>" target="_blank"> 
                            		<i class="fas fa-edit text-success awesome-size"></i>
                           		</a>
                        	</div>
                        	<div class="col-md-4">
                    			<form action="<%= request.getContextPath() %>/SupprimerRole" method="POST">
                       				<input type="hidden" name="id" value="<%=item.getId() %>">
                            		<button type="submit" class="btn-style" name="submit" onclick='return confirm("Voulez-vous supprimer ce role")'>
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