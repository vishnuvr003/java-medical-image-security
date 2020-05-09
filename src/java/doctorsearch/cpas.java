/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package doctorsearch;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
public class cpas extends HttpServlet {

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
        processRequest(request, response);
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
        try {
            String msg="",pt="/index.jsp";
            HttpSession ss=request.getSession();
            connect c=new connect();
            c.read("select * from log where uname='"+ss.getAttribute("user").toString()+"' and pass='"+request.getParameter("p1")+"'");
            if(c.rs.next())
            {
          
         int h= c.save("update log set pass='"+request.getParameter("p2")+"' where uname='"+ss.getAttribute("user").toString()+"'");
         msg=h==0?"failed":"changed";
           
           if(c.rs.getString(3).equals("doc"))
           {
           pt="/dochome.jsp";
           }else if(c.rs.getString(3).equals("admin"))
           {
           pt="/adminhome.jsp";
           }
           }
           else
           {
           msg="invalid old  password";
           }
            
              RequestDispatcher rd=request.getRequestDispatcher(pt);
                request.setAttribute("msg", msg);
                rd.forward(request, response);
            
        } catch (Exception ex) {
       PrintWriter out = response.getWriter();
       out.println(ex);
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
