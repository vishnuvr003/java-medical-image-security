/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package test;

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.File;
import java.security.SecureRandom;
import javax.imageio.ImageIO;

public class ImageEncryptAndDecrypt {
    public static void main(String ar[])
    {
    Encrypt("anju0000R0EULSHG","D:\\Project2018\\java\\MountcionFinel\\DataHidingFinel\\build\\web\\temp\\anju/elarge_spine-normal-lumbar-1.png","E:/a/anju.png");
   
            //Encrypt("e:/a/NEWR.png","e:/A/RE.PNG","anju");

    }
  
public static void Encrypt(String password,String sPath,String dPath){
   // String sPath="E:/a/des.png",dPath="E:/a/en.png";
    StringBuilder sb=new StringBuilder();
    char st; 
    int value;
    try{
        for (int i = 0; i < password.length(); i++) {
             st=password.charAt(i);
             value=(int)st;
             sb.append(value);
        }
    SecureRandom sr= SecureRandom.getInstance("SHA1PRNG");
    sr.setSeed(sb.toString().getBytes());
    BufferedImage FSImg=ImageIO.read(new File(sPath));  
        for (int w = 0; w < FSImg.getWidth(); w++) {
            for (int h = 0; h < FSImg.getHeight(); h++) {
                Color color=new Color(FSImg.getRGB(w, h));
                Color newColor=new Color(color.getRed()^sr.nextInt(255), color.getGreen()^sr.nextInt(255), color.getBlue()^sr.nextInt(255));
                FSImg.setRGB(w, h, newColor.getRGB());
            }
        }
    System.out.println("Process Completed!!..");
    ImageIO.write(FSImg, "png", new File(dPath));
    System.out.println("Wrote to "+dPath);
    }catch(Exception e){
    e.printStackTrace();}
    }
}
