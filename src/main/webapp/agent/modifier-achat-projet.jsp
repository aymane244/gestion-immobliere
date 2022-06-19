<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="mobilierDao.AchatDao"%>
<%@page import="Database.ConnectionDB"%>
<%@page import="mobilierModel.AchatProjet"%>
<%
	int id =Integer.parseInt(request.getParameter("id"));
	AchatDao db = new AchatDao(ConnectionDB.getConnection());
	AchatProjet projet = db.selectAchatProjet(id);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Modifier <%= projet.getProjetNom() %></title>
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
                            <h3><i class="fas fa-edit"></i> Editer Achat du bien pour un projet</h3>
                        </div>
                        <div class="card-body py-5">
                        	<form action="<%= request.getContextPath() %>/ModifierAchatProjet" method="post">
                        		<div class="row">
                        			<div class="col-lg-6">
                                        <div class="row mb-3">
                                            <label for="nom_projet" class="col-md-12 col-form-label text-md-end">Nom du projet</label>
                                            <div class="col-md-12">
                                                <div class="d-flex">
                                                    <i class="fas fa-user position-awesome"></i>
                                                    <input id="nom_projet" type="text" class="form-control pl-5" name="nom_projet" value="<%=projet.getProjetNom() %>" required>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="row mb-3">
                                            <label for="residence_projet" class="col-md-12 col-form-label text-md-end">Nom du résidence</label>
                                            <div class="col-md-12">
                                                <div class="d-flex">
                                                    <i class="fas fa-user position-awesome"></i>
                                                    <input id="residence_projet" type="text" class="form-control pl-5" name="residence_projet" value="<%=projet.getBienNom() %>" required>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="row mb-3">
                                            <label for="client_projet" class="col-md-12 col-form-label text-md-end">Nom du client</label>
                                            <div class="col-md-12">
                                                <div class="d-flex">
                                                    <i class="fas fa-user position-awesome"></i>
                                                    <input id="client_projet" type="text" class="form-control pl-5" name="client_projet" value="<%=projet.getClientNom() %>" required>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="row mb-3">
                                            <label for="confirmation_projet" class="col-md-12 col-form-label text-md-end">Confirmation d'achat</label>
                                            <div class="col-md-12">
                                                <div class="d-flex">
                                                	<i class="fas fa-phone position-awesome"></i>
                                                    <%
                                                    	if(projet.getConfirmation() == null){
                                                    %>
                                                    <input id="confirmation_bien" type="text" class="form-control pl-5" name="confirmation_projet" value="Veuillez confirmer" required>
                                                    <%
                                                    	}else{
                                                    %>
                                                    <input id="confirmation_bien" type="text" class="form-control pl-5" name="confirmation_projet" value="<%=projet.getConfirmation() %>" required>
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
                                    	<input type="hidden" value="<%= projet.getId() %>" name="id">
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