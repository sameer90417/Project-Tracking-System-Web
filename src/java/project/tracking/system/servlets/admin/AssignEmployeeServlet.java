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
import project.tracking.system.dao.Coderdao;
import project.tracking.system.dao.Designerdao;
import project.tracking.system.dao.Employeedao;
import project.tracking.system.dao.Testerdao;
import project.tracking.system.daoimpl.CoderDaoImpl;
import project.tracking.system.daoimpl.DesignerDaoImpl;
import project.tracking.system.daoimpl.EmployeeDaoImpl;
import project.tracking.system.daoimpl.TesterDaoImpl;
import project.tracking.system.entity.Coder;
import project.tracking.system.entity.Designer;
import project.tracking.system.entity.Employee;
import project.tracking.system.entity.Tester;

/**
 *
 * @author hp
 */
public class AssignEmployeeServlet extends HttpServlet {

    
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
            
            
                        int pid = Integer.parseInt(request.getParameter("project_id"));
            int eid = Integer.parseInt(request.getParameter("employee_id"));
            
            Employeedao empdao = new EmployeeDaoImpl();
            Employee emp = empdao.selectEmployee(eid);
            if (emp.getProfile().equals("designer")) {
                Designer designer = new Designer();
                designer.setEid(eid);
                designer.setPid(pid);
                Designerdao dao = new DesignerDaoImpl();
                boolean isAdded = dao.allocateDesigner(designer);
                response.sendRedirect("./pages/tables/project-Table-admin.jsp");
            } else if (emp.getProfile().equals("coder")) {
                Coder coder = new Coder();
                coder.setEid(eid);
                coder.setPid(pid);
                
                Coderdao dao = new CoderDaoImpl();
                boolean isAdded = dao.allocateCoder(coder);
                response.sendRedirect("./pages/tables/project-Table-admin.jsp");
            } else if(emp.getProfile().equals("tester")){
                Tester tester = new Tester();
                tester.setEid(eid);
                tester.setPid(pid);
                
                Testerdao dao = new TesterDaoImpl();
                boolean isAdded = dao.allocateTester(tester);
                response.sendRedirect("./pages/tables/project-Table-admin.jsp");
            
        }
            
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
