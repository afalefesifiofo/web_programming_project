/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package it.unica.dieetech.registrazione;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import it.unica.dieetech.exceptions.InvalidParamException;
import it.unica.dieetech.model.Immagine;
import it.unica.dieetech.model.ImmagineFactory;
import it.unica.dieetech.model.UtenteFactory;
import it.unica.dieetech.utils.Utils;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

/**
 *
 * @author user
 */
@WebServlet(name = "Registrazione", urlPatterns = {"/registrazione"})
@MultipartConfig
public class Registrazione extends HttpServlet {

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
    
        response.setContentType("multipart/form-data");
        
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String username = request.getParameter("username");
        String email = request.getParameter("e_mail");
        String citta = request.getParameter("citta");
        String password = request.getParameter("password");
        String pswrepet = request.getParameter("psw_repeat");
        String webpage = "login.jsp";
        String url;
        String Nome_file;
        
        Part file = request.getPart("image");
        
        
        try(InputStream contenutoFile = file.getInputStream()){
            Utils.checkString(name, 1, 20);
            Utils.checkString(surname, 1, 20);
            Utils.checkString(username, 3, 20);
            Utils.checkString(citta, 2, 50);
            Utils.checkString(email, 10, 50);
            Utils.checkString(password, 1, 25);
            Utils.checkEqual(pswrepet,password);
            
            
            if(file.getSubmittedFileName().isEmpty()){
                url = "img/DT_bk.png";
                Nome_file = "immagine stock";
                }
            
            else{

            File fileDaSalvare = new File("C:/Users/andre/Documents/NetBeansProjects/DieeTech Test Servlet/web/uploads/" + file.getSubmittedFileName());
            Files.copy(contenutoFile,fileDaSalvare.toPath(),StandardCopyOption.REPLACE_EXISTING);
            url = "http://localhost:8080/DieeTech_Test_Servlet/uploads/" + file.getSubmittedFileName();
            Nome_file = file.getSubmittedFileName();}

            if(ImmagineFactory.getInstance().addImmagine(new Immagine (request.getParameter("name"), Nome_file , url))){
            
                    UtenteFactory.getInstance().setUtente(username, name, surname, email, password, citta, url);
                    response.sendRedirect("utenteRegistrato.jsp");//redirect alla nuova jsp user (areaPersonale)
            	}
            }catch(InvalidParamException e){
                    request.setAttribute("webpage", webpage);
                    request.setAttribute("errorMessage",e.getMessage());
                    request.getRequestDispatcher("error.jsp").forward(request, response);
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
