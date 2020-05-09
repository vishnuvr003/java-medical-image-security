<%-- 
    Document   : login
    Created on : Jul 24, 2017, 3:46:41 PM
    Author     : S17
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                   
    </head>
    <body>
       
       <div class="box-header" style="font-size: 14px;">
     
      
   </div>
  
  
   <div class="outer-space">
       <form action="login" method="post" name="f">
    <p class="no-bottom-margin">User Name</p><div class="padding-top-8"><input type="text" name="t1" id="t1" class="form-control" required="">
                
    </div>
   

    <div style="clear:both;"></div>
  
<p class="no-bottom-margin">Password</p>
    <div class="padding-top-8"><input type="password" name="t2" id="t2"  class="form-control" required="">
             
    </div>
            <div>
      <div class="padding-top-20"><input type="submit" class="btn  btn-lg common-btn practo-btn" id="EmailRegister" name="s1" id="s1" value="login">
                    
               </div>
   </div>
                </form>
        </div>

    </body>
</html>
