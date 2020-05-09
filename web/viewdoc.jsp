<%-- 
    Document   : viewdoc
    Created on : 26 Jul, 2017, 1:44:19 PM
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
    
        <h1>Doctor details</h1>
        <table class="table" width="100%" border="1">
            <tr>
                <td>Name</td>
             
                <td>Qualification</td>
                 <td>Specialization Details</td>
                <td>Hospital Name</td>
                 <td>Experience</td>
                <td>ContactNo</td>
                  <td>Registration Number</td>
             
                 <td>email</td>
              
                 <td></td>
                <td></td>
            </tr>
           <%
           connect cc= new connect();
           cc.read("select * from docreg where status='waiting'");
           while(cc.rs.next())
           {
           %>
             <tr>
                <td><%=cc.rs.getString(2)%></td>
               
                
                 
                <td><%=cc.rs.getString(5)%></td>
                 <td><%=cc.rs.getString(6)%></td>
                 
                 <td><%=cc.rs.getString(7)%></td>
                <td><%=cc.rs.getString(8)%></td>
          
            
                <td><%=cc.rs.getString("cno")%></td>
                  <td><%=cc.rs.getString("RegistrationNumber")%></td>
                 <td><%=cc.rs.getString("mail")%></td>
               
                 <td><a href="apv.jsp?id=<%=cc.rs.getString(1)%>&ml=<%=cc.rs.getString(14)%>"><button>approve</button></a></td>
                 <td><a href="rej.jsp?id=<%=cc.rs.getString(1)%>&ml=<%=cc.rs.getString(14)%>"><button>reject</button></a></td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
