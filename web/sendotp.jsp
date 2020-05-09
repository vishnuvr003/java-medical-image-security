<%-- 
    Document   : sendotp
    Created on : 26 Jul, 2017, 10:21:13 AM
    Author     : S7
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function sh()
            {
                var c=/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

        if(document.f.name.value==""||document.f.mail.value=="")
        {
            alert("Must fill these fields");
        }else if(!c.test(document.f.mail.value))
        {
             alert("Provide a valid mail id");
             document.f.mail.focus();
        }else
               if(!isNaN(document.f.name.value))
             {
                 alert("Must enter alphabet");
                 document.f.name.value="";
                 document.f.name.focus();
                 
             }
        
        else
        {
        alert("Please wait for Confirmation");
                var str=document.f.name.value;
                var str1=document.f.mail.value;
                var xhttp= new XMLHttpRequest();
                xhttp.onreadystatechange=function()
                {
                   //alert(this.readyState);
                    if(this.readyState==4 && this.status==200)
                    {
                        document.getElementById("dd").innerHTML=xhttp.responseText;
                    }
                };
                xhttp.open("get","checkotp.jsp?str="+str1+"&str1="+str,true);
                xhttp.send();
            }
            }
              function aa(ff)
            {
              //  alert(ff.otp1.value);
                
                if(ff.otp1.value!=ff.otp2.value)
                {
                    alert("Inavlid OTP check. Please check your mail");
                    ff.otp2.value="";
                  return false;
                }
                else
                    return true;
            }
        </script>
    </head>
    <body>
       
       <div class="box-header" style="font-size: 14px;">
     
       
      
   </div>
  
   <div class="outer-space">
       <form action="" method="post" name="f">
    <p class="no-bottom-margin">Full Name</p>
    <div class="padding-top-8">
        <input autofocus="" class="form-control email-text" id="name" name="name" placeholder="Full Name" type="text" value="" required="">
        <span id="nameErrorBlock" class="error-block display-block"> 
  
</span>
    </div>
   

    <div style="clear:both;"></div>
  
<p class="no-bottom-margin">Email</p>
    <div class="padding-top-8">
        <input autofocus="" class="form-control email-text" id="mail" name="mail" placeholder="Email" type="email" value="" required="">
        <span id="nameErrorBlock" class="error-block display-block"> 
  
</span>
    </div>
    <div>
      <input id="csrf_token" name="csrf_token" type="hidden" value="20170302084032##4fd10d60fe92f0a69c8c0869bf43da50d482a6b2">
      <input id="intent" name="intent" type="hidden" value="profiles">
      <input id="source" name="source" type="hidden" value="">
      <input id="view_type" name="view_type" type="hidden" value="normal">
      <input id="type" name="type" type="hidden" value="doctor">
   </div>

   <div>
      <div class="padding-top-20">
          <button class="btn  btn-lg common-btn practo-btn" id="EmailRegister" onclick="sh();" type="button">Send OTP</button>
      </div>
   </div>
   </form>
   <div>
     
   </div>
  </div>
         <div id="dd" >
        </div>
    </body>
</html>
