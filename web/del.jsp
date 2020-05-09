<%@page import="doctorsearch.connect"%>
<%
connect cc=new connect();
int z=cc.save("delete from cate where cid='"+request.getParameter("id")+"'");
String msg=z==0?"failed":"deleted";
 RequestDispatcher rd=request.getRequestDispatcher("/adminhome.jsp?pg=adct");
                request.setAttribute("msg", msg);
                rd.forward(request, response); 
%>
