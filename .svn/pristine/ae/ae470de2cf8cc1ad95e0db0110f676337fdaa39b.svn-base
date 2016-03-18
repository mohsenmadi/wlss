<html>
<head>
<title>Levy filing</title>
<meta name="layout" content="main" />
</head>
<body>
	<div style="padding: 15px 0px 0px 0px;">

		<div class="container">

			<div id="divBorder3">

				<div class="row" style="padding: 5px 0 0px 15px;">

					<div class="col-sm-5">
						<div class="row" id="divBorderFirmNums">
							<g:render template="/common/numbersSummary" />
						</div>
					</div>

					<div class="col-sm-5"></div>

					<div class="col-sm-2 text-right hidden-print" style="padding: 0 40px 0 0;">
					
						<div style="height: 15px"></div>
						<div class="row" style="font-size:13px;">
							<g:link action="futureFeature" id=""><u>Filing History</u></g:link>
						</div>
						
						<div style="height: 3px"></div>
						<div class="row" style="font-size:13px;">
							<g:link action="futureFeature" id=""><u>Payment History</u></g:link>
						</div>
						
					</div>
				</div>

				<g:set var="currYear" value="${Calendar.instance[Calendar.YEAR]}" />

				<g:render template="filingYear" model="[filings:filingsCurr, 'displayYear':currYear]" />
				<div style="height: 40px"></div>
				<g:render template="filingYear" model="[filings:filingsPrev, 'displayYear':(currYear-1)]" />

			</div>

		</div>
	</div>
</body>
</html>
