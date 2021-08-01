/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entities;

/**
 *
 * @author ektar
 */
public class post {
    private int pID;

    public post(int pID, int catID, String pTitle, String pDesc, String pImg, int userID) {
        this.pID = pID;
        this.catID = catID;
        this.pTitle = pTitle;
        this.pDesc = pDesc;
        this.pImg = pImg;
        this.userID = userID;
    }
    private int catID;
    private String pTitle;
    private String pDesc;
    private String pImg;
    private int userID;

    public post(int catID, String pTitle, String pDesc, String pImg,int userID) {
        this.catID = catID;
        this.pTitle = pTitle;
        this.pDesc = pDesc;
        this.pImg = pImg;
        this.userID=userID;
    }

    public int getpID() {
        return pID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public void setpID(int pID) {
        this.pID = pID;
    }

    public int getCatID() {
        return catID;
    }

    public void setCatID(int catID) {
        this.catID = catID;
    }

    public String getpTitle() {
        return pTitle;
    }

    public void setpTitle(String pTitle) {
        this.pTitle = pTitle;
    }

    public String getpDesc() {
        return pDesc;
    }

    public void setpDesc(String pDesc) {
        this.pDesc = pDesc;
    }

    public String getpImg() {
        return pImg;
    }

    public void setpImg(String pImg) {
        this.pImg = pImg;
    }
}
