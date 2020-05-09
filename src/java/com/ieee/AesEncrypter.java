/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ieee;

import doctorsearch.connect;
import java.io.*;
import java.security.NoSuchAlgorithmException;
import java.security.spec.*;
import java.text.SimpleDateFormat;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.*;
import javax.crypto.spec.IvParameterSpec;

public class AesEncrypter {
  byte[] buf = new byte[1024];
  Cipher ecipher;
  Cipher dcipher;
  AesEncrypter(SecretKey key) throws Exception{
//    byte[] iv = new byte[]  {
//    		  (byte) 0x8E, 0x12, 0x39, (byte) 0x9C, 0x07, 0x72, 0x6F, 0x5A,
//    		  (byte) 0x8E, 0x12, 0x39, (byte) 0x9C, 0x07, 0x72, 0x6F, 0x5A
//    		};
       byte[] iv = new byte[] 
       {
        (byte) 0001, 0002, 0003,(byte) 0004, 0005, 0006, 0007,0010,
    		  (byte) 0010, 0012, 0013, (byte) 0014, 0015, 0016, 0017, 0020
//    		
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
  public static void encrptf(String filename,String wpath,String user)
  {
      
      try {
          SecretKey key = KeyGenerator.getInstance("AES").generateKey();
          System.out.println(key);
          String e=key.toString();
          int lenk=e.length();
          int dotk=e.indexOf("@");
          int filedot=filename.indexOf(".");
          String Encryptkey = e.substring(dotk+1,lenk);
          int keylen=Encryptkey.length();
           AesEncrypter encrypter = null;
          try {
              encrypter = new AesEncrypter(key);
          } catch (Exception ex) {
              Logger.getLogger(AesEncrypter.class.getName()).log(Level.SEVERE, null, ex);
          }
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
    String path=filename;
    System.out.println("file is"+path);
    
    String path1 = wpath;
         //  String patt=path1.replace("\\build", "");   
           String p=path1;
           
           String p1=path1+"/encryptedfiles/encrypted";
if (!new File(p1).exists()) {
            if (new File(p1).mkdir()) {
               // out.println("Directory is created!");
            } else {
              // out.println("Failed to create directory!");
            }
        }
            System.out.println("p"+p);
          try {
              encrypter.encrypt(new FileInputStream(p+"//"+filename), new FileOutputStream(p1+"//"+path));
          } catch (Exception ex) {
              Logger.getLogger(AesEncrypter.class.getName()).log(Level.SEVERE, null, ex);
          }
    //encrypter.decrypt(new FileInputStream("D:\\encryptedfiles\\"+path), new FileOutputStream("D:\\decryptedfiles\\"+path));
    File file=new File(p1+"//"+path);
    String file2=(p1+"//"+path);
    System.out.println("file enc is:"+file2);
    //session.setAttribute("file",file2);
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
         String secretkey = r.substring(3, 8);
                       String filename1=filename;
                                            int fu=0;
                                          
                              String status="waiting";
                              connect c=new connect();
                              String us[]=user.split(",");
                                             c.save("insert into filedetails values(0,'"+filename+"','"+path+"','"+us[0]+"',curdate(),AES_ENCRYPT('"+Publickey+"',123),AES_ENCRYPT('"+Encryptkey+"',123),AES_ENCRYPT('"+signaturekey+"',123),AES_ENCRYPT('"+secretkey+"',123),'waiting','"+us[1]+"')");

                                                      
                                                        
                                                      //  stat.executeUpdString filename1=rs3.getString(1);
                                           // int fu=0;
                                            
                                                   // PreparedStatement stat=con.prepareStatement("update filedetails set publickey=AES_ENCRYPT('"+Publickey+"',123),masterkey=AES_ENCRYPT('"+Encryptkey+"',123),signaturekey=AES_ENCRYPT('"+signaturekey+"',123),secretkey=AES_ENCRYPT('"+secretkey+"',123),fileflag=AES_ENCRYPT('"+fflag+"',123) where filename= AES_ENCRYPT('"+filename+"',123)");

    }
    
      } catch (NoSuchAlgorithmException ex) {
         System.out.print(ex);
      }
  }
  public static  void main(String ar[])
  {
      encrptf("s1.jpg", "D:\\Project2018\\java\\DataHiding\\build\\web\\temp", "anu");
  }
}
