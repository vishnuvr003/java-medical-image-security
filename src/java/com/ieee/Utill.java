/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ieee;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.awt.image.ImageObserver;
import java.awt.image.PixelGrabber;
import java.io.File;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;

public final class Utill {
    /**
     * Converts a java.awt.Image into an array of pixels
     */
    public static int[] convertToPixels(Image img) {
      int width = img.getWidth(null);
      int height = img.getHeight(null);
      int[] pixel = new int[width * height];

      PixelGrabber pg = new PixelGrabber(img, 0, 0, width, height, pixel, 0, width);
      try {
        pg.grabPixels();
      } catch (InterruptedException e) {
        throw new IllegalStateException("Error: Interrupted Waiting for Pixels");
      }
      if ((pg.getStatus() & ImageObserver.ABORT) != 0) {
        throw new IllegalStateException("Error: Image Fetch Aborted");
      }
      return pixel;
    }
    public static  void  change(String inputImage,String oututImage, String formatName)
    {
   // String inputImage = "D:/Photo/Pic1.jpg";
       // String oututImage = "D:/Photo/Pic1.png";
     //   String formatName = "PNG";
        try {
            boolean result = ImageConverter.convertFormat(inputImage,
                    oututImage, formatName);
            if (result) {
                System.out.println("Image converted successfully.");
            } else {
                System.out.println("Could not convert image.");
            }
        } catch (Exception ex) {
            System.out.println("Error during converting image.");
            ex.printStackTrace();
        }
    }
    public static String  join(String f1,String f2,String f3)
    {
        try {
            
            //PartialEncryption.encript1();
            BufferedImage img1 = ImageIO.read(new File(f1));
            BufferedImage img2 = ImageIO.read(new File(f2));
            BufferedImage joinedImg = joinBufferedImage(img1, img2);
            ImageIO.write(joinedImg, "png", new File(f3));
            return  "Succsess";
        } catch (IOException ex) {
           return ex.getMessage();
        }
    }
    public static BufferedImage joinBufferedImage(BufferedImage img1,
      BufferedImage img2) {
  //  int offset = 2;
    int width = img1.getWidth() + img2.getWidth() ;
    int height = Math.max(img1.getHeight(), img2.getHeight()) ;
    BufferedImage newImage = new BufferedImage(width, height,
        BufferedImage.TYPE_INT_ARGB);
    Graphics2D g2 = newImage.createGraphics();
    //Color oldColor = g2.getColor();
   // g2.setPaint(Color.BLACK);
    //g2.fillRect(0, 0, width, height);
    //g2.setColor(oldColor);
    g2.drawImage(img1, null, 0, 0);
    g2.drawImage(img2, null, img1.getWidth(), 0);
    g2.dispose();
    return newImage;
  }
    public static void main(String ar[])
    {
    System.out.print(join("D:\\Project2018\\java\\DataHiding\\build\\web\\temp/anjul_cts.png", "D:\\Project2018\\java\\DataHiding\\build\\web\\temp/anjus_cts.png", "D:\\Project2018\\java\\DataHiding\\build\\web\\temp/anju/anjul_cts.png"));
    }

}