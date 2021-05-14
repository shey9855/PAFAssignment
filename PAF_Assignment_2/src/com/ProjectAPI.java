package com;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

//import com.google.gson.*;
//import com.google.gson.reflect.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ProjectAPI
 */
@WebServlet("/ProjectAPI")
public class ProjectAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private Project project;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProjectAPI() {
        
    	this.project = new Project();
    }

	

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		String output = project.insertItem(
				request.getParameter("ProjectCode"),
				request.getParameter("ProjectName"),
				request.getParameter("Description"),
				request.getParameter("Budget"),
				request.getParameter("Category"));
		
		response.getWriter().write(output); 
	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Map paras = getParasMap(request);
		
		 String output = project.updateItem(paras.get("ProjectCode").toString(),
											paras.get("ProjectName").toString(),
											paras.get("Description").toString(),
											paras.get("Budget").toString(),
											paras.get("Category").toString());
		response.getWriter().write(output);
	}

	private Map getParasMap(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		Map<String, String> map = new HashMap<String, String>();
		try
		 {
			 Scanner scanner = new Scanner(request.getInputStream(), "UTF-8");
			 String queryString = scanner.hasNext() ?
			 scanner.useDelimiter("\\A").next() : "";
			 scanner.close();
			 String[] params = queryString.split("&");
			 for (String param : params)
			 { 
		
				 String[] p = param.split("=");
				 map.put(p[0], p[1]);
			 }
		 }
		catch (Exception e)
		 {
		 }
		return map;
	}



	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Map paras = getParasMap(request);
		
		String output = project.deleteItem(paras.get("ProjectCode").toString());
		response.getWriter().write(output);
	}

}
