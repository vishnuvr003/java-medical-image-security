/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package doctorsearch;
import com.ieee.ConvertImage;
import static com.ieee.ConvertImage.p01;
import static com.ieee.ConvertImage.po;
import java.awt.*;
import java.awt.image.*;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import test.Shuffle;


public class SplitImage {
    
    String fn,mj,min;
   public static String aid;
   public static int xt1,yt1,xt2,yt2,st;
   public SplitImage(String fn,String mj,String min) {
    try{
        
       Image image1 = ImageIO.read(new File(fn));
       BufferedImage buffered = (BufferedImage) image1;
       int wid=buffered.getWidth();
       System.out.println(wid);
    // byte[] bytes= ConvertImage.toBytes(fn);
      //S/ystem.out.print("lghth="+bytes.length);
      
      //ConvertImage.toIm(conv,bytes);
      //conv=fn;
       // byte[] cby= ConvertImage.toBytes(conv);
       if(st==0)
   Shuffle.swapTwoRandomTiles(buffered, conv);
       else
           conv=fn;
//       else
//           Shuffle.ReturnTwoRandomTiles(buffered, conv, xt1, yt1, xt2, yt2);
//   // Shuffle.swapTwoRandomTiles(buffered, "E:/b/returned.png");
       int mx=(int)(wid*93.75f/100);
//       int ln=(int)(cby.length*93.75f/100);
//       byte lg[]=new byte[ln];
//       int sn=cby.length-ln;
//      System.out.println(sn);
//       byte sm[]=new byte[sn];
//       int j=0;
//       for(int i=0;i<ln;i++)
//     {
//    lg[i]=cby[i];
//    //j++;
//     }
//     for(int i=ln;i<cby.length;i++)
//     {
//    sm[j]=cby[i];
//  
//    System.out.println(sm[j]);  j++;
//     }
//    // ConvertImage.toIm("e:/a/l.png",lg);
         // ConvertImage.toIm("e:/a/s.png",sm);
       Image img = ImageIO.read(new File(conv));
        BufferedImage cv = (BufferedImage) img;
      // int mx=wid/2;
 System.out.println("max="+mx);
       int mn=wid-mx;
        System.out.println("mn="+mn);
       BufferedImage b1=cv.getSubimage(0, 0,mx, cv.getHeight());
       File outputfile = new File(mj);
       ImageIO.write(b1, "png", outputfile);
       BufferedImage b2=cv.getSubimage(mx,0,mn, cv.getHeight());

       File outputfile1 = new File(min);
       ImageIO.write(b2, "png", outputfile1);
       System.out.println("sixe fis"+b1.getHeight());
         
       
 }catch(Exception ex)
    {
        ex.printStackTrace();
    }
  



}
static  String mainfile,file1,file2,t,conv;
public static void main(String[] args)
   {
       
       try {
           
            //SplitImage v=   new SplitImage();  
               //    v.join1("D:\\Project2018\\java\\DataHiding\\build\\web\\temp","anjul_cts.png","anjus_cts.png");
//mainfile="D:\\Project2018\\java\\DataHiding\\build\\web\\temp\\aa.png";
//file1="D:\\Project2018\\java\\DataHiding\\build\\web\\temp\\larg.png";
//  file2="D:\\Project2018\\java\\DataHiding\\build\\web\\temp\\small.png";
// conv="D:\\Project2018\\java\\DataHiding\\build\\web\\temp\\shuf.png";
      SplitImage v=   new SplitImage(mainfile,file1,file2);   
      
              } catch (Exception ex) {
          
       }
     

   }

    private SplitImage() {
       //To change body of generated methods, choose Tools | Templates.
    }


 public void join1(String fn,String f1,String f2) throws Exception
 {
 byte[]b=getByte(fn+"/encryptedfiles/encrypted/"+f1);
 System.out.print("converted");
 byte[]c=getByte(fn+"/"+f2);
  System.out.print("converted");
 
 for(int bb=b.length,i=0;bb<c.length;bb++,i++)
 {
     b[bb]=c[i];
 
 }

ConvertImage.covert(b,fn+"//Combinednew.png");
        
 }
 public byte[] getByte(String fn)
 {
        try {
            FileInputStream fis = null;
            File file = new File(fn);
            fis = new FileInputStream(file);
            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            byte[] buf = new byte[1024];
            try {
                for (int readNum; (readNum = fis.read(buf)) != -1;) {
                    //Writes to this byte array output stream
                    
                    
                    bos.write(buf, 0, readNum);
                    System.out.println("read " + buf+ " bytes,");
                }
            } catch (IOException ex) {
                Logger.getLogger(ConvertImage.class.getName()).log(Level.SEVERE, null, ex);
            }byte[] bytes = bos.toByteArray();
             return bytes;
        } catch (FileNotFoundException ex) {
            Logger.getLogger(SplitImage.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
 }

//
public void join(String fn,String f1,String f2)
{
        try {
            File path = new File(fn);
            
// load source images
            File file1 = new File(path+"/encryptedfiles/encrypted/"+f1);
            File file2 = new File(path,f2);
            
            BufferedImage img1 = null;
            try {
                img1 = ImageIO.read(file1);
            } catch (Exception ex) {
                System.out.print("err"+ex);
            }
            BufferedImage img2 = null;
            try {
                img2 = ImageIO.read(file2);
            } catch (Exception ex) {
               System.out.print("err"+ex);
            }
            
            int widthImg1 = img1.getWidth();
            int heightImg1 = img1.getHeight();
            //int mx=(int)(widthImg1*93.75f/100);
            // int mx=wid/2;
            
            // int mn=wid-mx;
            int widthImg2 = img2.getWidth();
            int heightImg2 = img2.getHeight();
            
            BufferedImage img = new BufferedImage(
                    widthImg1+widthImg2, // Final image will have width and height as
                    heightImg1, // addition of widths and heights of the images we already have
                    BufferedImage.TYPE_INT_RGB);
            System.out.println("sixe fisss"+img.getHeight());
            boolean image1Drawn = img.createGraphics().drawImage(img1, 0, 0, null); // 0, 0 are the x and y positions
            if(!image1Drawn) System.out.println("Problems drawing first image"); //where we are placing image1 in final image
            
            boolean image2Drawn = img.createGraphics().drawImage(img2, widthImg1, 0, null); // here width is mentioned as width of
            if(!image2Drawn) System.out.println("Problems drawing second image"); // image1 so both images will come in same level
// horizontally
            File final_image = new File(path, "combined.png");; // “png can also be used here”
            boolean final_Image_drawing = ImageIO.write(img, "png", final_image); //if png is used, write “png” instead “jpeg”
            if(!final_Image_drawing) System.out.println("Problems drawing final image");
        } catch (Exception ex) {
            System.out.print(ex);
        }
}
}

//// Save as new image
//ImageIO.write(combined, "jpg", new File("D:\\Project2018\\java\\Imagesecurity\\web\\join", "combined.jpg"));
