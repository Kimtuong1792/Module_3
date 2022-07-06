package repository.employee;

import model.Customer;
import model.Employee;

import java.sql.SQLException;
import java.util.List;

public interface IEmployeeRepository {
    void createEmployee(Employee employee) throws SQLException;

    Employee selectEmployee(int id);

    List<Employee> selectAllEmployee();

    boolean deleteEmployee(int id) throws SQLException;

    boolean updateEmployee(Employee employee) throws SQLException;
    Employee findById(int id);
}
