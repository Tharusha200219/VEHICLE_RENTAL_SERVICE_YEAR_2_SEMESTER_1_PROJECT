package com.letslearn.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Response;
import org.apache.jasper.tagplugins.jstl.core.Out;

import com.letslearn.DBcon.DbCon;
import com.letslearn.Dao.AdminDao;
import com.letslearn.Modal.Admin;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RequestDispatcher dis = null;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		resp.sendRedirect("Index.jsp");
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String emailString = request.getParameter("email");
		String passwordString= request.getParameter("password");
		
		try {
			//for user based login credentials
			AdminDao adao = new AdminDao(DbCon.getConnection());
			Admin admin = adao.adminLogin(emailString, passwordString);
			if(admin!=null) {
				request.getSession().setAttribute("auth", admin);
				//redirects to index.jsp page
				request.setAttribute("status", "success");
				dis = request.getRequestDispatcher("packagesManagement.jsp");
				dis.forward(request, response);
			}else {
				//redirects to index.jsp page
				request.setAttribute("status", "error");
				dis = request.getRequestDispatcher("auth-login.jsp");
				dis.forward(request, response);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

}
