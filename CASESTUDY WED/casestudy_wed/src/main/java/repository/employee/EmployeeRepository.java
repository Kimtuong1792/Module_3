package repository.employee;

import model.Customer;
import model.Employee;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepository implements IEmployeeRepository{
    private String jdbcURL = "jdbc:mysql://localhost:3306/casestudy_wed";
    private String jdbcUsername = "root";
    private String jdbcPassword = "12345678";
    static List<Employee> employeeList = new ArrayList<>();
    private static final String INSERT_EMPLOYEE_SQL = "INSERT INTO employee (id, name, date_of_birth , id_card,  salary , phone_number , email , address , position_id , education_degree_id , division_id , username ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? );";
    private static final String FIND_BY_ID = "select * from employee where id = ?";
    private static final String SELECT_ALL_EMPLOYEE = "select * from employee";
    private static final String UPDATE_EMPLOYEE_SQL = "update employee set name =? , date_of_birth = ? , id_card = ? , salary = ? ,  phone_number = ? , email = ? , address = ?  , position_id = ? , education_degree_id = ? , division_id = ? , username = ? where id = ? ";
    private static final String DELETE_EMPLOYEE_SQL = "delete from employee where id = ? ";
    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }

    @Override
    public void createEmployee(Employee employee) throws SQLException {
        employeeList.clear();
        System.out.println(INSERT_EMPLOYEE_SQL);
        // try-with-resource statement will auto close the connection.
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_EMPLOYEE_SQL)) {
            preparedStatement.setInt(1, employee.getId());
            preparedStatement.setString(2, employee.getName());
            preparedStatement.setString(3, employee.getBirthday());
            preparedStatement.setString(4, employee.getIdCard());
            preparedStatement.setDouble(5, employee.getSalary());
            preparedStatement.setString(6, employee.getNumberPhone());
            preparedStatement.setString(7, employee.getEmail());
            preparedStatement.setString(8, employee.getAddress());
            preparedStatement.setInt(9, employee.getPositionId());
            preparedStatement.setInt(10, employee.getEducationDegreeId());
            preparedStatement.setInt(11, employee.getDivisionId());
            preparedStatement.setString(12, employee.getUserName());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
    @Override
    public Employee selectEmployee(int id) {
        return null;
    }

    @Override
    public List<Employee> selectAllEmployee() {
        employeeList.clear();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_EMPLOYEE)) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String birthday = rs.getString("date_of_birth");
                String idCard = rs.getString("id_card");
                int salary = rs.getInt("salary");
                String numberPhone = rs.getString("phone_number");
                String email = rs.getString("email");
                String address = rs.getString("address");
                int position_id = rs.getInt("position_id");
                int education_degree_id = rs.getInt("education_degree_id");
                int division_id = rs.getInt("division_id");
                String username = rs.getString("username");

                employeeList.add(new Employee(id,name,birthday,idCard,salary,numberPhone,email,address,position_id,education_degree_id,division_id,username));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return employeeList;
    }

    @Override
    public boolean deleteEmployee(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_EMPLOYEE_SQL);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    @Override
    public boolean updateEmployee(Employee employee) throws SQLException {
        employeeList.clear();
        boolean rowUpdated;

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_EMPLOYEE_SQL);) {
            statement.setString(1, employee.getName());
            statement.setString(2, employee.getBirthday());
            statement.setString(3, employee.getIdCard());
            statement.setInt(4, (int)employee.getSalary());
            statement.setString(5, employee.getNumberPhone());
            statement.setString(6, employee.getEmail());
            statement.setString(7, employee.getAddress());
            statement.setInt(8, employee.getPositionId());
            statement.setInt(9, employee.getEducationDegreeId());
            statement.setInt(10, employee.getDivisionId());
            statement.setString(11, employee.getUserName());
            statement.setInt(12, employee.getId());
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    @Override
    public Employee findById(int id) {
        Employee employee = null;

        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {

                String name = rs.getString("name");
                String birthday = rs.getString("date_of_birth");
                String idCard = rs.getString("id_card");
                int salary = rs.getInt("salary");
                String numberPhone = rs.getString("phone_number");
                String email = rs.getString("email");
                String address = rs.getString("address");
                int position_id = rs.getInt("position_id");
                int education_degree_id = rs.getInt("education_degree_id");
                int division_id = rs.getInt("division_id");
                String username = rs.getString("username");

                employee = new Employee(id,name,birthday,idCard,salary,numberPhone,email,address,position_id,education_degree_id,division_id,username);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employee;
    }
    }

