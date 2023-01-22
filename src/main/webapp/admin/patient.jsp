<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<%@page import="com.db.DBconnect"%>
<%@page import="com.dao.AppoinmentDao"%>
<%@page import="com.entity.Appoinment"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Doctor"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>patient page</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
  .paint-card {
    box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
    }
</style>
</head>
<body>
      <c:if test="${empty adminObj}">
           <c:redirect url="../admin_login.jsp"></c:redirect>
      </c:if>
      <%@include file="navbar.jsp" %>

      <div class="col-md-12">
          <div class="card paint-card">
              <div class="card-body">
                  <p class="fs-3 text-center">Patient Details</p>
                  <table class="table">
                       <thead>
                            <tr>
                                <th scope="col">Full Name</th>
                                <th scope="col">Gender</th>
                                <th scope="col">Age</th>
                                <th scope="col">Appointment</th>
                                <th scope="col">Email</th>
                                <th scope="col">Mob No</th>
                                <th scope="col">Diseases</th>
                                <th scope="col">Doctor Name</th>
                                <th scope="col">Address</th>
                                <th scope="col">Status</th>
                            </tr>
                       </thead>
                       
                       <tbody>
                             <%
                               AppoinmentDao dao=new AppoinmentDao(DBconnect.getconn());
                               DoctorDao dao2= new DoctorDao(DBconnect.getconn());
                               List<Appoinment> list=dao.getAllAppoinment();
                               for(Appoinment ap:list){  
                               Doctor d=dao2.getDoctorById(ap.getDoctorId());
                             %>
                             
                             <tr>
                               <th><%=ap.getFullName() %></th>
                               <td><%=ap.getGender() %></td>
                               <td><%=ap.getAge() %></td>
                               <td><%=ap.getAppoiDate() %></td>
                               <td><%=ap.getEmail() %></td>
                               <td><%=ap.getpNo() %></td>
                               <td><%=ap.getDiseases() %></td>
                               <td><%=d.getFullname() %></td>
                               <td><%=ap.getAddress()%></td>
                               <td><%=ap.getStatus() %></td>
                             </tr>
                             <%} %>
                       </tbody>
                </table>
            </div>
         </div>
     </div>
                
</body>
</html>