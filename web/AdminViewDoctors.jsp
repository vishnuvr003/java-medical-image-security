<%-- 
    Document   : AdminViewDoctors
    Created on : 9 Mar, 2018, 2:05:58 PM
    Author     : Administrator
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
           connect cc1= new connect();
           cc1.read("select * from docreg where status<>'waiting'");
           while(cc1.rs.next())
           {
           %>
             <tr>
                <td><img src="photo/<%=cc1.rs.getString("pho")%>" width="50px"><%=cc1.rs.getString(2)%></td>
               
                
                 
                <td><%=cc1.rs.getString(5)%></td>
                 <td><%=cc1.rs.getString(6)%></td>
                 
                 <td><%=cc1.rs.getString(7)%></td>
                <td><%=cc1.rs.getString(8)%></td>
          
            
                <td><%=cc1.rs.getString("cno")%></td>
                  <td><%=cc1.rs.getString("RegistrationNumber")%></td>
                 <td><%=cc1.rs.getString("mail")%></td>
               
                         </tr>
            <%}%>
        </table>
    </body>
</html>
