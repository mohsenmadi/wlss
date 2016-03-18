<g:set var="filingService" bean="filingService"/>
<g:set var="numMap" value="${filingService.setFilingMap()}"/>

<table id="firmSummaryTable" style="">

   <tr>
      <td class="text-left" colspan="4" style="font-size: 14px; font-weight: bold;">
         Transaction Levies Account Balance
      </td>
   </tr>

   <tr>

      <td class="text-right" style="font-weight: bold;">
         Outstanding Amount:
      </td>

      <td>
         ${numMap.currRe} $<g:formatNumber number="${numMap.outstandingAmount}" minFractionDigits="2"
                                           maxFractionDigits="2"/>
      </td>

      <td class="text-right" style="font-weight: bold;">
         Total Amount Due:
      </td>

      <td>
         <div
               id="${numMap.totalDueAmount > 0 ? 'overDue' : numMap.totalDueAmount < 0 ? 'underDue' : 'noDues'}">
            $
            <g:formatNumber number="${numMap.totalDueAmount}" minFractionDigits="2" maxFractionDigits="2"/>
         </div>
      </td>
   </tr>


   <tr>
      <td class="text-right" style="font-weight:bold;">
         NSF Charges:
      </td>

      <td>
         ${numMap.currCl} $<g:formatNumber number="${numMap.miscCharges}" minFractionDigits="2" maxFractionDigits="2"/>
      </td>

      <td>
      </td>

      <td>
      </td>
   </tr>

</table>