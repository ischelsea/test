package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ArticletypeDao;
import entity.Articletype;

public class ArticleTypeServlet extends HttpServlet {

	public ArticleTypeServlet() {
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
		ArticletypeDao typedao=new ArticletypeDao();
		if(action.equals("add")){
			Articletype articletype=new Articletype();
			articletype.setArticleType_name(request.getParameter("typename"));
			articletype.setArticleType_info(request.getParameter("typeinfo"));
			if(typedao.addType(articletype)){
				request.getRequestDispatcher("ArticleTypeServlet?action=select").forward(request, response);
			}
		}
		if(action.equals("select")){
			List typelist=typedao.selectAll();
			if(typelist.size()>0){
				request.setAttribute("typelist", typelist);
				request.getRequestDispatcher("admin/articletypeManage.jsp").forward(request, response);
			}
		}
		if(action.equals("selectTypeName")){
			List typelist=typedao.selectAll();
			if(typelist.size()>0){
				request.setAttribute("typelist", typelist);
				request.getRequestDispatcher("admin/articleAdd.jsp").forward(request, response);
			}
		}
		if(action.equals("selectById")){
			int id=Integer.parseInt(request.getParameter("id"));
			Articletype articletype=typedao.selectById(id);
			if(!articletype.equals("")&&articletype!=null){
				request.setAttribute("articletype", articletype);
				request.getRequestDispatcher("admin/articletypeUpdate.jsp").forward(request, response);
			}
		}
		if(action.equals("update")){
			int id=Integer.parseInt(request.getParameter("id"));
			Articletype articletype=new Articletype();
			articletype.setArticleType_name(request.getParameter("typename"));
			articletype.setArticleType_info(request.getParameter("typeinfo"));
			articletype.setArticleType_id(id);
			if(typedao.updateType(articletype)){
				request.getRequestDispatcher("ArticleTypeServlet?action=select").forward(request, response);
			}
		}
		if(action.equals("delete")){
			int id=Integer.parseInt(request.getParameter("id"));
			if(typedao.deleteType(id)){
				request.getRequestDispatcher("ArticleTypeServlet?action=select").forward(request, response);
			}
		}

	}

	public void init() throws ServletException {
		// Put your code here
	}

}
