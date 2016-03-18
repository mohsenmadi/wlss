
<g:if test="${exFy?.exConfNum}">

    <table id="qrSummaryTable" style="border: 0px; color: #2f6d8c">

        <tr>
            <td class="text-center" colspan="2" style="font-size: 15px; font-weight: bold;">
                Exemption Summary
            </td>
        </tr>

        <tr>
            <td class="text-right" style="font-weight: bold;">Last own filing:</td>
            <td>
                <g:formatDate format="MMM dd, yyyy @ hh:mm:ss aa" date="${exFy?.exConfDate}"/>
            </td>
        </tr>

        <tr>
            <td class="text-right" style="font-weight: bold;">Confirmation#:</td>
            <td>
                ${exFy?.exConfNum}
            </td>
        </tr>

    </table>

</g:if>