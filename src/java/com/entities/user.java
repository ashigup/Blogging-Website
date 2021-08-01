/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entities;

public class user {
    private String first_name;
    private String last_name;
    private String email;
    private String password;
    private String gender;
    private String about;
    private String profile;
    private Integer ID;

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public user()
    {
        
    }
    
    public user(String first_name, String last_name, String email, String password, String gender, String about) {
        this.first_name = first_name;
        this.last_name = last_name;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.about = about;
    }

    public user(String first_name, String last_name, String email, String password, String gender, String about, String profile) {
        this.first_name = first_name;
        this.last_name = last_name;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.about = about;
        this.profile = profile;
    }
    

    public user(String first_name, String last_name, String email, String password, String gender) {
        this.first_name = first_name;
        this.last_name = last_name;
        this.email = email;
        this.password = password;
        this.gender = gender;
    }

    public String getFirst_name() {
        return first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getGender() {
        return gender;
    }

    public String getAbout() {
        return about;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setAbout(String about) {
        this.about = about;
    }
    
    
    
    
    
    
    
    
}
