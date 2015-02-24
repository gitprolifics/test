/**
 * 
 */
package com.ibm.travelbookingportlet.vo;

/**
 * @author Kotireddy_Sareddy
 *
 */
public class TripInclusionsVO {

	private String itemName;
	
	private boolean isChecked;

	/**
	 * @return the itemName
	 */
	public String getItemName() {
		return itemName;
	}

	/**
	 * @param itemName the itemName to set
	 */
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	/**
	 * @return the isChecked
	 */
	public boolean isChecked() {
		return isChecked;
	}

	/**
	 * @param isChecked the isChecked to set
	 */
	public void setChecked(boolean isChecked) {
		this.isChecked = isChecked;
	} 
	
}
