<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="mobilierDao.AchatDao"%>
<%@page import="Database.ConnectionDB"%>
<%@page import="mobilierModel.Achat"%>
<%
	int id =Integer.parseInt(request.getParameter("id"));
	AchatDao db = new AchatDao(ConnectionDB.getConnection());
	Achat achat = db.selectAchat(id);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Modifier <%= achat.getBienNom() %></title>
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
                            <h3><i class="fas fa-edit"></i> Editer Achat du bien</h3>
                        </div>
                        <div class="card-body py-5">
                        	<form action="<%= request.getContextPath() %>/ModifierAchatBien" method="post">
                        		<div class="row">
                        			<div class="col-lg-6">
                                        <div class="row mb-3">
                                            <label for="nom_bien" class="col-md-12 col-form-label text-md-end">Nom du bien</label>
                                            <div class="col-md-12">
                                                <div class="d-flex">
                                                    <i class="fas fa-user position-awesome"></i>
                                                    <input id="nom_bien" type="text" class="form-control pl-5" name="nom_bien" value="<%=achat.getBienNom() %>" required>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="row mb-3">
                                            <label for="client_bien" class="col-md-12 col-form-label text-md-end">Nom du client</label>
                                            <div class="col-md-12">
                                                <div class="d-flex">
                                                    <i class="fas fa-user position-awesome"></i>
                                                    <input id="client_bien" type="text" class="form-control pl-5" name="client_bien" value="<%=achat.getClientPrenom() %> <%=achat.getClientNom() %>" required>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="row mb-3">
                                            <label for="confirmation_bien" class="col-md-12 col-form-label text-md-end">Confirmation d'achat</label>
                                            <div class="col-md-12">
                                                <div class="d-flex">
                                                    <i class="fas fa-phone position-awesome"></i>
                                                    <%
                                                    	if(achat.getConfirmation() == null){
                                                    %>
                                                    <input id="confirmation_bien" type="text" class="form-control pl-5" name="confirmation_bien" value="Veuillez confirmer" required>
                                                    <%
                                                    	}else{
                                                    %>
                                                    <input id="confirmation_bien" type="text" class="form-control pl-5" name="confirmation_bien" value="<%=achat.getConfirmation() %>" required>
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
                                    	<input type="hidden" value="<%= achat.getId() %>" name="id">
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