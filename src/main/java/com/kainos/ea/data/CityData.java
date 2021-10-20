package com.kainos.ea.data;

import com.kainos.ea.model.City;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collection;

public class CityData {
    public Collection<City> selectAllCities(Connection connection){
        Collection<City> cities = new ArrayList<>();

        try {
            String query = "SELECT * FROM city LIMIT 100";
            PreparedStatement statement = connection.prepareStatement(query);

            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                City city = new City(
                        rs.getInt("ID"),
                        rs.getString("Name"),
                        rs.getString("CountryCode"),
                        rs.getString("District"),
                        rs.getInt("Population")
                );

                cities.add(city);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return cities;
    }

    public City selectCity(int cityId, Connection connection){
        City city = new City();
        try {
            String query = "SELECT * FROM city WHERE ID = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, cityId);

            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                city.setCityId(rs.getInt("ID"));
                city.setCityName(rs.getString("Name"));
                city.setCountryCode(rs.getString("CountryCode"));
                city.setDistrict(rs.getString("District"));
                city.setPopulation(rs.getInt("Population"));
                return city;
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return city;
    }
}
