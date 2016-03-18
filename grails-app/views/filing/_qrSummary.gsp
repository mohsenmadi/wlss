<g:set var="filingService" bean="filingService" />
<% filingService.setFilingMap(filing) %>

<g:set var="liuService" bean="liuService" />

<table id="qrSummaryTable" style="border: 0px; color: #2f6d8c">

	<tr>
		<td class="text-center" colspan="2"	style="font-size: 15px; font-weight: bold;">
			Filing Summary ${filingService.filingMap.year} - ${filingService.filingMap.qr}
			(${filingService.intervalMap[filingService.filingMap.qr]})
		</td>
	</tr>

	<g:set var="numAmnds" value="${filing.amendments.size() - 1}"/>
	<g:if test="${numAmnds > 0}">

		<g:if test="${liuService.liUserIsFinOrCustSrv()}">
			<tr>
				<td class="text-right" style="font-weight: bold;"># of Submissions:</td>
				<td>
					${numAmnds}
				</td>
			</tr>
		</g:if>

		<tr>
			<td class="text-right" style="font-weight: bold;">Last Transaction:</td>
			<td><g:formatDate format="MMM dd, yyyy @ hh:mm aa"
					date="${filingService.filingMap.dateCreated}" /></td>
		</tr>

		<tr>
			<td class="text-right" style="font-weight: bold;">Last Confirmation #:</td>
			<td>
				${filingService.filingMap.confirmation}
			</td>
		</tr>
	</g:if>

	<tr>
		<td title="Civil Litigation" class="text-right"
			style="font-weight: bold;">Civil Litigation:</td>
		<td>
			$<g:formatNumber
				number="${filingService.filingMap.costCl}" minFractionDigits="2"
				maxFractionDigits="2" /> 
		</td>
	</tr>

	<tr>
		<td title="Real Estate" class="text-right" style="font-weight: bold;">Real
			Estate:</td>
		<td>
			$<g:formatNumber
				number="${filingService.filingMap.costRe}" minFractionDigits="2"
				maxFractionDigits="2" /> 
		</td>
	</tr>

	<tr>
		<td title="Real Estate" class="text-right" style="font-weight: bold;">Real
			Estate<sub>&#8804; 2009</sub>:
		</td>
		<td>
			$<g:formatNumber
				number="${filingService.filingMap.costReo}" minFractionDigits="2"
				maxFractionDigits="2" /> 
		</td>
	</tr>

	<tr>
		<td class="text-right" style="font-weight: bold;">Total Amount:</td>
		<td>$<g:formatNumber number="${filingService.filingMap.totCost}"
				minFractionDigits="2" maxFractionDigits="2" />
		</td>
	</tr>

	<tr>
		<td class="text-right" style="font-weight: bold;">Due:</td>
		<td>
			<div id="${filingService.filingMap.due > 0 ? 'overDue' : 
						  filingService.filingMap.due < 0 ? 'underDue' : 'noDues'}">
				$<g:formatNumber number="${filingService.filingMap.due}"
					minFractionDigits="2" maxFractionDigits="2" />
			</div>
		</td>
	</tr>

	<g:if test="${filingService.filingMap.due > 0}">
		<tr>
			<td></td>
			<td>
				<g:render template="/common/payButton" model="[label:'pay now']" />
			</td>
		</tr>
	</g:if>

</table>