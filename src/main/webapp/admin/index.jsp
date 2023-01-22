<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<%@page import="com.db.DBconnect"%>
<%@page import="com.dao.DoctorDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin_index</title>
<style type="text/css">
  .paint-card {
    box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
    }
</style>
<%@include file="../component/allcss.jsp"%>
</head>
<body>

     <c:if test="${empty adminObj}">
       <c:redirect url="../admin_login.jsp"></c:redirect>
     </c:if>
   <%@include file="navbar.jsp"%>
   <div class="container p-5">
   <p class="text-center fs-3">Admin Dashboard</p>
                       <c:if test="${not empty succMsg}">
                         <p class="text-center text-success fs-3">${succMsg}</p>
                         <c:remove var="succMsg" scope="session"/>
                        </c:if>
                        
                        <c:if test="${not empty errorMsg}">
                         <p class="text-center text-danger fs-3">${errorMsg}</p>
                         <c:remove var="errorMsg" scope="session"/>
                        </c:if>
                        
                        <% DoctorDao dao=new DoctorDao(DBconnect.getconn());
                           
                        %>
       <div class="row">
          <div class="col-md-4">
             <div class="card paint-card">
                <div class="card-body text-center text-success">
                    <i class="fas fa-user-md fa-3x"></i><br>
                    <p class="fs-4 text-center">
                         Doctor <br><%=dao.countDoctor() %>
                    </p>
                </div>
             </div>
          </div>
          
          <div class="col-md-4">
             <div class="card paint-card">
                <div class="card-body text-center text-success">
                    <i class="fas fa-user-circle fa-3x"></i><br>
                    <p class="fs-4 text-center">
                         User <br><%=dao.countUser() %>
                    </p>
                </div>
             </div>
          </div>
          
          <div class="col-md-4">
             <div class="card paint-card">
                <div class="card-body text-center text-success">
                   <i class="far fa-calendar-check fa-3x"></i><br>
                   <p class="fs-4 text-center">
                        Total Appointment <br><%=dao.countAppoinment() %>
                   </p>
                </div>
             </div>
          </div>
          <div class="col-md-4 mt-2">
          
              <div class="card paint-card" data-bs-toggle="modal" data-bs-target="#exampleModal">
                 <div class="card-body text-center text-success">
                    <i class="far fa-calendar-check fa-3x"></i><br>
                    <p class="fs-4 text-center">
                        Specialist <br><%=dao.countSpecialist() %>
                    </p>
                  </div>
              </div>
              
           </div>
           
        </div>
      </div>
         
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       
       <form action="../addSpecialist" method="post">
       
         <div class="form-group">
            <label>Enter Specialist Name</label>
            <input type="text" name="specName" class="form-control">   
         </div><br>
         
         <div class="text-center mt-3">
            <button type="submit" class="btn btn-primary">ADD</button>
         </div>
         
       </form>
       
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

</body>
</html>