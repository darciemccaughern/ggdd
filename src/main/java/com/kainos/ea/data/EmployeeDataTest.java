package com.kainos.ea.data;

import com.kainos.ea.model.Employee;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.junit.jupiter.MockitoExtension;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;



@ExtendWith(MockitoExtension.class)


class EmployeeDataTest {

/*
    @org.junit.jupiter.api.Test
    void setSalaryTooLow() throws SQLException {
        EmployeeData empdata = new EmployeeData();
        Employee employee = new Employee(1,15_000,"stuart","test","24 belfast road","belfast","antrim","Bt34 8KZ","1234567890123","Bhs645jgf",0);
        Connection connection = Mock(Connection.class);
        PreparedStatement ps;
        when(connection.prepareStatement(any(), Statement.RETURN_GENERATED_KEYS)).thenReturn(ps);

        empdata.insertEmployeeIntoDatabase(employee, connection);
        verify(connection.prepareStatement(any(),Statement.RETURN_GENERATED_KEYS),atLeastOnce());
    }
    
 */



}