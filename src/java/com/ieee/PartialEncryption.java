/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ieee;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.*;
import java.security.Key;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.Cipher;
import javax.crypto.CipherInputStream;
import javax.crypto.CipherOutputStream;
import javax.crypto.spec.SecretKeySpec;
import javax.imageio.ImageIO;
/**
 *
 * @author S7
 */
public class PartialEncryption {
      private static final String ALGORITHM = "AES";
    private static final String TRANSFORMATION = "AES";
  public static String fn;
     public static String fn1;
    public static String key;

    public static void encript(String fn) {
        InputStream in = null;
          try {
              in = new FileInputStream(new File(fn));
              OutputStream out =new FileOutputStream(new File(fn1));
              new PartialEncryption().encrypt(in, out);
//To change body of generated methods, choose Tools | Templates.
          } catch (Exception ex) {
              Logger.getLogger(PartialEncryption.class.getName()).log(Level.SEVERE, null, ex);
          } finally {
              try {
                  in.close();
              } catch (IOException ex) {
                  Logger.getLogger(PartialEncryption.class.getName()).log(Level.SEVERE, null, ex);
              }
          }
    }

    public static void encript1() {
      InputStream in = null;
          try {
              in = new FileInputStream(new File(fn));
              OutputStream out =new FileOutputStream(new File(fn1));
              new PartialEncryption().enc(in, out);
//To change body of generated methods, choose Tools | Templates.
          } catch (Exception ex) {
              Logger.getLogger(PartialEncryption.class.getName()).log(Level.SEVERE, null, ex);
          } finally {
              try {
                  in.close();
              } catch (IOException ex) {
                  Logger.getLogger(PartialEncryption.class.getName()).log(Level.SEVERE, null, ex);
              }
          } //To change body of generated methods, choose Tools | Templates.
    }
    public void encrypt(InputStream in, OutputStream out)throws Exception {
    try {
        // Bytes written to out will be encrypted
        Cipher cipher = Cipher.getInstance(TRANSFORMATION);
     ;
           Key secretKey = new SecretKeySpec(key.getBytes(), ALGORITHM);
          cipher.init(Cipher.ENCRYPT_MODE,secretKey);
       OutputStream out_c = new CipherOutputStream(out,cipher);

        // Read in the cleartext bytes and write to out to encrypt
        int numRead = 0;
        int count = 0;
        boolean first = true;
byte []buf=new byte[1024];
        while ((numRead = in.read(buf)) >= 0) {

            if(count <= 1048576){
                count += numRead;
                out_c.write(buf, 0, numRead);
            }else{

                out.write(buf, 0, numRead);

            }
        }
        out.close();
        out_c.close();


    } catch (java.io.IOException e) {
    }
}

// Movies encrypt only 1 MB.

public void enc(InputStream in, OutputStream out) throws Exception {
    try {
        // Bytes read from in will be decrypted
         Cipher cipher = Cipher.getInstance(TRANSFORMATION);
        
           Key secretKey = new SecretKeySpec(key.getBytes(), ALGORITHM);
          cipher.init(Cipher.DECRYPT_MODE,secretKey);
        InputStream in_c = new CipherInputStream(in, cipher);

        // Read in the decrypted bytes and write the cleartext to out
        int numRead = 0;
        int count = 0;
byte []buf=new byte[1024];
        while ((numRead = in_c.read(buf)) >= 0 && count <= 1048576) {
            count += numRead;
            out.write(buf, 0, numRead);
        }

        //in.skip(count); This removed 1MB from the final file. No need to skip.

        while((numRead = in.read(buf)) >= 0){

            out.write(buf,0,numRead);

        }

        out.close();
    } catch (java.io.IOException e) {
    }
}
public static void main(String ar[]) throws Exception
{

InputStream in =new FileInputStream(new File(fn));
OutputStream out =new FileOutputStream(new File(fn1));
new PartialEncryption().encrypt(in, out);
//new PartialEncryption().enc(in, out);

      
}
}
