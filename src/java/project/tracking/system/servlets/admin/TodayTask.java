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
import project.tracking.system.dao.Employeedao;
import project.tracking.system.dao.ProjectTrackerdao;
import project.tracking.system.daoimpl.EmployeeDaoImpl;
import project.tracking.system.daoimpl.ProjectTrackerDaoImpl;
import project.tracking.system.entity.Employee;
import project.tracking.system.entity.ProjectTracker;

/**
 *
 * @author hp
 */
public class TodayTask extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet TodayTask</title>");            
            out.println("</head>");
            out.println("<body>");
            
            int numberTask = Integer.parseInt(request.getParameter("numbertask"));
            int eid = Integer.parseInt(request.getParameter("eid"));
            int pid = Integer.parseInt(request.getParameter("pid"));
            
            Employeedao empdao = new EmployeeDaoImpl();
            Employee emp = empdao.selectEmployee(eid);
            
            ProjectTracker tracker = new ProjectTracker();
            tracker.setPid(pid);
            if (emp.getProfile().equals("designer")) {
                tracker.setCompletedDesignersTask(numberTask);
            } else if (emp.getProfile().equals("coder")) {
                tracker.setCompletedCodersTask(numberTask);
            } else if (emp.getProfile().equals("tester")) {
                tracker.setCompletedTestersTask(numberTask);
            }
            
            ProjectTrackerdao trackerdao = new ProjectTrackerDaoImpl();
            trackerdao.updateTrackDetails(tracker, emp.getProfile());
            
            response.sendRedirect("progress-employee.jsp?pid="+pid+"&eid="+eid);
            
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
