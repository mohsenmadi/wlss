package com.lss.common

import java.util.Date

// TODO: create enum for codes where 0=info, 1=update, 2=error

class Notification {

	String message
	Date dateCreated
	String relatedTo
	Integer code = 0 
	boolean freshlyAdded = true

	static constraints = {
		dateCreated nullable:true
		relatedTo nullable:true
	}
	
	String toString() {
		message + " @" + dateCreated + ", fresh? $freshlyAdded, code=$code"
	}
}
