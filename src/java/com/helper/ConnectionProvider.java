
package com.helper;
import java.sql.*;


public class ConnectionProvider {
    private static Connection con;
    
    public static Connection getConnection()
    {
     
        try
        {
            //load driver
            
            if(con==null){
              Class.forName("com.mysql.cj.jdbc.Driver");
	String url="jdbc:mysql://localhost:3306/techblog";
	
	 con=DriverManager.getConnection(url,"root","root");
	
            }
        }catch(ClassNotFoundException | SQLException e)
        {
            System.out.println(e);
        }
        return con;
    }
    
    
}
