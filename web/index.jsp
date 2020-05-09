<%-- 
    Document   : index.jsp
    Created on : 25 Jul, 2017, 10:52:23 AM
    Author     : S7
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Practo Accounts</title>
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      
      
      <script type="text/javascript" async="" src="./Practo Accounts_files/mixpanel-2-latest.min.js.download"></script><script async="" src="./Practo Accounts_files/analytics.js.download"></script><script type="text/javascript">
        window.mpkey = "85d643d7bc71611832663cd683666848";
        window.isIN = "IN" == "IN" ? true : false ;
      </script>
      <link rel="stylesheet" media="screen,print" href="./Practo Accounts_files/responsive-layout.css">
      
      
      <script type="text/javascript" src="./Practo Accounts_files/responsive-layout.js.download"></script>
      
      <!--[if lt IE 9]-->
      <script src="./Practo Accounts_files/html5shiv.min.js.download" type="text/javascript"></script>
      <script src="./Practo Accounts_files/respond.min.js.download" type="text/javascript"></script>
      <!--[endif]-->
      <link rel="stylesheet" href="./Practo Accounts_files/fonts_icons.min.css">
      <link rel="stylesheet" type="text/css" href="./Practo Accounts_files/css">
      
      
      <link rel="icon" href="https://accounts.practo.com/static/images/favicon-32x32.png" sizes="32x32">    
      <style type="text/css">
      body{
        font-family: 'Camphor' !important;
      }
      .navbar-default {
        box-shadow: none;
        background: none;
      }
   </style>
    
<style>
.password-strength {
  display: none;
}
.password-strength > span {
  font-weight: bolder;
}
.password-strength > span.very-weak {
  color: #FF2D00;
}
.password-strength > span.weak {
  color: #FF7800;
}
.password-strength > span.moderate {
  color: #FFEB01
}
.password-strength > span.strong {
  color: #AAE000;
}
.password-strength > span.very-strong {
  color: #00A500;
}
</style>

  </head>
  <body>
      <div class="" id="">
      <header class="navbar-header">

                    <a href="index.jsp" class="navbar-brand">
                    <img src="assets/img/logo.png" alt="" /></a>
                </header>
          <marquee><font color="red" size="3" ><b>Get Your Doctor Here..</b></font></marquee>
         
          <HR/>
    
          <div class="clearfix secondary-nav" style="width:100%;">
              <ul class="list" style="width:100%">
                     <li><a href="web/index.html" id="loginLink">Home</a></li>
                 <li><a href="index.jsp?pg=lg" id="loginLink">Login</a></li>
                 <li><a href="index.jsp?pg=rg" id="registerLink">Doctor</a></li>
                   <li><a href="index.jsp?pg=pat" id="registerLink">Patient</a></li>
              </ul>
          </div>
         
  

      
      <div style="clear:both;"></div>
      <div id="variableHeightContainer" class="variableHeightContainer variableHeightContainer-fit">
        
        
      
      


<div class="graphicImage">
    <img class="img-responsive" src="img/Medicine.jpg" onerror="this.src=&#39;/static/images/illustration.png&#39;" alt="Practo Accounts">
</div>

<div class="rightRegisterForm">
  <div class="outer-box center-align" >
       <%
       if(request.getAttribute("msg")!=null)
       {
       out.println("<script>alert('"+request.getAttribute("msg")+"');</script>");
       }
          String pg ="";
      if(request.getParameter("pg")!=null)
      {  
          pg=request.getParameter("pg");
      }
      else
      {
      response.sendRedirect("web/index.html");
      }
      if(pg.equals("lg"))
      {
          %><%@include  file="login.jsp"%>
          <%
      }else if(pg.equals("rg"))
      {%>
      <%@include file="sendotp.jsp" %>
   <%}else if(pg.equals("doc"))
   {
          %>
          
          <%@include file="docreg.jsp" %>
          <%}
   
   else if(pg.equals("upp"))
   {
          %>
          
          <%@include file="PatientPhoto.jsp" %>
          <%}
   else if(pg.equals("pat"))
   {
          %>
          <%@include  file="PatientReg.jsp" %>
  <%} else if(pg.equals("up"))
  {%><%@include file="uploadfile.jsp" %>
  <%}%>
  </div>

</div>

<style type="text/css">
  #navCollapse,
 #bottomNavCollapse {
     background-color: #FFFFFF;
 }
 nav[role='navigation'] {
     box-shadow: none;
     border: none;
 }
 .navbar-header {
     background-color: white;
 }
 .connectFacebookBtn {
     margin-bottom: 0%;
 }
 .hrContainer {
     margin-top: 1%;
     margin-bottom: 1%;
     width: 410px;
 }
 .tc {
     text-align: right;
 }
 .fbMsg {
  position: relative;
  top: -10px;
 }
 .join-practo {
   visibility: hidden;
 }
 #registerLink {
    color: #14bef0;
    font-weight: bold;
}
 #loginLink {
    color: #14bef0;
    font-weight: bold;
}
li > a#registerLink {
    border-bottom: 3px solid #14bef0;
  }
  li > a#loginLink {
    border-bottom: 3px solid #14bef0;
  }
 #registerLink:hover {
  text-decoration: none;
 }
 #loginLink:hover {
  text-decoration: none;
 }
</style>
<script type="text/javascript">
var fb_login_fail = localStorage.getItem('fb_login_fail');
if (fb_login_fail == "true") {
  localStorage.setItem('fb_login_fail',false);
  $('.graphicImage').before('<div class="alert alert-info fbMsg" role="alert">Facebook signup has been discontinued. Please register instead.</div>')
  }
  var registerEmailFn  =  function(event){
       var mobile = document.getElementById("mobile");
       var email = document.getElementById("email");
       var password =  document.getElementById("password");
       var name =  document.getElementById("name");
       var isPatientSignup = document.getElementById('is-patient-signup');
       if (mobile) {
        var mobileValidation = PRC.validator.Empty(mobile, null, 'placeholder');
       };
       if (email) {
        var emailValidation = PRC.validator.Empty(email, null, 'placeholder');
       }
       var passwordValidation = PRC.validator.Empty(password, null, 'placeholder');
       var nameErrorBlock = document.getElementById("nameErrorBlock");
       var mobileErrorBlock = document.getElementById("mobileErrorBlock");
       var emailErrorBlock = document.getElementById("emailErrorBlock");
       var passwordErrorBlock = document.getElementById("passwordErrorBlock");
       var hasError = false;

       if( typeof mobileValidation != "undefined" && !mobileValidation){
           if(PRC.settings.gaTrackingCode  && PRC.settings.gaTrackingCode.buttonClick){


              var pathName = window.location.pathname;
                if (pathName.indexOf('patient')>-1) {
                    PRC.settings.gaTrackingCode.buttonClick("PatRegFail_Email");
                  }else if(pathName.indexOf('doctor')>-1){
                      PRC.settings.gaTrackingCode.buttonClick("DocRegFail_Email");
                  }

          }

           mobileErrorBlock.innerHTML = mobile.errors[0];
           mobileErrorBlock.style.display="block";
           hasError = true;
           event.preventDefault();
       }
       else
          (typeof mobileErrorBlock != "undefined" && mobileErrorBlock) ? mobileErrorBlock.style.cssText = " " : "";

        if( typeof emailValidation != "undefined" && !emailValidation){
           if(PRC.settings.gaTrackingCode  && PRC.settings.gaTrackingCode.buttonClick){


              var pathName = window.location.pathname;
                if (pathName.indexOf('patient')>-1) {
                    PRC.settings.gaTrackingCode.buttonClick("PatRegFail_Email");
                  }else if(pathName.indexOf('doctor')>-1){
                      PRC.settings.gaTrackingCode.buttonClick("DocRegFail_Email");
                  }

          }

           emailErrorBlock.innerHTML = email.errors[0];
           emailErrorBlock.style.display="block";
           hasError = true;
           event.preventDefault();
       }
       else
          (typeof emailErrorBlock != "undefined" && emailErrorBlock) ? emailErrorBlock.style.cssText = " " : "";

        if(isPatientSignup) {
           var nameValidation = PRC.validator.Empty(name, null, 'placeholder');
           if(!nameValidation){
              nameErrorBlock.innerHTML = name.errors[0];
              nameErrorBlock.style.display="block";
              hasError = true;
              event.preventDefault();
           }
           else {
              name.value = name.value.trim();
              nameErrorBlock.innerHTML = '';
              nameErrorBlock.style.cssText = " ";
           }
           name.errors= [];
        }
       if(!passwordValidation){

              if(PRC.settings.gaTrackingCode  && PRC.settings.gaTrackingCode.buttonClick){
                 var pathName = window.location.pathname;
                  if (pathName.indexOf('patient')>-1) {
                      PRC.settings.gaTrackingCode.buttonClick("PatRegFail_Email");
                    }else if(pathName.indexOf('doctor')>-1){
                        PRC.settings.gaTrackingCode.buttonClick("DocRegFail_Email");
                    }

              }

              passwordErrorBlock.innerHTML = password.errors[0];
              passwordErrorBlock.style.display="block";

              if(event.preventDefault)
                event.preventDefault();
              else{
                // event for enter button since event is nt associated for window object
                event.defaultPrevented =  true;
              }
              hasError = true;
       }
       else
        passwordErrorBlock.style.cssText = " ";

       if(!hasError){

           if(PRC.settings.gaTrackingCode  && PRC.settings.gaTrackingCode.buttonClick){

              var pathName = window.location.pathname;
                  if (pathName.indexOf('patient')>-1) {
                    PRC.settings.gaTrackingCode.buttonClick("PatReg_Email");
                    //mixpanel Patient tracking -- start
                      if (PRC.settings.mpTrackingCode && PRC.settings.mpTrackingCode.buttonClick) {
                          var eventObj = {
                              "name" : "Account Action",
                              "Button Type": "Patient Register",
                              "Authentication Method": "Mobile",
                              "User Mobile" : (mobile) ? mobile.value : "",
                              "element": "register button",
                              "action" : "click",
                              "feature" : "accounts",
                              "screen" : "patientregister",
                              "platform": "web"
                          };
                          PRC.settings.mpTrackingCode.buttonClick(eventObj);
                      }
                      //mixpanel Patient tracking -- end
                  } else if(pathName.indexOf('doctor')>-1){
                    PRC.settings.gaTrackingCode.buttonClick("DocReg_Email");
                    //mixpanel Doctor tracking -- start
                    if (PRC.settings.mpTrackingCode && PRC.settings.mpTrackingCode.buttonClick) {
                        var eventObj = {
                            "name" : "Account Action",
                            "Button Type": "Doctor Register",
                            "Authentication Method": "Email",
                            "User Email" : (email) ? email.value : "",
                            "element": "register button",
                            "action" : "click",
                            "feature" : "accounts",
                            "screen" : "doctorregister",
                            "platform": "web"
                        };
                        PRC.settings.mpTrackingCode.buttonClick(eventObj);
                    }
                    //mixpanel Doctor tracking -- end
                  }

           }
           document.getElementById('register_email_form').submit();
       }
       (mobile) ? mobile.errors= [] : "";
       (email) ? email.errors= []: "";
       password.errors= [];

       event.stopPropagation();
   };

 var checkMobileFn =  function(event){
         var mobile = document.getElementById("mobile");
         if (mobile) {
           var msg = "Invalid Mobile Number";
           if(mobile.value.trim().length){
                var errorBlock =  document.getElementById("mobileErrorBlock");
              if(!PRC.validator.Empty(mobile, msg, 'placeholder') ){
                errorBlock.innerHTML = msg;
                errorBlock.style.display = "block";

              }else{
                   errorBlock.innerHTML = "";
                   errorBlock.style.display = "none";

              }
              mobile.errors = [];
              event.preventDefault();
           }

           event.stopPropagation();
          }
   };

   var doctor  = function(event){
        if(PRC.settings.gaTrackingCode  && PRC.settings.gaTrackingCode.linkClick){
            PRC.settings.gaTrackingCode.linkClick("DocReg_ForkFromPat", function(){
              window.location.replace('/doctor_signup' + window.location.search);
            });
         }
         event.stopPropagation();
         event.preventDefault();
   };

   var notDoctor = function(event) {
             if(PRC.settings.gaTrackingCode  && PRC.settings.gaTrackingCode.linkClick){
              PRC.settings.gaTrackingCode.linkClick("PatReg_ForkFromDoc", function(){
                var url = '/new_patient_signup' + window.location.search;
                window.location.replace(url.replace('intent=software', 'intent=accounts'));
              });
           }
          event.stopPropagation();
          event.preventDefault();
   };

   var terms = function(event){
         //mixpanel Patient tracking -- start
          if (PRC.settings.mpTrackingCode && PRC.settings.mpTrackingCode.buttonClick) {
              var eventObj = {
                  "name" : "Accounts Action",
                  "Link Type": "Patient Register Terms Link",
                  "element": "terms link",
                  "action" : "click",
                  "feature" : "accounts",
                  "screen" : "patientregister",
                  "platform": "web"
              };
              PRC.settings.mpTrackingCode.buttonClick(eventObj);
          }
          //mixpanel Patient tracking -- end
   };


   var obj = {
      init: function(eleIdArr){
            if(eleIdArr && eleIdArr.length){
             var length = eleIdArr.length;
             for(var iloop=0; length--;iloop++){
                 var eleObj = eleIdArr[iloop];
                 if(document.getElementById(eleObj.eleId))
                     document.getElementById(eleObj.eleId).addEventListener(eleObj.event, this, eleObj.bubble?eleObj.bubble:false);
             }
           }

          window.addEventListener("keypress", function(event){
                if(event.keyCode == 13){
                  var registerEmailBtn =  document.getElementById("EmailRegister");
                  registerEmailBtn.onclick = registerEmailFn;
                  registerEmailBtn.onclick.apply(registerEmailBtn,[event]);
                }

          } , false);

      }
      ,handleEvent: function(event){
          switch(event.target.id){
              case "EmailRegister":
                                    registerEmailFn(event);
                                    break;
              case "EmailRegisterImage":
                                    registerEmailFn(event);
                                    break;

              case "mobile"        :
                                    checkMobileFn(event);
                                    break;

              case "doctor"        :
                                    doctor(event);
                                    break;

              case "notDoctor"     :
                                    notDoctor(event);
                                    break;
              case "terms"     :
                                    terms(event);
                                    break;

          };

      }
   };


   (function(eventObj){

      var eleArr = [
                       {"eleId": "EmailRegister", "event": "click"},
                       {"eleId": "EmailRegisterImage", "event": "click"},
                       {"eleId": "EmailRegister", "event": "click"},
                       {"eleId": "EmailRegister", "event": "click"},
                       {"eleId": "email", "event": "blur"},
                       {"eleId": "doctor", "event": "click"},
                       {"eleId": "notDoctor", "event": "click"},
                       {"eleId": "mobile", "event": "blur"},
                       {"eleId": "terms", "event": "click"}
                     ];
      eventObj.init(eleArr);


    if(window.opener && window.opener.PRC){
        window.opener.PRC.fbPopupFlag = true;
        window.opener.PRC.redirectURL = window.location.href.split('#')[0];
    }

   })(obj)
   if($("#mobileErrorBlock").text().trim()){
     $('#mobile').addClass('borderRed');
   }
   var joinPractoDoctor = document.getElementById('joinPractoDoctor');
   if(joinPractoDoctor ){
     var joinPractoDoctorHtml = joinPractoDoctor.innerHTML;
     if(joinPractoDoctorHtml.length > 21) {
       $('.box-header').css({
         "font-size": "14px"
       });
     }
   }


</script>
<script src="./Practo Accounts_files/zxcvbn-4-4-2.js.download">
</script>
<script>
$(function () {
  $('#password').on('input', function() {
    var password = $(this).val();
    if (password && typeof zxcvbn !== "undefined") {
      var user_dictionary = [
          'practo',
          $('#mobile').val()
      ];
      Array.prototype.push.apply(user_dictionary, $('#name').val().split(' '));
      var result = zxcvbn(password, user_dictionary);
      var strength_label = [
        ['very-weak', "Very Weak"],
        ['weak', "Weak"],
        ['moderate', "Moderate"],
        ['strong', "Strong"],
        ['very-strong', "Very Strong"]
      ][result.score];
      $('#password-strength-indicator').removeClass();
      $('#password-strength-indicator').addClass(strength_label[0]);
      $('#password-strength-indicator').html(strength_label[1]);
      $('.password-strength').css('display', 'block');
    } else {
      $('.password-strength').css('display', 'none');
    }
  });
});
</script>

      
        <script type="text/javascript" src="./Practo Accounts_files/responsive-layoutAMDMod.js.download"></script>
      
      <script type="text/javascript">
        window.emptyMsg = "field cannot be empty";
      </script>
         <div style="clear:both;"></div>
      </div>
       <div style="clear:both;"></div>
       <div style="margin-bottom:40px" id="margin-div"></div>

        
        

     </div>
     
          <style type="text/css">
  .practo_GlobalFooter {
    padding:0 0 0 0;
    box-sizing: border-box;
    color: #fff;
    background: #28328c;
    position: static;
    height: auto;
  }
  .practo_GlobalFooter .practo-logo {
    background: url('../static/images/practo_logo.svg') no-repeat;
    background-position: 40px 17px;
    width: 213px;
    height: 50px;
    margin: 15px auto;
    display: block;
  }
  .practo_GlobalFooter .footer-block {
    max-width: 1280px;
    margin: 0 auto;
    padding: 0 0 20px 0;
  }
  .practo_GlobalFooter .footer-container {
    padding: 20px 50px;
  }
  .practo_GlobalFooter .g-footer-column {
    width: 24%;
    display: table-cell;
  }
  .practo_GlobalFooter .g-footer-column h6 {
    margin: 10px 0;
  }
  .practo_GlobalFooter .g-footer-column .g-footer-column-links a {
    color: #fff;
    text-decoration: none !important;
    margin: 5px 0;
    font-size: 14px;
    line-height: 1.5;
  }
  .practo_GlobalFooter .g-footer-column .g-footer-column-links a:hover {
    text-decoration: underline !important;
  }
  .practo_GlobalFooter .copy-rights-wrap {
    text-align: center;
  }
  .practo_GlobalFooter .h4,
  .practo_GlobalFooter .g-footer-column h6 {
    font-weight: bold;
    font-size: 14px;
    line-height: 1.25;
  }
  .practo_GlobalFooter .para,
  .practo_GlobalFooter .practo_GlobalFooter {
    font-size: 14px;
    line-height: 1.25;
  }
  .practo_GlobalFooter .small-reg,
  .practo_GlobalFooter .g-footer-column .g-footer-column-links a,
  .practo_GlobalFooter .copy-rights-wrap {
    font-size: 14px;
    line-height: 1.5;
  }
  .practo_GlobalFooter .small-bold {
    font-weight: bold;
    font-size: 12px;
    line-height: 1.5;
  }
  .practo_GlobalFooter .center {
    float: none;
    display: block;
    margin: 0 auto;
    text-align: center;
  }
  .practo_GlobalFooter .ialign,
  .practo_GlobalFooter .practo-logo {
    vertical-align: middle;
    display: inline-block;
  }

  @media (max-width: 800px) {
    .error-page-body {
      height: initial;
    }
    .error-page-image {
      display: block;
      width: 100%;
      height: initial;
      text-align: center;
      padding-top: 30px;
    }
    .error-page-image img{
      width: 70%;
    }
    .error-page-body-text {
      display: block;
      padding: 30px 20px 30px 20px;
      width: calc(100% - 40px);
      height: initial;
    }
    .error-page-description {
      font-size: 24px;
      padding-right: 20px;
    }

    .error-page-homepage-link{
      font-size: 18px;
    }
    .practo_GlobalFooter .footer-container {
      max-width: 100%;
      padding: 0;
    }
    .practo_GlobalFooter .h4,
    .practo_GlobalFooter .g-footer-column h6 {
      font-weight: bold;
      font-size: 14px;
      line-height: 18px;
    }
    .practo_GlobalFooter .responsive-hide {
      display: none;
      height: 0px;
      opacity: 0;
      -webkit-transition: height 0.5s linear;
      -moz-transition: height 0.5s linear;
      -ms-transition: height 0.5s linear;
      -o-transition: height 0.5s linear;
      transition: height 0.5s linear;
    }
    .practo_GlobalFooter .g-footer-column {
      width: 100%;
      display: block;
      box-sizing: border-box;
      padding: 0 20px;
      border-bottom: 2px solid rgba(255, 255, 255, 0.2);
    }
    .practo_GlobalFooter .g-footer-column.open .g-footer-column-links {
      height: auto;
      display: block;
      opacity: 1;
      -webkit-transition: height 0.5s linear;
      -moz-transition: height 0.5s linear;
      -ms-transition: height 0.5s linear;
      -o-transition: height 0.5s linear;
      transition: height 0.5s linear;
    }
    .practo_GlobalFooter .g-footer-column.open h6:after {
      content: "-";
      float: right;
    }
    .practo_GlobalFooter .g-footer-column h6 {
      margin: 0;
      padding: 15px 0;
      cursor: pointer;
    }
    .practo_GlobalFooter .g-footer-column h6:after {
      content: "\e953";
      font-family: 'practicon' !important;
      float: right;
    }
    .practo_GlobalFooter .g-footer-column .g-footer-column-links div {
      margin: 10px 0;
    }
  }
</style>
<footer class="practo_GlobalFooter bg-dark-blue">
  <div class="bg-dark-blue footer-block clearfix">
    <div class="g-footer-new clearfix">
      <div class="footer-container">
        <div class="g-footer-column">
          <div class="g-footer-column-head">
            <h6>Practo</h6>
          </div>
          <div class="g-footer-column-links responsive-hide">
            <div><a href="https://www.practo.com/company/about" target="_blank" title="About">About</a></div>
            <div><a href="https://blog.practo.com/" target="_blank" title="blog">Blog</a></div>
            <div><a href="https://www.practo.com/company/careers" target="_blank" title="Careers">Careers</a></div>
            <div><a href="https://www.practo.com/company/press" target="_blank" title="Press">Press</a></div>
            <div><a href="https://www.practo.com/company/contact" target="_blank" title="Contact Us">Contact</a></div>
          </div>
        </div>
        <div class="g-footer-column">
          <div class="g-footer-column-head">
            <h6>For patients</h6>
          </div>
          <div class="g-footer-column-links responsive-hide">
            <div><a href="https://www.practo.com/consult/new_question?source=Footer-AskFreeQuestion" target="_blank" title="ask">Ask free health questions</a></div>
            <div><a href="https://www.practo.com/" title="Doctor Search">Search for doctors</a></div>
            <div><a href="https://www.practo.com/" title="Clinic Search">Search for clinics</a></div>
            <div><a href="https://www.practo.com/healthfeed" target="_blank" title="Healthfeed">Health Feed</a></div>
            <div><a href="https://www.practo.com/consult?source=Footer-ConsultFeed" target="_blank" title="Consult a doctor">Consult a Doctor</a></div>
            <div><a href="https://www.practo-order.com/" title="Order Medicines">Order medicines</a></div>
            <div><a href="https://www.practo.com/mobile?pid=inclinic&amp;c=poster" target="_blank" title="Practo App">Practo app</a></div>
            <div><a href="https://health.practo.com/" target="_blank" title="Health blog">Health blog</a></div>
          </div>
        </div>
        <div class="g-footer-column">
          <div class="g-footer-column-head">
            <h6>For doctors</h6>
          </div>
          <div class="g-footer-column-links responsive-hide">
            <div><a href="https://www.practo.com/for-doctors/ray" target="_blank" title="Ray by Practo">Ray by Practo</a></div>
            <div><a href="https://www.practo.com/consult" target="_blank" title="Practo Consult">Practo Consult</a></div>
            <div><a href="https://www.practo.com/for-doctors/health-feed" target="_blank" title="Practo Health Feed">Practo Health Feed</a></div>
            <div><a href="https://www.practo.com/for-doctors/profile" target="_blank" title="Practo Profile">Practo Profile</a></div>
            <div><a href="https://www.practo.com/for-doctors/reach" target="_blank" title="Practo Reach">Practo Reach</a></div>
            <div><a href="https://www.practo.com/for-doctors/ray/features#rayTab" target="_blank" title="Practo Tab">Ray Tab</a></div>
            <div><a href="https://doctors.practo.com/" target="_blank" title="Doctor Blog">Doctor blog</a></div>
            <div><a href="https://resources.practo.com/doctors" target="_blank" title="Resources">Resources</a></div>
          </div>
        </div>
        <div class="g-footer-column">
          <div class="g-footer-column-head">
            <h6>More</h6>
          </div>
          <div class="g-footer-column-links responsive-hide">
            <div><a href="https://help.practo.com/" target="_blank" title="Help">Help</a></div>
            <div><a href="https://developers.practo.com/" target="_blank" title="Developers">Developers</a></div>
            <div><a href="https://www.practo.com/company/privacy" target="_blank" title="Privacy">Privacy Policy</a></div>
            <div><a href="https://www.practo.com/company/terms" target="_blank" title="Terms">Terms &amp; Conditions</a></div>
            <div><a href="https://www.practo.com/sitemap" target="_blank" title="Sitemap">Healthcare directory</a></div>
          </div>
        </div>
        <div class="g-footer-column">
          <div class="g-footer-column-head">
            <h6>Social</h6>
          </div>
          <div class="g-footer-column-links responsive-hide">
            <div><a href="https://www.facebook.com/practo" rel="nofollow" target="_blank" title="Facebook:Connect">Facebook</a></div>
            <div><a href="https://twitter.com/Practo" rel="nofollow" target="_blank" title="Twitter:Connect">Twitter</a></div>
            <div><a href="https://www.linkedin.com/company/practo-technologies-pvt-ltd" rel="nofollow" target="_blank" title="LinkedIn:Connect">LinkedIn</a></div>
            <div><a href="https://www.youtube.com/user/PractoSupport" rel="nofollow" target="_blank" title="Youtube:Connect">YouTube</a></div>
            <div><a href="https://github.com/practo" rel="nofollow" target="_blank" title="GitHub:Connect">GitHub</a></div>
          </div>
        </div>
        <div class="clear"></div>
      </div>
    </div>
    <div class="copy-rights-wrap clearfix">
      <div class="footer-container clearfix">
        <div class="center">
          <i class="practo_GlobalFooter practo-logo"></i>
        </div>
        <div class="center copyright">Copyright © 2017, Practo. All rights reserved.</div>
      </div>
    </div>
  </div>
</footer>
<script type="text/javascript">
  $('.g-footer-column-head').on('click', function(e) {
    if($(e.currentTarget).parent('.g-footer-column').hasClass('open')){
      $('.g-footer-column').removeClass('open');
    } else {
      $('.g-footer-column').removeClass('open');
      $(e.currentTarget).parent('.g-footer-column').addClass('open');
    }
  });
</script>
      

      <script type="text/javascript">

         var navButton =  function(event){
             var navCollapse =  document.getElementById("navCollapse");
             var style =  window.getComputedStyle(navCollapse);
             if(style.display == "none")
                   navCollapse.style.display = "block";
             else
                   navCollapse.style.display = "none";
             event.preventDefault();
             event.stopPropagation();
           };

           var loginLink = function(event){
             loaction.href="/doctersearch/index.jsp?pg=lg";
              event.preventDefault();
              event.stopPropagation();
           };

           var registerLink = function(event){
             loaction.href="/doctersearch/index.jsp?pg=rg" ;
              event.preventDefault();
              event.stopPropagation();
           };

           var bottomNavBtn = function(event){
               var navCollapse =  $( "#bottomNavCollapse" );
               (navCollapse.is( ":visible" ))?navCollapse.slideUp():navCollapse.slideDown();

               event.preventDefault();
               event.stopPropagation();

           };


           var topNavBtn = function(event){
               var navCollapse =  $( "#topnavCollapse" );
               if (navCollapse) {
                  (navCollapse.is( ":visible" ))?navCollapse.slideUp():navCollapse.slideDown();
                  event.preventDefault();
                  event.stopPropagation();
               }

           };


           var preventPostBack  = function(event){

                var pathName, target;

                 pathName =  window.location.pathname;
                 target   =  event.target;

                 if(target.href.indexOf(pathName)>-1){
                        event.preventDefault();
                        event.stopPropagation();
                 }

           };


          if(typeof eventObj == "undefined")
            eventObj ={};

          eventObj["bottomNavBtn"] = bottomNavBtn;
          eventObj["topNavBtn"] = topNavBtn;
          eventObj["preventPostBack"] =  preventPostBack;
          eventObj["loginLink"] = loginLink;
          eventObj["registerLink"] = registerLink;


        (function(eventObj, global){
             var bottomNavBtn = document.getElementById("bottomNavBtn");
             if(bottomNavBtn)
                  bottomNavBtn.addEventListener('click', eventObj["bottomNavBtn"], false);
             var topNavBtn = document.getElementById("topNavBtn");
             if(topNavBtn){
              topNavBtn.addEventListener('click', eventObj["topNavBtn"], false);
             }
              global.addEventListener('resize',  function(){
                 setTimeout(  eventObj["resize"], 300  );
              }  , false);
             var loginLink = document.getElementById("loginLink");
             if (loginLink) {
                loginLink.addEventListener("click", eventObj["loginLink"], false);
             }
             var registerLink = document.getElementById("registerLink");
             if (registerLink) {
                registerLink.addEventListener("click", eventObj["registerLink"], false);
             }
         })(eventObj, window);

      </script>

  
      <link rel="stylesheet" href="./Practo Accounts_files/practonav.css">
      <script src="./Practo Accounts_files/practonav.js.download"> </script>
      <script>
          $(function(){
            if(window.self == window.top ) {
              var config = {
                    nav: {
                      'is_loggedin' : false,
                      'login' : {
                          'url': "/doctersearch/index.jsp?pg=lg",
                          callback : null,
                          'logouturl':"/doctersearch/index.jsp?pg=lg"
                      },
                      'consultEnabled': window.isIN ? window.isIN : false ,
                      'selectedNavLabel':"",
                      'locale': 'en' ? 'en': 'en',
                      'country_code': 'IN'
                    }
              };
              //initiate nav
              $('body').practoNav(config);
            }
          });
      </script>
  
  

</body></html>