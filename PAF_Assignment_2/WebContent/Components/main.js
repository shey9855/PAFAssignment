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
	var type = ($("#ProjectId").val() == "") ? "POST" : "PUT";
 	$.ajax(
 	{
	 url : "ProjectAPI",
	 type : type,
	 data : $("#formItem").serialize(),
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

			 $("#ProjectId").val("");
			 $("#formItem")[0].reset();
	}

$(document).on("click", ".btnUpdate", function(event)
{
		$("#ProjectId").val($(this).data("ProjectId"));
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
			 data : "ProjectId=" + $(this).data("ProjectId"),
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