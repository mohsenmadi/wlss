<g:set var="liuService" bean="liuService" />

<g:if test="${createAmendment && liuService.hasFirmRole()}">

	<div class="row textLawpro">
		<div class="col-sm-12">

			<div class="row textLawpro">
				<span style="font-weight:bold;padding-left:15px"> Additional Members</span><br>
				<span style="padding-left:15px;font-size:12.5px">
					Enter the LSUC key for the member you wish to add to the member listing above.<br>
					<span style="padding-left:15px">
						Contact Customer Service for help on member search related issues.
					</span>
				</span>
			</div>

		</div>
	</div>

	<div style="height: 10px"></div>

	<div class="row">
		<div class="col-sm-5" style="font-size: 90%;">
			<g:textField
					id="searchMemKey"
					style="width:105px;"
					placeholder="LSUC key"
					name="searchMemKey" />

			<g:submitToRemote
					id="searchBtn"
					name="memKeyAdded"
					before="if(textIsEmpty('#searchMemKey')) return false;"
					value="find"
					url='[action:"addMember", id:"${comingFrom}"]'
					update="divAddMember" />
		</div>

		<div class="col-sm-6" style="padding: 3px 0px 4px 0px;">
			<div id="divAddMemberMsg"
				 style="color: #00bb00; display: none; font-size: 90%; font-weight: bold; font-style: italic;">
			</div>
		</div>

		<div class="col-sm-1"></div>
	</div>

	<div style="height: 15px"></div>
	<div class="row">
		<div class="col-sm-10" id="divAddMember">
			<div style="height: 10px"></div>
			<g:render template="addMemberTable" />
		</div>
	</div>

</g:if>