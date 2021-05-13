<%@page import="com.Project"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
				 
				<br><br> 
				 
	 			<input id="btnSave" name="btnSave" type="button" value="Save"
	 			class="btn btn-primary">
	 			
	 			<input type="hidden" id="ProjectId"
	 			name="ProjectId" value="">
			</form>
			
			<div id="alertSuccess" class="alert alert-success"></div>
			<div id="alertError" class="alert alert-danger"></div>
			<br>
			
			<div id="divItemsGrid">
 <%
 		Project itemObj = new Project();
 		out.print(itemObj.readItems());
 %>
	</div>
</div> </div> </div>
</body>
</html>