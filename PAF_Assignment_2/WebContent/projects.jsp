<%@page import="com.Project"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/main.js"></script>
</head>
<body>

		<div class="container"><div class="row"><div class="col-6">
			<h1>Project Management </h1>
			
			<form id="formItem" name="formItem">
			
			
	 			Project code:
	 			<input id="ProjectCode" name="ProjectCode" type="text"
	 			class="form-control form-control-sm">
 <br> 
				Project name:
				<input id="ProjectName" name="ProjectName" type="text"
				class="form-control form-control-sm">
	 <br> 
	 			Description:
	 			<input id="Description" name="Description" type="text"
	 			class="form-control form-control-sm">
	 <br> 
	 			Budget:
	 			<input id="Budget" name="Budget" type="text"
				 class="form-control form-control-sm">
	 <br>
	 			Category:
	 			<input id="Category" name="Category" type="text"
				 class="form-control form-control-sm">
				 
				<br>
				 
	 			<input id="btnSave" name="btnSave" type="button" value="Save"
	 			class="btn btn-primary">
	 			<br>
	 			
	 			<div id="alertSuccess" class="alert alert-success"></div>
			<div id="alertError" class="alert alert-danger"></div>
			<br>
			
			<div id="divItemsGrid">
	 			
	 			
			</form>
			
			
 <%
 		Project itemObj = new Project();
 		out.print(itemObj.readItems());
 		//out.print(itemObj.insertItem(ProjectCode, ProjectName, Description, Budget, Category));
 %>
	</div>
</div> </div> </div>
</body>
</html>