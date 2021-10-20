package com.kainos.ea.model;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

public class City {
    private int cityId;
    private String cityName;
    private String countryCode;
    private String district;
    private int population;

    @JsonCreator
    public City(@JsonProperty("cityId") int cityId,
                @JsonProperty("cityName") String cityName,
                @JsonProperty("countryCode") String countryCode,
                @JsonProperty("district")  String district,
                @JsonProperty("population")  int population) {
        this.cityId = cityId;
        this.cityName = cityName;
        this.countryCode = countryCode;
        this.district = district;
        this.population = population;
    }

    public City(){}

    public int getCityId() {
        return cityId;
    }

    public void setCityId(int cityId) {
        this.cityId = cityId;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public String getCountryCode() {
        return countryCode;
    }

    public void setCountryCode(String countryCode) {
        this.countryCode = countryCode;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public int getPopulation() {
        return population;
    }

    public void setPopulation(int population) {
        this.population = population;
    }
}
