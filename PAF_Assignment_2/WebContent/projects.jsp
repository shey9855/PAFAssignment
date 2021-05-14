<%@page import="com.Project"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Insert title here</title>

<link rel="stylesheet" href="Views/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/main.js"></script>
</head>

<nav class=\"navbar navbar-expand-md navbar-dark\" style=\"background-color:black\">
<a  href="#"><h5 style=\"color:white;\">Add New Project</h5> <i class='navbar-brand'></i></a>

<body>

		<div class="container"><div class="row"><div class="col-6">
			<h1>Project Management </h1>
			
			<form id="formItem" name="formItem">
			
			
	 			Project Code:
	 			<input id="ProjectCode" name="ProjectCode" type="text"
	 			class="form-control form-control-sm">
 <br> 
				Project Name:
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
	 			<input type="hidden" id="ProjectId" name="ProjectId" value="">
	 			<br>
	 			
	 			<div id="alertSuccess" class="alert alert-success"></div>
			<div id="alertError" class="alert alert-danger"></div>
			<br>
			
			<div id="divItemsGrid"></div>
	 			
	 			
			</form>
			
			
			
 <%
 		Project itemObj = new Project();
 		out.print(itemObj.readItems());
 		//out.print(itemObj.insertItem(ProjectCode, ProjectName, Description, Budget, Category));
 %>
	</div>
</div> </div> </div>

<footer class="w3-container w3-padding-64 w3-light-grey w3-center w3-large"> 
<div class="foot">
 <font class="copyright"> Copyright 2020 © THE GadgetBadget. All Rights Reserved. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp <br> <br><a href="about us.html" > About Us</a>	&nbsp;&nbsp; <a href="feedback.jsp" > Feedback</a>	&nbsp;&nbsp; <a href="contactus.html" > Contact Us</a> <br>	
  <i class="fa fa-facebook-official w3-hover-opacity"></i>
  <i class="fa fa-instagram w3-hover-opacity"></i>
  <i class="fa fa-snapchat w3-hover-opacity"></i>
  <i class="fa fa-pinterest-p w3-hover-opacity"></i>
  <i class="fa fa-twitter w3-hover-opacity"></i>
  <i class="fa fa-linkedin w3-hover-opacity"></i>
 </font>
 </div> 
  
</footer>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>