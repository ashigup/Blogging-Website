
package com.dao;

import com.helper.ConnectionProvider;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class likesDao {
    private Connection con;

    public likesDao() {
        con=ConnectionProvider.getConnection();
    }

    public boolean insertLike(int pid,int uid)
    {
        boolean f=false;
        
        try {
            String query="insert into likes(pid,uid) values (?,?) ";
            PreparedStatement ptsmt=this.con.prepareStatement(query);
            ptsmt.setInt(1, pid);
            ptsmt.setInt(2, uid);
            ptsmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    
    
    public int countLike(int pid)
    {
       int count=0;
        
        try {
            String query="select count(*) from likes where pid=? ";
            PreparedStatement ptsmt=this.con.prepareStatement(query);
            ptsmt.setInt(1, pid);
           ResultSet set= ptsmt.executeQuery();
            
            if(set.next())
            {
                count=set.getInt(1);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return count;
    }
    
    public boolean isLikedByUser(int pid,int uid)
    {
        boolean f=false;
        
        try {
            String query="select * from likes where pid=? and uid=? ";
            PreparedStatement ptsmt=this.con.prepareStatement(query);
            ptsmt.setInt(1, pid);
            ptsmt.setInt(2, uid);
            
             ResultSet set= ptsmt.executeQuery();
            
            if(set.next())
            {
                
                f=true;
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    
    public boolean deleteLike(int pid,int uid)
    {
        boolean f=false;
        
        try {
            String query="delete from likes where pid=? and uid=? ";
            PreparedStatement ptsmt=this.con.prepareStatement(query);
            ptsmt.setInt(1, pid);
            ptsmt.setInt(2, uid);
            
             ptsmt.executeUpdate();
           
                f=true;
         
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    
}
