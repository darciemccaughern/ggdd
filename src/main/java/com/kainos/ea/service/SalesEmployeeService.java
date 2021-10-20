package com.kainos.ea.service;

import com.kainos.ea.data.EmployeeData;
import com.kainos.ea.data.SalesEmployeeData;
import com.kainos.ea.model.SalesEmployee;
import com.kainos.ea.util.DatabaseConnector;

import java.sql.Connection;
import java.util.Collection;

public class SalesEmployeeService {
    public static SalesEmployeeData salesEmployeeData = new SalesEmployeeData();
    public static EmployeeData employeeData = new EmployeeData();
    public static DatabaseConnector databaseConnector = new DatabaseConnector();

    public int insertSalesEmployeeIntoDatabase(SalesEmployee salesEmployee) {
        Connection connection = databaseConnector.getConnection();
        salesEmployee.setEmployeeId(employeeData.insertEmployeeIntoDatabase(salesEmployee, connection));
        salesEmployeeData.insertSalesEmployeeIntoDatabase(salesEmployee,connection);
        return salesEmployee.getEmployeeId();
    }

    public SalesEmployee selectSalesEmployee(int employeeId) {
        Connection connection = databaseConnector.getConnection();
        return salesEmployeeData.selectSalesEmployee(employeeId, connection);
    }

    public Collection<SalesEmployee> selectAllSalesEmployees(){
        Connection connection = databaseConnector.getConnection();
        return salesEmployeeData.selectAllSalesEmployees(connection);
    }

    public void deleteSalesEmployee(int employeeId){
        Connection connection = databaseConnector.getConnection();
        salesEmployeeData.deleteSalesEmployee(employeeId, connection);
    }

    public SalesEmployee updateSalesEmployee(int employeeId, SalesEmployee salesEmployee) {
        Connection  connection = databaseConnector.getConnection();
        return salesEmployeeData.updateSalesEmployee(employeeId, salesEmployee, connection);
    }
}
