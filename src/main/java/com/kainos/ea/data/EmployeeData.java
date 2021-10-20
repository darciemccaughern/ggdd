package com.kainos.ea.data;


import com.kainos.ea.model.Employee;
import com.kainos.ea.model.SalesEmployee;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collection;

public class EmployeeData {

    public int insertEmployeeIntoDatabase(Employee employee, Connection connection) {
        int auto_id = -1;
        try {

            String query = "INSERT INTO employee (fName, lName, address, city, county, postalCode, sortCode, startSalary, nin)"
                    + " VALUES (?,?,?,?,?,?,?,?,?)";

            PreparedStatement statement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            statement.setString(1, employee.getfName());
            statement.setString(2, employee.getlName());
            statement.setString(3, employee.getAddress());
            statement.setString(4, employee.getCity());
            statement.setString(5, employee.getCounty());
            statement.setString(6, employee.getPostalCode());
            statement.setString(7,employee.getSortCode());
            statement.setFloat(8, employee.getSalary());
            statement.setString(9, employee.getNin());

            statement.executeUpdate();

            ResultSet rs = statement.getGeneratedKeys();
            rs.next();
            auto_id = rs.getInt(1);

            return auto_id;
        } catch(SQLException ex){
            ex.printStackTrace(); // Bad practice alert!
        }
        return auto_id;
    }

    public Collection<Employee> selectAllEmployees(Connection connection){
        Collection<Employee> employees = new ArrayList();

        try {
            String query = "SELECT * FROM employee";
            PreparedStatement statement = connection.prepareStatement(query);

            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Employee employee = new Employee(
                       rs.getInt("employeeId"),
                        rs.getFloat("salary"),
                        rs.getString("fName"),
                        rs.getString("lName"),
                        rs.getString("address"),
                        rs.getString("city"),
                        rs.getString("county"),
                        rs.getString("postalCode"),
                        rs.getString("bankNo"),
                        rs.getString("nin"),
                        rs.getString("sortCode")
                );

                employees.add(employee);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return employees;
    }

    public Employee selectEmployee(int employeeId, Connection connection) {
        try {
            String query = "SELECT * FROM employee WHERE employeeId = ?;";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, employeeId);

            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Employee employee = new Employee(
                        rs.getInt("employeeId"),
                        rs.getFloat("salary"),
                        rs.getString("fName"),
                        rs.getString("lName"),
                        rs.getString("address"),
                        rs.getString("city"),
                        rs.getString("county"),
                        rs.getString("postalCode"),
                        rs.getString("bankNo"),
                        rs.getString("nin"),
                        rs.getString("sortCode")
                );

                return employee;
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public void updateEmployee(int employeeId, Employee employee, Connection connection) throws SQLException{
            String query = "UPDATE employee " +
                    "SET salary = ?, city = ? " +
                    "WHERE employeeId = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setFloat(1,employee.getSalary());
            statement.setString(2,employee.getCity());
            statement.setInt(3, employeeId);

            statement.executeUpdate();
    }

    public void deleteEmployee(int employeeId, Connection connection) throws SQLException{
            String query = "DELETE FROM employee WHERE employeeId = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1,employeeId);

            statement.executeUpdate();
    }
}
