package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Appoinment;

public class AppoinmentDao {

	private Connection con;

	public AppoinmentDao(Connection con) {
		super();
		this.con = con;
	}
	
	public boolean addAppoinment(Appoinment ap) {
		boolean f=false;
		
		try {
			
			String sql="insert into appoinment(user_id, fullname, gender, age, appoin_date, email, phno, diseases, doctor_id, address, status) values(?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, ap.getUserId());
			ps.setString(2, ap.getFullName());
			ps.setString(3, ap.getGender());
			ps.setString(4, ap.getAge());
			ps.setString(5, ap.getAppoiDate());
			ps.setString(6, ap.getEmail());
			ps.setString(7, ap.getpNo());
			ps.setString(8, ap.getDiseases());
			ps.setInt(9, ap.getDoctorId());
			ps.setString(10, ap.getAddress());
			ps.setString(11, ap.getStatus());
		
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public List<Appoinment> getAllAppoinmentByLoginUser(int userId){
		List<Appoinment> list=new ArrayList<Appoinment>();
		Appoinment ap=null;
		
		try {
			
			String sql="select * from appoinment where user_id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, userId);
			
			ResultSet rs=ps.executeQuery();
	        while (rs.next()) {
				ap=new Appoinment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppoiDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setpNo(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));
				list.add(ap);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
  
	public List<Appoinment> getAllAppoinmentByDoctorLogin(int doctor_Id){
		List<Appoinment> list=new ArrayList<Appoinment>();
		Appoinment ap=null;
		
		try {
			
			String sql="select * from appoinment where doctor_id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, doctor_Id);
			
			ResultSet rs=ps.executeQuery();
	        while (rs.next()) {
				ap=new Appoinment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppoiDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setpNo(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));
				list.add(ap);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public Appoinment getAppoinmentById(int id){
		
		Appoinment ap=null;
		
		try {
			
			String sql="select * from appoinment where id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, id);
			
			ResultSet rs=ps.executeQuery();
	        while (rs.next()) {
				ap=new Appoinment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppoiDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setpNo(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ap;
	}
	
	
	public boolean updateCommentStatus(int id,int doctid,String comm) {
		boolean f= false;
		
		try {
			
			String sql="update appoinment set status=? where id=? and doctor_id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, comm);
			ps.setInt(2, id);
			ps.setInt(3, doctid);
			
			int i=ps.executeUpdate();
			if(i==1){
				f=true;
			}
				
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public List<Appoinment> getAllAppoinment(){
		List<Appoinment> list=new ArrayList<Appoinment>();
		Appoinment ap=null;
		
		try {
			
			String sql="select * from appoinment order by id desc";
			PreparedStatement ps=con.prepareStatement(sql);
			
			ResultSet rs=ps.executeQuery();
	        while (rs.next()) {
				ap=new Appoinment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppoiDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setpNo(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));
				list.add(ap);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
