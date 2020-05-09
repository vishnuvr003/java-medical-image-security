/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package test;
import com.ieee.CryptoUtils;
import java.io.*;
/**
 *
 * @author S7
 */
public class Join {
    public static final String FILE_SUFFIX = ".png";
     static void splitFile(String  INPUT_FILE) throws Exception{
 
        File inputFile = new File(INPUT_FILE + "_Splits");
        inputFile.mkdir();
int NUMBER_OF_OUTPUT_FILES=2;
        RandomAccessFile raf = new RandomAccessFile(INPUT_FILE, "r");

        long sourceSize = raf.length();
        long bytesPerSplit =  (long)(sourceSize*93.75f/100);
        long remainingBytes = sourceSize-bytesPerSplit;

        int maxReadBufferSize = 8 * 1024; // 8KB
        for (int destIx = 1; destIx <= NUMBER_OF_OUTPUT_FILES; destIx++) {
            BufferedOutputStream bw = new BufferedOutputStream(new FileOutputStream(INPUT_FILE + "_Splits\\split." + destIx + FILE_SUFFIX));
            if (bytesPerSplit > maxReadBufferSize) {
                long numReads = bytesPerSplit / maxReadBufferSize;
                long numRemainingRead = bytesPerSplit % maxReadBufferSize;
                for (int i = 0; i < numReads; i++) {
                    readWrite(raf, bw, maxReadBufferSize);
                }
                if (numRemainingRead > 0) {
                    readWrite(raf, bw, numRemainingRead);
                }
            } else {
                readWrite(raf, bw, bytesPerSplit);
            }
            bw.close();
        }
        if (remainingBytes > 0) {
            BufferedOutputStream bw = new BufferedOutputStream(new FileOutputStream("split." + NUMBER_OF_OUTPUT_FILES + 1));
            readWrite(raf, bw, remainingBytes);
            bw.close();
        }
        raf.close();
    }
    public static void mergeFiles( String [] INPUT_FILE ) {
int NUMBER_OF_OUTPUT_FILES=2;
        File[] files = new File[2];
        for(int i=1;i<=NUMBER_OF_OUTPUT_FILES;i++){
            files[i-1] = new File(INPUT_FILE [i-1]);
        }
     
            
    

        String mergedFilePath = files[0].getParent();


        File mergedFile = new File(mergedFilePath+"/mer.png");

        mergeFiles(files, mergedFile);
    }

    public static void mergeFiles(File[] files, File mergedFile) {

        FileOutputStream fstream = null;
        BufferedOutputStream out = null;
        try {
            fstream = new FileOutputStream(mergedFile, true);
             out = new BufferedOutputStream(fstream);
        } catch (IOException e1) {
            e1.printStackTrace();
        }

        for (File f : files) {
            System.out.println("merging: " + f.getName());
            FileInputStream fis;
            try {
               // fis = new FileInputStream(f);
                BufferedInputStream in = new BufferedInputStream(new FileInputStream(f));

                byte aLine;
                byte[] b=new byte[1024];
                

                in.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        try {
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
     static void readWrite(RandomAccessFile raf, BufferedOutputStream bw, long numBytes) throws IOException {
        byte[] buf = new byte[(int) numBytes];
        int val = raf.read(buf);
        if (val != -1) {
            bw.write(buf);
        }
    }
   public static void main(String ar[]) throws Exception
   {
    byte[] buffer = new byte[1000];        
    try {
        FileInputStream fis = new FileInputStream(new File("E:\\a\\c2.png"));
        BufferedInputStream bis = new BufferedInputStream(fis);
    //    CryptoUtils.encrypt("anju0000ZN07NTRQ", new File("E:\\a\\c2.png"), new File("E:\\a\\en.png"));
      String file[]={"E:\\a\\c2.png","E:\\a\\c3.png"};
        mergeFiles(file);
        splitFile("E:/a/mer.png");
    } catch (IOException e)
    {
        e.printStackTrace();
    }
   }
}
