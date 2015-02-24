/**
 * 
 */
package com.ibm.travelbookingportlet.cons;

/**
 * @author Kotireddy_Sareddy
 *
 */
public enum HotelRatingImage {

   ONE(1,"onestar"),
   TWO(2,"twostar"),
   THREE(3,"threestar"),
   FOUR(4,"fourstar"),
   FIVE(5,"fivestar");
   
	private int rating;
	private String ratedname;
	
	
	 HotelRatingImage(int rating, String ratedname) {
		this.rating = rating;
		this.ratedname = ratedname;
	}

	/**
	 * @return the rating
	 */
	public int getRating() {
		return rating;
	}
	
	/**
	 * @return the ratedname
	 */
	public String getRatedname() {
		return ratedname;
	}	
}
