package servlet;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Checkcode extends HttpServlet {


	private static final String CONTENT_TYPE = "text/html; charset=gb2312";   
    private Font mFont = new Font("Times New Roman", Font.PLAIN, 17);  
	Color getRandColor(int fc,int bc)   
    {   
        Random random = new Random();   
        if(fc>255) fc=255;   
        if(bc>255) bc=255;   
        int r=fc+random.nextInt(bc-fc);   
        int g=fc+random.nextInt(bc-fc);   
        int b=fc+random.nextInt(bc-fc);   
        return new Color(r,g,b);   
    }  
	
	 private String getRandChar() {  
	     int rand = (int)Math.round(Math.random()*2);  
	     long itmp = 0;  
	     char ctmp = '\u0000';  
	     switch(rand) {  
	     case 1:  
	         itmp = Math.round(Math.random()*25+65);  
	         ctmp = (char)itmp;  
	         return String.valueOf(ctmp);  
	      case 2:  
	         itmp = Math.round(Math.random()*25+97);  
	         ctmp = (char)itmp;  
	         return String.valueOf(ctmp);  
	         default:  
	             itmp = Math.round(Math.random()*9);  
	             ctmp = (char)itmp;  
	             return String.valueOf(itmp); 
	     }
	   }  
	
	 public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		 response.setHeader("Pragma","No-cache");   
         response.setHeader("Cache-Control","no-cache");   
         response.setDateHeader("Expires", 0);  
         response.setContentType("image/jpeg"); 
         int width=80, height=18;  
         BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB); 
         Graphics g = image.getGraphics();   
         Random random = new Random();   
         g.setColor(getRandColor(200,250));   
         g.fillRect(1, 1, width-1, height-1);   
         g.setColor(new Color(102,102,102));   
         g.drawRect(0, 0, width-1, height-1);   
         g.setFont(mFont); 
         g.setColor(getRandColor(160,200));
         for (int i=0;i<155;i++)   
         {   
             int x = random.nextInt(width - 1);   
             int y = random.nextInt(height - 1);   
             int xl = random.nextInt(6) + 1;   
             int yl = random.nextInt(12) + 1;   
             g.drawLine(x,y,x + xl,y + yl);   
         }   
         for (int i = 0;i < 70;i++)   
         {   
             int x = random.nextInt(width - 1);   
             int y = random.nextInt(height - 1);   
             int xl = random.nextInt(12) + 1;   
             int yl = random.nextInt(6) + 1;   
             g.drawLine(x,y,x - xl,y - yl);   
         }     
         String sRand="";   
         for (int i=0;i<4;i++)   
         {   
        	 String tmp = getRandChar();
             sRand += tmp;
             g.setColor(new Color(20+random.nextInt(110),20+random.nextInt(110),20+random.nextInt(110)));   
             g.drawString(String.valueOf(tmp),15*i+10,16);   
         } 
         HttpSession session = request.getSession(true); 
         session.setAttribute("ValidateCode",sRand);   
         g.dispose();
         //���ͼ����֤��
         ImageIO.write(image, "JPEG", response.getOutputStream());   
	 }

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
