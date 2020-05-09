<%-- 
    Document   : DoctorViewAppontments
    Created on : 21 Feb, 2018, 2:44:05 PM
    Author     : S7
--%>

<%@page import="doctorsearch.connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <h1>My Appointments</h1>
        <table class="table" width="100%" border="1">
            <tr>
                <td>User</td>
             <td>Name</td>
             <td>Gender</td>
             <td>Dateof Birth</td>
                <td>Date Of Booking</td>
                <td>Approve</td>
                
              
              
                <td></td>
            </tr>
           <%
           connect cc= new connect();
           cc.read("select * from appintment inner join patientdetails on patientdetails.uname=appintment.uname  where status='waiting' and doc='"+session.getAttribute("user")+"'");
           while(cc.rs.next())
           {
           %>
             <tr>
                <td><%=cc.rs.getString(3)%></td>
               <td><%=cc.rs.getString("name")%></td>
                 <td><%=cc.rs.getString("gender")%></td>
                  <td><%=cc.rs.getString("dob")%></td>
                <td><%=cc.rs.getString(4)%></td>
                 <td><img src="pphoto/<%=cc.rs.getString("photo")%>" width="50px" ></td>
                          
               
                <td><a href="dochome.jsp?pg=up&id=<%=cc.rs.getString(1)%>&uname=<%=cc.rs.getString(3)%>"><button>Approve</button></a></td>
            </tr>
            <%}
            
            if(request.getParameter("id")!=null)
            {
            cc.save("update appintment set status='approved' where aid='"+request.getParameter("id")+"'");
            response.sendRedirect("dochome.jsp?pg=up");
            }
            %>
        </table>
            
    </body>
</html>
