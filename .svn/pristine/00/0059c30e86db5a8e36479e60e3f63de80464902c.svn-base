import com.lss.enums.LssRole

// http://grails-plugins.github.io/grails-spring-security-core/guide/requestMappings.html
grails.plugin.springsecurity.useSecurityEventListener = true

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'com.lss.client.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'com.lss.client.UserRole'
grails.plugin.springsecurity.authority.className = 'com.lss.client.Role'
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	'/':                ['isAuthenticated()'],
	'/index':           ['isAuthenticated()'],
	'/index.gsp':       ['isAuthenticated()'],
	'/assets/**':       ['permitAll'],
	'/**/js/**':        ['permitAll'],
	'/**/css/**':       ['permitAll'],
	'/**/examples/**':  ['permitAll'],
	'/**/images/**':    ['permitAll'],
	'/**/SampleData/**':[LssRole.ROLE_ADMIN.toString()],
	'/**/docs/**':      ['isAuthenticated()'],
	'/**/fonts/**':     ['permitAll'],
	'/**/favicon.ico':  ['permitAll'],
	'/login/**':        ['permitAll'],
	'/logout/**':       ['permitAll'],
	'/appVals/**':      ['permitAll'],
	'/dispatch/**':     ['isAuthenticated()'],
	'/dbconsole/**':    [LssRole.ROLE_ADMIN.toString()],
	'/secure/**':       [LssRole.ROLE_ADMIN.toString()],
	'/payment/**':      ['isAuthenticated()'],
	'/filing/**':       [LssRole.ROLE_FIRM.toString(),
						 		LssRole.ROLE_LAWYER.toString(),
						 		LssRole.ROLE_FINANCE.toString(),
						 		LssRole.ROLE_CUSTSRV.toString()],
	'/lp/**':      	  [LssRole.ROLE_FINANCE.toString(),
								LssRole.ROLE_CUSTSRV.toString()]
	//	'/whereTo/**':         				 ['ROLE_ONE', 'ROLE_TWO', ...], this is for multiple roles
]

