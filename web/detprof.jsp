<%-- 
    Document   : detprof
    Created on : 26 Jul, 2017, 3:37:50 PM
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
                xhttp.open("post","getSubcate.jsp?id="+str+"&y="+y,true);
                xhttp.send();
            }
            function chk(v)
            {
             if(isNaN(v.t5.value))
             {
                 alert("must enter number");
                 v.t5.value="";
                 v.t5.focus();
                 return false;
             }
              if(v.t5.value.length<10)
             {
                 alert("must enter number");
                 v.t5.value="";
                 v.t5.focus();
                 return false;
             }
              if(!isNaN(v.t3.value))
             {
                 alert("must be alphabet");
                 v.t3.value="";
                 v.t3.focus();
                 return false;
             }
             return true;
            }
            
        </script>
        <style>
            .b1, .b2, .b3
            {
                
                width:150px;
                height:30px;
                padding-top: 5px !important;
                
            }
        </style>
        <script src="js/jquery-1.7.min.js"></script>
        <script>
            $(document).ready(function(){
                $(".b2").hide();
              $(".b3").hide();
                $(".c2").hide();
                
                $(".b1").click(function(){
                    $(".b1").hide();
                    $(".c1").hide();
                $(".b2").show();
                  $(".b3").show();
                $(".c2").show()
                } );
                
                $(".b3").click(function(){
                    $(".b1").show();
                    $(".c1").show();
                $(".b2").hide();
                $(".b3").hide();
                $(".c2").hide()
                });
              
                                    });
               </script>
               
               <style>
               </style>
               <%!
               public String  getSub(String x)
               {
               try
               {
                 connect c01=new connect();
                        c01.read("select * from subcat where sub_id='"+x+"'");
                        if(c01.rs.next())
                        {
                        return c01.rs.getString(3);
                        }
                     
               
               }
catch(Exception e)
               {}
               return "";
               }
               public String  getcate(String x)
               {
               try
               {
                 connect c01=new connect();
                        c01.read("select * from cate where cid='"+x+"'");
                        if(c01.rs.next())
                        {
                        return c01.rs.getString(2);
                        }
                     
               
               }
catch(Exception e)
               {}
               return "";
               }
               %>
    </head>
    <body>
        <%
        connect p=new connect();
        p.read("select * from docreg where mail='"+session.getAttribute("user").toString()+"'");
           if(p.rs.next())  
           {
               
        %>
        <form method="post" action="edtpf" onsubmit="return chk(this);">
            <table class=" table-striped" width="100%" style="padding:10px;margin:20px;">
            <tr><td>name</td>
                <td><%=p.rs.getString(2)%></td></tr>
               <tr><td>category</td>
                   <td class="c1"><%=getcate(p.rs.getString(3))%></td>
                  <td class="c2">  <Select name="t1" <% %> onchange="get(this);" class="form-control">
                              <option>-select-</option>
                        <%
                        connect c01=new connect();
                        c01.read("select * from cate");
                        while(c01.rs.next())
                        {
                            %>
                            <option value="<%=c01.rs.getString(1)%>" <% if(p.rs.getString(3).equals(c01.rs.getString(1))) out.print("selected='selected'");%>><%=c01.rs.getString(2)%></option>
                         <%
                         }
                         %>
                               </Select></td>
               </tr>
                  <tr><td>sub category</td>
                <td class="c1"><%=getSub(p.rs.getString(4))%></td>
                <td class="c2" id="sub">
            <Select name="t2" class="form-control" >
                              <option value="<%=p.rs.getString(4)%>"><%=getSub(p.rs.getString(4))%></option>
                              <option></option>
                               </Select>
                </td>
                  </tr>
                     <tr><td>qualification</td>
                          <td class="c1"><%=p.rs.getString(5)%></td>
                          <td class="c2"><textarea class="form-control" name="ql" required=""><%=p.rs.getString(5)%></textarea>
</td>
                      </tr>
                        <tr><td>specification details</td>
                <td class="c1"><%=p.rs.getString(6)%></td>
                <td class="c2"><textarea class="form-control" name="q2" required=""><%=p.rs.getString(6)%></textarea></td></tr>
                          <tr><td>hospital name</td>
                <td class="c1"><%=p.rs.getString(7)%></td>
                <td class="c2"><textarea  class="form-control"name="q3" required=""><%=p.rs.getString(7)%></textarea></td></tr>
                            <tr><td>experance</td>
                <td class="c1"><%=p.rs.getString(8)%></td>
                <td class="c2"><textarea class="form-control" name="q4" required=""><%=p.rs.getString(8)%></textarea></td></tr>
                              <tr><td>contact no</td>
                <td class="c1"><%=p.rs.getString(9)%></td>
                <td class="c2"><textarea  class="form-control" name="q5" required="" maxlength="12"><%=p.rs.getString(9)%></textarea></td></tr>
                               <tr><td>address</td>
                <td class="c1"><%=p.rs.getString(10)%></td>
                <td class="c2"><textarea name="q6" class="form-control" required=""><%=p.rs.getString(10)%></textarea></td></tr>
                                <tr><td>location</td>
                <td class="c1"><%=p.rs.getString(11)%></td>
                <td class="c2">  <textarea name="q7"  class="form-control" required=""><%=p.rs.getString(11)%></textarea></td></tr>
                                 <tr><td>email</td>
                <td><%=p.rs.getString(14)%></td>
                      </tr>
                      <tr><td><button  class="b1 btn btn-warning" type="button">edit</button></td>
                                     <td><input type="submit"   value="update"  class="b2 btn btn-info"></td>
                                     <td><button class="b3 btn btn-danger"   type="button">cancel</button></td></tr>
         </table>   </form>
        
        <%}%>
    </body>
</html>
