<%-- 
    Document   : Images
    Created on : 6 Feb, 2018, 10:57:06 AM
    Author     : S7
--%>


<%@page import="test.Shuffle"%>
<%@page import="doctorsearch.SplitImage.*"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.awt.Image"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="doctorsearch.SplitImage"%>
<%@page import="com.ieee.Utill"%>
<%@page import="com.ieee.PartialEncryption"%>
<%@page import="doctorsearch.connect"%>
<%@page import="com.ieee.CryptoUtils"%>
<%@page import="com.ieee.DecodeMessage"%>
<%@page import="java.io.File"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
          <span class="close" onclick="cl()">&times;</span>
     <%
          String x=session.getAttribute("un")+""; 
      String pt1="";
      String pt="";
      String nf="";
      String Small="Cloud/"+x+"/sm.png";
      String Org="";
      int tt=0;
          try
         {
     String im=request.getParameter("key");
         String id=session.getAttribute("id").toString();
       String lg=request.getParameter("im");
     connect dd=new connect();
     String ke="";
      
     dd.read("select * from `filedetails` inner join randompos on randompos.aid=filedetails.fid where fid='"+id+"'");
   String fn="";
     if(dd.rs.next())
     {
         
    int xt1=dd.rs.getInt("p1");
    int yt1=dd.rs.getInt("p2");
    int xt2=dd.rs.getInt("xt2");
    int yt2=dd.rs.getInt("yt2");
      
       fn=  dd.rs.getString("filename");
         ke=dd.rs.getString(5);
   
     if(ke.equals(im))
     {
     
         tt++;
     

                        String root = getServletContext().getRealPath("/");
                        String rr=root;
                        String root1=root;
                      root= root.replace("build\\", "");
                   
                        File tempath = new File(root+"/temp/"+fn);  
        
         
      pt="temp/"+x+"/d"+fn;
      
    
      String path = root1+pt; 
           
      pt1=root1+session.getAttribute("lar");
      //out.println(pt1);
      CryptoUtils.encrypt(ke, pt1, path);
       
DecodeMessage.rem="";
DecodeMessage.dfn=path;
         DecodeMessage.main(null);
                 out.println("<h3>Decoded Message="+DecodeMessage.rem+"</h3>");
 
   
      nf="Cloud/"+x+"/nf"+fn;
String xx=Utill.join(path, root1+Small,root1+ nf);
Image image1 = ImageIO.read(new File(root1+ nf));
       BufferedImage buffered = (BufferedImage) image1;
       Org="Cloud/"+x+"/org"+fn;
    Shuffle.ReturnTwoRandomTiles(buffered, root1+Org, xt1, yt1,xt2,yt2);
    
      
  
     }
     }
     else
     {
     out.print("<h1>Invalid Key</h1>");
     } 
         }catch(Exception e)
         {
         out.print(e);
         }
        if(tt>0)
        {
     %>
     
 
  <div style="width:100%;border:solid thin;">
       <div style="width:300px;float:left;border:solid thin;margin-left: 10px;padding:10px;overflow: auto;">  <h4>Before Decryption</h4>
    
                 <img src="<%=session.getAttribute("lar")%>" width="100%" >
          </div>
             <div style="width:300px;float:left;border:solid thin;margin-left: 10px;padding:10px;overflow: auto;">  <h4>Larger File</h4>
    
                 <img src="<%=pt%>" width="100%" >
          </div>
             <div style="width:300px;float:left;border:solid thin;margin-left: 10px;padding:10px;overflow: auto;">After Joining <h4></h4>
              
                 
                 <img src="<%=nf%>" width="100%">

          </div>
           <div style="width:300px;float:left;border:solid thin;margin-left: 10px;padding:10px;overflow: auto;">Original Imaget <h4></h4>
    
               
    <img src="<%=Org%>" height="300px">
          </div>
            
            
             
        </div>
          <%}%>
     <form>
      
     </form>
    </body>
</html>
