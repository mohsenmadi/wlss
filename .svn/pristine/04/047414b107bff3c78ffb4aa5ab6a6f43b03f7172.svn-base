package com.lss.filing

import com.lss.payment.Payment

class Amendment {

	Integer cl
	Integer re
	Integer reo
	String confirmation
	Date dateCreated
	Payment payment
	
	static belongsTo = [filing:Filing]
	static hasMany = [memActivities:MemberActivity]
	
	static constraints = {
		cl nullable:true, min:0
		re nullable:true, min:0
		reo nullable:true, min:0
		dateCreated nullable:true
		confirmation nullable:true
		payment nullable:true
	}
	
	String toString() {
		"$id: conf: $confirmation, ($cl, $re, $reo), mas:${memActivities?.size()}"
	}
}
