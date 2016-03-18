package com.lss.filing

import com.lss.client.User
import com.lss.enums.ActivityOwner

class MemberActivity {

	boolean activeCl = false
	boolean activeRe = false
	ActivityOwner activityOwner
	
	static belongsTo = [amendment:Amendment, member:User]

	static constraints = {
		activityOwner nullable:false 
	}
	
	String toString() {
		"${member.username}, $activeCl, $activeRe"
	}
}
