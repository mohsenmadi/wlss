package com.lss.service

import grails.plugins.rest.client.RestBuilder
import groovy.json.JsonBuilder
import groovy.json.JsonOutput
import org.springframework.http.MediaType

class WsReqService {

   String wsUrl
   def connectTimeout = 10000
   def readTimeout = 20000
   def envKeyVal = ['X-LSS-Env': 'dev']  //For Development= 'dev', TEST = 'test', UAT = 'uatest'

   def makeGetWsr(serviceUrl) {
      try {
//         def timeTaken = System.currentTimeMillis()
         log.info "making getWsr to $serviceUrl"
         def rest = new RestBuilder(connectTimeout: connectTimeout, readTimeout: readTimeout)
         def response = rest.get("$wsUrl/$serviceUrl") {
            header 'X-LSS-Env', envKeyVal['X-LSS-Env']
            accept "application/json"
         }
         log.info"  out of getWsr"
         response.json
      } catch (Exception e) {
         log.debug "== problem makeGetWsr on $serviceUrl"
         null
      }
   }

   def makePostWsr(serviceUrl, jsonBuilder) {
      try {
//         def timeTaken = System.currentTimeMillis()
         log.info "making postWsr to $serviceUrl"
         def rest = new RestBuilder(connectTimeout: connectTimeout, readTimeout: readTimeout)
         def response = rest.post("$wsUrl/$serviceUrl") {
            header 'X-LSS-Env', envKeyVal['X-LSS-Env']
            accept "application/json"
            contentType "application/json"
            json jsonBuilder
         }
         log.info"  out of postWsr"
         response.json
      } catch (Exception e) {
         log.debug "== problem makePostWsr on $serviceUrl"
         null
      }
   }

   // testing purposes only
   def testPostWsr() {
      try {
         def jsonBuilder = new JsonBuilder()
         jsonBuilder {
            sleepTime '15000'
         }
         def rest = new RestBuilder(connectTimeout: 10000, readTimeout: 10000)
         def response = rest.post("http://giza:8080/sbx-ds/sb/sbr/na") {
            header 'X-LSS-Env', envKeyVal['X-LSS-Env']
            accept "application/json"
            json jsonBuilder.toString()
         }
         response.text
      } catch (Exception e) {
         log.debug "== the problem in testPostWsr: ${e.toString()}"
         log.error "error! testPostWsr: ${e.toString()}"
      }
   }
}