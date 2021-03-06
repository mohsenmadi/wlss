<div class="panel panel-default qrTable ${filingService.filingMap.enabled ?: 'opacityHalf'}">

	<div class="panel-heading">
		<div class="row" style="padding: 0 0 0 6px; color:#2f6d8c; font-size: 12px;">

			<div class="col-sm-2">
				<div class="row" style="padding: 4px 0 0 1px;">
					<g:form id="${filingService.filingMap.id}" controller="filing">
						<g:actionSubmit 
							title="go to detailed quarter page" 
							id="qrBtn" action="quarter" disabled="${!filingService.filingMap.enabled}"
							value="${filingService.filingMap.qr}" />
					</g:form>
				</div>
			</div>
			
			<div class="col-sm-10" style="padding: ${filingService.filingMap.enabled ? '0' : '10px'} 0 0 20px;">
				<g:if test="${filingService.filingMap.enabled}">
					<div class="row">
						<span style="font-weight:bold;">CL:</span>
						<span id="${filingService.filingMap.clStatus == "Not Filed"? 'notFiledText' :''}">${filingService.filingMap.clStatus}</span>
					</div>

					<div class="row">
						<span style="font-weight:bold;">RE:</span>
						<span id="${filingService.filingMap.reStatus == "Not Filed"? 'notFiledText' :''}">${filingService.filingMap.reStatus}</span>
					</div>
				</g:if>
				<g:else>
					<div class="row" style="padding-bottom:6px;"><span style="font-style:italic;">${filingService.filingMap.clStatus}</span></div>
				</g:else>
			</div>

		</div>
	</div>

	<table class="table">
		<thead>
			<th class="text-center">Type</th>
			<th class="text-right">#</th>
			<th class="text-right">Amount</th>
		</thead>

		<tbody>
			<tr>
				<td class="text-center"><div title="Civil Litigation related">CL</div></td>
				<td class="text-right">
					${filingService.filingMap.currCl}
				</td>
				<td class="text-right"><g:formatNumber number="${filingService.filingMap.costCl}"
						minFractionDigits="2" maxFractionDigits="2" /></td>
			</tr>

			<tr>
				<td class="text-center"><div title="Real Estate related">RE</div></td>
				<td class="text-right">
					${filingService.filingMap.currReFamily}
				</td>
				<td class="text-right"><g:formatNumber number="${filingService.filingMap.currReFamilyCost}"
						minFractionDigits="2" maxFractionDigits="2" /></td>
			</tr>

			<tr id="rowDue">
				<td class="text-center">Due</td>
				<td class="text-right"></td>
				<td class="text-right">
					<div
						id="${filingService.filingMap.due > 0 ? 'overDue' : 
								filingService.filingMap.due < 0 ? 'underDue' : 'noDues'}">
						<g:formatNumber number="${filingService.filingMap.due}" minFractionDigits="2"
							maxFractionDigits="2" />
					</div>
				</td>
			</tr>

		</tbody>
	</table>
</div>