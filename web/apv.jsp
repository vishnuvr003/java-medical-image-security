<%@page import="doctorsearch.Sendmail"%>
<%@page import="java.util.Random"%>
<%@page import="doctorsearch.connect"%>
<%
    connect c12=new connect();
if(request.getParameter("id")!=null)
    {
        Random r=new Random();
      int x=r.nextInt(1000);  
       c12.save("update docreg set status='approved' where id='"+request.getParameter("id")+"'");
      int ck=c12.save("insert into log values('"+request.getParameter("ml") +"','"+x+"','doc')");
 String msg=ck==0?"failed":" approved";
     
          
          Sendmail mailSender;
        mailSender = new Sendmail(request.getParameter("ml"),"welcome to our site","your request has been approved ; now on you can login to our sigh using "+x+" this password.");
   
      RequestDispatcher rd=request.getRequestDispatcher("/adminhome.jsp?pg=vudc");
                request.setAttribute("msg", msg);
                rd.forward(request, response); 
}
%>