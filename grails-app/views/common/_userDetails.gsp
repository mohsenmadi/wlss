<g:set var="liuService" bean="liuService" />

<div id="userDetails">
	<g:if test="${!liuService.forUsername}">

		<div class="row">
			<div class="col-sm-12">
				<span style="font-size:14px">&#128338;</span> <g:formatDate date="${new Date()}" type="datetime" style="LONG" timeStyle="SHORT"/>
			</div>
		</div>

		<div style="height: 10px"></div>

		<div class="row">
			<div class="col-sm-12">
				<em>${liuService.firm.name}</em>

			</div>
		</div>

		<div class="row">
			<div class="col-sm-6">
				${liuService.user.firstName.equals('Firm') ? 'Welcome ' : liuService.user.title}
						${liuService.user.firstName}
				<g:if test="${liuService.hasFirmOrLawyerRole()}">
					 - ${liuService.user.username}
				</g:if>
			</div>


			<div class="col-sm-2 hidden-print">
				<g:form name="logoutForm" controller="logout">
					<g:submitButton id="signOut" name="signOut" value="sign out" />
				</g:form>
			</div>
		</div>
	</g:if>



	<g:else>
		<div class="row">
			<div class="col-sm-12">
				<em>${liuService.liUser.firstName}, you are currently acting as:</em>
			</div>
		</div>

		<div class="row">
			<div class="col-sm-7" style="padding:0 0 0 5px;">
				<g:link controller="lp" action="show" id="${liuService.user.username}">
					${liuService.user.firstName.equals('Firm') ? '' : liuService.user.firstName}
					${liuService.user.lastName} - ${liuService.user.username}
				</g:link>
			</div>
			<div class="col-sm-2" style="padding:0">
				<g:form name="logoutForm" controller="logout">
					<g:submitButton id="signOut" name="signOut" value="sign out" />
				</g:form>
			</div>
		</div>

	</g:else>
</div>
