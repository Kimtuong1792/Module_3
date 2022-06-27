import javax.servlet.RequestDispatcher;
import java.io.IOException;

@javax.servlet.annotation.WebServlet(name = "Money" ,urlPatterns = "/converter")
public class Money extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        Double rate = Double.parseDouble(request.getParameter("rate"));
        Double usd = Double.parseDouble(request.getParameter("usd"));
        Double vnd = rate * usd;
        request.setAttribute("tyGia", vnd);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
        requestDispatcher.forward(request,response);
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }
}
