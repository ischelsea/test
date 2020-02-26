package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.WordDao;
import entity.Word;

public class WordServlet extends HttpServlet {

	public WordServlet() {
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
		String action=request.getParameter("action");
		WordDao worddao=new WordDao();
		if(action.equals("select")){
			List wordlist=worddao.selectAll();
			int i=wordlist.size();
			if(i>0){
				request.setAttribute("i", i);
				request.setAttribute("wordlist", wordlist);
				request.getRequestDispatcher("admin/wordManage.jsp").forward(request, response);
			}
		}
		if(action.equals("fontselect")){
			List wordlist=worddao.selectAll();
			int i=wordlist.size();
			if(i>0){
				request.setAttribute("i", i);
				request.setAttribute("wordlist", wordlist);
				request.getRequestDispatcher("font/liuyan.jsp").forward(request, response);
			}
		}
		if(action.equals("delete")){
			int id=Integer.parseInt(request.getParameter("id"));
			if(worddao.deleteWord(id)){
				request.getRequestDispatcher("WordServlet?action=select").forward(request, response);
			}
		}
		if(action.equals("add")){
			SimpleDateFormat formater=new SimpleDateFormat("yyyy'��'MM'��'dd'��' HH:mm:ss");
			String time=formater.format(new Date());
			Word word=new Word();
			word.setWord_title(request.getParameter("title"));
			word.setWord_content(request.getParameter("content"));
			word.setWord_sdTime(time);
			word.setWord_author(request.getParameter("author"));
			if(worddao.addWord(word)){
				request.getRequestDispatcher("WordServlet?action=fontselect").forward(request, response);
			}
		}

	}

	public void init() throws ServletException {
		// Put your code here
	}

}
