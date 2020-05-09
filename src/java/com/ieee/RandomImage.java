/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ieee;
 import java.awt.Image;
import java.awt.image.ImageObserver;
import java.awt.image.PixelGrabber;
// Java program to demonstrate creation of random pixel image
import java.io.File;
import java.io.IOException;
import java.awt.image.BufferedImage;
import java.awt.image.DataBufferByte;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
public class RandomImage
{int widthImg1;int heightImg1;
	public static void main(String args[])throws IOException
	{
             File final_image = new File("D:\\Project2018\\java\\DataHiding\\web\\img\\cts.jpg");;
        BufferedImage img1 = ImageIO.read(final_image);
        double[][] C=img2matriz(img1);
        int rows=C.length;
       
int cols = C[0].length;
//swapTwoRandomTiles(C,rows,cols);
  shu(C,"D:\\Project2018\\java\\DataHiding\\web\\img\\cts1.jpg");



}
static void swapTwoRandomTiles (int[][]c,int numRows,int numCols) {
   
           Random random=new Random();
    int xt1 = random.nextInt (numCols);
    int yt1 = random.nextInt (numRows);
    int xt2 = random.nextInt (numCols);
    int yt2 = random.nextInt (numRows);

    swapTiles (c,xt1,yt1,xt2,yt2);
}

static void swapTiles(int [][]a, int xt1, int yt1, int xt2, int yt2) {
    try {
        Random random = new Random();
        int te[][]=a;
        for (int i = a.length - 1; i > 0; i--) {
            for (int j = a[i].length - 1; j > 0; j--) {
                int m = random.nextInt(i + 1);
                int n = random.nextInt(j + 1);
                
                int temp = a[i][j];
                a[i][j] = a[m][n];
                a[m][n] = temp;
            }
        }
       // shu(a,"D:\\Project2018\\java\\DataHiding\\web\\img\\u1.jpg");
       // shu(te,"D:\\Project2018\\java\\DataHiding\\web\\img\\u2.jpg");
    } catch (Exception ex) {
        Logger.getLogger(RandomImage.class.getName()).log(Level.SEVERE, null, ex);
    }
}
public static void shu(double[][]a,String fn)
{
    try {
        BufferedImage img = new BufferedImage(
                a.length, a[0].length, BufferedImage.TYPE_BYTE_GRAY);
        for(int x = 0; x < a.length; x++){
            for(int y = 0; y<a[x].length; y++){
                img.setRGB(y, x, (int)Math.round(a[y][x]));
            }
        }
        File imageFile = new File(fn);
        ImageIO.write(img, "jpg", imageFile);
    } catch (IOException ex) {
        Logger.getLogger(RandomImage.class.getName()).log(Level.SEVERE, null, ex);
    }
}

 public static  double[][] img2matriz(BufferedImage bi){
    double[][] C=new double[bi.getHeight()][bi.getWidth()];
    for(int i=0;i<bi.getHeight();i++) 
    {
        for(int j=0;j<bi.getWidth();j++)
        {
           C[i][j] = bi.getRGB(i, j);
        }
    }     
    return C;
}


    /**
     * Converts a java.awt.Image into an array of pixels
     */
    

 private static int[][] convertTo2DWithoutUsingGetRGB(BufferedImage image) {

  final byte[] pixels = ((DataBufferByte) image.getRaster().getDataBuffer()).getData();
  final int width = image.getWidth();
  final int height = image.getHeight();
  final boolean hasAlphaChannel = image.getAlphaRaster() != null;

  int[][] result = new int[height][width];
  if (hasAlphaChannel) {
     final int pixelLength = 4;
     for (int pixel = 0, row = 0, col = 0; pixel < pixels.length; pixel += pixelLength) {
        int argb = 0;
        argb += (((int) pixels[pixel] & 0xff) << 24); // alpha
        argb += ((int) pixels[pixel + 1] & 0xff); // blue
        argb += (((int) pixels[pixel + 2] & 0xff) << 8); // green
        argb += (((int) pixels[pixel + 3] & 0xff) << 16); // red
        result[row][col] = argb;
        col++;
        if (col == width) {
           col = 0;
           row++;
        }
     }
  } else {
     final int pixelLength = 3;
     for (int pixel = 0, row = 0, col = 0; pixel < pixels.length; pixel += pixelLength) {
        int argb = 0;
        argb += -16777216; // 255 alpha
        argb += ((int) pixels[pixel] & 0xff); // blue
        argb += (((int) pixels[pixel + 1] & 0xff) << 8); // green
        argb += (((int) pixels[pixel + 2] & 0xff) << 16); // red
        result[row][col] = argb;
        col++;
        if (col == width) {
           col = 0;
           row++;
        }
     }
  }

  return result;
 }
}
