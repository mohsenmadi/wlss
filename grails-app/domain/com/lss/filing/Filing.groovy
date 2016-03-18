package com.lss.filing

class Filing {

	String quarter
	BigDecimal paid = 0 // TODO YB to removed this object
	BigDecimal owingCl = 0
	BigDecimal owingRe = 0
	
	String lastTrxId
	boolean firmFiledCl	// needed for lawyer only
	boolean firmFiledRe	// needed for lawyer only
	List amendments

	static belongsTo = [filingYear:FilingYear]	
	static hasMany = [amendments:Amendment]

	static constraints = {
		quarter blank:false
		paid nullable:false
		owingCl nullable:false
		owingRe nullable:false
		lastTrxId nullable:false
	}

	String toString() {
		"${id}: ${filingYear.year}-$quarter, ${amendments.size() - 1} amnds"
	}
}
