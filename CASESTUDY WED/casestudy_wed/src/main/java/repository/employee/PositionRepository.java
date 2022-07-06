package repository.employee;

import model.Division;
import model.Position;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PositionRepository implements IPositionRepository{
    private String jdbcURL = "jdbc:mysql://localhost:3306/casestudy_wed";
    private String jdbcUsername = "root";
    private String jdbcPassword = "12345678";
    List<Position> positionList = new ArrayList<>();
    private static final String SELECT_ALL_POSITION = "select * from position";
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
    public List<Position> selectAllPosition() {
        positionList.clear();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_POSITION)) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                positionList.add(new Position(id,name));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return positionList;
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
