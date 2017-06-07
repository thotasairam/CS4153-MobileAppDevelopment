package edu.okstate.cs.tsairam.mw08_thota_sairam;

import android.widget.Adapter;

public class CarsData {


    private String roadName;
    private long carNumber;
    private String location;
    private boolean cellTappped;


    public CarsData(String roadName, long carNumber, String location, boolean cellTappped) {
        this.roadName = roadName;
        this.carNumber = carNumber;
        this.location = location;
        this.cellTappped = cellTappped;
    }

    public boolean isCellTappped() {
        return cellTappped;
    }

    public void setCellTappped(boolean cellTappped) {
        this.cellTappped = cellTappped;
    }

    public String getRoadName() {
        return roadName;
    }

    public void setRoadName(String roadName) {
        this.roadName = roadName;
    }

    public long getCarNumber() {
        return carNumber;
    }

    public void setCarNumber(long carNumber) {
        this.carNumber = carNumber;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

}