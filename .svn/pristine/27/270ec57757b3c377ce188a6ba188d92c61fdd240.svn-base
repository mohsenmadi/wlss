package com.lss.payment

class CreditCard extends Payment {

	String nameOnCard
	String ccType
	String ccNo
	String expiryDate
	Integer saveInfo //1 -> SELECTED, 0->NOT SELECTED
	Integer authorize  //1 -> SELECTED, 0->NOT SELECTED
	Integer mm
	Integer yy

	static transients = ['ccNo', 'mm', 'yy']

	static constraints = {
		ccNo creditCard:true, bindable:true
		nameOnCard maxSize:50
		saveInfo nullable:true
	}
}
