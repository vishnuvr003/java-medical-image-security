<%-- 
    Document   : subcat
    Created on : 26 Jul, 2017, 12:58:34 PM
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
       <form name="f1" method="post" action="sbct">
        <table>
             <tr>
                <td>category</td>
                <td>
                    <select name="cr">
                        <option>-select-</option>
                        <%
                        connect c01=new connect();
                        c01.read("select * from cate");
                        while(c01.rs.next())
                        {
                            %>
                            <option value="<%=c01.rs.getString(1)%>"><%=c01.rs.getString(2)%></option>
                         <%
                         }
                         %>
                    </select>
                </td>
            </tr>
            <tr>
                <td> sub category</td>
                <td><input type="text" name="sc" required=""></td>
            </tr>
             <tr>
                <td></td>
                <td><input type="submit" value="save"></td>
            </tr>
        </table>
        </form>
    </body>
</html>
