package Models;

public class Employee {
    private int employeeId;
    private String firstname;
    private String lastname;
    private String addressline;
    private String city;
    private String county;
    private String postcode;
    private String bankAccNumber;
    private String sortCode;
    private float salary;

    public Employee(int employeeId,String firstname,String lastname,String addressline,String city,String county,String postcode,String bankAccNumber,String sortCode,float salary) {
        this.setEmployeeId(employeeId);
        this.setFirstname(firstname);
        this.setLastname(lastname);
        this.setAddressline(addressline);
        this.setCity(city);
        this.setCounty(county);
        this.setPostcode(postcode);
        this.setBankAccNumber(bankAccNumber);
        this.setSortCode(sortCode);
        this.setSalary(salary);
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getAddressline() {
        return addressline;
    }

    public void setAddressline(String addressline) {
        this.addressline = addressline;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCounty() {
        return county;
    }

    public void setCounty(String county) {
        this.county = county;
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public String getBankAccNumber() {
        return bankAccNumber;
    }

    public void setBankAccNumber(String bankAccNumber) {
        this.bankAccNumber = bankAccNumber;
    }

    public String getSortCode() {
        return sortCode;
    }

    public void setSortCode(String sortCode) {
        this.sortCode = sortCode;
    }

    public float getSalary() {
        return salary;
    }

    public void setSalary(float salary) {
        this.salary = salary;
    }
}
