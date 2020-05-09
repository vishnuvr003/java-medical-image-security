<%@page import="doctorsearch.connect"%>
<%
connect cc=new connect();
int z=cc.save("delete from consultingtime where ctime='"+request.getParameter("id")+"'");
String msg=z==0?"failed":"deleted";
 RequestDispatcher rd=request.getRequestDispatcher("/dochome.jsp?pg=mycon");
                request.setAttribute("msg", msg);
                rd.forward(request, response); 
%>
