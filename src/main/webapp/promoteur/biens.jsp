<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="mobilierModel.Bien"%>
<%@page import="mobilierDao.BiensDao"%>
<%@page import="java.util.List"%>
<%@page import="Database.ConnectionDB"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Biens</title>
		<%@include file="../includes/css/header.html"%>
		<style>
			<%@include file="../includes/css/styles.css"%>
		</style>
	</head>
	<body>
		<%@include file="../includes/navbar-admins.jsp"%>
		<div class="container-fluid mt-5 pt-5">
			<%
        		if(session.getAttribute("success_pro_bien") != null){
       		%>
   			<div class='container alert alert-success text-center' role='alert'>
				<%= session.getAttribute("success_pro_bien")%>
			</div>
			<%
       			}
			%>
			<%
        		if(session.getAttribute("success_pro_bien_mod") != null){
       		%>
   			<div class='container alert alert-success text-center' role='alert'>
				<%= session.getAttribute("success_pro_bien_mod")%>
			</div>
			<%
       			}
			%>
			<div class="text-center py-3">
                <h2><i class="fas fa-school"></i> Page Biens</h2>
            </div>
            <div class="mt-4 align-items-center text-center">
                <a href="ajouter-bien.jsp" target="_blank" class="btn btn-primary">
                    <i class="fas fa-plus-square"></i> Ajouter un bien
                </a>
            </div>
            <table class="table table-bordered mt-5">
            	<thead class="text-center">
                    <tr>
                    	<th scope="col">#</th>
                        <th scope="col">Nom du bien</th>
                        <th scope="col">description du bien</th>
                        <th scope="col">Type</th>
                        <th scope="col">Adresse</th>
                        <th scope="col">Prix</th>
                        <th scope="col">Supérficie</th>
                        <th scope="col">Chambres</th>
                        <th scope="col">Syndic</th>
                        <th scope="col">Garage</th>
                        <th scope="col">Images</th>
                        <th scope="col">Actions</th>
                    </tr>
				</thead>
                <tbody class="text-center">
					<tr>
						<%
							BiensDao dbBien = new BiensDao(ConnectionDB.getConnection());
				  			List<Bien> biens = dbBien.selectAll();
							int i = 1;
          					for(Bien bien: biens){
						%>
	                   	<td><%= i++ %></td>  
	                   	<td><%= bien.getNom() %></td>          
	                    <td><%= bien.getDescription() %></td>
	                    <td><%= bien.getType() %></td>
	                    <td><%= bien.getAdresse() %></td>
	                    <td><%= bien.getPrix() %></td>
	                    <td><%= bien.getSuperficie() %></td>
	                    <td>
	                    	<% if(bien.getChambres().equals("")){%>
	                    		pas de chambres pour <%= bien.getType() %>
	                    	<%}else{%>
	                    	<%=bien.getChambres() %>
	                    	<%}%>
	                    </td>
	                    <td>
	                    	<% if(bien.getChambres().equals("")){%>
	                    		pas de syndic pour <%= bien.getType() %>
	                    	<%}else{%>
	                    	<%=bien.getSyndic() %>
	                    	<%}%>
						</td>
	                    <td><%= bien.getGarage() %></td>
	                    <td><img src="../images/promoteur/assets/<%= bien.getImage() %>" style="max-width:10rem; height:100px;"></td>
	                   	<td class="row-style"> 
	                    	<div class="row">
	                        	<div class="col-md-6">
	                             	<a href="modifier-bien.jsp?id=<%= bien.getId() %>" target="_blank"> 
	                             	<input type="hidden" value="<%= bien.getId() %>">
	                                 	<i class="fas fa-edit text-success awesome-size"></i>
	                               	</a>
	                           	</div>
	                            <div class="col-md-6">
	                            	<form action="<%= request.getContextPath() %>/SupprimerBien" method="POST">
	                                	<input type="hidden" name="id" value="<%= bien.getId() %>">
	                                    <button type="submit" class="btn-style" name="submit" onclick='return confirm("Voulez-vous supprimer ce bien ?")'>
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