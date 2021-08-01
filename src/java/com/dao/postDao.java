package com.dao;

import com.entities.categories;
import com.entities.post;
import com.helper.ConnectionProvider;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class postDao {

    private Connection con;

    public postDao() {
        this.con = ConnectionProvider.getConnection();
    }

    public ArrayList<categories> getCategories() throws SQLException {
        ArrayList<categories> cat = new ArrayList<>();

        String q = "select * from category";
        Statement st = this.con.createStatement();
        ResultSet set = st.executeQuery(q);

        while (set.next()) {
            int cid = set.getInt("cid");
            String cname = set.getString("cname");
            categories c = new categories(cid, cname);
            cat.add(c);
        }

        return cat;
    }

    public boolean savePost(post p) {
        boolean f = false;

        try {
            String query = "insert into post(ptitle,pdescription,pimage,catid,userid) values (?,?,?,?,?)";
            PreparedStatement ptsmt = this.con.prepareStatement(query);

            ptsmt.setString(1, p.getpTitle());
            ptsmt.setString(2, p.getpDesc());

            ptsmt.setString(3, p.getpImg());
            ptsmt.setInt(4, p.getCatID());
            ptsmt.setInt(5, p.getUserID());

            ptsmt.executeUpdate();
            f = true;

        } catch (Exception e) {

            e.printStackTrace();
            //
        }

        return f;
    }

    public ArrayList<post> getAllPosts() {
        ArrayList<post> posts=new ArrayList<>();
        try {
            String query = "select * from post order by pid desc";
            PreparedStatement ptsmt = this.con.prepareStatement(query);
            ResultSet set = ptsmt.executeQuery();
            
            while(set.next())
            {
                int catID=set.getInt("catid");
                int pID=set.getInt("pid");
                int userID=set.getInt("userid");
                String ptitle=set.getString("ptitle");
                String pdesc=set.getString("pdescription");
                String pimg=set.getString("pimage");
                
                post p=new post(pID,catID,ptitle,pdesc,pimg,userID);
                posts.add(p);
                
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return posts;
    }

    
    
      public ArrayList<post> getAllPostsBycatID(int catID) {
        ArrayList<post> posts=new ArrayList<>();
        try {
            String query = "select * from post where catid=? order by pid desc";
            PreparedStatement ptsmt = this.con.prepareStatement(query);
            ptsmt.setInt(1,catID);
            ResultSet set = ptsmt.executeQuery();
            
            while(set.next())
            {
                //int catID=set.getInt("catid");
                 int pID=set.getInt("pid");
                int userID=set.getInt("userid");
                String ptitle=set.getString("ptitle");
                String pdesc=set.getString("pdescription");
                String pimg=set.getString("pimage");
                
                post p=new post(pID,catID,ptitle,pdesc,pimg,userID);
                posts.add(p);
                
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return posts;
    }
    
    
      
       public post getAllPostsBypID(int pID) {
        post p=null;
        try {
            String query = "select * from post where pid=? order by pid desc";
            PreparedStatement ptsmt = this.con.prepareStatement(query);
            ptsmt.setInt(1,pID);
            ResultSet set = ptsmt.executeQuery();
            
            while(set.next())
            {
                int catID=set.getInt("catid");
//                 int pID=set.getInt("pid");
                int userID=set.getInt("userid");
                String ptitle=set.getString("ptitle");
                String pdesc=set.getString("pdescription");
                String pimg=set.getString("pimage");
                
              p=new post(pID,catID,ptitle,pdesc,pimg,userID);
                
                
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return p;
    }
    
    
    
    
    
}
