<%-- 
    Document   : DocDecode
    Created on : 22 Feb, 2018, 3:07:10 PM
    Author     : S7
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
    /* Full height */
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
function lod(fn) {
  
     var im = document.getElementById('ii').value;
     
    var modal = document.getElementById('myModal');
     modal.style.display = "block";
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("modal-content").innerHTML =
      this.responseText;
    }
  };
  xhttp.open("GET", "LargeFileView.jsp?im="+im+"&ima="+fn, true);
  xhttp.send();
}
function show() {
    var key = document.getElementById('key').value;
    var im = document.getElementById('t1').value;
   
        // modal.style.display = "block";
location.href="dochome.jsp?pg=de&key="+key+"&im="+im;
 
}
</script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
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
    <h1>Welcome</h1>
        <% 
            String un="",fn="",id, lg="";
           // 
           
        if(session.getAttribute("sma")!=null)
        {
       
         out.println("<h3> Data On small File:"+session.getAttribute("sma")+"</h3>");
      un=session.getAttribute("un")+"";
      //out.println(un);
          fn=session.getAttribute("fn")+"";
       //   out.println(fn);
          un=session.getAttribute("un")+"";
    // out.println(un);
          id=session.getAttribute("id")+"";
          lg=session.getAttribute("lar")+""; 
        }
        
        
        %>
       
        <form>
        <div style="width:100%;border:solid thin;">
             <div style="width:300px;float:left;border:solid thin;margin-left: 10px;padding:10px;overflow: auto;">  <h4>Received</h4>
    
                 <img src="temp/<%=un%>/<%=fn%>" width="100%" >
          </div>
             <div style="width:300px;float:left;border:solid thin;margin-left: 10px;padding:10px;overflow: auto;">After Spliting Larger Part <h4></h4>
                 <input type="hidden" name="ii" id="ii" value="<%=lg%>">
                 
                 <img src="<%=lg%>" width="100%">
    <button onclick="lod()" type="button">Decrypt and View</button>
          </div>
           <div style="width:300px;float:left;border:solid thin;margin-left: 10px;padding:10px;overflow: auto;">After Spliting Smallert Part <h4></h4>
    
    <img src="Cloud/<%=un%>/sm.png" height="300px">
          </div>
            
            
             
        </div>
        </form>  
</body>
</html>
