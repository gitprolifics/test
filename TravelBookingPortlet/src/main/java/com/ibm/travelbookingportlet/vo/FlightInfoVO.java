package com.ibm.travelbookingportlet.vo;

import java.math.BigDecimal;

public class FlightInfoVO {
	private static final long serialVersionUID = 1L;
	
	private int flightid;
	private String arrivaldate;
	private String arrivaltime;
	private String boarding;
	private String departuredate;
	private String departuretime;
	private BigDecimal fare;
	private String flightname;
	private String destinationOne;
	private String destinationTwo;
	private String localTravel;
	
	public String getDestinationOne() {
		return destinationOne;
	}
	public void setDestinationOne(String destinationOne) {
		this.destinationOne = destinationOne;
	}
	public String getDestinationTwo() {
		return destinationTwo;
	}
	public void setDestinationTwo(String destinationTwo) {
		this.destinationTwo = destinationTwo;
	}
	/**
	 * @return the serialversionuid
	 */
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public int getFlightid() {
		return flightid;
	}
	public void setFlightid(int flightid) {
		this.flightid = flightid;
	}
	public String getArrivaldate() {
		return arrivaldate;
	}
	public void setArrivaldate(String arrivaldate) {
		this.arrivaldate = arrivaldate;
	}
	public String getArrivaltime() {
		return arrivaltime;
	}
	public void setArrivaltime(String arrivaltime) {
		this.arrivaltime = arrivaltime;
	}
	public String getBoarding() {
		return boarding;
	}
	public void setBoarding(String boarding) {
		this.boarding = boarding;
	}
	public String getDeparturedate() {
		return departuredate;
	}
	public void setDeparturedate(String departuredate) {
		this.departuredate = departuredate;
	}
	public String getDeparturetime() {
		return departuretime;
	}
	public void setDeparturetime(String departuretime) {
		this.departuretime = departuretime;
	}
	public BigDecimal getFare() {
		return fare;
	}
	public void setFare(BigDecimal fare) {
		this.fare = fare;
	}
	public String getFlightname() {
		return flightname;
	}
	public void setFlightname(String flightname) {
		this.flightname = flightname;
	}
	public String getLocalTravel() {
		return localTravel;
	}
	public void setLocalTravel(String localTravel) {
		this.localTravel = localTravel;
	}
	
	
}
