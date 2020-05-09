/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package test;
import static com.ieee.NHistogram.fn1;
import doctorsearch.SplitImage;
import doctorsearch.connect;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
/**
 *
 * @author S7
 */
public class Shuffle {
   static int tileWidth,tileHeight;
   static String shu="E:/a/shuf.png";
    static String ret="E:/a/ret.png";
    public static void main(String ar[])
    {
        try {
            BufferedImage img1 = ImageIO.read(new File("D:\\Project2018\\java\\DataHiding\\build\\web\\Cloud\\anju\\nfelarge_download (2).png"));
           
            tileWidth=img1.getWidth()/2;
            tileHeight=img1.getHeight()/2; 
          //  swapTwoRandomTiles(img1,shu);
            ReturnTwoRandomTiles(img1,ret,0,1,1,0);
        } catch (IOException ex) {
            Logger.getLogger(Shuffle.class.getName()).log(Level.SEVERE, null, ex);
        }
            
    }
    
public static void swapTwoRandomTiles (BufferedImage b,String shu) {
    //choose x and y coordinates randomly for the tiles
     Random r=new Random();
      tileWidth=b.getWidth()/2;
            tileHeight=b.getHeight()/2; 
     int numCols=b.getWidth()/tileWidth;
     int numRows=b.getHeight()/tileHeight;
    int xt1 = r.nextInt (numCols);
    int yt1 = r.nextInt (numRows);
    int xt2 = r.nextInt (numCols);
    int yt2 = r.nextInt (numRows);
    SplitImage.xt1=xt1;
      SplitImage.xt2=xt2;
        SplitImage.yt1=yt1;
  SplitImage.yt2=yt2;
    swapTiles (b,xt1,yt1,xt2,yt2,shu);
}
public static void ReturnTwoRandomTiles (BufferedImage b,String shu,int xt1,int yt1,int xt2,int yt2) {
    //choose x and y coordinates randomly for the tiles
     Random r=new Random();
      tileWidth=b.getWidth()/2;
            tileHeight=b.getHeight()/2; 
     int numCols=b.getWidth()/tileWidth;
     int numRows=b.getHeight()/tileHeight;
   
    //SplitImage.xt1=xt1;
     // SplitImage.xt2=xt2;
     //   SplitImage.yt1=yt1;
  //SplitImage.yt2=yt2;
    swapTiles (b,xt1,yt1,xt2,yt2,shu);
}

static void swapTiles(BufferedImage b, int xt1, int yt1, int xt2, int yt2,String shu) {
    int tempPixel = 0;
    for (int x=0; x<tileWidth; x++) {
        for (int y=0; y<tileHeight; y++) {
            //save the pixel value to temp
            tempPixel = b.getRGB(x + xt1*tileWidth, y + yt1*tileHeight);
            //write over the part of the image that we just saved, getting data from the other tile
            b.setRGB ( x + xt1*tileWidth, y + yt1*tileHeight, b.getRGB ( x+xt2*tileWidth, y+yt2*tileHeight));
            //write from temp back to the other tile
            b.setRGB ( x + xt2*tileWidth, y + yt2*tileHeight, tempPixel);
        }
    }
        try {  
            ImageIO.write(b,"png",new File(shu));
        } catch (IOException ex) {
            Logger.getLogger(Shuffle.class.getName()).log(Level.SEVERE, null, ex);
        }
} 
 
}
