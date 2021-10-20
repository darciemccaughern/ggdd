package Controller;

import EmployeeDatabase.EmployeeService;
import Models.Employee;
import org.eclipse.jetty.http.HttpStatus;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

public class HR {

    @POST
    @Path("/insertEmp")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response createEmployee(Employee employee) {

        EmployeeService employee1 = new EmployeeService();

        employee1.insertEmployee(employee1);
        return Response.status(HttpStatus.CREATED_201).build();

    }
}
