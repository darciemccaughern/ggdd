package com.kainos.ea.model;

public class Employee implements Payable, Comparable<Employee>{
    private int employeeId; // employee number
    protected float salary; // employee salary
    private String fName; // employee first name
    private String lName;
    private String email;
    private String address;
    private String address2;
    private String city;
    private String county;
    private String postalCode;
    private String country;
    private String phoneNo;
    private String bankNo;
    private String nin;
    private static final float MIN_SALARY = 7_000.00f;
    private boolean isManager;

    public Employee(){
        employeeId = -1;
    }

    public Employee (int newNumber) {
        this();
        setEmployeeId(newNumber);
        setManager(false);
    }

    public Employee(float salary, String city){
        setSalary(salary);
        setCity(city);
    }

    public Employee (int newNumber, float newSalary) {
        this(newNumber);      // good
        setSalary(newSalary);
    }

    public Employee (int newNumber, float newSalary, String fName, String lName) {
        this(newNumber, newSalary);      // good
        setfName(fName);
        setlName(lName);
    }

    public Employee(float salary, String fName, String lName, String email, String address, String address2, String city, String county, String postalCode, String country, String phoneNo, String bankNo, String nin) {
        this.salary = salary;
        this.fName = fName;
        this.lName = lName;
        this.email = email;
        this.address = address;
        this.address2 = address2;
        this.city = city;
        this.county = county;
        this.postalCode = postalCode;
        this.country = country;
        this.phoneNo = phoneNo;
        this.bankNo = bankNo;
        this.nin = nin;
        setManager(false);
    }

    public Employee(int employeeId, float salary, String fName, String lName, String email, String address, String address2, String city, String county, String postalCode, String country, String phoneNo, String bankNo, String nin) {
        this(salary, fName, lName, email, address, address2, city, county, postalCode, country, phoneNo, bankNo, nin);
        setEmployeeId(employeeId);
    }

    public float calcPay(){ // calculate monthly pay in pence
        return getSalary() /12;
    }

    public int getEmployeeId() {

        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        if (employeeId > 0) {
            this.employeeId = employeeId;
        }
    }

    public void setEmployeeId(String thisNumber){
        try{
            int s = Integer.parseInt(thisNumber);
            setEmployeeId(s);
        } catch(NumberFormatException e){
            throw new BadNumber(e.getMessage());
        }
    }

    public float getSalary() {
        return salary;
    }

    public void setSalary(float salary) {
        if(salary >= MIN_SALARY) {
            this.salary = salary;
        } else {
            throw new SalaryTooLowException(
                    String.format("Salary £%,.2f is below the minimum salary £%,.2f.",
                            salary, MIN_SALARY));
        }
    }

    public boolean isManager() {
        return isManager;
    }

    public void setManager(boolean manager) {
        isManager = manager;
    }

    @Override
    public String getfName() {
        return fName;
    }

    @Override
    public void setfName(String fName) {
        this.fName = fName;
    }

    public String getlName() {
        return lName;
    }

    public void setlName(String lName) {
        this.lName = lName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAddress2() {
        return address2;
    }

    public void setAddress2(String address2) {
        this.address2 = address2;
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

    public String getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    public String getBankNo() {
        return bankNo;
    }

    public void setBankNo(String bankNo) {
        this.bankNo = bankNo;
    }

    public String getNin() {
        return nin;
    }

    public void setNin(String nin) {
        this.nin = nin;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj instanceof Employee){
            Employee emp = (Employee) obj;
            return this.getSalary() == emp.getSalary()
                    && this.getfName().equals(emp.getfName())
                    && this.getEmployeeId() == emp.getEmployeeId();
        }else return false;
    }

    @Override
    public String toString() {
        return String.format("Employee %d: %s %s, £%,.2f."
                        + " Monthly gross pay: £%,.2f.",
                getEmployeeId(), getfName(), getlName(), getSalary(), calcPay());
    }

    public int compareTo(Employee x){
        int returned = Float.compare(this.getSalary(), x.getSalary());

        if (returned == 0){
            String s1 = this.getfName().split("\\.")[0];
            String s2 = x.getfName().split("\\.")[1];
            if (s1.charAt(0) > s2.charAt(0) ){
                return 1;
            }
            if (s1.charAt(0) < s2.charAt(0) ){
                return -1;
            }
        }
        return returned;
    }
}
