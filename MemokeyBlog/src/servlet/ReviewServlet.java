package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

import dao.ReviewDao;
import entity.Review;

public class ReviewServlet extends HttpServlet {

	public ReviewServlet() {
		super();
	}


	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
           this.doPost(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		ReviewDao reviewdao=new ReviewDao();
		String action=request.getParameter("action");
		if(action.equals("add")){
			//String s=
			int articleid=Integer.parseInt(request.getParameter("articleid"));
			
			Review review=new Review();
			SimpleDateFormat fomater=new SimpleDateFormat("yyyy'��'MM'��'dd'��' HH:mm:ss");
			String nowtime=fomater.format(new Date());
			review.setReview_articleId(articleid);
			review.setReview_author(request.getParameter("author"));
			review.setReview_content(request.getParameter("content"));
			review.setReview_sdTime(nowtime);
			if(reviewdao.addReview(review)){
				//System.out.println("���۳ɹ�");
				out.print("<script type='text/javascript'>alert('���۳ɹ���');history.back()</script>");
			}
			
		}

	}

	public void init() throws ServletException {
		// Put your code here
	}

}
