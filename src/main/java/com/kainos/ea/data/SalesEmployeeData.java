package com.kainos.ea.data;

import com.kainos.ea.model.Employee;
import com.kainos.ea.model.SalesEmployee;
import org.checkerframework.checker.units.qual.C;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;

public class SalesEmployeeData {
    public int insertSalesEmployeeIntoDatabase(SalesEmployee salesEmployee, Connection connection) {
        try {
            String query = "INSERT INTO salesEmployee (employeeId, commissionRate, totalSalesMonth) "
                    + " VALUES (?,?,?)";
            PreparedStatement statement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            statement.setInt(1, salesEmployee.getEmployeeId());
            statement.setFloat(2, salesEmployee.getCommissionRate());
            statement.setFloat(3, salesEmployee.getTotalSalesMonth());

            statement.executeUpdate();

            ResultSet rs = statement.getGeneratedKeys();
            rs.next();
            return rs.getInt(1);

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return -1;
    }

    public SalesEmployee selectSalesEmployee(int employeeId, Connection connection) {
        try {
            String query = "SELECT * FROM employee INNER JOIN salesEmployee using(employeeId) WHERE employee.employeeId = ?;";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, employeeId);

            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                SalesEmployee salesEmployee = new SalesEmployee(
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
                        rs.getFloat("commissionRate"),
                        rs.getFloat("totalSalesMonth")
                );

                return salesEmployee;
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public Collection<SalesEmployee> selectAllSalesEmployees(Connection connection){
        Collection<SalesEmployee> salesEmployees = new ArrayList<>();

        try {
            String query = "SELECT * FROM employee INNER JOIN salesEmployee using(employeeId)";
            PreparedStatement statement = connection.prepareStatement(query);

            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                SalesEmployee salesEmployee = new SalesEmployee(
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
                        rs.getFloat("commissionRate"),
                        rs.getFloat("totalSalesMonth")
                );

                salesEmployees.add(salesEmployee);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return salesEmployees;
    }

    public void deleteSalesEmployee(int employeeId, Connection connection){
        try {
            String query = "DELETE FROM salesEmployee WHERE employeeId = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1,employeeId);

            statement.executeUpdate();
        }catch (Exception ex){
            System.out.println("oof");
        }
    }

    public SalesEmployee updateSalesEmployee(int employeeId, SalesEmployee salesEmployee, Connection connection) {
        salesEmployee.setEmployeeId(employeeId);
        try{
            String query = "UPDATE salesEmployee " +
                    "SET commissionRate = ?, totalSalesMonth = ? " +
                    "WHERE employeeId = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setFloat(1,salesEmployee.getCommissionRate());
            statement.setFloat(2,salesEmployee.getTotalSalesMonth());
            statement.setInt(3, employeeId);

            statement.executeUpdate();
        }catch (Exception ex){
            ex.printStackTrace();
        }

        return salesEmployee;
    }
}
