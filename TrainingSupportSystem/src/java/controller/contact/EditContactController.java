/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.contact;

import dal.WebContactDAO;
import model.WebContact;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author win
 */
public class EditContactController extends HttpServlet {

    WebContactDAO wDB = new WebContactDAO();

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
            out.println("<title>Servlet EditContactController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditContactController at " + request.getContextPath() + "</h1>");
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
        String contact_id = request.getParameter("contact_id");
        WebContact wc = new WebContact();
        wc.setContact_id(Integer.parseInt(contact_id));
        request.setAttribute("contact_pro", wDB.get(wc));
        request.getRequestDispatcher("view/admin/webedit.jsp").forward(request, response);

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
        String contact_id = request.getParameter("contact_per");
        String raw_name = request.getParameter("name_per");
        String raw_email = request.getParameter("email_per");
        String raw_mobile = request.getParameter("number_per");
        String name = (raw_name != null && raw_name.length() > 0) ? raw_name : null;
        String email = (raw_email != null && raw_email.length() > 0) ? raw_email : null;
        String mobile = (raw_mobile != null && raw_mobile.length() > 0) ? raw_mobile : null;
        WebContact wc = new WebContact();
        wc.setContact_id(Integer.parseInt(contact_id));
        wc.setName(name);
        wc.setEmail(email);
        wc.setMobile(mobile);
        wDB.update(wc);
        response.sendRedirect("weblist");
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
