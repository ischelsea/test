package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ArticleDao;
import dao.SortDao;
import entity.Article;
import entity.Sort;
import entity.Comment;
import entity.Review;

public class ArticleServlet extends HttpServlet {

	public ArticleServlet() {
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
		ArticleDao articledao=new ArticleDao();
		SortDao articletypedao=new SortDao();
		if(action.equals("add")){
			Article article=new Article();
			SimpleDateFormat fomater=new SimpleDateFormat("yyyy'��'MM'��'dd'��' HH:mm:ss");
			String nowtime=fomater.format(new Date());
			String typename=request.getParameter("type");
			Articletype articletype=articletypedao.selectByType(typename);
			int type=articletype.getArticleType_id();
			article.setArticle_typeID(type);
			article.setArticle_title(request.getParameter("title"));
			article.setArticle_content(request.getParameter("content"));
			article.setArticle_sdTime(nowtime);
			article.setArticle_create(request.getParameter("create"));
			article.setArticle_info(request.getParameter("info"));
			if(articledao.addArticle(article)){
				//out.print("<script type='text/javascript'>alert('����ɹ���');history.back()</script>");
				request.getRequestDispatcher("ArticleServlet?action=select").forward(request, response);
			}
		}
		if(action.equals("select")){
			List articlelist=articledao.selectArticle();
			if(articlelist.size()>0){
				request.setAttribute("articlelist", articlelist);
				request.getRequestDispatcher("admin/articleManage.jsp").forward(request, response);
			}
		}
		if(action.equals("fontselect")){
			List articlelist=articledao.selectArticle();
			if(articlelist.size()>0){
				request.setAttribute("articlelist", articlelist);
				request.getRequestDispatcher("font/myarticle.jsp").forward(request, response);
			}
		}
		if(action.equals("selectById")){
			int id=Integer.parseInt(request.getParameter("id"));
			Article article=articledao.selectByid(id);
			if(article!=null&&!article.equals("")){
				request.setAttribute("article", article);
				request.getRequestDispatcher("admin/articleUpdate.jsp").forward(request, response);
			}
		}
		if(action.equals("fontselectById")){
			int id=Integer.parseInt(request.getParameter("id"));
			Article article=articledao.selectByid(id);
			if(article!=null&&!article.equals("")){
				int count=article.getArticle_count();
				count++;
				//System.out.println(count);
				if(articledao.updateArticleCount(count, id)){
					Article article1 =articledao.selectByid(id);
					int newcount =article1.getArticle_count();
					//System.out.println(newcount);
					request.setAttribute("newcount", newcount);
				}
				ReviewDao reviewdao=new ReviewDao();
				List reviewlist=reviewdao.selectReviewCount(id);
				int i=reviewlist.size();
				if(i>0){
					request.setAttribute("i", i);
				}
				else{
					request.setAttribute("i", 0);
				}
				request.setAttribute("article", article);
				request.getRequestDispatcher("font/articlecontent.jsp").forward(request, response);
			}
		}
		if(action.equals("selectcontent")){
			int id=Integer.parseInt(request.getParameter("id"));
			Article article=articledao.selectByid(id);
			if(article!=null&&!article.equals("")){
				int count=article.getArticle_count();
				count++;
				//System.out.println(count);
				if(articledao.updateArticleCount(count, id)){
					Article article1 =articledao.selectByid(id);
					int newcount =article1.getArticle_count();
					System.out.println(newcount);
					request.setAttribute("newcount", newcount);
				}
				ReviewDao reviewdao=new ReviewDao();
				List reviewlist=reviewdao.selectReviewCount(id);
				int i=reviewlist.size();
			    request.setAttribute("i", i);
				request.setAttribute("article", article);
				request.getRequestDispatcher("font/articlecontent.jsp").forward(request, response);
			}
		}
		if(action.equals("update")){
			int id=Integer.parseInt(request.getParameter("id"));
			Article article=new Article();
			String typename=request.getParameter("type");
			Articletype articletype=articletypedao.selectByType(typename);
			article.setArticle_typeID(articletype.getArticleType_id());
			article.setArticle_title(request.getParameter("title"));
			article.setArticle_content(request.getParameter("content"));
			article.setArticle_create(request.getParameter("create"));
			article.setArticle_info(request.getParameter("info"));
			article.setId(id);
			if(articledao.updateArticle(article)){
				//out.print("<script type='text/javascript'>alert('�޸ĳɹ���');history.back()</script>");
				request.getRequestDispatcher("ArticleServlet?action=select").forward(request, response);
			}
		}
		if(action.equals("delete")){
			int id=Integer.parseInt(request.getParameter("id"));
			if(articledao.deleteArticle(id)){
				//out.print("<script type='text/javascript'>alert('ɾ���ɹ���');history.back()</script>");
				request.getRequestDispatcher("ArticleServlet?action=select").forward(request, response);
			}
		}
		if(action.equals("selectByType")){
			String typename=request.getParameter("type");
			Articletype articletype=articletypedao.selectByType(typename);
			int typeid=articletype.getArticleType_id();
			List articlelist=articledao.selectByTypeid(typeid);
			if(articlelist.size()>0){
				request.setAttribute("articlelist", articlelist);
				request.getRequestDispatcher("admin/articleSelect.jsp").forward(request, response);
			}
			else{
			out.print("<script type='text/javascript'>alert('û���ҵ������Ϣ��');history.back()</script>");
			}
		}
		if(action.equals("fontselectByType")){
			String typename=request.getParameter("type");
			Articletype articletype=articletypedao.selectByType(typename);
			if(!articletype.equals("")&&articletype!=null){
				int typeid=articletype.getArticleType_id();
				List articlelist=articledao.selectByTypeid(typeid);
				int size=articlelist.size();
				if(size>0){
					//��ʾ������
					 List plist=new ArrayList();
					 for(int i=0;i<size;i++){
					      Article article=(Article)articlelist.get(i);
					      ReviewDao reviewdao =new ReviewDao();
					      List reviewlist=reviewdao.selectReviewCount(article.getId());
									int count=reviewlist.size();
									Pinlun pl=new Pinlun();
									pl.setCount(count);
									pl.setArticleid(article.getId());
									plist.add(pl);
					   }
					request.setAttribute("articlelist", articlelist);
					request.setAttribute("reviewlist", plist);
					request.setAttribute("typename", typename);
					request.setAttribute("size", size);
					request.getRequestDispatcher("font/articlecontentByType.jsp").forward(request, response);
				}
				else{
				out.print("<script type='text/javascript'>alert('û���ҵ������Ϣ��');history.back()</script>");
				}
			}
			else{
				out.print("<script type='text/javascript'>alert('û���ҵ������Ϣ��');history.back()</script>");
			}
			
		}
	
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
