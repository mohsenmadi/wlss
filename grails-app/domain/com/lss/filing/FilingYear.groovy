package com.lss.filing

import java.util.List

class FilingYear {

	String year
	List filings
	String exConfNum
	Date exConfDate
	
	static hasMany = [filings:Filing]

	static constraints = {
		year nullable:false, blank:false
		exConfNum nullable:true
		exConfDate nullable:true
	}
	
	String toString() {
		"$id: $year - $exConfNum @ $exConfDate"
	}
}
