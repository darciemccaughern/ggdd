package com.kainos.ea.model;

public class SalesEmployee extends Employee {
    private float commissionRate;
    private float totalSalesMonth;


    public SalesEmployee(int employeeId, float salary, String fName, String lName, String address, String city, String county, String postalCode, String bankNo, String nin,int isBusinessHead, float commissionRate, float totalSalesMonth) {
        super(employeeId, salary, fName, lName, address, city, county, postalCode, bankNo, nin, isBusinessHead);
        this.commissionRate = commissionRate;
        this.setTotalSalesMonth(totalSalesMonth);
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

}

