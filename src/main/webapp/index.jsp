<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Virtual Job Portal</title>

<!-- Include Bootstrap and other styles -->
<%@include file="all_component/all_css.jsp" %>

<!-- ✅ Spline Viewer Script -->
<script type="module" src="https://unpkg.com/@splinetool/viewer@1.9.82/build/spline-viewer.js"></script>
<!-- ✅ Styles specific for Spline layout -->
<style>
    html, body {
        margin: 0;
        padding: 0;
        height: 100%;
        overflow: hidden; /* Remove scroll */
        background-color: black;
    }

    .navbar {
        position: fixed;
        top: 0;
        width: 100%;
        z-index: 1000;
    }

    .spline-container {
        height: calc(100vh - 70px); /* Full screen minus navbar */
        width: 100%;
        margin-top: 70px;
        position: relative;
        box-sizing: border-box;
    }

    spline-viewer {
        width: 100%;
        height: 100%;
        display: block;
    }
</style>
</head>

<body>

<!-- ✅ Navbar stays unchanged -->
<%@include file="all_component/navbar.jsp" %>

<!-- ✅ Optional DB Connection Print (for debugging) -->
<%
   Connection conn = DBConnect.getConn(); 
   out.println(conn);
%>

<!-- ✅ Spline Fullscreen Section -->
<div class="spline-container">
<spline-viewer url="https://prod.spline.design/LrGR8LnnlqFLLROJ/scene.splinecode"></spline-viewer></div>

<!-- ✅ Hide Spline Logo -->
<script>
  window.addEventListener('DOMContentLoaded', () => {
    const hideSplineBadge = () => {
      const spline = document.querySelector('spline-viewer');
      if (spline && spline.shadowRoot) {
        const logo = spline.shadowRoot.querySelector('a[href*="spline.design"]');
        if (logo) {
          logo.style.display = 'none';
          return true;
        }
      }
      return false;
    };

    const interval = setInterval(() => {
      if (hideSplineBadge()) clearInterval(interval);
    }, 100);
  });
</script>

</body>
</html>
