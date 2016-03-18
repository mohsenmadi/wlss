package com.lss.service

import grails.transaction.Transactional

@Transactional
class CommonService {
	
	def grailsApplication
	def wsHeader
	def liuService

	def getWsHeader() {
		wsHeader = wsHeader ?: ["X-LSS-Env":"${grailsApplication.metadata.'app.ws.env'}"]
	}
	
	def getYearIdx(year) {
		(year as int) == Calendar.instance[Calendar.YEAR] ? -1 : -2
	}

	def getRunLocally() {
		false
	}

	def getComment(theComment) {
		if (!theComment && liuService.liUserIsFin()) {
			theComment = "No comment added"
		}
		theComment
	}
}