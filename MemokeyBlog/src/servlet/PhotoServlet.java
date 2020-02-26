package servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import dao.PhotoDao;
import entity.Photo;
import com.jspsmart.upload.SmartUpload;

public class PhotoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final int MAX_MEMORY_SIZE = 5 * 2 * 1024;
	private static final File REPOSITORY_PATH = new File("c:\\temp");

	File file;
	ServletContext application;
	String desc="";
	String strdesc="";

	public PhotoServlet() {
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
		String action =request.getParameter("action");
		PhotoDao photodao=new PhotoDao();
		if(action.equals("upload")){
		application = this.getServletContext();
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(MAX_MEMORY_SIZE);
		factory.setRepository(REPOSITORY_PATH);
		// �����ļ��ϴ�������
		ServletFileUpload servletfileupload = new ServletFileUpload(factory);
		
		try {
			SmartUpload su=new SmartUpload();
			su.initialize(this.getServletConfig(),request, response);

			List items = servletfileupload.parseRequest(request);
			for(Iterator ii=items.iterator();ii.hasNext();){
				FileItem fileitem = (FileItem) ii.next();
				String field=fileitem.getFieldName();
				if(field.equals("desc")){
					 desc=fileitem.getString();
					 strdesc=new String(desc.getBytes("iso-8859-1"),"utf-8");
					System.out.println(strdesc);
					continue;
				}
			}
			Iterator iter = items.iterator();
			String username = (String) request.getSession().getAttribute("masterName");
			while (iter.hasNext()) {
				FileItem item = (FileItem) iter.next();
				if (!item.isFormField()) {
					String filename = item.getName();
					long size = item.getSize();
					if (filename == null || filename.equals("") && size == 0) {
						continue;
					}
					file = new File(application.getRealPath("\\") + "photo\\"
							+ request.getSession().getAttribute("masterName"));
					if (!file.exists()) {
						file.mkdirs();
					}
					double i=Math.random()*1000000;
					long lo=Math.round(i);
					filename=lo+filename.substring(filename.lastIndexOf("."));
					item.write(new File(file, filename));
					
					
					//String desc=(String)su.getRequest().getParameter("desc");
					//System.out.println(desc);
					SimpleDateFormat fomater=new SimpleDateFormat("yyyy'��'MM'��'dd'��' HH:mm:ss");
					String nowtime=fomater.format(new Date());
					String photo_addr="photo\\"+username+'\\'+filename;
					Photo photo=new  Photo();
					photo.setPhoto_desc(strdesc);
					photo.setPhoto_sdTime(nowtime);
					photo.setPhoto_addr(photo_addr);
					
					if(photodao.addPhoto(photo)){
						request.getRequestDispatcher("PhotoServlet?action=select").forward(request, response);
					}
				}
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			out.println("�ϴ�����ԭ�����£�");
			out.println(e.toString());
			e.printStackTrace();
		}
		}
		
		if(action.equals("select")){
			List photolist=photodao.select();
			if(photolist.size()>0){
				request.setAttribute("photolist", photolist);
				request.getRequestDispatcher("admin/photoManage.jsp").forward(request, response);
			}
		}
		if(action.equals("fontselect")){
			List photolist=photodao.select();
			if(photolist.size()>0){
				request.setAttribute("photolist", photolist);
				request.getRequestDispatcher("font/myphoto.jsp").forward(request, response);
			}
		}
		if(action.equals("selectById")){
			int id=Integer.parseInt(request.getParameter("id"));
			Photo photo=photodao.selectById(id);
			if(photo!=null&&!photo.equals("")){
				request.setAttribute("photo", photo);
				request.getRequestDispatcher("admin/photoShow.jsp").forward(request, response);
			}
		}
		if(action.equals("delete")){
			int id=Integer.parseInt(request.getParameter("id"));
			if(photodao.deletePhoto(id)){
				request.getRequestDispatcher("PhotoServlet?action=select").forward(request, response);
			}
		}
	}
	
	public void init() throws ServletException {
		// Put your code here
	}

}
