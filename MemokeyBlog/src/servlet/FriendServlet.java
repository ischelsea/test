package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FriendDao;
import entity.Friend;

public class FriendServlet extends HttpServlet {


	public FriendServlet() {
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
		FriendDao frienddao=new FriendDao();
		if(action.equals("select")){
			List friendlist=frienddao.selectAll();
			if(friendlist.size()>0){
				request.setAttribute("friendlist", friendlist);
				request.getRequestDispatcher("admin/friendManage.jsp").forward(request, response);
			}
		}
		if(action.equals("fontselect")){
			List friendlist=frienddao.selectAll();
			if(friendlist.size()>0){
				request.setAttribute("friendlist", friendlist);
				request.getRequestDispatcher("font/myfriend.jsp").forward(request, response);
			}
		}
		if(action.endsWith("add")){
			Friend friend=new Friend();
			friend.setFriend_name(request.getParameter("name"));
			friend.setFriend_sex(request.getParameter("sex"));
			friend.setFriend_OICQ(request.getParameter("qq"));
			friend.setFriend_blog(request.getParameter("blog"));
			if(frienddao.addFriend(friend)){
			request.getRequestDispatcher("FriendServlet?action=select").forward(request, response);
			}
		}
		if(action.equals("selectById")){
			int id=Integer.parseInt(request.getParameter("id"));
			Friend friend=frienddao.selectById(id);
			if(friend!=null&&!friend.equals("")){
				request.setAttribute("friend", friend);
				request.getRequestDispatcher("admin/friendUpdate.jsp").forward(request, response);
			}
		}
		if(action.endsWith("update")){
			int id=Integer.parseInt(request.getParameter("id"));
			Friend friend=new Friend();
			friend.setFriend_name(request.getParameter("name"));
			friend.setFriend_sex(request.getParameter("sex"));
			friend.setFriend_OICQ(request.getParameter("qq"));
			friend.setFriend_blog(request.getParameter("blog"));
			friend.setId(id);
			if(frienddao.updateFriend(friend)){
			request.getRequestDispatcher("FriendServlet?action=select").forward(request, response);
			}
		}
		if(action.equals("delete")){
		  int id=Integer.parseInt(request.getParameter("id"));
		  if(frienddao.deleteFriend(id)){
			request.getRequestDispatcher("FriendServlet?action=select").forward(request, response);
		  }
		}

	}


	public void init() throws ServletException {
		// Put your code here
	}

}
