<div id="divExemptions">

	<g:form>

		<div class="row textLawpro">
			<span class="badge">1</span> <span style="font-weight:bold"> Members Listing</span><br>
			<span style="padding-left:25px;font-size:12.5px">
				Members who qualify for exemption for this filing year.
			</span>
		</div>


		<div class="row">
			<div style="height: 10px"></div>
			<div id="memberTable">
				<g:render template="memberTable" model="['listMembers':listMembers, 'evalProp':'exempts']" />
			</div>
		</div>



		<!-- add member section  -->
		<g:render template="addMember" model='["comingFrom":"pageExempt-${displayYear}"]' />


		<!-- declare and submit filing/amendment -->
		<g:render template="submitChangesExempt" model="['updateDiv':'divExemptions']" />

	</g:form>
</div>