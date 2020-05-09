<%-- 
    Document   : DocViewFile
    Created on : 21 Feb, 2018, 2:53:01 PM
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
                <td>Photo</td> 
              
              
                <td></td>
            </tr>
           <%
           connect cc1= new connect();
           cc1.read("select * from appintment inner join patientdetails on patientdetails.uname=appintment.uname  where status<>'waiting' and doc='"+session.getAttribute("user")+"'");
           while(cc1.rs.next())
           {
           %>
             <tr>
                <td><%=cc1.rs.getString(3)%></td>
               <td><%=cc1.rs.getString("name")%></td>
                 <td><%=cc1.rs.getString("gender")%></td>
                  <td><%=cc1.rs.getString("dob")%></td>
                <td><%=cc1.rs.getString(4)%></td>
               
                      <td><img src="pphoto/<%=cc1.rs.getString("photo")%>" width="50px" ></td>
                      <td><a href="dochome.jsp?pg=fup&id1=<%=cc1.rs.getString(1)%>&uname=<%=cc1.rs.getString(3)%>"><button class="btn btn-info">View Files</button></a></td>
            </tr>
            <%}
           %>
        </table><%
            
            if(request.getParameter("id1")!=null)
            {
                %>
                <table class="table">
                    <tr><td>File Id</td><td>File Name</td><td>Uplaoded date</td><td>Decrypt And Download</td></tr>
            <%
            cc1.read("select * from filedetails where aid='"+request.getParameter("id1")+"'");
            while(cc1.rs.next())
            {
            %>
                    <tr>
            <td><%=cc1.rs.getString(1)%></td>
            <td><%=cc1.rs.getString(2)%></td>
            <td><%=cc1.rs.getString(4)%></td>
            <td><a href="dochome.jsp?pg=vf&aid=<%=cc1.rs.getString(1)%>">View File Details</a></td>
                    </tr> 
                    <%
            }%>     </table>
            <%
            }
            %>
                  
           
    </body>
</html>
