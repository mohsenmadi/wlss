package com.lss.dispatch

import com.lss.filing.Filing
import grails.plugin.springsecurity.SpringSecurityUtils

import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.web.context.request.RequestContextHolder

import com.lss.enums.LssRole
import com.lss.service.PaymentService;

class DispatchController implements Serializable {

    def lssWsService
    def sessionIdUdser
    def sessionIdFiling
    def paymentService
    def commonService
    def liuService

    def wsReqService


    def index() {

        log.info "User ${liuService.username} in."

        def controller = 'login'
        def action = 'auth'
        def updateResponse

        if (SpringSecurityUtils.ifAllGranted(LssRole.ROLE_ADMIN.toString())) {
            controller = 'secure'
            action = 'index'

        } else if (SpringSecurityUtils.ifAllGranted(LssRole.ROLE_FINANCE.toString()) ||
                   SpringSecurityUtils.ifAllGranted(LssRole.ROLE_CUSTSRV.toString())) {
            liuService.resetForUsername()
            controller = 'lp'
            action = 'index'

        } else if (SpringSecurityUtils.ifAllGranted(LssRole.ROLE_FIRM.toString()) ||
                   SpringSecurityUtils.ifAllGranted(LssRole.ROLE_LAWYER.toString())) {

            updateResponse = updateUserAsNeeded()
            log.info "== updateResponse: $updateResponse"

            if (updateResponse.equals('accDisabled')) {
                denyService('Your account is disabled! Please contact LawPRO for more information.')
            } else if (updateResponse.equals('changeOfPw')) {
                denyService('Please login with your new account username/password credentials.')
            } else if (updateResponse.equals('noPw')) {
                denyService('Please contact LawPRO to reset your username/password credentials.')
            } else if (updateResponse.equals('changeOfFirm')) {
                denyService('Your account is updated with the new firm! Please relogin using the same credentials.')
            } else if (updateResponse.equals('serverCnxnBad')) {
                denyService('Sorry for the inconvenience, there are some network problems! Please try again later.')
            } else {

                def userType = liuService.isLawyerOnly() ? 'lawyer' : 'firm'
                log.info "==============================="
                log.info "=== $userType logging in: ${liuService.user.username} @ ${new Date()}"
                log.info "==============================="
                updateFilingsIfNeeded()
                controller = 'filing'
                action = 'summary'
            }

        } else { // get here if account has no role associated
            log.info "== user has no role!"
            denyService('Account identification problems encountered. Please contact LawPRO for more information.')
        }

        redirect controller: controller, action: action
    }

    def denyService(msg) {
        flash.message = msg
        SecurityContextHolder.clearContext()
    }

    def updateUserAsNeeded() {
        def tempSessionId = getSessionId()
        if (sessionIdUdser != tempSessionId && !commonService.runLocally) {
            sessionIdUdser = tempSessionId
            return liuService.isLawyerOnly() ? lssWsService.updateLawyer() : lssWsService.updateFirm()
        }
        'proceed'
    }

    def refreshFilingsAndExempts() {
        sessionIdFiling = null
        redirect action:'index'
    }

    def holdbackIfNeeded() {
        // in case lawyer whose firm is this one is logged in and doing firm-lawyer update, we wait
        def username = liuService.user.username
        def didWait = false
        Thread.start {
            while (lssWsService.setFirmCurrentlyUpdating.contains(username)) {
                sleep 1000
                didWait = true
            }
        }.join()
    }

    def hold

    def updateFilingsIfNeeded() {
        def tempSessionId = getSessionId()
        if (sessionIdFiling == tempSessionId || commonService.runLocally) {
            return 'proceed'
        }

        sessionIdFiling = tempSessionId

        holdbackIfNeeded()

        // after doing this, put login loading... in a loop to change text
        lssWsService.updateFilings()
        lssWsService.updateExemptionStatus()
        paymentService.updateOwing()
        lssWsService.updateFirmLawyersExempts()
        'proceed'
    }

    def getSessionId() {
        RequestContextHolder.getRequestAttributes()?.getSessionId()
    }

    def reloadDataForPage() {
        def targetUri = params.targetUri ?: "/"
        switch(targetUri) {
            case ~/.*filing\/(index|quarter).*/:
                lssWsService.updateFiling(Filing.get(params.id))
                paymentService.updateOwing()
                break;
            case ~/.*filing\/exemptions.*/:
                lssWsService.updateExemptionStatus(params.id)
                break;
            default:
                lssWsService.updateFilings()
                paymentService.updateOwing()
        }
        redirect(uri: targetUri)
    }

}