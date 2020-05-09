<%-- 
    Document   : ViewMyFiles
    Created on : 5 Feb, 2018, 2:53:58 PM
    Author     : S7
--%>

<%@page import="doctorsearch.connect"%>
<%@page import="java.io.File"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
<style>
/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 80%; /* Full width */
    height: 350px; /* Full height */
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
    color: #aaaaaa;
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
function lod(x) {
    
   location.href="Decode?id="+x+"&pg=viewF";
 // xhttp.open("GET", , true);
  //xhttp.send();
}
function show() {
    var key = document.getElementById('key').value;
    var id = document.getElementById('t1').value;
        // modal.style.display = "block";
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("modal-content").innerHTML =
      this.responseText;
    }
  };
  xhttp.open("GET", "Images.jsp?key="+key+"&id="+id, true);
  xhttp.send();
}
</script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            td{
               border:solid thin; 
               padding:10px;
                
            }
            </style>
    </head>
    <body>


<!-- The Modal -->


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
<div id="myModal" class="modal">

  <div class="modal-content" ID="modal-content">
     
 
  </div>

</div>
        <h3>My Files</h3>
        <div style="width:100%;">
         <%
             
      
    
  connect ap=new connect();
   String aid=request.getParameter("aid");
      ap.read("select * from filedetails where fid='"+aid+"'");
      while(ap.rs.next())
      {
          String fn=ap.rs.getString("filename");
          String user=ap.rs.getString("userid");
          String us[]=user.split("@");
                  
      %>
        <div style="border:solid thin; width:400px;float:left;padding:5px;margin:10px;">
            <table width="100%" class="table">
                <tr>
                    <td rowspan="2" id="img<%=ap.rs.getString(1)%>" ><img src="temp/<%=us[0]%>/<%=fn%>" width="100px" height="100px">
                        <br>--Encrypted--<<button type="button" class="btn-danger" onclick="lod(<%=ap.rs.getString(1)%>)" id="myBtn" > View details </button></td>
                    <td>Uploaded Date:<br><%=ap.rs.getString(4)%></td>
                </tr>
                <tr><td>File Name:<br><%=ap.rs.getString(2)%></td></tr>
               
            </table>
            
        </div>
        <%}%>
        </div>
    </body>
</html>
