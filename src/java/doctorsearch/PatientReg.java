/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package doctorsearch;

import java.io.IOException;
import java.io.PrintWriter;
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
public class PatientReg extends HttpServlet {

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
        PrintWriter out = response.getWriter();
      String t1=request.getParameter("t1");
       String t2=request.getParameter("t2");
        String t3=request.getParameter("t3");
         String t4=request.getParameter("t4");
          String t5=request.getParameter("t5");
           String t6=request.getParameter("t6");
            String t7=request.getParameter("t7");
            connect c=new connect();
            HttpSession ses=request.getSession();
            ses.setAttribute("user", t6);
            c.save("insert into patientdetails values(0,'"+t1+"','"+t2+"','"+t3+"','"+t4+"','"+t5+"','"+t6+"',null)");
            c.save("insert into log values('"+t6+"','"+t7+"','pat')");
           out.print("insert into patientdetails values(0,'"+t1+"','"+t2+"','"+t3+"','"+t4+"','"+t5+"','"+t6+"')");
            
            RequestDispatcher rd=request.getRequestDispatcher("/index.jsp?pg=upp");
                request.setAttribute("msg", "Succsessfully Registerd");
        rd.forward(request, response);
            
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
