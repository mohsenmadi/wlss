package com.lss.common

class Contact {

	String street
	String city
	String province
	String postCode
	String phone
	String fax
	String email

	static constraints = {
		street blank:true, nullable:true
		city blank:true, nullable:true
		province blank:true, nullable:true
		postCode blank:true, nullable:true
		phone blank:true, nullable:true
		fax blank:true, nullable:true
		email blank:true, nullable:true, email:true
	}

	String toString() {
		"$city, $province"
	}
}
