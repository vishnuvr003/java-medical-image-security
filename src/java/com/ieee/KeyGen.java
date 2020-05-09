/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ieee;

import java.util.Random;

/**
 *
 * @author S7
 */
public class KeyGen {
    
  public String genKey(String nm) {
       String nm1="";
        if(nm.length()>8)
            nm1=nm.substring(0,7);
        else if(nm.length()==8)
            nm1=nm;
        else
        {
            nm1=nm;
        for(int i=nm.length();i<8;i++)
        {
        nm1=nm1+"0";
        }
        }
        nm1=getrand(nm1);
        return  nm1;                        
    }
    
    public String getrand(String an)
    {
    char[] chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".toCharArray();
Random rnd = new Random();
StringBuilder sb = new StringBuilder(an);
for (int i = 0; i < 8; i++)
    sb.append(chars[rnd.nextInt(chars.length)]);

return sb.toString();
    }
    public static void main(String ar[])

    {
        String k=new KeyGen().genKey("ramya");
            
    System.out.print(k.length()+","+k);
    }
            }
