<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="mobilierDao.AchatDao"%>
<%@page import="Database.ConnectionDB"%>
<%@page import="mobilierModel.AchatProgramme"%>
<%
	int id =Integer.parseInt(request.getParameter("id"));
	AchatDao db = new AchatDao(ConnectionDB.getConnection());
	AchatProgramme programme = db.selectAchatProgramme(id);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Modifier <%= programme.getProgrammeNom() %></title>
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
                            <h3><i class="fas fa-edit"></i> Modifier Achat du bien pour le programme <%= programme.getProgrammeNom() %></h3>
                        </div>
                        <div class="card-body py-5">
                        	<form action="<%= request.getContextPath() %>/ModifierAchatProgramme" method="post">
                        		<div class="row">
                        			<div class="col-lg-6">
                                        <div class="row mb-3">
                                            <label for="nom_programme" class="col-md-12 col-form-label text-md-end">Nom du programme</label>
                                            <div class="col-md-12">
                                                <div class="d-flex">
                                                    <i class="fas fa-user position-awesome"></i>
                                                    <input id="nom_programme" type="text" class="form-control pl-5" name="nom_programme" value="<%= programme.getProgrammeNom() %>" required>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="row mb-3">
                                            <label for="residence_programme" class="col-md-12 col-form-label text-md-end">Nom du résidence</label>
                                            <div class="col-md-12">
                                                <div class="d-flex">
                                                    <i class="fas fa-user position-awesome"></i>
                                                    <input id="residence_programme" type="text" class="form-control pl-5" name="residence_programme" value="<%=programme.getBienNom() %>" required>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="row mb-3">
                                            <label for="client_programme" class="col-md-12 col-form-label text-md-end">Nom du client</label>
                                            <div class="col-md-12">
                                                <div class="d-flex">
                                                    <i class="fas fa-user position-awesome"></i>
                                                    <input id="client_programme" type="text" class="form-control pl-5" name="client_programme" value="<%=programme.getClientPrenom() %> <%=programme.getClientNom() %>" required>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="row mb-3">
                                            <label for="confirmation_programme" class="col-md-12 col-form-label text-md-end">Confirmation d'achat</label>
                                            <div class="col-md-12">
                                                <div class="d-flex">
                                                    <i class="fas fa-phone position-awesome"></i>
                                                    <%
                                                    	if(programme.getConfirmation() == null){
                                                    %>
                                                    <input id="confirmation_bien" type="text" class="form-control pl-5" name="confirmation_programme" value="Veuillez confirmer" required>
                                                    <%
                                                    	}else{
                                                    %>
                                                    <input id="confirmation_bien" type="text" class="form-control pl-5" name="confirmation_programme" value="<%=programme.getConfirmation() %>" required>
                                                	<%
                                                    	}
                                                    %>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-0 text-center">
                                    <div class="col-md-12">
                                    	<input type="hidden" value="<%= programme.getId() %>" name="id">
                                        <button type="submit" class="btn btn-primary">Modifier</button>
                                    </div>
                                </div>
                        	</form>
                        </div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>