<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>

<!-- ✅ Include Bootstrap and other styles -->
<%@include file="all_component/all_css.jsp" %>

<!-- ✅ Spline Viewer Script -->
<script type="module" src="https://unpkg.com/@splinetool/viewer@1.9.82/build/spline-viewer.js"></script>
<!-- ✅ Styling -->
<style>
  html, body {
    margin: 0;
    padding: 0;
    height: 100%;
    overflow: hidden;
    background-color: black;
    font-family: Arial, sans-serif;
  }

  .navbar {
    position: fixed;
    top: 0;
    width: 100%;
    z-index: 1000;
  }

  .spline-container {
    height: calc(100vh - 70px); /* Adjust height after navbar */
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

  .welcome-text {
    position: absolute;
    top: 40%;
    left: 50%;
    transform: translate(-50%, -50%);
    color: white;
    text-align: center;
    z-index: 10;
  }

  .welcome-text h1 {
    font-size: 48px;
    font-weight: bold;
  }
</style>
</head>

<body>

<!-- ✅ Redirect if not admin -->
<c:if test="${userobj.role ne 'admin' }">
  <c:redirect url="login.jsp"></c:redirect>
</c:if>

<!-- ✅ Navbar -->
<%@include file="all_component/navbar.jsp"%>

<!-- ✅ Spline Scene with Welcome Text -->
<div class="spline-container">
  <!-- Welcome Text Overlay -->
  <div class="welcome-text">
  </div>

  <!-- Spline 3D Scene -->
<spline-viewer url="https://prod.spline.design/8WYf7fI9ZKSxlbvb/scene.splinecode"></spline-viewer></div>

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