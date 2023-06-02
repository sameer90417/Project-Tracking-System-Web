/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package project.tracking.system.servlets.admin;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import project.tracking.system.dao.ProjectTrackerdao;
import project.tracking.system.dao.Projectdao;
import project.tracking.system.daoimpl.ProjectDaoImpl;
import project.tracking.system.daoimpl.ProjectTrackerDaoImpl;
import project.tracking.system.entity.Project;
import project.tracking.system.entity.ProjectTracker;

/**
 *
 * @author hp
 */
public class AssignTaskServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            
            int pid = Integer.parseInt(request.getParameter("p_id"));
        
            
            int designerTask = Integer.parseInt(request.getParameter("designertask"));
            int coderTask = Integer.parseInt(request.getParameter("codertask"));
            int testerTask = Integer.parseInt(request.getParameter("testerTask"));
            
            ProjectTracker tracker = new ProjectTracker();
            tracker.setPid(pid);
            tracker.setDesignersTask(designerTask);
            tracker.setCoderesTask(coderTask);
            tracker.setTestersTask(testerTask);
            
            ProjectTrackerdao dao = new ProjectTrackerDaoImpl();
            boolean isAdded = dao.addTrackDetails(tracker);
            
            response.sendRedirect("./pages/tables/project-Table-admin.jsp");
            
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
