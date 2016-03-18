
<div class="row textLawpro">
	<div class="col-sm-12">
		<span class="badge">1</span> <span class="textLawpro"> Filing's Selection:</span><br>
		<span style="padding-left:25px;font-size:12.5px">
				Select filings that qualify for payment of the Civil Litigation and Reas Estate levy surcharge
		</span>
		<div style="height:10px"></div>
		
		<table  class ="table table-bordered" style="font-size:85%; width:65%">
			<thead>	<tr  style="border-top:1px solid gray; border-bottom:1px solid gray;">
				<th class="text-center"></th>
				<th class="text-center">Year-Quarter</th>
				<!--   <th class="text-center">Key</th>-->
				<th class="text-center" title="Civil Litigation">CL($${feeMap?.CL})</th>
				<th class="text-center" title="Real Estate">RE($${feeMap?.RE})</th>
				<th class="text-center" title="Real Estate prior 2009">RE($${feeMap?.REO})</th>
				<th class="text-center">Total</th>				
				<th class="text-center">Outstanding</th>
				</tr>
			</thead>
			<tbody>			
												
				<g:each in="${paytrxs}" var="ptrx">													 	
					<tr>
							<td id="tableCellStyle">
							<g:checkBox id="fKey" name="fKey" value="${ptrx.key}~${ptrx.value.due}" checked="false" onChange="calcTotal()"/>
						
							</td>
						<td >
						<g:link action="renderFilingQtr" id="${ptrx.value.filingId}">${ptrx.value.fy}-${ptrx.value.qtr}</g:link></td>
						<!-- <td id="tableCellStyle"> WN-${ptrx.key} </td>  -->
						<td id="tableCellStyle" >${ptrx.value.cl}</td>
						<td id="tableCellStyle" >${ptrx.value.re}</td>
						<td id="tableCellStyle" >${ptrx.value.reo}</td>
						<td id="tableCellStyle" ><g:formatNumber number="${ptrx.value.totAmt}" minFractionDigits="2" maxFractionDigits="2"/></td>
						
						<td id="tableCellStyle" ><g:formatNumber number="${ptrx.value.due}" minFractionDigits="2" maxFractionDigits="2"/></td>											
					</tr>												
				</g:each>
				<tr class="border_bottom">
					<td colspan="6" class="text-right">Total:</td>
					<td id="tableCellStyle" style="padding: 3px;">
						<g:textField  class="payTotals" id="selTot" name="selTot"
						        value="0.00" readonly="true" disabled="true" minFractionDigits="2" maxFractionDigits="2"/>
					</td>
				</tr>
				<tr >
					<td colspan="6" class="text-right">NSF Charges:</td>
					<td id="tableCellStyle" >
						<g:field type="hidden" size="15" style="text-align:right;border-width: 0px;" 
									id="charges" name="charges"
									title="NSF or other processing fee" 
									value="${charges}" disabled="true"
									/>
					
						<g:formatNumber number="${charges}" minFractionDigits="2" maxFractionDigits="2"/>			
					</td>
				</tr>
				
			</tbody>
		</table>	
	</div>	<!--  col ends here -->	
</div> <!-- row ends here -->

