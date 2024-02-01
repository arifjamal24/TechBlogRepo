package com.tech.blog.entities;

import java.sql.Timestamp;

public class User {
private int id;
private String name;
private String password;
private String email;
private String gender;
private String about;
private Timestamp datetime;
private String profile;



public User(String name, String password, String email, String gender, String about) {
	super();
	this.name = name;
	this.password = password;
	this.email = email;
	this.gender = gender;
	this.about = about;
}


public int getId() {
	return id;
}


public void setId(int id) {
	this.id = id;
}


public String getName() {
	return name;
}


public void setName(String name) {
	this.name = name;
}


public String getPassword() {
	return password;
}


public void setPassword(String password) {
	this.password = password;
}


public String getEmail() {
	return email;
}


public void setEmail(String email) {
	this.email = email;
}


public String getGender() {
	return gender;
}


public void setGender(String gender) {
	this.gender = gender;
}


public String getAbout() {
	return about;
}


public void setAbout(String about) {
	this.about = about;
}


public Timestamp getDatetime() {
	return datetime;
}


public void setDatetime(Timestamp datetime) {
	this.datetime = datetime;
}


public String getProfile() {
	return profile;
}


public void setProfile(String profile) {
	this.profile = profile;
}

@Override
public String toString() {
	return "User [id=" + id + ", name=" + name + ", password=" + password + ", email=" + email + ", gender=" + gender
			+ ", about=" + about + ", datetime=" + datetime + "]";
}


public User(int id, String name, String password, String email, String gender, String about, Timestamp datetime) {
	super();
	this.id = id;
	this.name = name;
	this.password = password;
	this.email = email;
	this.gender = gender;
	this.about = about;
	this.datetime = datetime;
}


public User() {
	super();
	// TODO Auto-generated constructor stub
}



}
