<%-- 
    Document   : LargeFileView
    Created on : 23 Feb, 2018, 12:41:29 PM
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
      <body>    
        <span class="close" onclick="cl()">&times;</span>
        <form >
            <input type="hidden" id="t1"  value="<%=request.getParameter("im")%>" />
            
          
            <input type="password" id="key" placeholder="Enter Your Private Key Here" ><button onclick="show()" type="button">DeCrypt now</button>
            
        </form>
        <div id="show">
      
        </div>
      

</body>
    </body>
</html>
