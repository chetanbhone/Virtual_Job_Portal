<%@page import="java.util.List"%>
<%@page import="com.dao.JobDAO"%>
<%@page import="com.entity.Jobs"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User : View Jobs</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body style="background-color: #f0f1f2;">

      <c:if test="${empty userobj }">
       <c:redirect url="login.jsp"/>
    </c:if>
 
   <%@include file="all_component/navbar.jsp"%>
   
     <div class="container">
      <div class="row">
        <div class="col-md-12">
           <h5 class="text-center text-primary">All jobs</h5>
           
            <c:if test="${not empty succmsg}">
    <h4 class="text-center text-danger">${succmsg}</h4>
    <c:remove var="succmsg" />
    
     <c:if test="${not empty succmsg}">
                    <h4 class="text-center text-success">${succmsg}</h4>
                    <c:remove var="succmsg" scope="session"/>
                </c:if>

                <c:if test="${not empty failedmsg}">
                    <h4 class="text-center text-danger">${failedmsg}</h4>
                    <c:remove var="failedmsg" scope="session"/>
                </c:if>

   </c:if>
   
   
     <div class="card"> 
        <div class="card-body">
          
          <form class="form-inline" action="more_view.jsp" method="get">
             <div class="form-group col-md-5 mt-1">
                <h5>Location</h5>
             </div>
             
             <div class="form-group col-md-4 mt-1">
              
              <h5>Category</h5>
             </div>
             <div class="form-group col-md-5">
               <select name="loc" class="custom-select " id="inlineFormCustomSelectPref">
                  <option selected value="lo">Choose...</option>
                  <option value="Odisha">Odisha</option>
                                    <option value="Jharkhand">Jharkhand</option>
                                    <option value="Gujarat">Gujarat</option>
                                    <option value="Bhubaneswar">Bhubaneswar</option>
                                    <option value="Delhi">Delhi</option>
                                    <option value="Bangalore">Bangalore</option>
                                    <option value="Chennai">Chennai</option>
                                    <option value="Hyderabad">Hyderabad</option>
                                    <option value="Baramati">Baramati</option>
                                    <option value="Aurangabad">Aurangabad</option>
                                    <option value="Lonavala">Lonavala</option>
                                    <option value="Ahamadnagar">Ahamadnagar</option>
                                    <option value="Pune">Pune</option>
                                    <option value="Mumbai">Mumbai</option>

               </select>
              </div>
              
               <div class="form-group col-md-5">
                  <select name="cat" class="custom-select" id="inlineFormCustomSelectPref" >
                  <option value="ca" selected>choose</option>
                  <option value="IT">IT</option>
                  <option value="Developer">Developer</option>
                  <option value="Banking">Banking</option>
                  <option value="Engineer">Engineer</option>
                  <option value="Teacher">Teacher</option>
                  <option value="Trainer">Trainer</option>
                  <option value="Web Developer">Web Developer</option>
                                    
                 </select>
               </div>
               
                 <button type="submit" class="btn btn-success mt-2">Submit</button>
             </form>
             
           </div>
           
         </div>
         
         <%
        JobDAO dao = new JobDAO(DBConnect.getConn());
        List<Jobs> list = dao.getAllJobsForUser();
        for (Jobs j: list) {
        %>
        
        <div class="card mt-2">
         <div class="card-body">
           <div class="text-center text-primary">
              <i class="far fa-clipboard fa-2x"></i>
           </div>
          
          <h6><%=j.getTitle()%></h6>

         <%
         if (j.getDescription().length() > 0 && j.getDescription().length() < 120) {
         %>
         <p><%=j.getDescription()%>.</p>
         <%
         } else {
         %>
         <p><%=j.getDescription().substring(0, 120)%>...</p>
         <%
         }
         %>
         
        <br>
        <div class="form-row">
          <div class="form-group col-md-3">
            <input type="text" class="form-control form-control-sm" value="Location: <%=j.getLocation()%>" readonly>
          </div>
          <div class="form-group col-md-3">
            <input type="text" class="form-control form-control-sm" value="Category: <%=j.getCategory()%>" readonly>
          </div>
          </div>
          <h6>Publish Date:<%=j.getPdate().toString()%></h6>
          <div class=" text-center ">
          <a href="one_view.jsp?id=<%=j.getId()%>" class="btn btn-sm bg-success text-white">View More</a>
           <a href="apply.jsp?jobId=<%=j.getId()%>" class="btn btn-sm bg-primary text-white">Apply</a>
          </div>
        </div>
      </div>
          <%
          }
          %> 
</body>
</html>