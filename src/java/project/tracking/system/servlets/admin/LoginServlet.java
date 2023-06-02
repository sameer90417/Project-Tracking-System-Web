/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package project.tracking.system.servlets.admin;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import project.tracking.system.dao.Employeedao;
import project.tracking.system.daoimpl.EmployeeDaoImpl;
import project.tracking.system.database.Authenticator;
import project.tracking.system.entity.Employee;

/**
 *
 * @author hp
 */
public class LoginServlet extends HttpServlet {

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
            out.println("<title>Servlet LoginServlet</title>");   
            out.println("<link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css\" rel=\"stylesheet\"\n" +
"        integrity=\"sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT\" crossorigin=\"anonymous\">");
            out.println("    <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js\"\n" +
"        integrity=\"sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8\"\n" +
"        crossorigin=\"anonymous\"></script>");
            out.println("</head>");
            out.println("<body>");
            
            String Email = request.getParameter("email").toLowerCase();
            String Password = request.getParameter("pass");
        
        Authenticator at = new Authenticator();
        boolean isExist = at.Authenticate(Email, Password);
        if (isExist) {
            
            if (Email.equals("admin@gmail.com") && Password.equals("Admin") ) {
                
                // Redirect to AdminHomeFrame
                RequestDispatcher rd = request.getRequestDispatcher("home.html");
                rd.forward(request, response);
                
            } else {
                Employeedao dao = new EmployeeDaoImpl();
                Employee emp = dao.getEmployeeByEmail(Email);
                // Redirect to EmployeeHomeFrame
                
                response.sendRedirect("pages/tables/Employee-Table.jsp?eid="+emp.getEid()+"&cid="+emp.getCid()+"&email="+Email);

            }
            
        } else {
            
              out.println("<div class=\"alert alert-warning d-flex align-items-center alert-dismissible fade show\" role=\"alert\">\n" +
"  <strong>Sorry!... </strong>Wrong Password \n" +
"  <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\n" +
"</div>");
              RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
              rd.include(request, response);
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
