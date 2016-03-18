package com.lss.payment

import com.lss.filing.Amendment

class Payment {

	String payId
	String referKey  //member or firm key
	Float amt
	Date dateCreated
	String reasonCode
	String reasonDesc
	Integer payStatus  // 0 -> SUBMITTED/IN-PROCESS, 1 -> CONFIRMED/ACCEPTED/PAID, 2 -> REJECTED/DECLINED/FAILED TO UPDATE LSS TRANS(Desk_WS)

	static hasMany = [amendments:Amendment]

	static constraints = {
		referKey nullable:false
		payId nullable:false
		payStatus nullable:true
		reasonCode nullable:true
		reasonDesc nullable:true
	}
}
