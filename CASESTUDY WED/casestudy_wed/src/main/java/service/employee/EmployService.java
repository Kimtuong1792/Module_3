package service.employee;

import model.Customer;
import model.Employee;
import repository.employee.EmployeeRepository;
import repository.employee.IEmployeeRepository;

import java.sql.SQLException;
import java.util.List;

public class EmployService implements IEmployeeSevice{
    private final IEmployeeRepository employeeRepository = new EmployeeRepository();
    @Override
    public void createEmployee(Employee employee) throws SQLException {
employeeRepository.createEmployee(employee);
    }

    @Override
    public Employee selectEmployee(int id) {
        return employeeRepository.selectEmployee(id);
    }

    @Override
    public List<Employee> selectAllEmployee() {
        return employeeRepository.selectAllEmployee();
    }

    @Override
    public boolean deleteEmployee(int id) throws SQLException {
        return employeeRepository.deleteEmployee(id);
    }

    @Override
    public boolean updateEmployee(Employee employee) throws SQLException {
        return employeeRepository.updateEmployee(employee);
    }

    @Override
    public Employee findById(int id) {
        return employeeRepository.findById(id);
    }
}
