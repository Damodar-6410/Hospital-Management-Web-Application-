package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AppoinmentDao;
import com.db.DBconnect;
import com.entity.Appoinment;

@WebServlet("/add_appoint")
public class AppoinmentServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int userid=Integer.parseInt(req.getParameter("userid"));
        String fullname=req.getParameter("fullname");
        String gender=req.getParameter("gender");
        String age=req.getParameter("age");
        String appoin_date=req.getParameter("appoint_date");
        String email=req.getParameter("email");
        String phno=req.getParameter("phno");
        String diseases=req.getParameter("diseases");
        int doctor_id=Integer.parseInt(req.getParameter("doct"));
        String address=req.getParameter("address");
       
        
        Appoinment ap=new Appoinment(userid, fullname, gender, age, appoin_date, email, phno, diseases, doctor_id, address, "pending");
        
        AppoinmentDao dao=new AppoinmentDao(DBconnect.getconn());
         
        HttpSession session=req.getSession();
        
        if(dao.addAppoinment(ap)) {
        	session.setAttribute("succMsg", "Appoinment Sucessfully");
        	resp.sendRedirect("user_appoinment.jsp");
        }else {
        	session.setAttribute("errorMsg", "Something Wrong on Server");
        	resp.sendRedirect("user_appoinment.jsp");
        }
	}

	
}
