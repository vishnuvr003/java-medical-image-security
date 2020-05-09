<%-- 
    Document   : getIm
    Created on : 5 Feb, 2018, 3:28:09 PM
    Author     : S7
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    
    <body>    
        <span class="close" onclick="cl()">&times;</span>
        <form method="post" action="Decode">
            <input type="hidden" name="t1"  value="<%=request.getParameter("id")%>" />
          
            
            <button type="submir">DeCrypt now</button>
            
        </form>
        <div id="show">
       
        </div>
      

</body>
</html>
