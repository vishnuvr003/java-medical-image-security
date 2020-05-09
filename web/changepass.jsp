<%-- 
    Document   : changepass
    Created on : 26 Jul, 2017, 4:02:04 PM
    Author     : S7
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script> function chh(v)
            {
                if(v.p2.value!=v.p3.value)
                {
                    alert("password missmatch ");
                    v.p2.value="";
                     v.p3.value="";
                      v.p2.focus();
                      return false;
                }
                return true;
            }
        </script>
    </head>
    <body>
        <form  method="post" action="cpas" onsubmit="return chh(this); ">
        <table>
            <tr>
                <td>current password</td>
                <td><input type="password"  name="p1" required="" /></td>
            </tr>
            <tr>
                <td>new password</td>
                <td><input type="password"  name="p2" required=""/></td>
            </tr>
            <tr>
                <td>retry password</td>
                <td><input type="password"  name="p3" required=""/></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit"  name="b" value="change"/></td>
            </tr>
        </table>
        </form>
    </body>
</html>
