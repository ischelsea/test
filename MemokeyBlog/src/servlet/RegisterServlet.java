package servlet;
 
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import util.DBUtil;
 
@WebServlet("/register_do")
public class RegisterServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String email=request.getParameter("password");
		boolean isSuccess=DBUtil.addUser(username, password, email);
		if(isSuccess){
			request.setAttribute("message", "注册成功!");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}else{
			request.setAttribute("message", "注册失败，用户名重复!");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}
 
}