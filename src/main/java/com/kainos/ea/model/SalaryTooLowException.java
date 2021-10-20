package com.kainos.ea.model;

public class SalaryTooLowException extends IllegalArgumentException{

    public SalaryTooLowException(String s) {
        super(s);
    }
}
