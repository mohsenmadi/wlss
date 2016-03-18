package com.lss.filing

import com.lss.client.User

class Exempt {

	boolean exCl
	boolean exRe
	
	static belongsTo = [lawyer:User, filingYear:FilingYear]

	static constraints = {
	}
	
	String toString() {
		"${lawyer.username} @ ${filingYear.year}: $exCl, $exRe"
	}
}
