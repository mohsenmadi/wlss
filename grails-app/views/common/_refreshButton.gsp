<g:link controller="dispatch" action="reloadDataForPage"
		params="[targetUri: (request.forwardURI - request.contextPath),id:params.id]"
		style="display:inline-block;"
		title="Reload current page">
	<span class="glyphicon glyphicon-refresh iconInfo"></span>
</g:link>