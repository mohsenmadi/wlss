package com.lss.payment

class Eft extends Payment {

	String nameOnCard
	String instNo
	String transitNo
	String accNo
	Integer saveInfo //1 -> SELECTED, 0->NOT SELECTED
	Integer authorize //1 -> SELECTED, 0->NOT SELECTED
	
	static transients = ['accNo']

	static constraints = {
		accNo  bindable:true
		authorize nullable:true
	}
}
