<g:set var="liuService" bean="liuService"/>

<div style="height: 5px"></div>

<g:if test="${createAmendment}">
	<div class="row textLawpro">
		<span class="badge">3</span><span class="textLawproBold"> Declaration</span>
		<p style="padding-left: 22px">
			<g:checkBox name="cbDeclare" value="${declare}" onChange="addBtnDisabledProp()" />
			I hereby certify the correctness of the information above.
		</p>
	</div>

	<g:render template="/lp/addComment"/>

</g:if>

<g:hiddenField name="submitBtnAction" value="${addBtnVal}" />

<!-- buttons -->
<div style="height: 20px"></div>

<div class="row">
	<div class="col-sm-2" style="disabled:true">
		<g:submitToRemote
				id="addBtn"
				value="${addBtnVal}"
				name="addBtn"
				url="[action:'addAmendment']"
				update="${updateDiv}"
				asynchronous="false"
				before="if(!validSubmit()) return false;"
				after="${remoteFunction(action:'refreshQrTemp', update:'divQrSummary')}"
				onComplete="addBtnDisabledProp()"
		/>
	</div>

	<g:javascript>
		$(document).ready(function () {
			$("#addBtn").prop("disabled", ${liuService.liUserIsCustSrv()});
		});
	</g:javascript>

	<g:if test="${addBtnVal == 'submit'}">
		<div class="col-sm-2" >
			<g:submitToRemote
					id="cancelBtn"
					value="cancel"
					name="cancelBtn"
					url="[action:'rerenderQuarter']"
					update="${updateDiv}" />
		</div>
	</g:if>

	<div class="col-sm-8">
		<div id="amendmentMsg"
			 style="color: #00bb00; display: none; font-weight: bold; font-style: italic; padding: 3px 0px 3px 5px;">
		</div>
	</div>
</div>

<g:javascript>
function addBtnDisabledProp() {
	var code = $.parseJSON('${msgCode}');
	if (code == -1) {
		showAmendmentMsg('#amendmentMsg', "No modifications detected!", "#dd0000");
		$("#cbDeclare").prop("checked", true);
		return;
	}

	var msg = "";
	var propChecked = $("#cbDeclare").prop("checked");
	if (propChecked == false) {
		$("#addBtn").prop("disabled", true);
		$("#addBtn").val("submit");

	} else {
		$("#addBtn").prop("disabled", false);

		var addBtnVal = $("#addBtn").val();
		var isAmended = addBtnVal != "submit" ? true : false;

		if (isAmended) {
			//msg = (addBtnVal == "amend" ? "Amendment" : "Filing") + " submitted successfully."
			msg = "Filing submitted successfully."
			var color = "#00bb00";

			if (code == 1) {
				msg = "Sorry, had to refresh amendments first! See alerts.";
				color = "#dd0000";
			} else if (code == 2) {
				msg = "Sorry, there are server errors! See alerts.";
				color = "#dd0000";
			}

			showAmendmentMsg('#amendmentMsg', msg, color);
		}
	}
}
</g:javascript>