package com.kainos.ea.service;

import com.kainos.ea.data.CityData;
import com.kainos.ea.model.City;
import com.kainos.ea.util.DatabaseConnector;

import java.sql.Connection;
import java.util.Collection;

public class CityService {

    public static DatabaseConnector databaseConnector = new DatabaseConnector();
    public static CityData cityData = new CityData();

    public Collection<City> selectAllCities(){
        Connection connection = databaseConnector.getConnection();
        Collection<City> cities = cityData.selectAllCities(connection);
        return cities;
    }

    public City selectCity(int cityId){
        Connection connection = databaseConnector.getConnection();
        return cityData.selectCity(cityId, connection);
    }
}
