<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="mobilierModel.Client"%>
<%@page import="Database.ConnectionDB"%>
<%@page import="java.util.List"%>
<%@page import="mobilierDao.ClientDao"%>
<%
	ClientDao db = new ClientDao(ConnectionDB.getConnection());
	List <Client> client = db.selectAll();
	List <Client> counts = db.countClient();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Clients</title>
		<%@include file="../includes/css/header.html"%>
		<style>
			<%@include file="../includes/css/styles.css"%>
		</style>
	</head>
	<body>
		<%@include file="../includes/navbar-admins.jsp"%>
		<div class="container-fluid mt-5 pt-5">
			<h2 class="text-center">Page Clients</h2>
			<%
        		if(session.getAttribute("success_clt") != null){
       		%>
   			<div class='container alert alert-success text-center w-50' role='alert'>
				<%= session.getAttribute("success_clt")%>
			</div>
			<%
       			}
			%>
			<%
        		if(session.getAttribute("success_clt_mod") != null){
       		%>
   			<div class='container alert alert-success text-center w-50' role='alert'>
				<%= session.getAttribute("success_clt_mod")%>
			</div>
			<%
       			}
			%>
			<div class="mt-4 align-items-center text-center">
                <a href="ajouter-client.jsp" target="_blank" class="btn btn-primary">
                    <i class="fas fa-plus-square"></i> Ajouter un client
                </a>
                <a href="achats.jsp" target="_blank" class="btn btn-primary">
                    <i class="fas fa-shopping-cart"></i> Les achats
                </a>
            </div>
            <%
				for(Client count : counts){
			%>
        	<h5><%= count.getCount() %> clients trouvés</h5>
        	<%
				}
			%>
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
					for(Client item : client){
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
                    <td class="row-style"> 
                    	<div class="row">
                        	<div class="col-md-6">
                            	<a href="modifier-profile-client.jsp?id=<%=item.getId() %>" target="_blank"> 
                                	<i class="fas fa-edit text-success awesome-size"></i>
                                </a>
                           	</div>
                            <div class="col-md-6">
                            	<form action="<%= request.getContextPath() %>/SupprimerClient" method="POST">
                                	<input type="hidden" name="id" value="<%=item.getId() %>">
                                    	<button type="submit" class="btn-style" name="submit" onclick='return confirm("Voulez-vous supprimer ce client")'>
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