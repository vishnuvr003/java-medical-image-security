<%-- 
    Document   : keygenerate
    Created on : Jan 6, 2016, 3:11:05 PM
    Author     : SKIVE5
--%>



<%@page import="java.util.Random"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@page import="javax.crypto.KeyGenerator"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="javax.crypto.CipherInputStream"%>
<%@page import="javax.crypto.CipherOutputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="javax.crypto.spec.IvParameterSpec"%>
<%@page import="java.security.spec.AlgorithmParameterSpec"%>
<%@page import="java.security.spec.AlgorithmParameterSpec"%>
<%@page import="javax.crypto.SecretKey"%>
<%@page import="javax.crypto.Cipher"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.DataInputStream"%>
<%@include file="getcon.jsp" %>


<%

int key1=(Integer)session.getAttribute("key");
session.setAttribute("key",key1);
System.out.println("keygenerate.jsp:"+key1);
 String username=(String)session.getAttribute("username");
              session.setAttribute("username",username);
System.out.println("keygenerate.jsp:"+username);
String filename=(String)session.getAttribute("filename");
System.out.println("keygenerate.jsp:"+filename);
long filesize=(Long)session.getAttribute("filesize");
session.setAttribute("filesize",filesize);
System.out.println("keygenerate.jsp:"+filesize);
String fileloc=(String)session.getAttribute("fileloc");
System.out.println("keygenerate.jsp:"+fileloc);

session.setAttribute("filename", filename);
session.setAttribute("filesize", filesize);
session.setAttribute("fileloc", fileloc);





class AesEncrypter {
  byte[] buf = new byte[1024];
  Cipher ecipher;
  Cipher dcipher;
  AesEncrypter(SecretKey key) throws Exception{
    byte[] iv = new byte[]  {
    		  (byte) 0x8E, 0x12, 0x39, (byte) 0x9C, 0x07, 0x72, 0x6F, 0x5A,
    		  (byte) 0x8E, 0x12, 0x39, (byte) 0x9C, 0x07, 0x72, 0x6F, 0x5A
    		};
    AlgorithmParameterSpec paramSpec = new IvParameterSpec(iv);
    ecipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
    dcipher = Cipher.getInstance("AES/CBC/PKCS5Padding");

    ecipher.init(Cipher.ENCRYPT_MODE, key, paramSpec);
    dcipher.init(Cipher.DECRYPT_MODE, key, paramSpec);
  }
  public void encrypt(InputStream in, OutputStream out)  throws Exception{
    out = new CipherOutputStream(out,ecipher);

    int numRead = 0;
    while ((numRead = in.read(buf)) >= 0) {
      out.write(buf, 0, numRead);
    }
    out.close();
  }

  public void decrypt(InputStream in, OutputStream out)  throws Exception{
    in = new CipherInputStream(in, dcipher);

    int numRead = 0;
    while ((numRead = in.read(buf)) >= 0) {
      out.write(buf, 0, numRead);
    }
    out.close();
  }
}

    //Display Encrypt Key
    SecretKey key = KeyGenerator.getInstance("AES").generateKey();
    System.out.println(key);
    String e=key.toString();
    int lenk=e.length();
    int dotk=e.indexOf("@");
    int filedot=filename.indexOf(".");
    String Encryptkey = e.substring(dotk+1,lenk);
    int keylen=Encryptkey.length();
    System.out.println("e="+e +"\n"+"dot="+dotk+"\n"+"Encryptkey="+Encryptkey);

    //Display Decrypt Key
    AesEncrypter encrypter = new AesEncrypter(key);
    System.out.println(encrypter);
    String d=encrypter.toString();
    int len=d.length();
    int dot=d.indexOf("@");
    String Decryptkey = d.substring(dot+1,len);
    System.out.println("d="+d +"\n"+"dot="+dot+"\n"+"Decryptkey="+Decryptkey);
    String Publickey= Decryptkey;
    System.out.println("public key is"+Publickey);
    String signaturekey=filename.substring(0, filedot).concat(Publickey.substring(0,5));
    System.out.println("signature key is:"+signaturekey);
    //retrive and saving encrypted and decrypted files
    String path="encrypted"+filename;
    System.out.println("file is"+path);
    
    String path1 = request.getSession().getServletContext().getRealPath("/");
           String patt=path1.replace("\\build", "");   
           String p=patt+"files";
           String p1=patt+"encryptedfiles";

            System.out.println("p"+p);
            
            
    encrypter.encrypt(new FileInputStream(p+"//"+filename), new FileOutputStream(p1+"//"+path));
    //encrypter.decrypt(new FileInputStream("D:\\encryptedfiles\\"+path), new FileOutputStream("D:\\decryptedfiles\\"+path));
    File file=new File(p1+"//"+path);
    String file2=(p1+"//"+path);
    System.out.println("file enc is:"+file2);
    session.setAttribute("file",file2);
         Random rand = new Random();
    String r = "";
    for (int j = 0; j < 1; j++) {
        long random = rand.nextLong();
        //System.out.println(random);
        long a = random % 10;
        if (a == 0) {
            r = Long.toString(random);
        } else {
            random = random + a;
            r = Long.toString(random);
        }
        System.out.println(r.substring(3, 8));
    }
    String secretkey = r.substring(3, 8);
%>


                                    <%

                                    
                                   
                                    
                                    
String fflag=filename.concat("||").concat(signaturekey);
System.out.println("fflg is:"+fflag);
                                
                                Statement st=con.createStatement();
	  String query="Select AES_DECRYPT(uid,123) from userdetails where AES_DECRYPT(username,123)='"+username+"'";	
                                
                                ResultSet rs=st.executeQuery(query);
                                if(rs.next())
                                    {
                                        String userid=rs.getString(1);
                                        PreparedStatement  check3=conn.prepareStatement("Select AES_DECRYPT(filename,123) from filedetails where AES_DECRYPT(filename,123)='"+filename+"'");
                                      
                                        ResultSet rs3=check3.executeQuery();
                                            if(rs3.next())
                                                  { 
                                                      String filename1=rs3.getString(1);
                                            int fu=0;
                                            java.util.Date now = new java.util.Date();
                              String DATE_FORMAT = "yyyy-MM-dd hh:mm:ss";
                              SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
                              String strDateNew = sdf.format(now);
                              String status="waiting";
                                                    PreparedStatement stat=con.prepareStatement("update filedetails set publickey=AES_ENCRYPT('"+Publickey+"',123),masterkey=AES_ENCRYPT('"+Encryptkey+"',123),signaturekey=AES_ENCRYPT('"+signaturekey+"',123),secretkey=AES_ENCRYPT('"+secretkey+"',123),fileflag=AES_ENCRYPT('"+fflag+"',123) where filename= AES_ENCRYPT('"+filename+"',123)");

                                                      
                                                        
                                                        stat.executeUpdString filename1=rs3.getString(1);
                                            int fu=0;
                                            java.util.Date now = new java.util.Date();
                              String DATE_FORMAT = "yyyy-MM-dd hh:mm:ss";
                              SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
                              String strDateNew = sdf.format(now);
                              String status="waiting";
                                                    PreparedStatement stat=con.prepareStatement("update filedetails set publickey=AES_ENCRYPT('"+Publickey+"',123),masterkey=AES_ENCRYPT('"+Encryptkey+"',123),signaturekey=AES_ENCRYPT('"+signaturekey+"',123),secretkey=AES_ENCRYPT('"+secretkey+"',123),fileflag=AES_ENCRYPT('"+fflag+"',123) where filename= AES_ENCRYPT('"+filename+"',123)");

                                                      
                                                        ate();
                                                        

//                                                    JOptionPane.showMessageDialog(null,"Watermarked file is encrypted and uploaded successfully.");
                                                     response.sendRedirect("upload.jsp");
                                                   }
                                          
                                    }

%>
								

