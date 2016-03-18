<g:set var="rowSize" value="${listMembers?.size()}"/>

<section class="">
   <div class="" id="fxhtc">

      <table class="fxht" id="fxht">
         <thead>
         <tr class="">
            <th>
               EXCL
               <div class="divth" title="Expand/Collapse table">
                  <g:if test="${rowSize > 7}">
                     <g:checkBox name="cbShowTable"
                                 value="${cbShowTableVal}"
                                 onchange="memberTableExpandContract()"/>
                     &#8675;
                  </g:if>
               </div>
            </th>
            <th style="padding-right:10px">
               LSUC Key
               <div class="divth">
                  LSUC Key
               </div>
            </th>

            <g:if test="${evalProp == 'memActivity'}">
               <th style="padding-right:18px">
                  Status
                  <div class="divth" title="left firm(&#8663;)? CL exempt? RE exempt?">
                     Status
                  </div>
               </th>
            </g:if>

            <th style="padding-right:17px">
               CL
               <div class="divth" title="Civil Litigation">
                  <g:if test="${createAmendment}">
                     <g:javascript>
                        updateMainSelector('cl');
                     </g:javascript>
                     <g:checkBox name="selectCls" onchange="toggleCbs('cl')"/>
                  </g:if>
                  CL
               </div>
            </th>

            <th style="padding-right:20px">
               RE
               <div class="divth" title="Real Estate">
                  <g:if test="${createAmendment}">
                     <g:javascript>
                        updateMainSelector('re');
                     </g:javascript>
                     <g:checkBox name="selectRes" onchange="toggleCbs('re')"/>
                  </g:if>
                  RE
               </div>
            </th>


            <th>
               Name

               <div class="divth">
            Name &nbsp; &nbsp; &nbsp; &nbsp;
                  <g:if test="${createAmendment}">
                     <button id="copyBtn" onclick="copyCol('cl');
                     return false">
                        &#8649;
                     </button>
                  </g:if>

               &nbsp;

                  <g:if test="${createAmendment}">
                     <button id="copyBtn" onclick="copyCol('re');
                     return false">
                        &#8647;
                     </button>
                  </g:if>
               </div>
            </th>
         </tr>
         </thead>
         <%
            def currYear = Calendar.instance[Calendar.YEAR]
            def yearIdx = displayYear as int
            yearIdx = yearIdx == currYear ? -1 : -2
         %>

         <tbody>

         <g:if test="${evalProp == 'memActivity'}">
            <g:each var="i" in="${0..<rowSize}">

               <g:set var="member" value="${listMembers[i]}"/>
               <g:set var="valCl" value="${member.activeCl}"/>
               <g:set var="valRe" value="${member.activeRe}"/>

               <g:set var="nameProps" value="${member.member.getDisplayUsernameProps(yearIdx)}"/>
               <g:set var="hasLeft" value="${nameProps[1] ? '\u21d7' : null}"/>
               <g:set var="exemptCl" value="${nameProps[2] ? 'CL' : null}"/>
               <g:set var="exemptRe" value="${nameProps[3] ? 'RE' : null}"/>

               <tr>
                  <td>${i + 1}</td>
                  <td>
                     ${nameProps[0]}
                  </td>
                  <td>
                     <span style="color:#945C5B;font-size:14px;">${hasLeft}</span>
                     <span id="${!exemptCl ?: 'exemptStyle'}">${exemptCl}</span>
                     <span id="${!exemptRe ?: 'exemptStyle'}">${exemptRe}</span>
                  </td>
                  <td style="padding-right:17px"><g:checkBox name="active-cl-${member.member.username}" onclick="updateMainSelector('cl')"
                                  disabled="${createAmendment ? 'false' : 'true'}" value="${valCl}"/></td>
                  <td style="padding-right:20px"><g:checkBox name="active-re-${member.member.username}" onclick="updateMainSelector('re')"
                                  disabled="${createAmendment ? 'false' : 'true'}" value="${valRe}"/></td>
                  <td>${member.member.firstName} ${member.member.lastName}</td>
               </tr>

            </g:each>
         </g:if>

         <g:else>
            <g:each var="i" in="${0..<rowSize}">

               <g:set var="member" value="${listMembers[i]}"/>
               <g:set var="valCl" value="${member.exempts[yearIdx].exCl}"/>
               <g:set var="valRe" value="${member.exempts[yearIdx].exRe}"/>
               <g:set var="disableCl" value="${!createAmendment ?: valCl && !finCustRole}"/>
               <g:set var="disableRe" value="${!createAmendment ?: valRe && !finCustRole}"/>

               <g:set var="nameProps" value="${member.getDisplayUsernameProps(yearIdx)}"/>
               <g:set var="hasLeft" value="${nameProps[1] ? '\u21d7' : null}"/>
               <g:set var="exemptCl" value="${nameProps[2] ? 'CL' : null}"/>
               <g:set var="exemptRe" value="${nameProps[3] ? 'RE' : null}"/>

               <tr>
                  <td>${i + 1}</td>
                  <td>
                     ${nameProps[0]}
                     ${hasLeft}
                  </td>
                  <td><g:checkBox title="${disableCl && createAmendment ? 'Contact LawPro to un-exempt' : ''}"
                                  name="active-cl-${member.username}" onclick="updateMainSelector('cl')"
                                  disabled="${disableCl}" value="${valCl}"/></td>
                  <td><g:checkBox title="${disableRe && createAmendment ? 'Contact LawPro to un-exempt' : ''}"
                                  name="active-re-${member.username}" onclick="updateMainSelector('re')"
                                  disabled="${disableRe}" value="${valRe}"/></td>
                  <td>${member.firstName} ${member.lastName}</td>
               </tr>

            </g:each>
         </g:else>
         </tbody>
      </table>
   </div>
</section>

<script>
$(document).ready(function() {
   memberTableExpandContract();
});
</script>