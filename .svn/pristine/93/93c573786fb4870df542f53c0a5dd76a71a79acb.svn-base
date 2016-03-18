<html>
<head>
<title>lp ops</title>
<meta name="layout" content="main" />
</head>
<body>

	<g:form>
		<div style="padding: 15px 0px 0px 15px;">


			<div class="row">
				<div class="col-sm-4" style="font-size: 100%;">
					<g:textField 
						id="referKey" 
						style="width:105px;"
						value="${forUsername?.username}"
						placeholder="referKey#..." 
						name="referKey" />
					<g:submitToRemote 
						id="searchBtn" 
						name="referKeyFind"
						before="if(textIsEmpty('#referKey')) return false;" 
						value="search"
						url="[action:'searchReferKey']" 
						update="divFoundReferKey" />
				</div>


				<div class="col-sm-6"></div>
			</div>
			
			<div style="height: 15px"></div>
			
			<div class="row">
				<div class="col-sm-6">
					<div id="divFindReferKeyMsg"
						style="display: none; font-size: 100%; font-weight: bold; font-style: italic;">
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-sm-10" id="divFoundReferKey">
					<div style="height: 15px"></div>
					<g:render template="referKeyDetails" />
				</div>
			</div>
		</div>
	</g:form>
</body>
</html>