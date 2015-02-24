/**
 * 
 */
package com.ibm.travelbookingportlet.cons;

/**
 * @author Kotireddy_Sareddy
 *
 */
public enum InclusionItems {
	
	BREAKFAST("Breakfast"),
	LUNCH("Lunch"),
	DINNER("Dinner"),
	LOCALTRAVEL("Localtravel"),
	INSURANCE("Insurance"),
	ZYM("Visa"),
	WIRELESS("Wireless");

	private String itemName;
	
	/**
	 * @param itemName the itemName to set
	 */
	private InclusionItems(String itemName) {
		this.itemName = itemName;
	}

	/**
	 * @return the itemName
	 */
	public String getItemName() {
		return itemName;
	}

	
}
