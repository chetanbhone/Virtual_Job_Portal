<%@ page import="java.util.List" %>
<%@ page import="com.dao.JobDAO" %>
<%@ page import="com.entity.Jobs" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin View Jobs</title>
    <%@ include file="all_component/all_css.jsp" %>
</head>
<body style="background-color: #f0f1f2;">
    <c:if test="${userobj.role ne 'admin'}">
        <c:redirect url="login.jsp"></c:redirect>
    </c:if>

    <%@ include file="all_component/navbar.jsp" %>

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h5 class="text-center text-primary">All Jobs</h5>

                <c:if test="${not empty succMsg}">
                    <div class="alert alert-success" role="alert">${succMsg}</div>
                    <c:remove var="succMsg" />
                </c:if>

                <%-- Replace embedded Java code with JSTL forEach loop --%>
               <%
                JobDAO dao = new JobDAO(DBConnect.getConn());
                List<Jobs> list = dao.getAllJobs();
                request.setAttribute("list", list);
               %>


                <c:forEach var="job" items="${list}">
                    <div class="card mt-2">
                        <div class="card-body">
                            <div class="text-center text-primary">
                                <i class="far fa-clipboard fa-2x"></i>
                            </div>
                            <h6>${job.title}</h6>
                            <p>${job.description}</p>

                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <input type="text" class="form-control form-control-sm" value="Location: ${job.location}" readonly />
                                </div>
                                <div class="form-group col-md-3">
                                    <input type="text" class="form-control form-control-sm" value="Category: ${job.category}" readonly />
                                </div>
                                <div class="form-group col-md-3">
                                    <input type="text" class="form-control form-control-sm" value="Status: ${job.status}" readonly />
                                </div>
                            </div>

                            <h6>Published on: ${job.pdate}</h6>

                            <div class="text-center">
                                <a href="edit_job.jsp?id=${job.id}" class="btn btn-sm bg-success text-white">Edit</a>
                                <a href="delete?id=${job.id}" class="btn btn-sm bg-danger text-white">Delete</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</body>
</html>
