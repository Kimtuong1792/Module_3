package controller;

import model.*;
import service.employee.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "EmployeeServlet", urlPatterns = "/employee")
public class EmployeeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final IEmployeeSevice employeeSevice = new EmployService();
    private final IDivisionService divisionService = new DivisionService();
    private final IPositionService positionService = new PositionService();
    private final IUserService userService = new UserService();
    private final IEducationDegreeService educationDegreeService = new EducationDegreeService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createEmployee(request, response);
                break;
            case "edit":
                updateEmployee(request, response);
                break;
            case "delete":
                deleteEmployee(request, response);
                break;
            default:
                lisEmployee(request, response);

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateEmployee(request, response);
                break;
            case "edit":
                showUpdateEmployee(request, response);
                break;
            default:
                lisEmployee(request, response);

        }
    }

    private void createEmployee(HttpServletRequest request, HttpServletResponse response) {

        int id = Integer.parseInt(request.getParameter("id"));
//        int id, String name, String birthday, String idCard,
//        double salary, String numberPhone, String email,
//                String address, int positionId, int educationDegreeId,
//        int divisionId, String userName)
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String idCard = request.getParameter("idCard");
        Double salary = Double.parseDouble(request.getParameter("salary"));
        String numberPhone = request.getParameter("numberPhone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int positionId = Integer.parseInt(request.getParameter("positionId"));
        int educationDegreeId = Integer.parseInt(request.getParameter("educationDegreeId"));
        int divisionId = Integer.parseInt(request.getParameter("divisionId"));
        String userName = request.getParameter("userName");
        Employee employee = new Employee(id, name, birthday, idCard, salary, numberPhone, email, address, positionId, educationDegreeId, divisionId, userName);

        try {
            employeeSevice.createEmployee(employee);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/employee/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) {
        List<Position> positionList = positionService.selectAllPosition();
        List<Division> divisionList = divisionService.selectAllDivision();
        List<EducationDegree> educationDegreeList = educationDegreeService.selectAllEducationDegree();
        List<User> userList = userService.selectAllUser();
        request.setAttribute("positionList", positionList);
        request.setAttribute("divisionList", divisionList);
        request.setAttribute("educationDegreeList", educationDegreeList);
        request.setAttribute("userList", userList);

        int id = Integer.parseInt(request.getParameter("id"));
        try {
            employeeSevice.deleteEmployee(id);
            request.setAttribute("mess", " Da xoa thanh cong ");
            List<Employee> employeeList = employeeSevice.selectAllEmployee();
            request.setAttribute("employeeList", employeeList);
            try {
                request.getRequestDispatcher("/view/employee/list.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    private void updateEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
//        int id, String name, String birthday, String idCard,
//        double salary, String numberPhone, String email,
//                String address, int positionId, int educationDegreeId,
//        int divisionId, String userName)
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String idCard = request.getParameter("idCard");
        Double salary = Double.parseDouble(request.getParameter("salary"));
        String numberPhone = request.getParameter("numberPhone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int positionId = Integer.parseInt(request.getParameter("positionId"));
        int educationDegreeId = Integer.parseInt(request.getParameter("educationDegreeId"));
        int divisionId = Integer.parseInt(request.getParameter("divisionId"));
        String userName = request.getParameter("userName");
        Employee employee = new Employee(id, name, birthday, idCard, salary, numberPhone, email, address, positionId, educationDegreeId, divisionId, userName);

        try {
            employeeSevice.updateEmployee(employee);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/employee/edit.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void lisEmployee(HttpServletRequest request, HttpServletResponse response) {

        List<Employee> employeeList = employeeSevice.selectAllEmployee();
        List<Position> positionList = positionService.selectAllPosition();
        List<Division> divisionList = divisionService.selectAllDivision();
        List<EducationDegree> educationDegreeList = educationDegreeService.selectAllEducationDegree();
        List<User> userList = userService.selectAllUser();
        request.setAttribute("employeeList", employeeList);
        request.setAttribute("positionList", positionList);
        request.setAttribute("divisionList", divisionList);
        request.setAttribute("educationDegreeList", educationDegreeList);
        request.setAttribute("userList", userList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("view/employee/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }




    private void showCreateEmployee(HttpServletRequest request, HttpServletResponse response) {
        List<Employee> employeeList = employeeSevice.selectAllEmployee();
        List<Position> positionList = positionService.selectAllPosition();
        List<Division> divisionList = divisionService.selectAllDivision();
        List<EducationDegree> educationDegreeList = educationDegreeService.selectAllEducationDegree();
        List<User> userList = userService.selectAllUser();
        request.setAttribute("employeeList", employeeList);
        request.setAttribute("positionList", positionList);
        request.setAttribute("divisionList", divisionList);
        request.setAttribute("educationDegreeList", educationDegreeList);
        request.setAttribute("userList", userList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("view/employee/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showUpdateEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee employ = employeeSevice.findById(id);
        request.setAttribute("employee", employ);
        List<Employee> employeeList = employeeSevice.selectAllEmployee();
        List<Position> positionList = positionService.selectAllPosition();
        List<Division> divisionList = divisionService.selectAllDivision();
        List<EducationDegree> educationDegreeList = educationDegreeService.selectAllEducationDegree();
        List<User> userList = userService.selectAllUser();
        request.setAttribute("employeeList", employeeList);
        request.setAttribute("positionList", positionList);
        request.setAttribute("divisionList", divisionList);
        request.setAttribute("educationDegreeList", educationDegreeList);
        request.setAttribute("userList", userList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/employee/edit.jsp");

        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
