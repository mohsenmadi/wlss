<g:if test="${setSearchMembers}">
	<g:set var="memberSize" value="${setSearchMembers?.size() ?: 0}" />
	<% listMembers = (setSearchMembers as List).sort{ it.username } %>

	<div class="panel panel-default" style="">

		<table class="table" style="font-size: 90%;">

			<thead>
				<th></th>
				<th>LSUC Key</th>
				<th>CL</th>
				<th>RE</th>
				<th>Name</th>
				<th></th>
			</thead>

			<g:each var="i" in="${0..<memberSize}">

				<g:set var="member" value="${listMembers[i]}" />

				<tr>
					<td>${i + 1}</td>
					<td>${member.username[0..7]}</td>
					<td><g:checkBox name="activea-cl-${member.username}" value="${false}" /></td>
					<td><g:checkBox name="activea-re-${member.username}" value="${false}" /></td>
					<td>${member.firstName} ${member.lastName}</td>
					<td><g:remoteLink update="divAddMember" style="color:red; font-size:9px;" action="deleteMember" id="${member.username}">DEL</g:remoteLink></td>
				</tr>

			</g:each>

		</table>
	</div>
</g:if>

<script type="text/javascript">
    addFadeOutMsg("#divAddMemberMsg", "${msg2user}");
</script>