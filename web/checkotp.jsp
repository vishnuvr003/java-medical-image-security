<%-- 
    Document   : checkotp
    Created on : 26 Jul, 2017, 10:46:41 AM
    Author     : S7
--%>

<%@page import="java.util.Random"%>
<%@page import="doctorsearch.Sendmail"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
          
        </script>
    </head>
    <body>
       <%
           
      if(request.getParameter("str")!=null)
      {
      Random r=new Random();
      int x=r.nextInt(1000);
      
          Sendmail mailSender;
       mailSender = new Sendmail(request.getParameter("str"),"One Time Password","Welcome doctor to our site. You can register to our site after verifying your One Time Password.Your One Time Password(OTP) is "+x);
    %>
      <div class="outer-space">
    <form method="post" action="otp" onsubmit="return aa(this);">
        <input type="hidden" name="name" value="<%=request.getParameter("str1")%>">
          <input type="hidden" name="mail" value="<%=request.getParameter("str")%>">
          <input type="hidden" id="otp1" name="otp1" value="<%=x%>" />

            <p class="no-bottom-margin">Otp Value</p><p><input type="text" name="otp2" class="form-control email-text" id="opt2" />
            </p> <td colspan="2"> <input type="submit" class="btn  btn-lg common-btn practo-btn" id="EmailRegister" name="b1" value="verify" />
         
 
     </form>
        
        <%
      }
       %>
      </div>
    </body>
</html>
