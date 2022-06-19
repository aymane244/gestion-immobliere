<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Ajouter un rôle</title>
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
                            <h3><i class="fas fa-edit"></i> Ajouter Rôle</h3>
                        </div>
                        <div class="card-body py-5">
                        	<form action="<%= request.getContextPath() %>/AjouterRole" method="post">
                        		<div class="row">
                        			<div class="col-lg-12">
                                        <div class="row mb-3">
                                            <label for="nom" class="col-md-12 col-form-label text-md-end">Nom du rôle</label>
                                            <div class="col-md-12">
                                                <div class="d-flex">
                                                    <i class="fas fa-user position-awesome"></i>
                                                    <input id="nom" type="text" class="form-control pl-5" name="nom" autocomplete="nom" placeholder="nom du role" required>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-0 text-center">
                                    <div class="col-md-12">
                                        <button type="submit" class="btn btn-primary">Ajouter Rôle</button>
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