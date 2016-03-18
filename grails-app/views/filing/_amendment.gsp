<g:set var="filingService" bean="filingService" />
<% filingService.setFilingMap(filing) %>

<div id="divAmendment">

	<g:form>

		<!-- Section 1 -->
		<div class="row textLawpro">
			<span class="badge">1</span> <span style="font-weight:bold"> Filing/Amendment</span><br>
			<span style="padding-left:25px;font-size:12.5px">
				Civil Litigation & Real Estate transactions which qualify for payment
			</span>
		</div>

		<div class="row">
			<div class="col-sm-12">
				<div style="height: 10px"></div>
				<g:render template="amendTable" />
			</div>
		</div>
		<div style="height: 18px"></div>

		<g:set var="liuService" bean="liuService"/>
		<g:set var="isLawyer" value="${liuService.isLawyerOnly()}"/>
		<g:set var="secHeader" value="${isLawyer?' Filing Type':' Members Listing'}"/>
		<g:set var="secDesc" value="${isLawyer?'Filing type selections':'Members active in the firm during this quarter'}"/>

		<!-- Section 2 -->
		<div class="row textLawpro">
			<span class="badge">2</span> <span style="font-weight:bold">${secHeader}</span><br>
			<span style="padding-left:25px;font-size:12.5px">${secDesc}
			</span>
		</div>

		<div class="row">
			<div style="height: 10px"></div>
			<div id="memberTable" class="col-sm-12">
				<g:render template="memberTable" model="['listMembers':listMembers, 'evalProp':'memActivity']" />
			</div>
		</div>



		<!-- add member section  -->
		<g:render template="addMember" model="['comingFrom':'pageAmend']" />


		<!-- Section 3 - declare and submit filing/amendment -->
		<g:render template="submitChanges" model="['updateDiv':'divAmendment']" />

	</g:form>
</div>