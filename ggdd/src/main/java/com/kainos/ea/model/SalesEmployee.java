package com.kainos.ea.model;

public class SalesEmployee extends Employee{
    private float commissionRate;
    private float totalSalesMonth;

    public SalesEmployee(){

    }

    public SalesEmployee(short newNumber, float newSalary, String fName, String lName) {
        super(newNumber, newSalary, fName, lName);
    }

    public SalesEmployee(short newNumber, float newSalary, String fName, String lName, float commissionRate, float salesTotal) {
        this(newNumber, newSalary, fName, lName);
        setCommissionRate(commissionRate);
        setTotalSalesMonth(salesTotal);
    }

    public SalesEmployee(float salary, String fName, String lName, String email, String address, String address2, String city, String county, String postalCode, String country, String phoneNo, String bankNo, String nin, float commissionRate, float totalSalesMonth) {
        super(salary, fName, lName, email, address, address2, city, county, postalCode, country, phoneNo, bankNo, nin);
        this.commissionRate = commissionRate;
        this.totalSalesMonth = totalSalesMonth;
    }

    public SalesEmployee(int employeeId, float salary, String fName, String lName, String email, String address, String address2, String city, String county, String postalCode, String country, String phoneNo, String bankNo, String nin, float commissionRate, float totalSalesMonth) {
        super(employeeId, salary, fName, lName, email, address, address2, city, county, postalCode, country, phoneNo, bankNo, nin);
        this.commissionRate = commissionRate;
        this.totalSalesMonth = totalSalesMonth;
    }

    public float getCommissionRate() {
        return commissionRate;
    }

    public void setCommissionRate(float commissionRate) {
        this.commissionRate = commissionRate;
    }

    public float getTotalSalesMonth() {
        return totalSalesMonth;
    }

    public void setTotalSalesMonth(float totalSalesMonth) {
        this.totalSalesMonth = totalSalesMonth;
    }

    @Override
    public float calcPay(){ // calculate monthly pay in pence
        return super.calcPay() + Math.round(commissionRate * totalSalesMonth);
    }

    @Override
    public boolean equals(Object obj) {
        if (obj instanceof SalesEmployee){
            SalesEmployee semp = (SalesEmployee) obj;
            return this.getTotalSalesMonth() == semp.getTotalSalesMonth()
                    && this.getCommissionRate() == semp.getCommissionRate()
                    && super.equals(obj);
        } else return false;
    }

    @Override
    public String toString() {
        return String.format("Employee %d: %s %s, £%,.2f."
                        + " Monthly gross pay: £%,.2f."
                        + " Commission rate: %,.2f%%"
                        + " Sales total: £%,.2f.",
                getEmployeeId(), getfName(), getlName(), getSalary(), calcPay(), getCommissionRate()*100, getTotalSalesMonth());
    }
}
