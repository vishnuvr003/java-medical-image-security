<%-- 
    Document   : UploadFiles
    Created on : 17 Feb, 2018, 12:43:27 PM
    Author     : S7
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script class="jsbin" src="js/jquery.min.js"></script>
<script class="jsbin" src="js/jquery-ui.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        String doc=request.getParameter("doc");
        String id=request.getParameter("id");
        session.setAttribute("aid",id);
                session.setAttribute("doc",doc);

        %>
  <form name="f1" method="post" action="UploadIm" enctype="multipart/form-data">
        <table>
            <tr>
                <td>choose your file</td>
                <td><input type="file"  onchange="readURL(this);" name="fl" id="fl" accept="image/gif, image/jpeg, image/png" required="" ></td>
            </tr>
             <tr>
                <td></td>
                <td><input type="submit" value="upload"></td>
            </tr>
            
        </table>
   
          
       <img id="blah" src="#" alt="your image" width="100px" border="1" />
      <script>
                    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#blah')
                    .attr('src', e.target.result)
                    .width(150)
                    .height(200);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
                    </script>
        </form>
        <% if(request.getAttribute("msg")!=null)
        {
            String fn=request.getAttribute("msg").toString();
        String user=session.getAttribute("user").toString();
        String x[]=user.split("@");
        %>
      
        <div style="width:100%;border:solid thin;">
             <div style="width:300px;float:left;border:solid thin;margin-left: 10px;padding:10px;overflow: auto;">  <h4>Original</h4>
    
    <img src="temp/<%=fn%>" >
          </div>
             <div style="width:300px;float:left;border:solid thin;margin-left: 10px;padding:10px;overflow: auto;">  <h4>Shuffled Image</h4>
    
    <img src="temp/<%=x[0]%>c_<%=fn%>" >
          </div>
            <div style="width:300px;float:left;border:solid thin;margin-left: 10px;padding:10px;overflow: auto;"> <h4>LargerPart</h4><img src="temp/<%=x[0]%>l_<%=fn%>" ></div>
            <div style="width:300px;float:left;border:solid thin;margin-left: 10px;padding:10px;overflow: auto;"> <h4>Smaller Part</h4><img src="temp/<%=x[0]%>s_<%=fn%>" ></div>
          <div style="width:300px;float:left;border:solid thin;margin-left: 10px;padding:10px;overflow: auto;">  <h4>Water Marked Larger Part</h4>
    
    <img src="temp/<%=x[0]%>l_<%=fn%>" >
          </div>
             <div style="width:300px;float:left;border:solid thin;margin-left: 10px;padding:10px;overflow: auto;">  <h4>Water Marked Smaller Part</h4>
    
    <img src="temp/<%=x[0]%>s_<%=fn%>" >
          </div>
              <div style="width:300px;float:left;border:solid thin;margin-left: 10px;padding:10px;overflow: auto;">  <h4>Encrypted Larger Part</h4>
    
    <img src="temp/<%=x[0]%>/elarge_<%=fn%>">
          </div>
             <div style="width:300px;float:left;border:solid thin;margin-left: 10px;padding:10px;overflow: auto;">  <h4>Joined Image</h4>
    
    <img src="temp/<%=x[0]%>/<%=fn%>">
          </div>
        </div>
       <%} %>
    </body>
</html>
