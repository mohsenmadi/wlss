package com.lss.events

import org.springframework.context.ApplicationListener
import org.springframework.security.authentication.event.AuthenticationFailureBadCredentialsEvent

import grails.util.Holders

class SecurityCareTaker implements ApplicationListener<AuthenticationFailureBadCredentialsEvent> {

	boolean migrateSuccess = false
	String TYPE_FIRM = /A\d{6}/
	String TYPE_LAWYER = /A\d{6}\w{1}/

	@Override
	public void onApplicationEvent(AuthenticationFailureBadCredentialsEvent event) {
		migrateSuccess = registerUser(event.getAuthentication().getPrincipal())
	}

	def registerUser(userid) {

		def lssWsService = Holders.grailsApplication.mainContext.lssWsService

		if (userid == 'asdf0') {
			userid = lssWsService.registerFirmAndItsMembersDebug(userid)
			migrateSuccess = userid ? true : false
			return userid
		}

		userid = userid.toUpperCase()
		def userType = userid ==~ TYPE_FIRM ? TYPE_FIRM :
				userid ==~ TYPE_LAWYER ? TYPE_LAWYER : null

		if (!userType) {
			return null
		}

		if (userType == TYPE_FIRM) {
			userid = lssWsService.registerFirmAndItsMembers(userid)
		} else {
			userid = lssWsService.registerLawyer(userid)
		}
		migrateSuccess = userid ? true : false
		userid
	}
}

// TODO this is good, what if two access this at the same time? better implement as
// follows:
//   - create a set, add upon migrateSuccess, delete upon a liuService.firmJustAdded() call
//   - this way, a response is sure to match its caller
