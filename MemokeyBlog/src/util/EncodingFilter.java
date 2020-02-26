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

public class EncodingFilter  implements Filter{

	    protected FilterConfig filterConfig;
	    private String targetEncoding = "utf-8";
	    
	/**
	*��ʼ��������,��һ���Servletһ������Ҳ���Ի�ó�ʼ������
	*/
	    public void init(FilterConfig config) throws ServletException {
	      this.filterConfig = config;
	      this.targetEncoding = config.getInitParameter("encoding");
	    }
	    
	    /**
	     *���й��˴��������������Ҫ�����й��˴���Ĵ��붼�ڴ�ʵ�֡�
	    */
	public void doFilter(ServletRequest srequest, ServletResponse sresponse, FilterChain chain)
	    throws IOException, ServletException {
	      //System.out.println("ʹ�����·�����������б��룺encoding="+targetEncoding);   
	      HttpServletRequest request = (HttpServletRequest)srequest;
	      HttpServletResponse response=(HttpServletResponse)sresponse;
	      // �����ַ������ʽ
	      request.setCharacterEncoding(targetEncoding);
	      response.setCharacterEncoding(targetEncoding);
	      // �Ѵ���Ȩ���͵���һ��
	      chain.doFilter(srequest,sresponse); 
	    }

	public void setFilterConfig(final FilterConfig filterConfig){
	     this.filterConfig=filterConfig;
	}
	    
	   //���ٹ�����
	public void destroy(){
	     this.filterConfig=null;
	}
	}