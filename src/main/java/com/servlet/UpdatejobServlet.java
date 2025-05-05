package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.dao.JobDAO;
import com.entity.Jobs; // ✅ added missing import


@WebServlet("/update")
public class UpdatejobServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String title = req.getParameter("title");
            String description = req.getParameter("desc");
            String location = req.getParameter("location");
            String category = req.getParameter("category");
            String status = req.getParameter("status");

            Jobs j = new Jobs();
            j.setId(id);
            j.setTitle(title);
            j.setDescription(description);
            j.setCategory(category);
            j.setStatus(status);
            j.setLocation(location);

            HttpSession session = req.getSession();

            JobDAO dao = new JobDAO(DBConnect.getConn());
            boolean f = dao.updateJob(j); 
            if (f) {
                session.setAttribute("succMsg", "Job updated successfully...");
                resp.sendRedirect("view_jobs.jsp");
            } else {
                session.setAttribute("failedMsg", "Something went wrong on server...");
                resp.sendRedirect("view_jobs.jsp");
            }
         

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
