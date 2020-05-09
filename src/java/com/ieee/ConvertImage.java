/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ieee;

import doctorsearch.connect;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.*;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
 
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import javax.imageio.ImageReadParam;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;
 
public class ConvertImage {

 public static int po,p01;
 public static void main(String ar[]) throws Exception
 {
 String fn="D:\\Project2018\\java\\DataHiding\\build\\web\\temp\\aa.png";
  String fo="E:\\a\\aas.png";
    String foo="E:\\a\\aac.png";
 byte[]b=toBytes(fn);
     toIm(fo,b);
    byte[]b1=toBytes(fo);
       toIm(foo,b1);

 }
 public static void toIm(String ff,byte []b)
 {
 OutputStream out = null;

try {
    out = new BufferedOutputStream(new FileOutputStream(ff));
    out.write(b);
} catch(Exception e) {
    
}
 }
    public static byte [] toBytes(String img)  {
        FileInputStream fis = null;
     try {
         /*
          * 1. How to convert an image file to  byte array?
          */
         File file = new File(img);
         fis = new FileInputStream(file);
         ByteArrayOutputStream bos = new ByteArrayOutputStream();
         byte[] buf = new byte[1024];
         try {
             for (int readNum; (readNum = fis.read(buf)) != -1;) {
                 //Writes to this byte array output stream
                 
                 
                 bos.write(buf, 0, readNum);
          // System.out.println("read " + readNum + " bytes,");
             }
         } catch (IOException ex) {
             Logger.getLogger(ConvertImage.class.getName()).log(Level.SEVERE, null, ex);
         }byte[] bytes = bos.toByteArray();
        Random R=new Random();
        //System.out.println("len=b"+bytes.length);
       
        int st=((bytes.length-1)*15)/100;
      
        int end=((bytes.length-1)*75)/100;
         System.out.println(st+"-");
          System.out.print(end);
         int j=end;
       // for(int i=bytes.length-1;i>=bytes.length/2;i-=5)
             for(int i=st ;i<end;i+=5)
        {
            
       //po=R.nextInt(bytes.length-1);
   // p01=R.nextInt(bytes.length-1);
        // System.out.println("waqpj"+i+"-"+j);
            bytes=   swap(bytes,i,j);
            
        // ps=new ArrayList();
          
      j-=5;
      
        }
         return bytes;
        // covert(bytes,"c1.jpg");
        // bytes=swap(bytes, po, p01);
       //  covert(bytes,"c2.jpg");
         /*
         * 2. How to convert byte array back to an image file?
         convert bytes() */
        
     } catch (FileNotFoundException ex) {
         Logger.getLogger(ConvertImage.class.getName()).log(Level.SEVERE, null, ex);
     } finally {
         try {
             fis.close();
         } catch (IOException ex) {
             Logger.getLogger(ConvertImage.class.getName()).log(Level.SEVERE, null, ex);
         }
     }
     return null;
 
    }

    private static byte[] swap(byte[] bytes, int po, int p01) {
        
byte  tem=bytes[po];
bytes[po]=bytes[p01];
bytes[p01]=tem;
return bytes;

//To change body of generated methods, choose Tools | Templates.
    }

    public static void covert(byte[] bytes,String f) {
     try {
         ByteArrayInputStream bis = new ByteArrayInputStream(bytes);
         Iterator<?> readers = ImageIO.getImageReadersByFormatName("jpg");
         
         //ImageIO is a class containing static methods for locating ImageReaders
         //and ImageWriters, and performing simple encoding and decoding.
         
         ImageReader reader = (ImageReader) readers.next();
         Object source = bis;
         ImageInputStream iis = ImageIO.createImageInputStream(source);
         reader.setInput(iis, true);
         ImageReadParam param = reader.getDefaultReadParam();
         
         Image image = reader.read(0, param);
         //got an image file
         
         BufferedImage bufferedImage = new BufferedImage(image.getWidth(null), image.getHeight(null), BufferedImage.TYPE_INT_RGB);
         //bufferedImage is the RenderedImage to be written
         
         Graphics2D g2 = bufferedImage.createGraphics();
         g2.drawImage(image, null, null);
         
         File imageFile = new File(f);
         ImageIO.write(bufferedImage, "jpg", imageFile);
         
         System.out.println(imageFile.getPath()+"File created"); //To change body of generated methods, choose Tools | Templates.
     } catch (Exception ex) {
       System.out.println(ex);
     }
    }
}