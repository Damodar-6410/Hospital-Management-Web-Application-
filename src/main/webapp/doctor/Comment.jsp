<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<%@page import="com.db.DBconnect"%>
<%@page import="com.dao.AppoinmentDao"%>
<%@page import="com.entity.Appoinment"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Comment page</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
   .paint-card {
    box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
    }
    .backImg {
    background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
     url("../img/hos1.jpg");
    height: 20vh;
    width: 100%;
    background-size: cover;
    background-repeat: no-repeat;
}
</style>
</head>
<body>
    <c:if test="${empty doctObj }">
       <c:redirect url="../doctor_login.jsp"></c:redirect>
    </c:if>
    
       <%@include file="navbar.jsp" %>
       <div class="container-fulid backImg p-5">
           <p class="text-center fs-2 text-white"></p>
       </div>
       <div class="container p-3">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card paint-card"> 
                         <div class="card-body">
                              <p class="text-center fs-4">Patient Comment</p>
                              
                              <%
                              int id=Integer.parseInt(request.getParameter("id"));
                              AppoinmentDao dao=new AppoinmentDao(DBconnect.getconn());
                              
                              Appoinment ap=dao.getAppoinmentById(id);
                              
                              %>
                              
                              <form class="row" action="../updateStatus" method="post">
                                  <div class="col-md-6"> 
                                      <label>Patient Name</label>
                                      <input type="text" readonly value="<%=ap.getFullName() %>" class="form-control">
                                  </div>
                                  
                                  <div class="col-md-6">
                                      <label>Age</label>
                                      <input type="text" value="<%=ap.getAge() %>" readonly class="form-control">
                                  </div>
                                  
                                  <div class="col-md-6">
                                      <br> <label>Mob No</label>
                                      <input type="text" readonly value="<%=ap.getpNo() %>" class="form-control">
                                  </div>
     
                                  <div class="col-md-6">
                                      <br> <label>Diseases</label>
                                      <input type="text" readonly value="<%=ap.getDiseases() %>" class="form-control">
                                  </div>
                                  
                                  <div class="col-md-12">
                                      <br> <label>Comment</label>
                                          <textarea required name="comm" class="form-control" rows="3"
                                              cols=""></textarea>
                                  </div>
                                  
                                  <input type="hidden" name="id" value="<%=ap.getId() %>">
                                  
                                  <input
                                       type="hidden" name="did" value="<%=ap.getDoctorId()%>">
                                       
                                   <button class=" mt-3 btn btn-primary col-md-6 offset-md-3">Submit</button>

                              </form>
                         </div>
                   </div>
               </div>
               
           </div>
        </div>
            

</body>
</html>