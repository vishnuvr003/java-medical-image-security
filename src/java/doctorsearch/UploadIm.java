/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package doctorsearch;

import com.sun.crypto.provider.AESKeyGenerator;
import static doctorsearch.SplitImage.file1;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import com.ieee.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author S7
 */
public class UploadIm extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
      
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       PrintWriter out = response.getWriter();
   
     String saveFile1="",saveFile="";
String contentType = request.getContentType();
System.out.println("Content type is :: " +contentType);
if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0))
{
DataInputStream in = new DataInputStream(request.getInputStream());
int formDataLength = request.getContentLength();
byte dataBytes[] = new byte[formDataLength];
int byteRead = 0;
int totalBytesRead = 0;
while (totalBytesRead < formDataLength)
{
byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
totalBytesRead += byteRead;
}
String file = new String(dataBytes);
 saveFile = file.substring(file.indexOf("filename=\"") + 10);
//out.print("FileName:" + saveFile.toString());
saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
//out.print("FileName:" + saveFile.toString());
saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
//out.print("FileName:" + saveFile.toString());
//out.print(dataBytes);
int lastIndex = contentType.lastIndexOf("=");
String boundary = contentType.substring(lastIndex + 1,contentType.length());
//out.println(boundary);
int pos;
pos = file.indexOf("filename=\"");
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
int boundaryLocation = file.indexOf(boundary, pos) - 4;
int startPos = ((file.substring(0, pos)).getBytes()).length;
int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
saveFile1=saveFile;

                       

                        String root = getServletContext().getRealPath("/");
                      // root= root.replace("build\\", "");
                        out.println(root);
                        File path = new File(root+"/temp");  
                        String pat=saveFile;
                        if (!path.exists()) {
                            boolean status = path.mkdirs();
                        }
                        saveFile1=root+"temp";

                        File uploadedFile = new File(path + "/" + saveFile);
                        
//saveFile =connect.pat+"directors/" + saveFile;
FileOutputStream fileOut = new FileOutputStream(path + "/" + saveFile);
//fileOut.write(dataBytes);
fileOut.write(dataBytes, startPos, (endPos - startPos));

fileOut.flush();
fileOut.close();
out.println("File saved as " +saveFile);
if(saveFile.contains("jpg"))
{
    Utill.change(saveFile1+"/"+saveFile, saveFile1+"/"+saveFile.replace("jpg", "png"), "PNG");
    saveFile=saveFile.replace("jpg", "png");
}
}
HttpSession ses=request.getSession();
     String email=ses.getAttribute("user")+"";
//String email="user";
  String aid=ses.getAttribute("aid")+"";  
try
{

 String x[]=email.split("@");
  out.println("user"+x[0]);
SplitImage.mainfile=saveFile1+"/"+saveFile;
out.print("file="+SplitImage.mainfile);
SplitImage.conv=saveFile1+"/"+x[0]+"c_"+saveFile;
out.print("converted file="+SplitImage.conv);
SplitImage.file1=saveFile1+"/"+x[0]+"l_"+saveFile;
SplitImage.file2=saveFile1+"/"+x[0]+"s_"+saveFile;
SplitImage.t=email;
SplitImage.st=0;

SplitImage.aid=aid;
SplitImage.main(null);

NHistogram.fn=SplitImage.file1;
NHistogram.fn1=saveFile1+"/"+x[0]+"w_"+saveFile;
NHistogram.fnn=saveFile1+"/"+x[0]+"l_"+saveFile;
String lf=NHistogram.fn1;
NHistogram.mess=x[0];
NHistogram.main(null);
NHistogram.fn=SplitImage.file2;
NHistogram.fn1=saveFile1+"/"+x[0]+"ws_"+saveFile;
NHistogram.fnn=saveFile1+"/"+x[0]+"s_"+saveFile;
String sf=NHistogram.fn1;
NHistogram.mess=x[0].substring(0,2);
File folder=new File(saveFile1+"/"+x[0]);
String pa=saveFile1.replace("build\\", "")+x[0];
 File folder1= new File((saveFile1.replace("build\\", "")+"/"+x[0]));
 if (!folder.exists()) {
            if (folder.mkdir()) {
                out.println("Directory is created!");
            } else {
               out.println("Failed to create directory!");
            }
        }
  if (!folder1.exists()) {
            if (folder1.mkdir()) {
                out.println("Directory is created!");
            } else {
               out.println("Failed to create directory!");
            }
        }
NHistogram.main(null);
//new File(saveFile1+"/"+x[0]).mkdir();
String nf=folder1+"/"+saveFile;

out.println(nf);
out.println("large file"+lf);

String key1=new KeyGen().genKey(x[0]);
out.println("large file key ="+key1);
String Encfile=folder+"/"+"elarge_"+saveFile;
out.println("large file"+Encfile);
CryptoUtils.encrypt(key1, lf, Encfile);

out.println(Encfile);
out.println(key1);
//PartialEncryption.fn=lf;

//PartialEncryption.fn1=folder+"/"+x[0]+"elarge_"+saveFile;

//P//artialEncryption.key=key1;
//PartialEncryption.encript(lf);
//String enf=saveFile1+"encryptedfiles/encrypted/"+new File(lf).getName();
//PartialEncryption.fn=folder1+"/"+x[0]+"elarge_"+saveFile;
//PartialEncryption.fn1=lf;
String nf1=folder+"/"+saveFile;
String xx=Utill.join(Encfile, sf, nf);

 xx=Utill.join(Encfile, sf, nf1);
//String key=new KeyGen().genKey(x[0]);

   // CryptoUtils.encrypt(key,new File(nf),new File(folder1+"/"+saveFile));
//out.println(xx);

 //WatermarkImage.fn=SplitImage.file1;
      //  WatermarkImage.text=email;
       // WatermarkImage.tem=saveFile1+"/"+x[0]+"lw"+saveFile;;
        //WatermarkImage.main(null);
        // WatermarkImage.fn=SplitImage.file2;
       // WatermarkImage.text=email;
       // WatermarkImage.tem=saveFile1+"/"+x[0]+"sw"+saveFile;;
       // WatermarkImage.main(null);
    //AesEncrypter.encrptf(x[0]+"l_"+saveFile, saveFile1, email);
   
           //String val = saveFile1;
connect c=new connect();
String doc=ses.getAttribute("doc")+"";
c.save("insert into filedetails values(0,'"+saveFile+"','"+email+"',curdate(),'"+key1+"','waiting','"+aid+"')");
out.print("insert into filedetails values(0,'"+saveFile+"','"+email+"',curdate(),'"+key1+"','waiting','"+aid+"')");
//c.save("insert into largefile values(select max(fid) from filedetails),'elarge_"+saveFile+"','"+key1+"',0)");  
c.save("delete from randompos where aid=(select max(fid) from filedetails)");
c.save("insert into randompos values(0,(select max(fid) from filedetails),'"+SplitImage.xt1+"','"+SplitImage.yt1+"','"+SplitImage.xt2+"','"+SplitImage.yt2+"')");
Sendmail s=new Sendmail(doc," Key For Decrypt Files" ,"Key For Decrypt large Part:"+ key1+", Filename :"+ saveFile+", Patient :"+email);



//Sendmail s1=new Sendmail(doc," Key For Decrypt Large File" , key1);
 //HttpSession ses=request.getSession();
//       String email=ses.getAttribute("user")+"";
                        //c.save("insert into ");
//                             //response.sendRedirect("Index.jsp");
//        request.setAttribute("msg","File Upload Successfully");
}catch(Exception e)
{
out.print(e);
}
//                         HttpSession ses=request.getSession();
//       String email=ses.getAttribute("user")+"";
//                        c.save("update docreg set pho='"+val+"' where mail='"+email+"' ");
//                             //response.sendRedirect("Index.jsp");
//        request.setAttribute("msg","File Upload Successfully");

//out.println(saveFile);
//for testing
  request.setAttribute("msg",saveFile);
 
      RequestDispatcher rd=request.getRequestDispatcher("/pathome.jsp?pg=up&id="+aid);
 rd.forward(request, response);
          
          
          
          
          
 
//   catch(Exception e)
//                 {
//  request.setAttribute("msg",e);
//  out.println(e);
// rd.forward(request, response);
//
//                 }
//                          
//                        
//        
//                    }
//         
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
