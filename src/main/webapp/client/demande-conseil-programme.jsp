<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="mobilierModel.Notaire"%>
<%@page import="mobilierModel.Bien"%>
<%@page import="mobilierModel.AchatProgramme"%>
<%@page import="mobilierDao.AchatDao"%>
<%@page import="mobilierDao.NotaireDao"%>
<%@page import="mobilierDao.BiensDao"%>
<%@page import="Database.ConnectionDB"%>
<%@page import="java.util.List"%>
<%
	int id =Integer.parseInt(request.getParameter("id"));
	AchatDao dbBien = new AchatDao(ConnectionDB.getConnection());
	NotaireDao db = new NotaireDao(ConnectionDB.getConnection());
	List <Notaire> notaires = db.selectAll();
	AchatProgramme achat = dbBien.selectAchatProgramme(id);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Conseil <%= achat.getProgrammeNom() %></title>
		<%@include file="../includes/css/header.html"%>
		<style>
		<%@include file="../includes/css/styles.css"%>
		</style>
	</head>
	<body>
		<%@include file="../includes/navbar-admins.jsp"%>
		<div class="container my-5 pt-5 pb-5">
			<div class="row">
				<div class="col-lg-12 col-md-12">
					<div class="card">
						<div class="card-header text-center link-font">
                            <h3><i class="fas fa-edit"></i> Demande de conseil sur le programme <%= achat.getProgrammeNom() %></h3>
                        </div>
                        <div class="card-body py-5">
                        	<form action="<%= request.getContextPath() %>/DemandeConseilProgramme" method="post">
                        		<div class="row">
                                    <div class="col-lg-12">
                                        <div class="row mb-3">
     	                             		<label for="notaire" class="col-md-12 col-form-label text-md-end">Nom du notaire</label>
         	                         		<div class="col-md-12">
            	                  	    		<div class="d-flex">
                	           	            		<i class="fas fa-tag position-awesome"></i>
													<select class="custom-select px-5" name="notaire">
														<option value="">--Choisir le nom du notaire--</option>
															<%
          														for(Notaire item: notaires){
															%>
															<option value="<%= item.getId() %>"><%= item.getPrenom() %> <%= item.getNom() %></option>
															<%
          														}
															%>
													</select>
          	            	               		</div>
           	                	     		</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-0 text-center mt-3">
                                    <div class="col-md-12">
                                    	<input type="hidden" value="<%= clients.getId() %>" id="conseil_client" name="client">
                                    	<input type="hidden" value="<%= achat.getProgramme() %>" id="programme" name="programme">
                                        <button type="submit" class="btn btn-primary">Demande de conseil</button>
                                    </div>
                                </div>
                        	</form>
                        </div>
					</div>
				</div>
			</div>
		</div>
		<%@include file="../includes/footer.jsp"%>
	</body>
</html>