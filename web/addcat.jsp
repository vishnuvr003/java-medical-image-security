<%-- 
    Document   : addcat
    Created on : 26 Jul, 2017, 12:50:41 PM
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
        <form name="f1" method="post" action="adct">
        <table>
            <tr>
                <td>category</td>
                <td><input type="text" name="cr" required=""></td>
            </tr>
             <tr>
                <td></td>
                <td><input type="submit" value="save"></td>
            </tr>
        </table>
        </form>
        <hr />
        <table width="100%" border="1" class="table">
            <tr>
                <td class="">category</td>
                <td></td>
            </tr>
            <%
            connect x0=new connect();
            x0.read("select * from cate");
            while(x0.rs.next())
            {
            %>
             <tr>
                <td><%=x0.rs.getString(2)%></td>
                <td><a href="del.jsp?id=<%=x0.rs.getString(2)%>"><button>del</button></a></td>
            </tr>
            <%
            }
            %>
        </table>
        
    </body>
</html>
