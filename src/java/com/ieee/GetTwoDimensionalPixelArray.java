/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ieee;
import static com.ieee.RandomImage.shu;
import java.awt.image.BufferedImage;

import java.awt.image.DataBufferByte;

import java.io.File;

import java.io.IOException;

import javax.imageio.ImageIO;

 

public class GetTwoDimensionalPixelArray {



       public static void main(String[] args) throws IOException { //required to throws exception for loading image

 

              BufferedImage inputImage = ImageIO.read(new File("D:\\Project2018\\java\\DataHiding\\web\\img\\cts.jpg")); //load the image from this current folder

              int[][] result = convertToArray(inputImage); //pass buffered image to the method and get back the result

            // shu(result,"D:\\Project2018\\java\\DataHiding\\web\\img\\cts1.jpg");
 

       } //!end of main!//

      

       //!start of method!//

       private static int[][] convertToArrayLocation(BufferedImage inputImage) {

 

              final byte[] pixels = ((DataBufferByte) inputImage.getRaster()

                           .getDataBuffer()).getData(); // get pixel value as single array from buffered Image

              final int width = inputImage.getWidth(); //get image width value

              final int height = inputImage.getHeight(); //get image height value

              int[][] result = new int[height][width]; //Initialize the array with height and width

 

              //this loop allocates pixels value to two dimensional array

              for (int pixel = 0, row = 0, col = 0; pixel < pixels.length-1; pixel++) {

                     int argb = 0;

                     argb = (int) pixels[pixel];

 

                     if (argb < 0) { //if pixel value is negative, change to positive //still weird to me

                           argb += 256;

                     }

 

                     result[row][col] = argb;

                     col++;

                     if (col == width) {

                           col = 0;

                           row++;

                     }

              }

              return result; //return the result as two dimensional array

       } //!end of method!//
       public static int[][] convertToArray(BufferedImage image)
{

    if (image == null || image.getWidth() == 0 || image.getHeight() == 0)
        return null;

    // This returns bytes of data starting from the top left of the bitmap
    // image and goes down.
    // Top to bottom. Left to right.
    final byte[] pixels = ((DataBufferByte) image.getRaster()
            .getDataBuffer()).getData();

    final int width = image.getWidth();
    final int height = image.getHeight();

    int[][] result = new int[height][width];

    boolean done = false;
    boolean alreadyWentToNextByte = false;
    int byteIndex = 0;
    int row = 0;
    int col = 0;
    int numBits = 0;
    byte currentByte = pixels[byteIndex];
    while (!done)
    {
        alreadyWentToNextByte = false;

        result[row][col] = (currentByte & 0x80) >> 7;
        currentByte = (byte) (((int) currentByte) << 1);
        numBits++;

        if ((row == height - 1) && (col == width - 1))
        {
            done = true;
        }
        else
        {
            col++;

            if (numBits == 8)
            {
                currentByte = pixels[++byteIndex];
                numBits = 0;
                alreadyWentToNextByte = true;
            }

            if (col == width)
            {
                row++;
                col = 0;

                if (!alreadyWentToNextByte)
                {
                    currentByte = pixels[++byteIndex];
                    numBits = 0;
                }
            }
        }
    }

    return result;
}

} //!end of clas