/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ieee;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.NoSuchAlgorithmException;
 
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.SecretKeySpec;
import test.ImageEncryptAndDecrypt;
 
/**
 * A utility class that encrypts or decrypts a file.
 * @author www.codejava.net
 *
 */
public class CryptoUtils {
    private static final String ALGORITHM = "AES";
    private static final String TRANSFORMATION = "AES";
 public static String  in,out;
    public static void encrypt(String key, String inputFile, String outputFile)
            throws Exception {
        ImageEncryptAndDecrypt.Encrypt(key,inputFile, outputFile);
    }
 
    public static void decrypt(String key, File inputFile, File outputFile)
            throws Exception {
        doCrypto(Cipher.DECRYPT_MODE, key, inputFile, outputFile);
    }
 
    private static void doCrypto(int cipherMode, String key, File inputFile,
            File outputFile) throws Exception {
        try {
            Key secretKey = new SecretKeySpec(key.getBytes(), ALGORITHM);
            Cipher cipher = Cipher.getInstance(TRANSFORMATION);
            cipher.init(cipherMode, secretKey);
             
            FileInputStream inputStream = new FileInputStream(inputFile);
            byte[] inputBytes = new byte[(int) inputFile.length()];
            inputStream.read(inputBytes);
             
            byte[] outputBytes = cipher.doFinal(inputBytes);
             
            
            
            FileOutputStream outputStream = new FileOutputStream(outputFile);
            outputStream.write(outputBytes);
             
            inputStream.close();
            outputStream.close();
             
        } catch (Exception ex) {
            throw new Exception("Error encrypting/decrypting file", ex);
        }
    }
    public static void main(String[] args) {
        String key = "anju00004EWL7U8Z";
        String ext1="";
   
        File inputFile = new File("D:\\Project2018\\java\\DataHiding\\web\\temp\\anju\\anjuelarge_aa.png");
        String pt=inputFile.getParent();
        System.out.print(pt);
      // File encryptedFile = new File("E:\\a","ec.png");
 File decryptedFile = new File("E:\\a","s2.jpg");
 
         //
        try {
       // CryptoUtils.encrypt(key, inputFile, encryptedFile);
       CryptoUtils.decrypt(key,inputFile , decryptedFile);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            ex.printStackTrace();
        }
    }
}