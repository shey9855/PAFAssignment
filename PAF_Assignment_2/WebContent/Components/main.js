$(document).ready(function()
{
if ($("#alertSuccess").text().trim() == "")
{
$("#alertSuccess").hide();
}
$("#alertError").hide();
});

$(document).on("click", "#btnSave", function(event)
{
// Clear alerts---------------------
	 $("#alertSuccess").text("");
	 $("#alertSuccess").hide();
	 $("#alertError").text("");
	 $("#alertError").hide();
// Form validation-------------------
	var status = validateItemForm();
	if (status != true)
 	{
		 $("#alertError").text(status);
		 $("#alertError").show();
 		return;
 	}
// If valid------------------------
	var type = ($("#hidItemIDSave").val() == "") ? "POST" : "PUT";
 	$.ajax(
 	{
	 url : "ProjectAPI",
	 type : type,
	 data : $("#formProject").serialize(),
	 dataType : "text",
	 complete : function(response, status)
	 {
	 	onItemSaveComplete(response.responseText, status);
	 }
 	});
});

function onItemSaveComplete(response, status)
{
	if (status == "success")
 	{
 		var resultSet = JSON.parse(response);
 		if (resultSet.status.trim() == "success")
 		{
			 $("#alertSuccess").text("Successfully saved.");
			 $("#alertSuccess").show();
			 $("#divItemsGrid").html(resultSet.data);
 		} else if (resultSet.status.trim() == "error")
 	{
			 $("#alertError").text(resultSet.data);
			 $("#alertError").show();
 	}
 		} else if (status == "error")
 	{
			 $("#alertError").text("Error while saving.");
			 $("#alertError").show();
 	} else
 	{
			 $("#alertError").text("Unknown error while saving..");
			 $("#alertError").show();
 	} 

			 $("#hidItemIDSave").val("");
			 $("#formProject")[0].reset();
	}

$(document).on("click", ".btnUpdate", function(event)
{
		$("#hidItemIDSave").val($(this).data("projectid")); 
		$("#ProjectCode").val($(this).closest("tr").find('td:eq(0)').text());
		$("#ProjectName").val($(this).closest("tr").find('td:eq(1)').text());
		$("#Description").val($(this).closest("tr").find('td:eq(2)').text());
		$("#Budget").val($(this).closest("tr").find('td:eq(3)').text());
		$("#Category").val($(this).closest("tr").find('td:eq(4)').text());
});

$(document).on("click", ".btnRemove", function(event)
{
 		$.ajax(
 		{
			 url : "ProjectAPI",
			 type : "DELETE",
			 data : "Projectid=" + $(this).data("projectid"),
			 dataType : "text",
			 complete : function(response, status)
			 {
			 	onItemDeleteComplete(response.responseText, status);
			 }
 		});
});

function onItemDeleteComplete(response, status)
{
	if (status == "success")
 	{
		 var resultSet = JSON.parse(response);
		 if (resultSet.status.trim() == "success")
		 {
			 $("#alertSuccess").text("Successfully deleted.");
			 $("#alertSuccess").show();
			 $("#divItemsGrid").html(resultSet.data);
		 } else if (resultSet.status.trim() == "error")
		 {
			 $("#alertError").text(resultSet.data);
			 $("#alertError").show();
		 }
 	} else if (status == "error")
 	{
		 $("#alertError").text("Error while deleting.");
		 $("#alertError").show();
	} else
 	{
		 $("#alertError").text("Unknown error while deleting..");
		 $("#alertError").show();
 	}
}

function validateItemForm() 
{ 
// CODE
	if ($("#ProjectCode").val().trim() == "") 
 	{ 
 		return "Insert Project Code."; 
 	} 
// NAME
	if ($("#ProjectName").val().trim() == "") 
 	{ 
 		return "Insert Project Name."; 
 	} 
// PRICE-------------------------------
	if ($("#Description").val().trim() == "") 
 	{ 
 		return "Enter small description"; 
 	} 
	if ($("#Budget").val().trim() == "") 
 	{ 
 		return "Insert the budget."; 
 	} 
	if ($("#Category").val().trim() == "") 
 	{ 
 		return "Insert the category."; 
 	} 
return true; 
}
