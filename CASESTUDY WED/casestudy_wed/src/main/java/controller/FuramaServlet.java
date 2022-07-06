package controller;

import java.io.IOException;

@javax.servlet.annotation.WebServlet(name = "FuramaServlet", urlPatterns = "/home")

public class FuramaServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "playList":
                break;
            case "addNew":
                break;
            case "edit":
                break;
            case "delete":
                break;
            default:

        }
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "playList":
                break;
            case "addNew":
                break;
            case "edit":
                break;
            case "delete":
                break;
            default:

        }
    }
}
