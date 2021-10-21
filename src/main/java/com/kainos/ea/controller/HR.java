package com.kainos.ea.controller;

import com.codahale.metrics.annotation.Timed;
import com.kainos.ea.model.Employee;
import com.kainos.ea.model.SalesEmployee;
import com.kainos.ea.service.EmployeeService;
import com.kainos.ea.service.SalesEmployeeService;
import io.swagger.annotations.Api;
import org.eclipse.jetty.http.HttpStatus;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.sql.SQLException;
import java.util.Collection;

@Api
@Path("/hr")
public class HR {

    public static EmployeeService employeeService = new EmployeeService();
    public static SalesEmployeeService salesEmployeeService = new SalesEmployeeService();


    @GET
    @Path("/employee/all")
    @Produces(MediaType.APPLICATION_JSON)
    public Collection<Employee> getAllEmployees() {
        EmployeeService employeeService = new EmployeeService();

        return employeeService.selectAllEmployees();
    }

    @GET
    @Path("/employee/{msg}")
    @Produces(MediaType.APPLICATION_JSON)
    public Employee getEmployee(@PathParam("msg") int employeeId) {
        EmployeeService employeeService = new EmployeeService();

        return employeeService.selectEmployee(employeeId);
    }

    @GET
    @Path("/salesEmployee/all")
    @Produces(MediaType.APPLICATION_JSON)
    public Collection<SalesEmployee> getAllSalesEmployees() {
        SalesEmployeeService salesEmployeeService = new SalesEmployeeService();

        return salesEmployeeService.selectAllSalesEmployees();
    }

    @GET
    @Path("/salesEmployee/{msg}")
    @Produces(MediaType.APPLICATION_JSON)
    public SalesEmployee getSalesEmployee(@PathParam("msg") int employeeId) {
        SalesEmployeeService salesEmployeeService = new SalesEmployeeService();

        return salesEmployeeService.selectSalesEmployee(employeeId);
    }

    @POST
    @Timed
    @Path("/create/employee")
    @Consumes(MediaType.APPLICATION_JSON)
    public void createEmployee(Employee employee) {
        System.out.println(employee.getfName());
        employeeService.insertEmployeeIntoDatabase(employee);
    }

    @POST
    @Path("/create/salesEmployee")
    @Consumes(MediaType.APPLICATION_JSON)
    public void createSalesEmployee(SalesEmployee salesEmployee) {
        salesEmployeeService.insertSalesEmployeeIntoDatabase(salesEmployee);
    }

    @PUT
    @Path("update/employee/{id}")
    public Response updateEmployee(@PathParam("id") int employeeId, Employee employee){
        try {
            employeeService.updateEmployee(employeeId, employee);
            return Response.status(HttpStatus.CREATED_201).build();
        }catch (SQLException ex){
            System.out.println(ex);
        }
        return Response.status(HttpStatus.BAD_REQUEST_400).build();
    }

    @DELETE
    @Path("delete/employee/{id}")
    public Response deleteEmployee(@PathParam("id") int employeeId){
        try {
            employeeService.deleteEmployee(employeeId);
            return Response.status(HttpStatus.CREATED_201).build();
        }catch (SQLException ex){
            System.out.println(ex);
        }
        return Response.status(HttpStatus.BAD_REQUEST_400).build();
    }

    @DELETE
    @Path("delete/salesEmployee/{id}")
    public void deleteSalesEmployee(@PathParam("id") int employeeId){
        salesEmployeeService.deleteSalesEmployee(employeeId);
    }

    @PUT
    @Path("update/salesEmployee/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public SalesEmployee updateSalesEmployee(@PathParam("id") int employeeId, SalesEmployee salesEmployee ){
        return salesEmployeeService.updateSalesEmployee(employeeId, salesEmployee);
    }
}
