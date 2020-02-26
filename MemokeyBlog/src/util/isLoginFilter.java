package util;

import javax.servlet.FilterChain;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import javax.servlet.FilterConfig;
import javax.servlet.http.HttpSession;

public class isLoginFilter implements Filter
{
	protected FilterConfig filterConfig;
	
	//���˴���ķ���
	public void doFilter(final ServletRequest req,final ServletResponse res,FilterChain chain)throws IOException,ServletException
	{
		 HttpServletRequest hreq = (HttpServletRequest)req;
         HttpServletResponse hres = (HttpServletResponse)res;
         HttpSession session = hreq.getSession();
         String name="";
        	name=(String)session.getAttribute("masterName");     
         	 if (name!=null) 
         	 {
				 	System.out.println("��isLoginFilter����֤ͨ��");
				 	//��֤�ɹ�����������
				 	chain.doFilter(req,res);
         	 }
         	 else {
         		   //��֤���ɹ������û���¼��
				 	//hres.sendRedirect("../login.jsp");
				 	hreq.getRequestDispatcher("../login.jsp").forward(hreq, hres);
				 	System.out.println("��isLoginFilter����һ��δ��֤������");
         	 }
		 }
        
	
	public void setFilterConfig(final FilterConfig filterConfig)
	{
		this.filterConfig=filterConfig;
	}
    
    //���ٹ�����
	public void destroy()
	{
		this.filterConfig=null;
	}
	 /**
     *��ʼ��������,��һ���Servletһ������Ҳ���Ի�ó�ʼ������
     */
    public void init(FilterConfig config) throws ServletException {
        this.filterConfig = config;       
    }
	
}
