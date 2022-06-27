import javax.servlet.RequestDispatcher;
import java.io.IOException;

@javax.servlet.annotation.WebServlet(name = "Product" , urlPatterns = "/product")
public class Product extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String name = request.getParameter("description");
        int price = Integer.parseInt(request.getParameter("price"));
        double percent = Double.parseDouble(request.getParameter("percent"));
        Double amout = price* percent * 0.01;
        Double product = price -amout;

        request.setAttribute("ketQua",product);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
        requestDispatcher.forward(request,response);

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }
}
