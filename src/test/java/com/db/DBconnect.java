package com.db;
import java.sql.Connection;
import java.sql.DriverManager;
public class DBconnect {
private static Connection conn;
public static Connection getconn() {
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital","root","root");
	}catch (Exception e) {
		e.printStackTrace();
	}
	return conn;
}
}
