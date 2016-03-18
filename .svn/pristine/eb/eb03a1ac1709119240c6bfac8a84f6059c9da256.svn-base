<g:set var="filingService" bean="filingService" />
<% filingService.setFilingMap(filing) %>

<table id="${createAmendment ? 'amendmentTableOpen' : 'amendmentTable'}">

	<tr style="border-top:1px solid gray; border-bottom:1px solid gray;">
		<td colspan="6">
		
			<span class="glyphicon glyphicon-time" aria-hidden="true"></span>
			
			<g:if test="${createAmendment}">
				<g:formatDate format="MMM dd, yyyy" date="${new Date()}" />
			</g:if>
			<g:else>
				<g:formatDate format="MMM dd, yyyy @ hh:mm aa" date="${filingService.filingMap.dateCreated}" />
			</g:else>
			
		</td>
	</tr>


	<input type="hidden" id="clOld" value=""/>
	<input type="hidden" id="reOld" value=""/>
	<input type="hidden" id="reoOld" value=""/>


	<tr>
		<td id="tableCellStyle">Civil Litigation</td>
		<td id="tableCellStyle">$${filingService.feeMap.CL}</td>
		<td id="tableCellStyle">&#65368;</td>
		<g:if test="${createAmendment}">
			<td class="text-right">
				<g:field title="Allowed numbers are 0 to 9999" class="spinnerWidth" id="cl" name="cl" type="number" min="0" max="9999"
						onchange="calcDollars('#cl', '#re', '#reo', '#clDollars', '${filingService.feeMap.CL}', '${filingService.feeMap.RE}', '${filingService.feeMap.REO}')"
						onkeyup="calcDollars('#cl', '#re', '#reo', '#clDollars', '${filingService.feeMap.CL}', '${filingService.feeMap.RE}', '${filingService.feeMap.REO}')"
						value="${amendment?.cl}" />
			</td>
		</g:if>
		<g:else>
			<td id="tableCellStyle">${amendment?.cl}</td>
		</g:else>
		<td id="tableCellStyle">=</td>
		<td id="tableCellStyle"><input type="text" class="inputReadOnly totalFieldWidth" value="$${filingService.filingMap.costCl}" id="clDollars" readonly/></td>
	</tr>



	<tr>
		<td id="tableCellStyle">Real Estate</td>
		<td id="tableCellStyle">$${filingService.feeMap.RE}</td>
		<td id="tableCellStyle">&#65368;</td>
		<g:if test="${createAmendment}">
			<td class="text-right">
				<g:field title="Allowed numbers are 0 to 9999" class="spinnerWidth" id="re" name="re" type="number" min="0" max="9999"
						onchange="calcDollars('#re', '#reo', '#cl', '#reDollars', '${filingService.feeMap.RE}', '${filingService.feeMap.REO}', '${filingService.feeMap.CL}')"
						onkeyup="calcDollars('#re', '#reo', '#cl', '#reDollars', '${filingService.feeMap.RE}', '${filingService.feeMap.REO}', '${filingService.feeMap.CL}')"
						value="${amendment?.re}" />
		   </td>
		</g:if>
		<g:else>
			<td id="tableCellStyle">${amendment?.re}</td>
		</g:else>
		<td id="tableCellStyle">=</td>
		<td id="tableCellStyle"><input type="text" class="inputReadOnly totalFieldWidth" value="$${filingService.filingMap.costRe}" id="reDollars" readonly/></td>
	</tr>
	
	
	
	<tr style="border-bottom:1px solid gray;">
		<td id="tableCellStyle">Real Estate<sub>&#8804; 2009</sub></td>
		<td id="tableCellStyle">$${filingService.feeMap.REO}</td>
		<td id="tableCellStyle">&#65368;</td>
		<g:if test="${createAmendment}">
			<td class="text-right">
				<g:field title="Allowed numbers are 0 to 9999"  class="spinnerWidth" id="reo" name="reo" type="number" min="0"  max="9999"
						onchange="calcDollars('#reo', '#cl', '#re', '#reoDollars', '${filingService.feeMap.REO}', '${filingService.feeMap.CL}', '${filingService.feeMap.RE}')"
						onkeyup="calcDollars('#reo', '#cl', '#re', '#reoDollars', '${filingService.feeMap.REO}', '${filingService.feeMap.CL}', '${filingService.feeMap.RE}')"
						value="${amendment?.reo}" />
		   </td>
		</g:if>
		<g:else>
			<td id="tableCellStyle">${amendment?.reo}</td>
		</g:else>
		<td id="tableCellStyle">=</td>
		<td id="tableCellStyle"><input type="text" class="inputReadOnly totalFieldWidth" value="$${filingService.filingMap.costReo}" id="reoDollars" readonly/></td>
	</tr>
	
	
	
	<tr style ="border-bottom:1px solid gray;">
		<td id="tableCellStyle">Total</td>
		<td></td>
		<td></td>
		<g:if test="${createAmendment}">
			<td id="tableCellStyle"><input type="text" class="inputReadOnly" style="text-align: left;" value="${filingService.filingMap.totTypes}" id="totTypes" readonly/></td>
		</g:if>
		<g:else>
			<td id="tableCellStyle">${filingService.filingMap.totTypes}</td>
		</g:else>
		<td id="tableCellStyle">=</td>
		<td id="tableCellStyle"><input type="text" class="inputReadOnly totalFieldWidth" value="$${filingService.filingMap.totCost}" id="totCost" readonly/></td>
	</tr>

</table>
