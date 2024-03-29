package com.letslearn.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.letslearn.DBcon.DbCon;
import com.letslearn.Dao.PackagesDao;
import com.letslearn.Modal.Packages;

/**
 * Servlet implementation class PackagesServlet
 */
@WebServlet("/PackagesServlet")
public class PackagesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private int result = 0;
	RequestDispatcher dis = null;
	String action = null;
	String price = null;
	String id = null;
	String discount = null;
	String packageName = null;
	String tel = null;
	String packType = null;
	String fname = null;
	String emailString = null;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		action = request.getParameter("action");
		if(action.equals("delete")){
			emailString = request.getParameter("email");
			price = request.getParameter("price");
			packageName = request.getParameter("packageName");
			tel = request.getParameter("tel");
			packType = request.getParameter("packType");
			fname = request.getParameter("fname");
			discount = request.getParameter("discount");
			id = request.getParameter("id");
			
			try {
				PackagesDao packagesDao = new PackagesDao(DbCon.getConnection());
				result = packagesDao.deletePackages(id);
				if (result != 0) {
					response.sendRedirect("packagesManagement.jsp");
					
				} else {
					// Send a JavaScript alert for an error
					out.write("<script>alert('An error . Please try again.');</script>");
				}
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		action = request.getParameter("action");
		
		emailString = request.getParameter("email");
		price = request.getParameter("price");
		packageName = request.getParameter("packageName");
		tel = request.getParameter("tel");
		packType = request.getParameter("packType");
		fname = request.getParameter("fname");
		discount = request.getParameter("discount");
		id = request.getParameter("id");
		
		
		if(action.equals("addPackages")) {
			try {
				Packages packages = new Packages(id,fname,emailString,"",packageName,packType,price,discount,tel);
				PackagesDao packagesDao = new PackagesDao(DbCon.getConnection());
				result = packagesDao.addPackages(packages);
				if (result != 0) {
					response.sendRedirect("packagesManagement.jsp");
				} else {
					// Send a JavaScript alert for an error
					out.write("<script>alert('An error occurred. Please try again.');</script>");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(action.equals("update")){
			try {
				Packages packages = new Packages(id,fname,emailString,"",packageName,packType,price,discount,tel);
				PackagesDao packagesDao = new PackagesDao(DbCon.getConnection());
				result = packagesDao.updatePackages(packages);
				if (result != 0) {
					response.sendRedirect("packagesManagement.jsp");
				} else {
					// Send a JavaScript alert for an error
					out.write("<script>alert('An error  Please try again.');</script>");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
