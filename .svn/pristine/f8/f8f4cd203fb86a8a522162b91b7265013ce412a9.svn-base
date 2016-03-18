package com.lss.service

import javax.annotation.PostConstruct;

import com.google.gson.JsonArray;
import com.lss.client.Firm
import com.lss.client.Role;
import com.lss.client.User
import com.lss.client.UserRole
import com.lss.common.Contact
import com.lss.common.Notification
import com.lss.enums.ActivityOwner;
import com.lss.enums.LssRole;
import com.lss.filing.Amendment
import com.lss.filing.Exempt
import com.lss.filing.Filing
import com.lss.filing.FilingYear
import com.lss.filing.MemberActivity

import grails.transaction.Transactional
import groovy.json.JsonBuilder
import groovy.json.JsonOutput
import groovy.json.JsonSlurper

@Transactional
class DomainCreateService {

	def grailsApplication
	def liuService

	def migrateFirmAndMem() {
		migrateAll("sampleData/firms.json", "sampleData/lawyers.json")
	}

	def migrateFirmAndMemUat() {
		migrateAll("sampleData/firmsUat.json", "sampleData/lawyersUat.json")
	}

	def migrateFirms() {
		def firms = "sampleData/firms.json"
		firms = grailsApplication.mainContext.getResource(file).file
		firms = new JsonSlurper().parse(firms)
		log.info "== $firms"
	}

	def migrateAll(firmsFile, lawyersFile) {

		log.info " "
		File fileFirms = grailsApplication.mainContext.getResource(firmsFile).file
		def jsonFirms = new JsonSlurper().parse(fileFirms)
		def firms = registerFirms(jsonFirms)

		log.info " "
		File fileMems = grailsApplication.mainContext.getResource(lawyersFile).file
		def jsonMems = new JsonSlurper().parse(fileMems)
		registerFirmsMembers(jsonMems)

		log.info " "
		createMemberActivities(firms)
	}

	def createMemberActivities(firms) {

		firms.each {
			def firm = Firm.findByReferKey(it.referKey)

			def users = User.findAllByFirm(firm).grep {
				it.getAuthorities().authority.contains(LssRole.ROLE_LAWYER.toString())
			}

			firm.filingYears.each {

				def filings = Filing.findAllByFilingYear(it)

				filings.each { filing ->
					def amnd = Amendment.findAllByFiling(filing)[0]

					users.each() {
						createNewMemActivity(amnd, it, ActivityOwner.FIRM)
					}
				}
			}
		}
	}

	def registerFirmMembers(json, firm) {

		def counter = 1
		def lawyer

		json.lawyersAdded.each {

			lawyer = User.findByUsername(it.referKey)

			if (!lawyer) {

				lawyer = registerLawyer(it, firm)

				log.info " + lawyer $counter: $lawyer"
				counter++
			}
		}
	}

	def registerLawyer(json, firm) {
		def lawyer = User.findByUsername(json.referKey)
		if (!lawyer) {
			lawyer = createLawyerFysAmnds(buildUser(json, firm))
		}
		lawyer
	}

	def createMemActivities(lawyersAdded, amnd) {
		lawyersAdded.each {
			def lawyer = User.findByUsername(it)
			if (lawyer) {
				createNewMemActivity(amnd, lawyer, ActivityOwner.FIRM)
			}
		}
	}

	def buildUser(json, firm) {

		// TODO lawyers have to have all contact date populated in lawyers.json
		def contact = new Contact().save(failOnError:true)

		new User(
				username:json.referKey,
				title:json.title,
				firstName:json.fname,
				lastName:json.lname,
				password:json?.password ?: 'NEW CALL',
				contact:contact,
				enabled:true,
				firm:firm
				)
	}

	def createLawyer(lawyer) {
		lawyer.lawyerRole = true
		lawyer.save(failOnError: true)
		UserRole.create lawyer, liuService.roleLawyer
		lawyer
	}

	def createLawyerFysAmnds(user) {
		def lawyer = createLawyer(user)
		addFysAndAmnds(lawyer)
		lawyer
	}

	def registerFirms(jsonFirms) {

		log.info "== firms? " + jsonFirms.firms.firms.size()

		def firms = []
		def counter = 1

		jsonFirms.firms.firms.each() { firm ->
			def ggFirm = registerFirm(firm)
			if (ggFirm) {
				firms.add(ggFirm)
				counter++
				print "   creating firm $counter : ${firm.referKey} - ${firm.name}"
			}
		}

		return firms
	}

	def registerFirm(firm) {
		def ggFirm = Firm.findByReferKey(firm.referKey)
		if (ggFirm) {
			return null
		}

		def contact = new Contact(
			street: firm.street,
			city: firm.city,
			province: firm.province,
			postCode: firm.postCode,
			phone: firm.phone,
			fax: firm.fax,
			email:firm.email
			).save(failOnError:true)

		ggFirm = new Firm(
				referKey: firm.referKey,
				name: firm.name,
				contact:contact
				).save(failOnError:true)

		def admin = new User(
				username:ggFirm.referKey,
				firstName:'Firm',
				lastName:ggFirm.name,
				password:firm?.password ?: 'NEW CALL',
				lawyerRole: false,
				enabled:firm.enabled,
				firm:ggFirm
				).save(failOnError:true)
		UserRole.create admin, liuService.roleFirm

		addFysAndAmnds(ggFirm)

		ggFirm
	}

	// owner is a firm or a lawyer
	def addFysAndAmnds(owner) {
		def dateFilingYear = Calendar.instance[Calendar.YEAR] - 1
		addFyAndAmnds(owner, dateFilingYear)
		addFyAndAmnds(owner, ++dateFilingYear)
		addNotification(owner,
			"""Welcome to LawPRO's LSS Services! This is a welcome message.
            Be sure to visit www.lss.ca/tour for a quick tour of the system.
         """,
			'Welcome Message', 0)
	}

	def addFyAndAmnds(owner, dateFilingYear) {
		def fy = new FilingYear(year:dateFilingYear).save(failOnError:true)
		owner.addToFilingYears(fy)

		1.upto(4) {
			def filing = new Filing(
					quarter:'Q' + it,
					lastTrxId: '-1',
					filingYear:fy
					).save(failOnError:true)

			def amnd = new Amendment(
					filing:filing
					).save(failOnError:true)

			if (owner in User) {
				createNewMemActivity(amnd, owner, ActivityOwner.LAWYER)
			}
		}

		if (owner in User) {
			new Exempt(exCl:false, exRe:false, lawyer:owner, filingYear:fy)
		}
	}

	def createNewMemActivity(amnd, member, activityOwner) {
		new MemberActivity(
				activityOwner:activityOwner,
				amendment:amnd,
				member:member
				).save()
	}

	def addNotification(msg, relatedTo, code) {
		addNotification(liuService.owner, msg, relatedTo, code)
	}

	def addNotification(owner, msg, relatedTo, code) {
		def ntf = new Notification(message:msg, relatedTo:relatedTo, code:code).save()
		owner.addToNotifications(ntf)
	}
}