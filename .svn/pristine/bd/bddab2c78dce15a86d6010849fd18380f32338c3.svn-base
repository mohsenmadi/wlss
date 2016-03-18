<div class="panel panel-default">

	<table class="table qrTable ${filingService.filingMap.enabled ?: 'opacityHalf'} ">
		<thead>
			<th>
				<g:form style="padding-bottom: 2px;" id="${filingService.filingMap.id}" controller="filing">
					<g:actionSubmit 
						title="go to filing page" 
						id="qrBtn" action="quarter" disabled="${!filingService.filingMap.enabled}"
						value="${filingService.filingMap.qr}" />
				</g:form>
			</th>
			<g:if test="${filingService.filingMap.enabled}">
				<th class="text-left"><div title="Civil Litigation related"> CL</div></th>
				<th class="text-left"><div title="Real Estate related"> RE</div></th>
			</g:if>
			<g:else>
				<th colspan="2" class="text-left"><div class="row" style="padding:0 0 2px 4px;"><span style="font-style:italic;">${filingService.filingMap.clStatus}</span></div></th>
			</g:else>
		</thead>

		<tbody>
		
			<tr style="background-color:#fff; border-bottom: 3px solid #ccc;border-top: 3px solid #ccc;">
				<td id="tableLabel"><div title="included in firm filing?">Firm</div></td>
				<td>${filingService.filingMap.enabled ? filingService.filingMap.clStatus : ''}</td>
				<td>${filingService.filingMap.enabled ? filingService.filingMap.reStatus : ''}</td>
				<!-- 
				<td><em>${filingService.filingMap.enabled ? 'TBI' : ''}</em></td>
				<td><em>${filingService.filingMap.enabled ? 'TBI' : ''}</em></td>
				 -->
			</tr>
			
			<tr style="background-color:#fff; border-bottom: 1px solid #ccc;">
				<td id="tableLabel"><div title="individual filing status">Self</div></td>
				<td>${filingService.filingMap.enabled ? filingService.filingMap.mclStatus : ''}</td>
				<td>${filingService.filingMap.enabled ? filingService.filingMap.mreStatus : ''}</td>
				<!-- 
				<td><em>${filingService.filingMap.enabled ? 'TBI' : ''}</em></td>
				<td><em>${filingService.filingMap.enabled ? 'TBI' : ''}</em></td>
				 -->
			</tr>
			
			<tr>
				<td id="tableLabel">
					Qty
				</td>
				
				<g:if test="${filingService.filingMap.enabled}">
					<td class="text-left"">
						${filingService.filingMap.currCl}
					</td>
					<td class="text-left"">
						${filingService.filingMap.currReFamily}
					</td>
				</g:if>

			</tr>
			
			<tr>
				<td id="tableLabel">Total</td>
				<td class="text-left">
					<g:formatNumber number="${filingService.filingMap.costCl}" minFractionDigits="2" maxFractionDigits="2" />
				</td>
				<td class="text-left">
					<g:formatNumber number="${filingService.filingMap.currReFamilyCost}" minFractionDigits="2" maxFractionDigits="2" />
				</td>
			</tr>
			
			<tr>
				<td id="tableLabel">Due</td>
				<td class="text-left" colspan="2">
					<div id="${filingService.filingMap.due > 0 ? 'overDue' : 
								  filingService.filingMap.due < 0 ? 'underDue' : 'noDues'}">
						$<g:formatNumber number="${filingService.filingMap.due}" minFractionDigits="2"
							maxFractionDigits="2" />
					</div>
				</td>
			</tr>

		</tbody>
	</table>

</div>