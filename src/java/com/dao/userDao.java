package com.dao;

import com.entities.user;
import com.helper.ConnectionProvider;
import java.sql.*;

/**
 *
 * @author ektar
 */
public class userDao {

    private Connection con;

    public userDao() {
        this.con = ConnectionProvider.getConnection();
    }

    public boolean saveUser(user u) {
        boolean f = false;

        try {
            String query="insert into user(first_name,last_name,email,password,gender,about) values (?,?,?,?,?,?)";
            PreparedStatement ptsmt=this.con.prepareStatement(query);
            ptsmt.setString(1,u.getFirst_name());
            ptsmt.setString(2,u.getLast_name());
            ptsmt.setString(3,u.getEmail());
            ptsmt.setString(4,u.getPassword());
            ptsmt.setString(5,u.getGender());
            ptsmt.setString(6,u.getAbout());
            ptsmt.executeUpdate();
            
            f=true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }
    
    
    
    public boolean updateUser(user u) {
        boolean f = false;

        try {
            String query="update user set password=? , about=? , profile=? where id=? ";
            PreparedStatement ptsmt=this.con.prepareStatement(query);
            
            ptsmt.setString(3,u.getProfile());
            ptsmt.setString(1,u.getPassword());
            ptsmt.setInt(4,u.getID());
            ptsmt.setString(2,u.getAbout());
            ptsmt.executeUpdate();
            
            f=true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }
    
    
    
    public user getUser(String email,String password)
    {
        user u=null;
        
        try{
        String query="select * from user where email=? and password=?";
        PreparedStatement ptsmt=this.con.prepareStatement(query);
        ptsmt.setString(1,email);
        ptsmt.setString(2, password);
       // System.out.println("Here.............." + ptsmt);
        ResultSet set=ptsmt.executeQuery();
        
        if(set.next())
        {
            u=new user();
            u.setFirst_name(set.getString("first_name"));
            u.setLast_name(set.getString("last_name"));
            u.setEmail(set.getString("email"));
            u.setPassword(set.getString("password"));
            u.setGender(set.getString("gender"));
            u.setAbout(set.getString("about"));
            u.setProfile(set.getString("profile"));
            u.setID(set.getInt("ID"));
            
        }
      
        
        }
        catch(Exception e)
                {
                    e.printStackTrace();
                }
        
        return u;
    }
    
    

}
