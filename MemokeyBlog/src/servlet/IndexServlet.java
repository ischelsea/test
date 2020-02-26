package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ArticleDao;
import dao.FriendDao;
import dao.MasterDao;
import dao.PhotoDao;
import dao.ReviewDao;
import dao.WordDao;
import entity.Article;
import entity.Master;
import entity.Pinlun;

public class IndexServlet extends HttpServlet {

	public IndexServlet() {
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
		HttpSession session=request.getSession();
		
		MasterDao masterdao=new MasterDao();
		Master master=masterdao.select();
		session.setAttribute("master", master);
		
		WordDao worddao=new WordDao();
		List wordlist =worddao.selectAll();
		session.setAttribute("wordlist", wordlist);
		
        FriendDao frienddao=new FriendDao();
        List friendlist =frienddao.selectAll();
		session.setAttribute("friendlist", friendlist);
		
		ArticleDao articledao=new ArticleDao();
		List articlelist=articledao.selectArticle();
		session.setAttribute("articlelist", articlelist);
		
		PhotoDao photodao=new PhotoDao();
		List photolist=photodao.select();
		request.setAttribute("photolist", photolist);
		
		 List plist=new ArrayList();
		 for(int i=0;i<articlelist.size();i++){
		      Article article=(Article)articlelist.get(i);
		      ReviewDao reviewdao =new ReviewDao();
		      List reviewlist=reviewdao.selectReviewCount(article.getId());
						int count=reviewlist.size();
						Pinlun pl=new Pinlun();
						pl.setCount(count);
						pl.setArticleid(article.getId());
						plist.add(pl);
		   }
		  
		request.setAttribute("reviewlist", plist);
		request.getRequestDispatcher("font/main.jsp").forward(request, response);
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
