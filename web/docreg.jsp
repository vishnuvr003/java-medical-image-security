<%-- 
    Document   : docreg
    Created on : 25 Jul, 2017, 3:04:40 PM
    Author     : S7
--%>

<%@page import="doctorsearch.connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function chk(v)
            {
             if(isNaN(v.t7.value))
             {
                 alert("must enter number");
                 v.t7.value="";
                 v.t7.focus();
                 return false;
             }
              if(v.t7.value.length<10)
             {
                 alert("must enter number");
                 v.t7.value="";
                 v.t7.focus();
                 return false;
             }
              if(!isNaN(v.t5.value))
             {
                 alert("must be alphabet");
                 v.t5.value="";
                 v.t5.focus();
                 return false;
             }
             return true;
            }
            
        </script>
        <script>
         function get(x)
            {//alert("Pleace wait for Confirmation");
                var str=x.value;
               // alert(x);
                var xhttp= new XMLHttpRequest();
                xhttp.onreadystatechange=function()
                {
                  
                    if(this.readyState==4 && this.status==200)
                    {
                        document.getElementById("sub").innerHTML=xhttp.responseText;
                    }
                };
                xhttp.open("post","getSubcate.jsp?id="+str,true);
                xhttp.send();
            }
            </script>
            <%
            String str=request.getParameter("name");
            String str1=request.getParameter("mail");
            %>
    <body>
          <div class="outer-space">
        <div style="padding-left: 40px;">
            <form name="" method="post" action="docreg" onsubmit="return chk(this);">
       <div class="padding-top-8">
     <p class="no-bottom-margin">Name</p>
     <input type="text" name="str1" readonly="" class="form-control" value="<%=str%>" required="">
         <span id="nameErrorBlock" class="error-block display-block"> 
  
</span>
    </div>
    <div class="padding-top-8">
     <p class="no-bottom-margin">Email Id</p>
     <input type="email" name="str2" readonly="" class="form-control" value="<%=str1%>" required="">
         <span id="nameErrorBlock" class="error-block display-block"> 
  
</span>
    </div>
 
      <div class="padding-top-8">
        <p class="no-bottom-margin">Category</p>
        <div class="padding-top-8">
            <Select name="t1" onchange="get(this);" class="form-control">
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
                               </Select>
                      
        </div>
    </div>
     <div class="padding-top-8">
        <p class="no-bottom-margin">Subcatogary</p>
        <div class="padding-top-8" id="sub">
           
            <Select name="t2" class="form-control">
                              <option>-select-</option>
                              <option></option>
                               </Select>
              
        </div>
        <span id="Span1" class="error-block display-block">
  
</span>
    </div>
    <div class="padding-top-8">
     <p class="no-bottom-margin">Qualification</p>
     <textarea name="t3" class="form-control" required=""></textarea>
         <span id="nameErrorBlock" class="error-block display-block"> 
  
</span>
    </div>
    

    <div class="padding-top-8">
        <p class="no-bottom-margin">Specialization Details</p>
        <div class="padding-top-8">
            <textarea name="t4" class="form-control" required=""></textarea>
        </div>
        <span id="mobileErrorBlock" class="error-block display-block">
  
</span>
    </div>
    
    <div class="padding-top-8">
        <p class="no-bottom-margin">Hospital Name</p>
        <div class="padding-top-8">
            <textarea name="t5" class="form-control" required=""></textarea>
        </div>
        <span id="Span2" class="error-block display-block">
  
</span>
    </div>
    
    <div class="padding-top-8">
        <p class="no-bottom-margin">Experiance</p>
        <div class="padding-top-8">
            <textarea name="t6" class="form-control" required=""></textarea>
        </div>
        <span id="Span3" class="error-block display-block">
  
</span>
    </div>
    
    <div class="padding-top-8">
        <p class="no-bottom-margin" class="form-control">ContactNo</p>
        <div class="padding-top-8">
            <input type="text" name="t7" required="" maxlength="12" >
          
        </div>
        <span id="Span4" class="error-block display-block">
  
     
  
</span>
    </div>
       <div class="padding-top-8">
        <p class="no-bottom-margin" class="form-control">Registration Number</p>
        <div class="padding-top-8">
            <input type="text" name="reg" required="" maxlength="12" >
          
        </div>
        <span id="Span4" class="error-block display-block">
  
     
  
</span>
    </div>
    <div class="padding-top-8">
        <p class="no-bottom-margin" class="form-control">Address</p>
        <div class="padding-top-8">
            <textarea name="t8" required=""></textarea>
        </div>
        <span id="Span5" class="error-block display-block">
  
</span>
    </div>
     
    <div class="padding-top-8">
        <p class="no-bottom-margin">Location</p>
        <div class="padding-top-8">
            <textarea name="t9" class="form-control" required=""></textarea>
        </div>
        <span id="Span8" class="error-block display-block">
  
</span>
    </div>
   
        <div class="padding-top-8">
        <div class="padding-top-8">
       
            </div>
        <span id="Span7" class="error-block display-block">
  
</span>
    </div>
        
        
    <div style="clear:both;"></div>
   <div>
      <div class="padding-top-20">
          <input type="submit" value="submit" class="btn-danger" >
      </div>
   </div>
   

 
   <div class="padding-top-8 textMuted font-10">
         <p class="tc no-bottom-margin">
           
           By signing up, I agree to <a href="https://www.practo.com/ray/terms" target="_blank" id="terms">terms</a>
           
         </p>
      </div>
 </form>
  </div>
       
        </div>
    </body>
</html>
