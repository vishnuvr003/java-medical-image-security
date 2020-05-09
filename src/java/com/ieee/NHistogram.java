/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ieee;

import java.awt.image.BufferedImage;
import java.awt.image.WritableRaster;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import javax.swing.JLabel;
import javax.swing.JOptionPane;

/**
 *
 * @author S7
 */
public class NHistogram {
    BufferedImage sourceImage = null, embeddedImage = null;
    FileInputStream  fis;
     public static String mess ="HAI how are you";
     public static String fn="D:\\Project2018\\java\\MountcionFinel\\DataHidingFinel\\build\\web\\temp/anju/dspine-normal-lumbar-1.png",fn1="E:/watermarked.png",fnn;
    public static void main(String ar[])
    {
        try {
            
            NHistogram n=new NHistogram();
            n.embedMessage();
        } catch (FileNotFoundException ex) {
            Logger.getLogger(NHistogram.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
       NHistogram() throws FileNotFoundException{
        try {
            File file = new File(fn);
          //  Utill.change(fn, fn.replace(".jpg", ".png"), "PNG");
          //  File final_image = new File(fn);
         //fn="D:\\Project2018\\java\\DataHiding\\web\\img\\b1n.png";
            BufferedImage img1 = ImageIO.read(file);
            embeddedImage=img1;
           // sourceImage=img1;
            
        } catch (IOException ex) {
            Logger.getLogger(NHistogram.class.getName()).log(Level.SEVERE, null, ex);
        }
       
       }
//       
//    BufferedImage equalize(BufferedImage src){
//        BufferedImage nImg = new BufferedImage(src.getWidth(), src.getHeight(), BufferedImage.TYPE_BYTE_GRAY);
//        WritableRaster wr = src.getRaster();
//        WritableRaster er = nImg.getRaster();
//        int totpix= wr.getWidth()*wr.getHeight();
//        int[] histogram = new int[256];
// 
//        for (int x = 1; x < wr.getWidth(); x++) {
//            for (int y = 1; y < wr.getHeight(); y++) {
//                histogram[wr.getSample(x, y, 0)]++;
//            }
//        }
//         
//        int[] chistogram = new int[256];
//        chistogram[0] = histogram[0];
//        for(int i=1;i<256;i++){
//            chistogram[i] = chistogram[i-1] + histogram[i];
//        }
//         
//        float[] arr = new float[256];
//        for(int i=0;i<256;i++){
//            arr[i] =  (float)((chistogram[i]*255.0)/(float)totpix);
//        }
//         
//        for (int x = 0; x < wr.getWidth(); x++) {
//            for (int y = 0; y < wr.getHeight(); y++) {
//                int nVal = (int) arr[wr.getSample(x, y, 0)];
//                er.setSample(x, y, 0, nVal);
//            }
//        }
//        nImg.setData(er);
//        return nImg;
//    }
//     BufferedImage getGrayscaleImage(BufferedImage src) {
//        BufferedImage gImg = new BufferedImage(src.getWidth(), src.getHeight(), BufferedImage.TYPE_BYTE_GRAY);
//        WritableRaster wr = src.getRaster();
//        WritableRaster gr = gImg.getRaster();
//        for(int i=0;i<wr.getWidth();i++){
//            for(int j=0;j<wr.getHeight();j++){
//                gr.setSample(i, j, 0, wr.getSample(i, j, 0));
//            }
//        }
//        gImg.setData(gr);
//        return gImg;
//    }
//      public static void main(String[] args) {
//         
//     
//            NHistogram he = new NHistogram("D:\\Project2018\\java\\DataHiding\\web\\img\\u.jpg", "D:\\Project2018\\java\\DataHiding\\web\\img\\u1.jpg");
//           
//           // he.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
//     
//    }
    private void embedMessage() {
  
   // embeddedImage = sourceImage.getSubimage(0,0,
    // sourceImage.getWidth(),sourceImage.getHeight());
    embedMessage(embeddedImage, mess);
    
   // JLabel l = new JLabel("No Priview Available Image Encrypted");
   // embeddedPane.getViewport().add(l);
   //this.validate();
    }

 private void embedMessage(BufferedImage img, String mess) {
        try {
            int messageLength = mess.length();
            System.out.println(messageLength);
            int imageWidth = img.getWidth(), imageHeight = img.getHeight(),
                    imageSize = imageWidth * imageHeight;
            // embedInteger(img, messageLength, 0, 0);
            Histogram g=new Histogram();
            int src[]=Utill.convertToPixels(img);
            int peak=new Histogram().peak(src, imageWidth, imageHeight);
           // peak=0;
           double zeop=new Histogram().mini(src, imageWidth, imageHeight);
            if(messageLength * 8 + 32 > imageSize) {
                
                return;
            }     embedInteger(img, messageLength,0, 0);
      byte b[] = mess.getBytes();
            System.out.print("peack="+peak);
                       shiftbit(src,peak,zeop,img.getHeight());

            for(int i=0; i<b.length; i++)
                embedByte(img, b[i], (i*8+32), 0,peak);
            ImageIO.write(img,"png",new File(fn1));
        } catch (IOException ex) {
            Logger.getLogger(NHistogram.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
 
 private void embedInteger(BufferedImage img, int n, int start, int storageBit) {
    int maxX = img.getWidth(), maxY = img.getHeight(), 
     startX = start/maxY, startY = start - startX*maxY, count=0;
   for(int i=startX; i<maxX && count<32; i++) {
      for(int j=startY; j<maxY && count<32; j++) {
          
        int rgb = img.getRGB(i, j), bit = getBitValue(n, count);
         rgb = setBitValue(rgb, storageBit, bit);
         img.setRGB(i, j, rgb);
         count++;
          }
       }
    }
 
 private void embedByte(BufferedImage img, byte b, int start, int storageBit,int p) {
  int maxX = img.getWidth(), maxY = img.getHeight(), 
         
     startX = start/maxY, startY = start - startX*maxY, count=0;
      System.out.println(startY);
   for(int i=startX; i<maxX && count<8; i++) {
       for(int j=startY; j<maxY && count<8; j++) {
           
          int rgb = img.getRGB(i, j), bit = getBitValue(b, count);
          rgb = setBitValue(rgb, storageBit, bit);
          img.setRGB(i, j, rgb);
         
         count++;
         }
       }

   }
 
 private void embedByte1(BufferedImage img, byte b, int start, int storageBit,int p,double  zerop) {
  int maxX = (int)zerop, maxY = img.getHeight(), 
     startX = start/maxY, startY = start - startX*maxY, count=0;
  
   for(int i=startX; i<maxX && count<8; i++) {
       for(int j=startY; j<maxY && count<8; j++) {
          int rgb = img.getRGB(i, j), bit = getBitValue(b, count);
          rgb = setBitValue(rgb, storageBit, bit);
          img.setRGB(i, j, rgb);
         
         count++;
         }
       }
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
 
// public int[]  histogram(int [] src, int width, int height){
//    
//    i_w = width;
//    i_h = height;
//    src_1d = new int[i_w * i_h];
//    src_1d = src;
//    
//    hist_1d = new int[hist_w*i_h];
//    int gs = grey_scales; 
//    hist_values = new double[gs];
//    
//    //histogram "normalisation"
//    double increment = 1.0/256.0; 
//    
//    //the grayscale value appearing more often.
//    double max_value = 0.0;
//    
//    //to spread over 256 vertical values of histogram
//    int scale_factor = 0; 
//    int blue;
//    int l = hist_1d.length;
//    int n = 1; 
//    
//    for(int i=0; i<src_1d.length; i++){
//      blue = src_1d[i] & 0x000000ff;
//      hist_values[blue] += increment;
//      max_value = (hist_values[blue]>max_value)?hist_values[blue]:max_value;
//    }
//    
//    scale_factor = (int) Math.floor(i_h / max_value);
//    
//    for(int i=0;i<hist_values.length;i++){
//      hist_values[i] *= scale_factor;
//    }
//    
//    //this is the bit which represents the hist bins as black
//    //lines.
//    
//    for(int i = 0; i < hist_values.length; i++){
//      while (hist_values[i] > 0){
//	  hist_1d[(l - gs*n) + i] = fgcolor;
//	hist_values[i] -= 1;
//	n++;
//      }
//      n=1;
//    }
//    
//    return hist_1d ;  
//  }

    private void shiftbit(int p, int maxX) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private void shiftbit(int[] img, int start, double zero,int height) {
     try
             {
            for (int col = 0; col < start; col++) {
                int pixel = img[col];
                pixel = (pixel & 0000) << 1;
                img[      col] = pixel;
    }
    }
     catch(Exception e)
     {
         
         
     }}
 
}
