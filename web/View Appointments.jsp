<%-- 
    Document   : View Appointments
    Created on : 21 Feb, 2018, 2:27:14 PM
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
                <td>Doctor</td>
             
                <td>Date</td>
                
              
              
                <td></td>
            </tr>
           <%
           connect cc= new connect();
           cc.read("select * from appintment inner join docreg on docreg.mail=appintment.doc where appintment.status<>'waiting' and uname='"+session.getAttribute("user")+"'");
           while(cc.rs.next())
           {
           %>
             <tr>
                 <td><img src="photo/<%=cc.rs.getString("pho")%>" width="50px"><%=cc.rs.getString("name")%></td>
               
                
                 
                <td><%=cc.rs.getString(4)%></td>
               
               
                <td><a href="pathome.jsp?pg=up&id=<%=cc.rs.getString(1)%>&doc=<%=cc.rs.getString(2)%>"><button>Upload Files</button></a></td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
