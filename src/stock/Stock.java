/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package stock;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Yassine Hero
 */
public class Stock {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException {
       
        Connection cnx= conn();
        new login().setVisible(true);
            
        
           
       
    }
    public static Connection conn(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            
            String url="jdbc:mysql://localhost:3306/stock";
            String user="root";
            String password="";
            Connection cnx=DriverManager.getConnection(url,user,password);
            System.out.println("connexion réussite");
            
            ResultSet rs;
    PreparedStatement ps;
    Statement st ;
    /* 
    String sql = "INSERT INTO `eleve`(`libelle`) VALUES ('aaa')" ;
            ps=cnx.prepareStatement(sql);
            ps.executeUpdate();
            return cnx;*/
        }
        catch(Exception e){
            e.printStackTrace();
            return null;
        }
        return null;

    }
    
    
}
