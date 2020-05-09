/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package doctorsearch;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author S7
 */
public class Book extends HttpServlet {

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
            HttpSession ses=request.getSession();
            String un=ses.getAttribute("user").toString();
            String doc=request.getParameter("doc");
            String dt=request.getParameter("dt");
           //String pid=request.getParameter("pid");
            String msg="";
            connect c=new connect();
            int ct=0;
            c.read("select count(*) from appintment where doc='"+doc+"' and date='"+dt+"'");
            if(c.rs.next())
            {
                
                ct=c.rs.getInt(1);
                
            }
            DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            
            Date date = null;
            try {
                date = formatter.parse(dt);
            } catch (ParseException ex) {
                Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
            }
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(date);
            // Get values from calendar.
            int day=calendar.get(Calendar.DAY_OF_WEEK);
            // out.println(day);
            int ct1=0;
            c.read("select* from consultingtime  where doc='"+doc+"' and day='"+day+"'");
            String ti="0";
            if(c.rs.next())
            {
                ti=c.rs.getString(1);
                ct1=c.rs.getInt("nobooking");
            }
            if(ct1>ct)
            {
                c.read("select * from appintment where uname='"+un+"' and date='"+dt+"' and doc='"+doc+"' ");
                if(c.rs.next())
                {
                   msg="Appointment alredy Registed";
                }
                else
                {
                    int a= c.save("insert into appintment values(0,'"+doc+"','"+un+"','"+dt+"','waiting','"+ti+"')");
                    if(a==1)
                        msg="Succsessfully Submited";
                    else
                      msg="Failed";
                    
                }
            }
            else
            {
               msg="Booking Not Possible For This Date choose another Date orAnother Doctor";
            } 
        
            RequestDispatcher rd=request.getRequestDispatcher("/pathome.jsp?pg=dcv");
         if(msg!="")
            request.setAttribute("msg",msg);
            rd.forward(request, response);
        } catch (Exception ex) {
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
        processRequest(request, response);
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
