<div class="row">

	<div class="col-sm-5">
		<g:if test="${forUsername}">
			<g:if test="${isFirm}">
				<g:link action="show" id="${forUsername.username}">
					<b> ${forUsername.firm.name} - ${forUsername.firm.referKey}
					</b>
				</g:link>
			</g:if>
			<g:else>
				<g:link action="show" id="${forUsername.username}">
					<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
					<b> ${forUsername.firstName} ${forUsername.lastName} - ${forUsername.username}
					</b>
				</g:link>
				<br>
				<g:link action="show" id="${forUsername.firm.referKey}">
					<b> ${forUsername.firm.name} - ${forUsername.firm.referKey}
					</b>
				</g:link>
			</g:else>

			<br>
			${forUsername.firm.contact.street}
			<br>
			${forUsername.firm.contact.city},
	      ${forUsername.firm.contact.province}
			${forUsername.firm.contact.postCode}
			<br>
			<span class="glyphicon glyphicon-phone" aria-hidden="true"></span>
			${forUsername.firm.contact.phone}
			<br>
			<span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
			${forUsername.firm.contact.fax}
			<br>
			<!-- <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span> -->
			<a href="mailto:${forUsername.firm.contact.email}"> ${forUsername.firm.contact.email}
			</a>

		</g:if>
		<g:else>
			<g:javascript>
				addFadeOutMsg("#divFindReferKeyMsg", "${msg2user}");
			</g:javascript>
		</g:else>
	</div>

	<g:if test="${forUsername}">
		<div class="col-sm-6" id="divBorderFirmNums">
			<g:render template="numbersSummary" />
		</div>
	</g:if>
</div>

<br>
<g:if test="${lawyers}">

	<g:set var="rowSize" value="${lawyers.size() - 1}" />
	
	<b style="color: green;">Firm 
		<g:link action="index" id="${forUsername.firm.referKey}">
			${forUsername.firm.referKey}
		</g:link>
		has ${rowSize + 1} members:</b>

	<div class="panel panel-default" style="${rowSize > 6 ? 'height: 207px; overflow:auto;' : ''}; font-size:12px;">

		<table class="table">
			<thead>
				<th></th>
				<th>Key</th>
				<th>Name</th>
				<th>Qtrs</th>
			</thead>

			<g:each status="i" var="lawyer" in="${lawyers}">
				<tr>
					<td>
						${i+1}
					</td>
					<td>
						<g:link action="index" id="${lawyer.key[0..7]}">
							${lawyer.value.username}
						</g:link>
					</td>
					<td>
						${lawyer.value.firstName} ${lawyer.value.lastName}
					</td>
					<td>
						<% qtrs = [] as Set %> <g:each var="ma" in="${lawyer.value.memActivities}">
							<% if (ma.activeCl || ma.activeRe) { 
								def qtr = "${ma.amendment.filing.filingYear.year}-" + "${ma.amendment.filing.quarter}"
								qtrs.add(qtr) 
							} 
						%>
						</g:each> ${qtrs.size() ? (qtrs as List).sort() : ''}
					</td>
				</tr>
			</g:each>

		</table>
	</div>
	

	<g:each status="i" var="lawyer" in="${lawyers}">
		<g:link title="${lawyer.value.firstName} ${lawyer.value.lastName}" id="${lawyer.key[0..7]}" action="index" style="font-size:12px;">
			${lawyer.key}
		</g:link>
		${i < rowSize ? '-' : ''}
	</g:each>
</g:if>
<g:elseif test="${forUsername}">
	<b style="color: green;">Please wait a few seconds and re-click the "find" button again to refresh, repeatedly...</b>
</g:elseif>