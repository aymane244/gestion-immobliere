<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="mobilierModel.Conseil"%>
<%@page import="mobilierDao.ConseilDao"%>
<%@page import="Database.ConnectionDB"%>
<%
	int id =Integer.parseInt(request.getParameter("id"));
	ConseilDao db = new ConseilDao(ConnectionDB.getConnection());
	Conseil conseil = db.selectConseil(id);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Ecrire conseil sur le bien <%= conseil.getBienNom() %></title>
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
                            <h3><i class="fas fa-edit"></i> Ecrire conseil sur le bien <%= conseil.getBienNom() %></h3>
                        </div>
                        <div class="card-body py-5">
                        	<form action="<%= request.getContextPath() %>/ConseilBien" method="post">
                        		<div class="row">
                        		 	<div class="col-lg-12">
                                        <div class="row mb-3">
                                            <label for="conseil" class="col-md-12 col-form-label text-md-end">Conseil</label>
                                            <div class="col-md-12">
                                            	<textarea id="nom" rows=10 cols=10 class="form-control pl-5" name="conseil" required></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-0 text-center">
                                    <div class="col-md-12">
                                    	<input type="hidden" name="id" value="<%= conseil.getId() %>">
                                        <button type="submit" class="btn btn-primary">Envoyer votre conseil</button>
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