package servlet;
 
import java.io.IOException;
 
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import entity.User;
import util.DBUtil;
 
/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login_do")
public class LoginServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
 
		User user = DBUtil.verifyAccount(username, password);
		if(user==null){
//		 	out.println("登录失败,用户名或密码错误！");
			request.setAttribute("message", "<font color='red'>登录失败,用户名或密码错误！</font>");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}else{
			
			int number = 0;
			ServletContext application = this.getServletContext();
			if(application.getAttribute("userNumber")!=null){
				number =(Integer) application.getAttribute("userNumber");
			}
			
			number++;
			
			application.setAttribute("userNumber", number);
			
			request.getSession().setAttribute("user", user);
			request.getRequestDispatcher("personCenter.jsp").forward(request, response);
		}
	}
 
}