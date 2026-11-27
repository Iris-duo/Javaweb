package com.test;

import javax.imageio.ImageIO;
import javax.servlet.*;
import javax.servlet.http.*;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

public class SeccodeServlet extends HttpServlet {
    private int width = 200;
    private int height = 50;
    private int len = 4;
    private String seccodeChar = "0123456789abcdefghijklmnopkrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    private Random random = new Random();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("image/jpeg");
        BufferedImage image = new BufferedImage(this.width,this.height,BufferedImage.TYPE_INT_RGB);
        Graphics g = image.getGraphics();
        //填充随机背景
        g.setColor(getRamdomColor(200,55));
        g.fillRect(0,0,width,height);
        //随机画线
        for(int i = 0;i < 100;i++){
            g.setColor(getRamdomColor(160,55));
            int x1 = random.nextInt(width);
            int y1 = random.nextInt(height);
            int x2 = random.nextInt(width);
            int y2 = random.nextInt(height);
            g.drawLine(x1,y1,x2,y2);
        }
        char code = "";
        Font font = new Font("宋体",Font.ITALIC,this.width/this.len);
        g.setFont(font);
        for(int i = 0; i < this.len;i++){
            g.setColor(getRamdomColor(120,55));
            char c = this.seccodeChar.charAt(this.random.nextInt(this.seccodeChar.length()));
            code += c;
            g.drawString(c + "",i * (this.width/this.len) + 10,height - 10);
        }
//        //随机画线
//        for(int i = 0;i < 10;i++){
//            g.setColor(getRamdomColor(120,55));
//            int x1 = random.nextInt(width);
//            int y1 = random.nextInt(height);
//            int x2 = random.nextInt(width);
//            int y2 = random.nextInt(height);
//            g.drawLine(x1,y1,x2,y2);
//        }
        HttpSession session = request.getSession();
        session.setAttribute("seccode",code);
        ImageIO.write(image,"jpeg",response.getOutputStream());
        g.dispose();
    }

    private Color getRamdomColor(int base,int inc){
        int r = base + random.nextInt(inc);
        int g = base + random.nextInt(inc);
        int b = base + random.nextInt(inc);
        return new Color(r,g,b);
    }

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        String w = config.getInitParameter("width");
        if(w!=null){
            this.width = Integer.parseInt(w);
        }

        String h = config.getInitParameter("height");
        if(h!=null){
            this.height = Integer.parseInt(h);
        }

        String l = config.getInitParameter("len");
        if(l!=null){
            this.len = Integer.parseInt(l);
        }

        String c = config.getInitParameter("seccodeChar");
        if(c!=null){
            this.seccodeChar = c;
        }
    }
}
