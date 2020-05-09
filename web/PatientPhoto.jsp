<%-- 
    Document   : PatientPhoto
    Created on : 4 Mar, 2018, 10:25:43 AM
    Author     : S7
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h3>Upload Pho Here </h3>
        <form name="f1" method="post" action="Pupload" enctype="multipart/form-data" class="form-group">
            <table width="100%" class="table" >
            <tr>
                <td>choose your file</td>
                <td><input type="file" name="fl" id="fl" required="" ></td>
            </tr>
             <tr>
                <td></td>
                <td><input type="submit" value="upload"></td>
            </tr>
        </table>
        </form>
        
    </body>
</html>
