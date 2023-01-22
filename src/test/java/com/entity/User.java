package com.entity;

public class User {
private int id;
private String fullname;
private String email;
private String password;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getFullname() {
	return fullname;
}
public void setFullname(String fullname) {
	this.fullname = fullname;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public User(String fullname, String email, String password) {
	super();
	this.fullname = fullname;
	this.email = email;
	this.password = password;
}
public User() {
	super();
	// TODO Auto-generated constructor stub
}

}
