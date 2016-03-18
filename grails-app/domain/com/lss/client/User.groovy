package com.lss.client

import com.lss.common.Contact
import com.lss.common.Notification
import com.lss.filing.Exempt
import com.lss.filing.FilingYear
import com.lss.filing.MemberActivity
import com.lss.payment.PayCharge

class User implements Serializable {

	private static final long serialVersionUID = 1

	transient springSecurityService

	String username
	String password
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	boolean lawyerRole = true

	String firstName
	String lastName
	String title
	Contact contact
	
	static belongsTo = [firm:Firm]

	List notifications
	List filingYears 
	List exempts
	List payCharges

	static hasMany = [
		exempts:Exempt,
		filingYears:FilingYear, 
		memActivities:MemberActivity, 
		notifications:Notification,
		payCharges:PayCharge]

	String forUsername
	boolean freshlyAdded

	static transients = ['springSecurityService', 'freshlyAdded']

	static constraints = {
		username blank: false, unique: true
		forUsername blank: true, nullable:true
		password blank: false
		title blank: true, nullable:true
		firstName blank:false
		lastName blank:false
	  	contact nullable:true
	}

	def getDisplayUsernameProps(yearIdx) {
		boolean hasLeft = false
		def uExempts = exempts
		if (username.size() > 8) {
			hasLeft = true
			uExempts = User.findByUsername(username[0..7]).exempts
		}
		boolean isExemptCl = !uExempts[yearIdx].exCl ? false : true
		boolean isExemptRe = !uExempts[yearIdx].exRe ? false : true
		[username[0..7], hasLeft, isExemptCl, isExemptRe]
	}

	@Override
	int hashCode() {
		username?.hashCode() ?: 0
	}

	@Override
	boolean equals(other) {
		is(other) || (other instanceof User && other.username == username)
	}

	@Override
	String toString() {
		username
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this)*.role
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}

	static mapping = {
		password column: '`password`'
	}
}