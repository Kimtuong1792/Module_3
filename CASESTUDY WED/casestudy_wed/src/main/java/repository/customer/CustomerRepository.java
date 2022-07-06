package repository.customer;

import model.Customer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private String jdbcURL = "jdbc:mysql://localhost:3306/casestudy_wed";
    private String jdbcUsername = "root";
    private String jdbcPassword = "12345678";
    static List<Customer> customerList = new ArrayList<>();
    private static final String INSERT_CUSTOMER_SQL = "INSERT INTO customer (id, customer_type_id , name, date_of_birth , gender,  id_card , phone_number , email , address) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
    private static final String FIND_BY_ID = "select * from customer where id = ?";
    private static final String SELECT_ALL_CUSTOMER = "select * from customer";
    private static final String UPDATE_CUSTOMER_SQL = "update customer set customer_type_id =? , name = ? , date_of_birth = ? , gender = ? ,  id_card = ? , phone_number = ? , email = ?  , address = ? where id = ? ";
    private static final String DELETE_CUSTOMER_SQL = "delete from customer where id = ? ";
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
    public void createCustomer(Customer customer) throws SQLException {
        customerList.clear();
        System.out.println(INSERT_CUSTOMER_SQL);
        // try-with-resource statement will auto close the connection.
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CUSTOMER_SQL)) {
            preparedStatement.setInt(1, customer.getId());
            preparedStatement.setInt(2, customer.getCustomerTypeId());
            preparedStatement.setString(3, customer.getName());
            preparedStatement.setString(4, customer.getBirthday());
            preparedStatement.setInt(5, customer.getGender());
            preparedStatement.setString(6, customer.getIdCard());
            preparedStatement.setString(7, customer.getNumberPhone());
            preparedStatement.setString(8, customer.getEmail());
            preparedStatement.setString(9, customer.getAddress());
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
    public Customer selectCustomer(int id) {
        return null;
    }

    @Override
    public List<Customer> selectAllCustomer() {
        customerList.clear();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMER)) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                int customerTypeId = rs.getInt("customer_type_id");
                String name = rs.getString("name");
                String birthday = rs.getString("date_of_birth");
                int gender = rs.getInt("gender");
                String idCard = rs.getString("id_card");
                String numberPhone = rs.getString("phone_number");
                String email = rs.getString("email");
                String address = rs.getString("address");

                customerList.add(new Customer(id,customerTypeId,name,birthday,gender,idCard,numberPhone,email,address));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return customerList;
    }

    //    public Customer(int id, int customerTypeId, String name,
//                    String birthday, int gender, String idCard,
//                    String numberPhone, String email, String address)
    @Override
    public boolean deleteCustomer(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_CUSTOMER_SQL);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    @Override
    public boolean updateCustomer(Customer customer) throws SQLException {
        customerList.clear();
        boolean rowUpdated;

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_CUSTOMER_SQL);) {

            statement.setInt(1, customer.getCustomerTypeId());
            statement.setString(2, customer.getName());
            statement.setString(3, customer.getBirthday());
            statement.setInt(4, customer.getGender());
            statement.setString(5, customer.getIdCard());
            statement.setString(6, customer.getNumberPhone());
            statement.setString(7, customer.getEmail());
            statement.setString(8, customer.getAddress());
            statement.setInt(9, customer.getId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    @Override
    public Customer findById(int id) {
        Customer customer = null;

        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {

                int customerTypeId = rs.getInt("customer_type_id");
                String name = rs.getString("name");
                String birthday = rs.getString("date_of_birth");
                int gender = rs.getInt("gender");
                String idCard = rs.getString("id_card");
                String numberPhone = rs.getString("phone_number");
                String email = rs.getString("email");
                String address = rs.getString("address");

                customer= new Customer(id,customerTypeId,name,birthday,gender,idCard,numberPhone,email,address);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customer;
    }
}
