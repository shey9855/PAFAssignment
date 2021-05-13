<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/main.js"></script>

</head>
<body>

<div class="container">
 	<div class="row">
 		<div class="col-8">
 			<h1 class="m-3">Project Details</h1>
 			<form id="formStudent">
 			
 			<div class="input-group input-group-sm mb-3">
				<div class="input-group-prepend">
 					<span class="input-group-text" id="lblName">Project Code: </span>
				</div>
					<input type="text" id="txtName" name="txtName">
			</div>
			<div class="input-group input-group-sm mb-3">
				<div class="input-group-prepend">
 					<span class="input-group-text" id="lblName">Project Name: </span>
				</div>
					<input type="text" id="txtName" name="txtName">
			</div>
			<div class="input-group input-group-sm mb-3">
				<div class="input-group-prepend">
 					<span class="input-group-text" id="lblName">Description: </span>
				</div>
					<input type="text" id="txtName" name="txtName">
			</div>
			<div class="input-group input-group-sm mb-3">
				<div class="input-group-prepend">
 					<span class="input-group-text" id="lblName">Budget: </span>
				</div>
					<input type="text" id="txtName" name="txtName">
			</div>
			<div class="input-group input-group-sm mb-3">
				<div class="input-group-prepend">
 					<span class="input-group-text" id="lblName">Category: </span>
				</div>
					<input type="text" id="txtName" name="txtName">
			</div>
					
					<br>
 			
 				<div id="alertSuccess" class="alert alert-success"></div>
 				<div id="alertError" class="alert alert-danger"></div>
 				
			<input type="button" id="btnSave" value="Save" class="btn btn-primary">
 			</form>
 		</div>
 	</div>

 <br>
 	<div class="row">
 		<div class="col-12" id="colStudents">

 		</div>
 	</div>
</div>

</body>
</html>