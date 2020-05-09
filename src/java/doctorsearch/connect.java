/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package doctorsearch;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author S17
 */
public class connect {
        public static String cid,sid,loc,sp;
    Connection con;
    Statement st;
    public ResultSet rs;
    public void getcon() throws Exception
    {
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/datahiding","root","");
        st=con.createStatement();
    }
    public int save(String s)
    { int t=0;
        try {
            getcon();
            t=st.executeUpdate(s);
        } catch (Exception ex) {
            Logger.getLogger(connect.class.getName()).log(Level.SEVERE, null, ex);
        }
    return t;
    }
    public void read(String s)
    {
        try {
            getcon();
            rs=st.executeQuery(s);
        } catch (Exception ex) {
            Logger.getLogger(connect.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
}
