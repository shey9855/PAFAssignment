package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class Project {
	
	private Connection connection()
	{
		Connection con = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			 //Provide the correct details: DBServer/DBName, username, password
			 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/paf2?useSSL=false", "root", "ABCroot@1");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return con;
 	}
	
	public String readItems()
	{
		String output = "";
		
			try
				{
					Connection con = connection();					
					
					if (con == null)
					{
						return "Error while connecting to the database for reading.";
					}
					
					 // Prepare the html table to be displayed
					 output = "<table border='1'><tr><th>Project Code</th>"
					 + "<th>Project Name</th>"
					 + "<th>Description</th><th>Budget</th>"
					 + "<th>Category</th>"
					 + "<th>Update</th><th>Remove</th></tr>";
					 String query = "select * from projects";
					 Statement stmt = con.createStatement();
					 ResultSet rs = stmt.executeQuery(query);
					 // iterate through the rows in the result set
					 
					 while (rs.next())
					 {
						 //String ProjectId = Integer.toString(rs.getInt("ProjectId"));
						 String ProjectCode = Integer.toString(rs.getInt("ProjectCode"));
						 String ProjectName = rs.getString("ProjectName");
						 String Description = rs.getString("Description");
						 String Budget = rs.getString("Budget"); 
						 String Category = rs.getString("Category");
	
						// Add into the html table
						 output += "<tr><td>" + ProjectCode + "</td>";					 
						 output += "<td>" + ProjectName + "</td>";
						 output += "<td>" + Description + "</td>";
						 output += "<td>" + Budget + "</td>";
						 output += "<td>" + Category + "</td>";
						 
					    // buttons
					     output += "<td><input name='btnUpdate' type='button' value='Update' "
						 + "class='btnUpdate btn btn-secondary' data-itemid='" + ProjectCode + "'></td>"
						 + "<td><input name='btnRemove' type='button' value='Remove' "
						 + "class='btnRemove btn btn-danger' data-itemid='" + ProjectCode + "'></td></tr>";
					  }
					  con.close();
					 // Complete the html table
					  
					  output += "</table>";
					}
			catch (Exception e)
			{
				 output = "Error while reading the items.";
				 System.err.println(e.getMessage());
			}
			return output;
	}
	
	public String insertItem(String ProjectCode, String ProjectName, String Description, String Budget, String Category)
	{
			 String output = "";
			 try
				 {
					 Connection con = connection();
					 if (con == null){
					 return "Error while connecting to the database for inserting.";
				 }
				 // create a prepared statement
				 String query = " insert into projects(ProjectCode,ProjectName,Description,Budget,Category) values (?, ?, ?, ?,?)";
				 PreparedStatement preparedStmt = con.prepareStatement(query);
				 // binding values
				 //preparedStmt.setInt(1, 0);
				 preparedStmt.setString(1, ProjectCode);
				 preparedStmt.setString(2, ProjectName);
				 preparedStmt.setString(3, Description);
				 preparedStmt.setString(4, Budget);
				 preparedStmt.setString(5, Category);
				 // execute the statement
				 preparedStmt.execute();
				 
				 con.close();
				 
				 String newItems = readItems();
				 output = "{\"status\":\"success\", \"data\": \"" +newItems + "\"}";
				 }
			 
			 catch (Exception e){
				 output = "{\"status\":\"error\", \"data\": \"Error while inserting the item\"}";
				 System.err.println(e.getMessage());
			 }
			 return output;
	} 
	
	public String updateItem(String ProjectCode, String ProjectName,String Description, String Budget, String Category)
			 {
			 	String output = "";
			 	try
			 	{
			 			Connection con = connection();
			 			
			 			if (con == null)
			 			{
			 				return "Error while connecting to the database for updating.";
			 			}
			 // create a prepared statement
			 			String query = "UPDATE projects SET ProjectCode=?,ProjectName=?,Description=?,Budget=?, Category=?WHERE ProjectId=?";
			 			
			 			PreparedStatement preparedStmt = con.prepareStatement(query);
			 // binding values
			 			 preparedStmt.setString(1, (ProjectCode));	
						 
						 preparedStmt.setString(2, ProjectName);
						 preparedStmt.setString(3, Description);
						 preparedStmt.setString(4, Budget);
						 preparedStmt.setString(5, Category);
						  
			
			 // execute the statement
						 preparedStmt.execute();
						 con.close();
						 String newItems = readItems();
						 output = "{\"status\":\"success\", \"data\": \"" +newItems + "\"}";
						 }
			 catch (Exception e)
			 {
						 output = "{\"status\":\"error\", \"data\": \"Error while updating the item.\"}";
						 System.err.println(e.getMessage());
			 }
			 return output;
		}
	
	public String deleteItem(String ProjectCode)
	{
			String output = "";
			try
			{
				 Connection con = connection();
				 if (con == null)
			{
				 return "Error while connecting to the database for deleting.";
	        }
				 
				 // create a prepared statement
				 String query = "delete from projects where ProjectCode=?";
				 PreparedStatement preparedStmt = con.prepareStatement(query);
				 
				 // binding values
				 preparedStmt.setString(0, (ProjectCode));
				 
				 // execute the statement
				 preparedStmt.execute();
				 con.close();
				 String newItems = readItems();
				 output = "{\"status\":\"success\", \"data\": \"" +newItems + "\"}";
			 }
			 catch (Exception e)
			 {
				 	output = "{\"status\":\"error\", \"data\": \"Error while deleting the item.\"}";
				 	System.err.println(e.getMessage());
			 }
			 return output;
	 } 
	
}
