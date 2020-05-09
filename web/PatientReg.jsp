<%-- 
    Document   : PatientReg
    Created on : 8 Feb, 2018, 2:22:47 PM
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
        <form method="post" action="PatientReg">
     <div class="outer-box center-align">
   <div class="box-header" style="font-size: 14px;">
      
        <div>
            <span id="joinPractoDoctor" class="display-inline">Join 125,000+ doctors </span>
            <a href="index.jsp?pg=lg" class="register font-14 blue-link" >Login Here..</a>
        </div>
      
   </div>
   <div class="outer-space">
    <p class="no-bottom-margin">Full Name</p>
    <div class="padding-top-8">
        <input type="text"  autofocus="" class="form-control email-text" name="t1" placeholder="Full Name" >
        <span id="nameErrorBlock" class="error-block display-block"> 
  
</span>
    </div>
    <p class="no-bottom-margin">Date Of Birth</p>
    <div class="padding-top-8">
        <input type="date" max="2000-01-01" min="1960-01-01" autofocus="" class="form-control email-text" name="t2" placeholder="Date Of Birth" />
        <span id="Span3" class="error-block display-block"> 
  
</span>
    </div>
    <p class="no-bottom-margin">Address</p>
    <div class="padding-top-8">
        <input type="text" autofocus="" class="form-control email-text" name="t3" placeholder="Address" />
        <span id="Span4" class="error-block display-block"> 
  
</span>
    </div>
    <p class="no-bottom-margin">Contact Number</p>
    <div class="padding-top-8">
        <input type="text"  autofocus="" class="form-control email-text" name="t4" placeholder="Contact Number" />
        <span id="Span5" class="error-block display-block"> 
  
</span>
    </div>
    <p class="no-bottom-margin">Gender</p>
    <div class="padding-top-8">
        <input type="radio" name="t5" value="Male" />
            Male
             <input type="radio" name="t5" value="Female"/>Female
    
        <span id="Span6" class="error-block display-block"> 
  
</span>
    </div>
    <div class="padding-top-8">
        <p class="no-bottom-margin">Email Id</p>
        <div class="padding-top-8">
               <input type="text"   class="form-control email-text " id="t2" 
                   name="t6" placeholder="Email" />
          
        </div>
        <span id="mobileErrorBlock" class="error-block display-block">
  
</span>
    </div>
    
   
      <div class="padding-top-8">
        <p class="no-bottom-margin">Password</p>
        <div class="padding-top-8">
           
           <input type="text"   class="form-control email-text " id="TextBox1" 
                   name="t7" placeholder="Password" />
          
        </div>
        <span id="Span2" class="error-block display-block">
  
</span>
    </div>
<div class="padding-top-8">
        <p class="no-bottom-margin"></p>
        <div class="padding-top-8">
            <input type="submit" class="btn  btn-lg common-btn practo-btn" id="Button1" 
                   value="Submit"/>
          
        </div>
        <span id="Span1" class="error-block display-block">
  
</span>
    </div>
    <div>
      
   &nbsp;&nbsp;&nbsp;
   </div>

  </div>
 </div>
        </form>
    </body>
</html>
