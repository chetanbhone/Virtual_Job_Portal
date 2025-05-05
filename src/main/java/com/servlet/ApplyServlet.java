package com.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.DB.DBConnect;

@WebServlet("/ApplyServlet")
@MultipartConfig(maxFileSize = 16177215)
public class ApplyServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String qualification = request.getParameter("qualification");
        String experience = request.getParameter("experience");
        InputStream resume = null;

        Part filePart = request.getPart("resume");
        if (filePart != null) {
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());

            resume = filePart.getInputStream();
        }

        Connection conn = null;
        String message = null;

        try {
            conn = DBConnect.getConn();

            String sql = "INSERT INTO applications (name, qualification, experience, resume) values (?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, qualification);
            statement.setString(3, experience);
            if (resume != null) {
                statement.setBlob(4, resume);
            }

            int row = statement.executeUpdate();
            if (row > 0) {
                message = "Job applied successfully! ";
                request.getSession().setAttribute("succmsg", message);
            } else {
                message = "Failed to apply for job.";
                request.getSession().setAttribute("failedmsg", message);
            }
        } catch (Exception ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
            request.getSession().setAttribute("failedmsg", message);
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
            response.sendRedirect("home.jsp");
        }
    }
}
