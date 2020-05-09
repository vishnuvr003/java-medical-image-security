<%-- 
    Document   : SearchDoctors
    Created on : 14 Feb, 2018, 10:50:43 AM
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
                xhttp.open("post","getSubcate.jsp?id="+str,true);
                xhttp.send();
            }
            </script>
    </head>
    <body>
        <h1>Search Doctor Here</h1>
        <form action="pathome.jsp?pg=dcv" method="post">
          
      <div class="padding-top-8">
        <p class="no-bottom-margin">Category</p>
        <div class="padding-top-8">
            <Select name="t1" onchange="get(this);" class="form-control">
                <option value="0">Any</option>
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
                              <option value="0">Any</option>
                              <option></option>
                               </Select>
              
        </div>
     </div>
                                   <div class="padding-top-8">
        <p class="no-bottom-margin">Specialization</p>
        <div class="padding-top-8">
            <Select name="t3" onchange="get(this);" class="form-control">
                              <option value="0">Any</option>
                        <%
                      
                        c01.read("select distinct spce from docreg");
                        while(c01.rs.next())
                        {
                            %>
                            <option value="<%=c01.rs.getString(1)%>"><%=c01.rs.getString(1)%></option>
                         <%
                         }
                         %>
                               </Select>
                      
        </div>
    </div>
                                <div class="padding-top-8">
        <p class="no-bottom-margin">Location</p>
        <div class="padding-top-8">
            <Select name="t4" onchange="get(this);" class="form-control">
                              <option value="0">Any</option>
                        <%
                      
                        c01.read("select distinct loc from docreg");
                        while(c01.rs.next())
                        {
                            %>
                            <option value="<%=c01.rs.getString(1)%>"><%=c01.rs.getString(1)%></option>
                         <%
                         }
                         %>
                               </Select>
                      
        </div>
    </div>
       <div style="clear:both;"></div>
       <br>
   <div>
      <div class="padding-top-20">
          <input type="submit" value="submit" class=" btn btn-danger" >
      </div>
   </div>
   
        </form></body>
</html>
