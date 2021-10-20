package com.kainos.ea.service;

import com.kainos.ea.data.EmployeeData;
import com.kainos.ea.model.Employee;
import com.kainos.ea.util.DatabaseConnector;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collection;

public class EmployeeService {

    public static EmployeeData employeeData = new EmployeeData();
    public static DatabaseConnector databaseConnector = new DatabaseConnector();

    public int insertEmployeeIntoDatabase(Employee employee) {
        Connection connection = databaseConnector.getConnection();
        int auto_id = employeeData.insertEmployeeIntoDatabase(employee,connection);
        return auto_id;
    }

    public Collection<Employee> selectAllEmployees(){
        Connection connection = databaseConnector.getConnection();
        return employeeData.selectAllEmployees(connection);
    }

    public Employee selectEmployee(int employeeId){
        Connection connection = databaseConnector.getConnection();
        return employeeData.selectEmployee(employeeId,connection);
    }

    public void updateEmployee(int employeeId, Employee employee) throws SQLException {
        Connection  connection = databaseConnector.getConnection();
        employeeData.updateEmployee(employeeId, employee, connection);
    }

    public void deleteEmployee(int employeeId) throws SQLException{
        Connection connection = databaseConnector.getConnection();
        employeeData.deleteEmployee(employeeId, connection);
    }
}
