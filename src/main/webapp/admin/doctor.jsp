<%@page import="com.dao.SpecialistDao" %>
<%@page import="com.db.DBconnect" %>
<%@page import="com.entity.Specalist" %>
<%@page import="com.entity.Doctor" %>
<%@page import="com.dao.DoctorDao" %>

<%@page import="java.util.List" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>doctor page</title>
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
 <%@include file="navbar.jsp"%>
 
   <div class="container-fluid p-3">
       <div class="row">
  
          <div class="col-md-4 offset-md-4">
             <div class="card paint-card">
                <div class="card-body">
                    <h3 class="fs-3 text-center">Add Doctor</h3>
                     <c:if test="${not empty succMsg}">
                         <p class="text-center text-success fs-3">${succMsg}</p>
                         <c:remove var="succMsg" scope="session"/>
                        </c:if>
                        
                        <c:if test="${not empty errorMsg}">
                         <p class="text-center text-danger fs-3">${errorMsg}</p>
                         <c:remove var="errorMsg" scope="session"/>
                        </c:if>
                    
                    <form action="../addDoctor" method="post">
                        <div class="mb-3">
                             <label class="form-Label">Full Name</label> <input type="text"
                              required name="fullname" class="form-control">
                        </div>
                        
                        <div class="mb-3">
                           <label class="form-Label ">DOB</label> <input type="date"
                            required name="dob" class="form-control">
                        </div>

                        <div class="mb-3">
                           <label class="form-Label">Qualification</label> <input required
                               name="qualification" type="text" class="form-control">
                        </div>
                        
                        <div class="mb-3">
                           <label class="form-Label">Specialist</label>
                            <select name="spec" required class="form-control">
                                 <option>--select--</option>
                                 <% 
                                 SpecialistDao dao=new SpecialistDao(DBconnect.getconn());
                                 List<Specalist> list=dao.getAllSpecialist();
                                 for(Specalist s:list){
                                 %>
                                 <option><%=s.getSpecialistName()%></option>
                                 <%}
                                 %>
                           </select>
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-Label"> Email</label> <input type="text"
                             required name="email" class="form-control">
                        </div>
                        
                        <div class="mb-3">
                           <label class="form-Label">Mob No.</label> <input type="text"
                            required name="mobno" class="form-control">
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-Label">Password</label> <input required
                             name="password" type="password" class="form-control">
                        </div>
                        
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                 </div>
             </div>
         </div>
     
     </div>
   </div>.
</body>
</html>