package com.kainos.ea.model;

public class Employee {
    private int employeeId; // employee number
    private float salary; // employee salary
    private String fName; // employee first name
    private String lName;
    private String address;
    private String city;
    private String county;
    private String sortCode;
    private String postalCode;
    private String bankNo;
    private String nin;
    private int isBuisnessHead;

    public Employee(int employeeId,float salary, String fName, String lName, String address, String city, String county, String postalCode, String bankNo, String nin,String sortCode, int isBuinessHead) {

        this.setEmployeeId(employeeId);
        this.setSalary(salary);
        this.setfName(fName);
        this.setlName(lName);
        this.setAddress(address);
        this.setCity(city);
        this.setCounty(county);
        this.setPostalCode(postalCode);
        this.setBankNo(bankNo);
        this.setNin(nin);
        this.setIsBusnessHead(isBuisnessHead);
        this.setSortCode(sortCode);

    }


    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public float getSalary() {
        return salary;
    }

    public void setSalary(float salary) {
        this.salary = salary;
    }

    public String getfName() {
        return fName;
    }

    public void setfName(String fName) {
        this.fName = fName;
    }

    public String getlName() {
        return lName;
    }

    public void setlName(String lName) {
        this.lName = lName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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

    public int getIsBuisnessHead() {
        return isBuisnessHead;
    }

    public void setIsBusnessHead(int isBusnessHead) {
        this.isBuisnessHead = isBusnessHead;
    }

    public String getSortCode() {
        return sortCode;
    }

    public void setSortCode(String sortCode) {
        this.sortCode = sortCode;
    }
}
