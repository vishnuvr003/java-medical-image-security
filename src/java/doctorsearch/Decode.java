/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package doctorsearch;

import com.ieee.CryptoUtils;
import com.ieee.DecodeMessage;
import com.ieee.Utill;
import com.mysql.jdbc.Util;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import test.Shuffle;

/**
 *
 * @author S7
 */
public class Decode extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {
            String id=request.getParameter("id");
           // String pk=request.getParameter("key");
            String fk;
          //  out.println(pk);
            String qr="select * from filedetails inner join randompos on randompos.aid=filedetails.fid  where fid='"+id+"'";
            connect c=new connect();
            c.read(qr);
            String fn="",un="";
            int xt1=0,yt1=0,xt2=0,yt2=0;
            if(c.rs.next())
            {
              fn=c.rs.getString(2);
              un=c.rs.getString("userid");
              xt1=c.rs.getInt("p1");
              yt1=c.rs.getInt("p2");
              xt2=c.rs.getInt("xt2");
              yt2=c.rs.getInt("yt2");
              
              fk=c.rs.getString("secretkey");
            }
        String x[]=un.split("@");
           
          String root = getServletContext().getRealPath("/");
           String root1= root;
                      root= root.replace("build\\", "");
                        //out.println(root);
                        File path = new File(root+"/temp/"+x[0]);
                        File dec=new File(root1+"/Cloud/"+x[0]);
                       
                        if (!dec.exists()) {
                            boolean status = dec.mkdirs();
                        }
                        
                        String nf=root+"temp/"+x[0]+"/"+fn;
                        out.println("new File="+nf);
                       // String njpg=nf.replace(".png", ".jpg");
                     out.println("new File"+nf);
                        String lg=root1+"Cloud/"+x[0]+"/l1.png"; 
                        String sm=root1+"Cloud/"+x[0]+"/sm.png";
                        String cnv=root1+"Cloud/"+x[0]+"/c.png";
                             String cj=root1+"Cloud/"+x[0]+"/cjoin.png";
                             String org=root1+"Cloud/"+x[0]+"/org.png";
            try {
              //  out.print(path+"/"+fn);
                //out.print(dec);
               // CryptoUtils.decrypt(pk, new File(path+"/"+fn), new File(dec+"/"+fn));
                  // Utill.change(nf, nf.replace(".png", ".jpg"), "JPG");
                 SplitImage.xt1=xt1;
                 SplitImage.st=5;
      SplitImage.xt2=xt2;
        SplitImage.yt1=yt1;
  SplitImage.yt2=yt2;
  
                SplitImage.mainfile=nf;
                
                out.print( "mainf"+SplitImage.mainfile);
                SplitImage.file1=lg;
                SplitImage.file2=sm;
                    SplitImage.conv=cnv;
                    
                SplitImage.main(null);
               
                // DecodeMessage.dfn=lg;
                
                //  DecodeMessage.main(x);
                //request.setAttribute("lar",DecodeMessage.rem );
            
                 DecodeMessage.dfn=sm;
                
                  DecodeMessage.main(null);
                    //   DecodeMessage.main(x);
                       HttpSession ses=request.getSession();
                ses.setAttribute("sma",DecodeMessage.rem );
                ses.setAttribute("lar", "Cloud/"+x[0]+"/l1.png");
                  ses.setAttribute("id",id );
                  ses.setAttribute("un",x[0]);
             ses.setAttribute("fn", fn);
             
                //String xx=Utill.join(lg, sm,cj);
                // Image image1 = ImageIO.read(new File(cj));
       //BufferedImage buffered = (BufferedImage) image1;
              //  Shuffle.ReturnTwoRandomTiles(buffered, org, xt1, yt1, xt2, yt2);
                response.sendRedirect("dochome.jsp?pg=viewF");
               
            } catch (Exception ex) {
               out.print(ex);
            }
                        
        } catch (SQLException ex) {
            out.print(ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {
            String id=request.getParameter("t1");
            String pk=request.getParameter("key");
            String fk;
            out.println(pk);
            String qr="select * from filedetails inner join randompos on randompos.aid=filedetails.fid inner join largefile on largefile.lid=filedetails.fid where fid='"+id+"'";
            connect c=new connect();
            c.read(qr);
            String fn="",un="";
            int xt1=0,yt1=0,xt2=0,yt2=0;
            if(c.rs.next())
            {
              fn=c.rs.getString(2);
              un=c.rs.getString(3);
              xt1=c.rs.getInt("p1");
              yt1=c.rs.getInt("p2");
              xt2=c.rs.getInt("xt2");
              yt2=c.rs.getInt("yt2");
              fk=c.rs.getString("key");
            }
        String x[]=un.split("@");
             request.setAttribute("un",x[0]);
             request.setAttribute("fn", fn);
          String root = getServletContext().getRealPath("/");
                     // root= root.replace("build\\", "");
                        //out.println(root);
                        File path = new File(root+"/temp/"+x[0]);
                        File dec=new File(root+"/Cloud/"+x[0]);
                       
                        if (!dec.exists()) {
                            boolean status = dec.mkdirs();
                        }
                        
                        String nf=root+"temp/"+x[0]+"/"+fn;
                       // String njpg=nf.replace(".png", ".jpg");
                       
                        String lg=root+"Cloud/"+x[0]+"/l1.png"; 
                        String sm=root+"Cloud/"+x[0]+"/sm.png";
                        String cnv=root+"Cloud/"+x[0]+"/c.png";
                             String cj=root+"Cloud/"+x[0]+"/cjoin.png";
                             String org=root+"Cloud/"+x[0]+"/org.png";
            try {
                out.print(path+"/"+fn);
                out.print(dec);
               // CryptoUtils.decrypt(pk, new File(path+"/"+fn), new File(dec+"/"+fn));
                  // Utill.change(nf, nf.replace(".png", ".jpg"), "JPG");
                 SplitImage.xt1=xt1;
                 SplitImage.st=5;
      SplitImage.xt2=xt2;
        SplitImage.yt1=yt1;
  SplitImage.yt2=yt2;
                SplitImage.mainfile=nf;
                out.print( "mainf"+SplitImage.mainfile);
                SplitImage.file1=lg;
                SplitImage.file2=sm;
                    SplitImage.conv=cnv;
                    
                SplitImage.main(null);
               
                // DecodeMessage.dfn=lg;
                
                  DecodeMessage.main(x);
                //request.setAttribute("lar",DecodeMessage.rem );
            
                 DecodeMessage.dfn=sm;
                
                  DecodeMessage.main(x);
                       DecodeMessage.main(x);
                request.setAttribute("sma",DecodeMessage.rem );
                String xx=Utill.join(lg, sm,cj);
                 Image image1 = ImageIO.read(new File(cj));
       BufferedImage buffered = (BufferedImage) image1;
                Shuffle.ReturnTwoRandomTiles(buffered, org, xt1, yt1, xt2, yt2);
                RequestDispatcher rd=request.getRequestDispatcher("/dochome.jsp?pg=viewF");
                rd.forward(request, response);
            } catch (Exception ex) {
               out.print(ex);
            }
                        
        } catch (SQLException ex) {
            out.print(ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
