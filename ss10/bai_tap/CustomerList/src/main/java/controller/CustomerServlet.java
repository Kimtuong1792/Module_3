package controller;

import model.Customer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@javax.servlet.annotation.WebServlet(name = "CustomerServlet" , urlPatterns = "/customer")
public class CustomerServlet extends javax.servlet.http.HttpServlet {
    static List<Customer> customerList = new ArrayList<>();

    static {
        customerList.add(new Customer("nguyen van hoan ", "01/12/1999", "Da Nang", "https://img.websosanh.vn/v2/users/review/images/4wvuq0i4ozs1q.jpg?compress=85"));
        customerList.add(new Customer("Le Thuan Dat ", "01/12/2000", "Da Nang", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqNCbOusYph9PYuz_SAG1jebjgWZN6z6t7Qg&usqp=CAU"));
        customerList.add(new Customer("Nguyen Hoang Sang ", "01/12/1995", "Da Nang", "https://img.websosanh.vn/v2/users/review/images/4wvuq0i4ozs1q.jpg?compress=85"));
        customerList.add(new Customer("Truong Ngoc Huyen ", "01/12/1997", "Da Nang", "https://afamilycdn.com/150157425591193600/2022/4/19/b186a902-f01a-454c-b469-a971e0fe898c-1650345561069268580389.jpg"));
        customerList.add(new Customer("Nguyen Thanh Cong ", "01/12/1999", "Da Nang", "https://img.websosanh.vn/v2/users/review/images/4wvuq0i4ozs1q.jpg?compress=85"));
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("customerList", customerList);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
