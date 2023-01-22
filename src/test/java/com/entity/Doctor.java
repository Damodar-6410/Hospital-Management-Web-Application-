package com.entity;

public class Doctor {
   private int id;
   private String fullname;
   private String dob;
   private String qualification;
   private String specialist;
   private String email;
   private String mobNo;
   private String password;
public Doctor() {
	
}

public Doctor(String fullname, String dob, String qualification, String specialist, String email, String mobNo,
		String password) {
	super();
	this.fullname = fullname;
	this.dob = dob;
	this.qualification = qualification;
	this.specialist = specialist;
	this.email = email;
	this.mobNo = mobNo;
	this.password = password;
}

public Doctor(int id, String fullname, String dob, String qualification, String specialist, String email, String mobNo,
		String password) {
	super();
	this.id = id;
	this.fullname = fullname;
	this.dob = dob;
	this.qualification = qualification;
	this.specialist = specialist;
	this.email = email;
	this.mobNo = mobNo;
	this.password = password;
}

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
public String getDob() {
	return dob;
}
public void setDob(String dob) {
	this.dob = dob;
}
public String getQualification() {
	return qualification;
}
public void setQualification(String qualification) {
	this.qualification = qualification;
}
public String getSpecialist() {
	return specialist;
}
public void setSpecialist(String specialist) {
	this.specialist = specialist;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getMobNo() {
	return mobNo;
}
public void setMobNo(String mobNo) {
	this.mobNo = mobNo;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}

}
