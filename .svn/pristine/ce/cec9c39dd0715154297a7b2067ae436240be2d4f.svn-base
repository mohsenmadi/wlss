package com.lss.client

import java.util.List

import com.lss.common.Contact
import com.lss.common.Notification
import com.lss.filing.FilingYear
import com.lss.payment.PayCharge

class Firm {

	String referKey
	String name
	Contact contact
	
	List notifications
	List payCharges
	List filingYears
	
	static hasMany = [
		filingYears:FilingYear, 
		users:User, 
		notifications:Notification, 
		payCharges:PayCharge]

	static constraints = {
		referKey blank:false
		name blank:false
		contact nullable:true
	}
	
	String toString() {
		return "$referKey - $name"
	}
}
