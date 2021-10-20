package com.kainos.ea.model;

public class BadNumber extends NumberFormatException{
    public BadNumber() {
    }

    public BadNumber(String s) {
        super(s);
    }
}
