package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MasterDao;

public class MasterServlet extends HttpServlet {

	public MasterServlet() {
		super();
	}


	public void destroy() {
		super.destroy(); 
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	        this.doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String action=request.getParameter("action");
		MasterDao masterdao=new MasterDao();
		if(action.equals("login")){
		String username=request.getParameter("username");
		String password=request.getParameter("password");
	
		String validatecode1 =(String)request.getSession().getAttribute("ValidateCode"); 
		String validatecode2=request.getParameter("validatecode");
		if(!validatecode1.equals(validatecode2)){
			request.setAttribute("message","....");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}else{
				request.setAttribute("msg", "错误");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		}
		
		if(action.equals("exit")){
			HttpSession session=request.getSession();
			session.invalidate();
			response.sendRedirect("login.jsp");
		}
	
	}

	public void init() throws ServletException {
	}

}
