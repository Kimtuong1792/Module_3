package repository.employee;

import model.Division;
import model.EducationDegree;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EducationDegreeRepository implements IEducationDegreeRepository{
    private String jdbcURL = "jdbc:mysql://localhost:3306/casestudy_wed";
    private String jdbcUsername = "root";
    private String jdbcPassword = "12345678";
    List<EducationDegree> educationDegreeList = new ArrayList<>();
    private static final String SELECT_ALL_EDUCATION_DEGREE = "select * from education_degree";
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
    public List<EducationDegree> selectAllEducationDegree()  {
        educationDegreeList.clear();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_EDUCATION_DEGREE)) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                educationDegreeList.add(new EducationDegree(id,name));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return educationDegreeList;
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

}
