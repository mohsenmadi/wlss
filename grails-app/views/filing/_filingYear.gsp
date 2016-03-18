<div id="divBorder">
	<div class="row" id="divBorder2" style="padding: 7px 0 7px 0;">
		<div class="col-sm-9" id="titleFont">Filing Year ${displayYear}</div>
		<div class="col-sm-3 text-right hidden-print" style="font-size:13px;">
			<g:link action="exemptions" id="${displayYear}"><u>Exemptions</u></g:link>
		</div>
	</div>


	<div style="height: 10px"></div>
		
	<g:set var="liuService" bean="liuService" />
	<g:set var="templateFilingQr" value="${liuService.isLawyerOnly() ? 'filingQrM' : 'filingQr'}" />

	<div class="row">
		<g:each var="i" in="${0..3}">
			<div class="col-sm-6 col-md-3">
				<g:set var="filingService" bean="filingService" />
				<% def filing = filingService.setFilingMap(filings[i]) %>
				<g:render template="${templateFilingQr}" model="[filing:filing]" />
			</div>
		</g:each>
	</div>
</div>