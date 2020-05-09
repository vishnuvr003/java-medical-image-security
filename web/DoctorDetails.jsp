<%-- 
    Document   : DoctorDetails
    Created on : 14 Feb, 2018, 11:31:14 AM
    Author     : S7
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<%@page import="doctorsearch.connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height:auto; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
}

/* The Close Button */
.close {
    color:red;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}
</style>
<script>
    function lodd(x) {
       
    var modal = document.getElementById('myModal');  
    var dt = document.getElementById(x).value;
    // alert(dt);
     modal.style.display = "block";
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("modal-content").innerHTML =
      this.responseText;
    }
  };
  xhttp.open("GET", "ViewConsulting Time.jsp?m="+x+"&dt="+dt, true);
  xhttp.send();
}

    </script>
    <script>
// Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
//btn.onclick = function() {
  //  modal.style.display = "block";
//}

// When the user clicks on <span> (x), close the modal


// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
function cl()
{
    
    var modal = document.getElementById('myModal');
        modal.style.display = "none";
}
</script>
    <body>
   
<div id="myModal" class="modal">

  <div class="modal-content" ID="modal-content">
     
 
  </div>

</div>
<form>
      <%
           Date date = new Date();
String dty= new SimpleDateFormat("yyyy-MM-dd").format(date);
     connect cc1= new connect();
     String cat=request.getParameter("t1");
    connect.cid=cat;
    
     String subcate=request.getParameter("t2");
     connect.sid=subcate;
     String sp=request.getParameter("t3");
     connect.sp=sp;
     String dt=request.getParameter("dt");
     
     String lo=request.getParameter("t4");connect.loc=lo;
     String q="select * from docreg  where status<>'waiting'";
     if(!cat.equals("0"))
         q=q+" and cid='"+cat+"'";
     
      if(!subcate.equals("0"))
         q=q+" and sub_id='"+subcate+"'";
        if(!sp.equals("0"))
         q=q+" and spce='"+sp+"'";
           if(!lo.equals("0"))
         q=q +" and loc='"+lo+"'";
         //  out.print(q);
     cc1.read(q);
           while(cc1.rs.next())
           {
      %>
        <div class="row">
                        <div class="col-lg-6">
                            <div class="panel panel-default">
                        <div class="panel-heading">
                            
                         Dr. <%=cc1.rs.getString(2)%>
                        </div>
                       
                        <div class="panel-body">
                           <img src="photo/<%=cc1.rs.getString("pho")%>" width="200px" height="200px" border="1" style="float:left;margin-right:10px;" />
             
           <p> qualification:<%=cc1.rs.getString("qual")%>
            </p>
                <p>
            specialization:
          <%=cc1.rs.getString("spce")%>
          </p>
            <p>  Hospitalname:
             <%=cc1.rs.getString("hopnm")%>
              </p>
            <p> Experiance:
              <%=cc1.rs.getString("exp")%>
        </p><p>
            ContactNo: <%=cc1.rs.getString("cno")%>
            
        </p>  
           
        <p class="no-bottom-margin">Choose Date </p>
     
        <input type="date" name="dt" id="<%=cc1.rs.getString("mail")%>" min="<%=dty%>"/>
                      
    
<button type="button"  class="btn btn-danger " onclick="lodd('<%=cc1.rs.getString("mail")%>')"><i class="icon-heart">Take Appointment</i>
                            </button>
                           
                        </div>
                        
                    </div>
                            
                        </div>
              
               

    </div>
           
<%}%>
<%
if(request.getAttribute("msg")!=null)
{
out.print("<script>alert('"+request.getAttribute("msg")+"');</script>");
}
%>
</form>
    </body>
</html>
