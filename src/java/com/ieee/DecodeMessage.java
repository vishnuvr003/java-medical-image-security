/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ieee;



import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;

/**
 *
 * @author S7
 */
public class DecodeMessage {
    public static String dfn="E:/watermarked.png";
  public  static String rem;
  public static String path; 
    public static void main(String ar[])
    {
        try {
            File file = new File(dfn);

          //  File final_image = new File(fn);;
            BufferedImage img1 = ImageIO.read(file); 
//           Histogram g=new Histogram();
//                        int imageWidth = img1.getWidth(), imageHeight = img1.getHeight();
//  int src[]=Utill.convertToPixels(img1);
  int peak=0;
                  // peak=0;
  System.out.print("peack="+peak);
  rem=new DecodeMessage().decodeMessage(img1, peak);
  System.out.print(rem);
        } catch (IOException ex) {
            Logger.getLogger(DecodeMessage.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
     private String  decodeMessage(BufferedImage image,int p) {
    int len = extractInteger(image,0, 0);
   System.out.println( "legth="+len);
    try
    {
        if(len<100)
        {
   byte b[] = new byte[len];
   for(int i=0; i<len; i++)
      b[i] = extractByte(image, (i*8+32),p);
       
   return new String(b);
    }
    }catch(Exception e)
    {
 
    }
        return "";
   }

 private int extractInteger(BufferedImage img, int start, int storageBit) {
    int maxX = img.getWidth(), maxY = img.getHeight(), 
      startX = start/maxY, startY = start - startX*maxY, count=0;
    int length = 0;
    for(int i=startX; i<maxX && count<32; i++) {
       for(int j=startY; j<maxY && count<32; j++) {
         int rgb = img.getRGB(i, j), bit = getBitValue(rgb, storageBit);
         length = setBitValue(length, count, bit);
          //System.out.print(bit);
         count++;
         }
      }
   return length;
   }

 private byte extractByte(BufferedImage img, int start, int storageBit) {
    int maxX = img.getWidth(), maxY = img.getHeight(), 
       startX = start/maxY, startY = start - startX*maxY, count=0;
    byte b = 0;
    for(int i=startX; i<maxX && count<8; i++) {
      for(int j=startY; j<maxY && count<8; j++) {
         int rgb = img.getRGB(i, j), bit = getBitValue(rgb, storageBit);
          b = (byte)setBitValue(b, count, bit);
         
         count++;
         }
       }
    return b;
    }

 

 private int getBitValue(int n, int location) {
   int v = n & (int) Math.round(Math.pow(2, location));
    return v==0?0:1;
    }
 private int setBitValue(int n, int location, int bit) {
    int toggle = (int) Math.pow(2, location), bv = getBitValue(n, location);
  if(bv == bit)
     return n;
 if(bv == 0 && bit == 1)
     n |= toggle;
   else if(bv == 1 && bit == 0)
    n ^= toggle;
    return n;
    }
}
