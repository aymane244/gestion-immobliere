<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="mobilierModel.Agent"%>
<%@page import="mobilierDao.AgentDao"%>
<%@page import="Database.ConnectionDB"%>
<%
	int id =Integer.parseInt(request.getParameter("id"));
	AgentDao db = new AgentDao(ConnectionDB.getConnection());
	Agent agents = db.selectAgent(id);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Modifier profile</title>
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
				 	<%
        				if(session.getAttribute("fail_agt_mod") != null){
       				%>
       				<div class='container alert alert-danger text-center w-50' role='alert'>
						<%= session.getAttribute("fail_agt_mod")%>
					</div>
					<%
        				}
					%>
					<div class="card">
						<div class="card-header text-center link-font">
                            <h3><i class="fas fa-edit"></i> Modifier profile</h3>
                        </div>

                        <div class="card-body py-5">
                        	<div class="text-center mb-3">
                                <div id="display_image" class="display_image_profile" style="display:none;background-size:100% 100%; background-repeat:no-repeat"></div>
                                <%
                                    if(agents.getImage() == null){
                                %>
                                <img src="../images/unknown_person.jpg"  class='rounded-circle img-fluid' style='max-width: 5rem' id='image_display'>
                                <%
									}else{
								%>
								<img src="../images/agent/<%=agents.getImage()%>" class='rounded-circle img-fluid' style='max-width: 5rem' id='image_display'>
								<%	
									}
								%>
                            </div>
                        	<form action="<%= request.getContextPath() %>/ModifierAgent" method="post" enctype="multipart/form-data">
                        		<div class="row">
                        			<div class="col-lg-6">
                                        <div class="row mb-3">
                                            <label for="nom" class="col-md-12 col-form-label text-md-end">Nom</label>
                                            <div class="col-md-12">
                                                <div class="d-flex">
                                                    <i class="fas fa-user position-awesome"></i>
                                                    <input id="nom" type="text" class="form-control pl-5" name="nom" value="<%= agents.getNom() %>" required>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="row mb-3">
                                            <label for="prenom" class="col-md-12 col-form-label text-md-end">Prénom</label>
                                            <div class="col-md-12">
                                                <div class="d-flex">
                                                    <i class="fas fa-user position-awesome"></i>
                                                    <input id="prenom" type="text" class="form-control pl-5" name="prenom" value="<%= agents.getPrenom() %>" required>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="row mb-3">
                                            <label for="cin" class="col-md-12 col-form-label text-md-end">CIN</label>
                                            <div class="col-md-12">
                                                <div class="d-flex">
                                                    <i class="fas fa-file-alt position-awesome"></i>
                                                    <input id="cin" type="text" class="form-control pl-5" name="cin" value="<%= agents.getCin() %>" required>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="row mb-3">
                                            <label for="email" class="col-md-12 col-form-label text-md-end">Email</label>
                                            <div class="col-md-12">
                                                <div class="d-flex">
                                                    <i class="fas fa-envelope position-awesome"></i>
                                                    <input id="email" type="email" class="form-control pl-5" name="email" value="<%= agents.getEmail() %>" required>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-3 align-items-center">
                                    <label for="image" class="col-md-12 col-form-label">Image</label>
                                    <div class="col-md-6">
                                        <div class="d-flex">
                                            <i class="fas fa-camera position-awesome-image"></i>
                                            <input id="image" type="file" class="form-control-file pl-5" name="image" onchange="affichage()">
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-0 text-center">
                                    <div class="col-md-12">
                                    	<input type="hidden" name="id" value="<%= agents.getId() %>">
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