<%-- 
    Document   : DoctorViewFeedback
    Created on : 3 Aug, 2017, 1:30:34 PM
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
        <table border="1" class="table">
         
            <tr>
                <td >User</td>
            
                  <td>Feedback</td>
                   <td>Date</td>
                
                    
            </tr>
            <%
            connect co= new connect();
            co.read("select * from feedback where doc='"+session.getAttribute("user")+"' order by date desc");
            while(co.rs.next())
            {
            %>
                <tr>
                    <td><%=co.rs.getString(2)%></td>
                    <td><%=co.rs.getString(3)%></td>
                  <td><%=co.rs.getString(4)%></td>
                  
               
                  
                      
            </tr>
            <%}%>
                
        </table>/h1>
    </body>
</html>
