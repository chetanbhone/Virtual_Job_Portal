<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signup page</title>
<%@include file="all_component/all_css.jsp" %>
</head>


<body style="background-color: #f0f1f2;">

<%@include file="all_component/navbar.jsp" %>

<!-- Main container -->
<div class="continer-fluid">
  <div class="row p-4">
    <div class="col-md-4 offset-md-4">
      <div class="card">
        <div class="card-body">
        
          <!-- Page Header -->
          <div class="text-center">
            <i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
            <h5>Registration</h5>
          </div>

          <!-- Success message display -->
      
      <c:if test="${not empty succmsg}">
        <h4 class="text-center text-success">${succmsg}</h4>
        <c:remove var="succmsg" />
     </c:if>

       

    
          <form action="add_user" method="post">

            
            <div class="form-group">
              <label>Enter Full Name</label>
              <input type="text" required="required" class="form-control"
                     id="exampleInputEmail1" aria-describedby="emailHelp"
                     name="name">
            </div>

           
            <div class="form-group">
              <label>Enter Qualification</label>
              <input type="text" required="required" class="form-control"
                     id="exampleInputEmail1" aria-describedby="emailHelp"
                     name="qua">
            </div>

          
            <div class="form-group">
              <label>Enter Email</label>
              <input type="email" required="required" class="form-control"
                     id="exampleInputEmail1" aria-describedby="emailHelp"
                     name="email">
            </div>

           
            <div class="form-group">
              <label for="exampleInputPassword1">Enter Password</label>
              <input required="required" type="password" class="form-control"
                     id="exampleInputPassword1" name="ps">
            </div>

          
            <button type="submit"
                    class="btn btn-primary badge-pill btn-block">
              Register
            </button>

          </form>
        </div>
      </div>
    </div>
  </div>

 
</div>

</body>
</html>