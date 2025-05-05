<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Apply for Job</title>
    <%@include file="all_component/all_css.jsp"%>  <%-- Include Bootstrap CSS --%>
</head>
<body>
    <%@include file="all_component/navbar.jsp"%>
    <div class="container">
        <div class="row">
            <div class="col-md-8 offset-md-2">
                <div class="card mt-3">
                    <div class="card-header text-center bg-primary text-white">
                        <h3>Job Application Form</h3>
                    </div>
                    <div class="card-body">
                        <form action="ApplyServlet" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="name">Name:</label>
                                <input type="text" class="form-control" id="name" name="name" required>
                            </div>
                            <div class="form-group">
                                <label for="qualification">Qualification:</label>
                                <input type="text" class="form-control" id="qualification" name="qualification" required>
                            </div>
                            <div class="form-group">
                                <label>Experience:</label><br>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" id="fresher" name="experience" value="fresher" required>
                                    <label class="form-check-label" for="fresher">Fresher</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" id="experienced" name="experience" value="experienced" required>
                                    <label class="form-check-label" for="experienced">Experienced</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="resume">Upload Resume:</label>
                                <input type="file" class="form-control-file" id="resume" name="resume" accept=".pdf,.doc,.docx" required>
                            </div>
                            <button type="submit" class="btn btn-primary btn-block">Submit Application</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
