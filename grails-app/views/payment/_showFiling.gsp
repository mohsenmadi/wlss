
<div class="row textLawpro">
	<div class="col-sm-12">
		<span class="badge">1</span> <span class="textLawpro"> Filing's Selection:</span>
	
		<div style="height:10px"></div>
		
		<table class="table table-bordered"  style="font-size:85%; width:50%">
			<thead>	<tr  >				
				<th class="text-center">Year-Quarter</th>				
				<th class="text-center" title="Civil Litigation">CL($${feeMap?.CL})</th>
				<th class="text-center" title="Real Estate">RE($${feeMap?.RE})</th>
				<th class="text-center" title="Real Estate prior 2009">RE($${feeMap?.REO})</th>
				<th class="text-center">Total</th>
				</tr>
			</thead>
			<tbody>			
				<g:set var="tot" value="${0.00}" />						
				<g:each var="ptrx" in="${payTrxs}"> 	
					<tr>							
						<td class="text-center">${ptrx.value.fy}-${ptrx.value.qtr}</td>
						<td class="text-center" >${ptrx.value.cl}</td>
						<td class="text-center" >${ptrx.value.re}</td>
						<td class="text-center" >${ptrx.value.reo}</td>
						<td id="tableCellStyle" ><g:formatNumber number="${ptrx.value.totAmt}" minFractionDigits="2" maxFractionDigits="2"/></td>																	
					</tr>	
					<% tot = tot.toDouble() + ptrx.value.totAmt.toDouble() %>		
					<br/>		
											
				</g:each>
				<tr class="border_bottom">
					<td colspan="4" class="text-right">Total:</td>
					<td id="tableCellStyle" style="padding-right: 7px;">
						<g:formatNumber class="payTotals" number="${tot}" minFractionDigits="2" maxFractionDigits="2"/>					
						
						
					</td>
					
				</tr>
				<tr >
					<td colspan="4" class="text-right">NSF Charges:</td>
					<td id="tableCellStyle" >
						<g:formatNumber class="payTotals"																 
									number="${charges}" readonly="true" disabled="true" 
									minFractionDigits="2" maxFractionDigits="2"/>
									
									
					</td>
				</tr>
			</tbody>
		</table>	
	</div>	<!--  col ends here -->	
</div> <!-- row ends here -->

