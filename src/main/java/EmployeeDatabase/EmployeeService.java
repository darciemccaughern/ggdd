package EmployeeDatabase;
import
import Models.Employee;

public class EmployeeService {

    public void insertEmployee() {
        System.out.println("in emp service");

        Employee emp1 = new Employee(450,18_000,"Graham","Willy","pkghsj7si","123456789112","1994/12/24");

        EmployeeDAO empDAO = new EmployeeDAO();
        empDAO.insertEmployeeDAO(emp1);

    }
}
