<g:set var="liuService" bean="liuService"/>
<g:set var="ntfs" value="${liuService.notifications.reverse()}"/>

<a href="#myModal" class="btn btn-warning btn-xs" id="alertBtn" type="submit" data-toggle="modal"
   data-target="#myModal">
   <g:set var="alertCount" value="${ntfs?.freshlyAdded*.grep(true)*.size().inject(0) { a, b -> a + b }}"/>
   ${alertCount > 0 ? "There ${alertCount > 1 ? 'are' : 'is'} ${alertCount} new alert${alertCount > 1 ? 's.' : '.'}" : "Alerts"}
</a>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
            </button>
            <h4 class="modal-title" id="myModalLabel">Messages & Alerts</h4>
         </div>

         <div class="modal-body">

            <div class="panel panel-default"
                 style="${ntfs?.size() > 12 ? 'height: 355px; overflow:auto;' : ''}">
               <table class="table" style="font-size: 90%;">

                  <thead>
                  <th>When</th>
                  <th>Related To</th>
                  <th>Message</th>
                  </thead>

                  <g:each var="ntf" in="${ntfs}">

                     <tr>
                        <td nowrap><g:formatDate format="MMM dd - hh:mm" date="${ntf.dateCreated}"/></td>
                        <td>
                           ${ntf.relatedTo}
                        </td>
                        <td>
                           ${ntf.message}
                        </td>
                     </tr>

                  </g:each>

               </table>
            </div>

         </div>

         <div class="modal-footer">
            <button type="button" onclick="markRead();" class="btn btn-default" data-dismiss="modal">Close</button>
         </div>
      </div>
   </div>
</div>

<g:javascript>
function markRead() {
	 ${remoteFunction(controller: 'filing', action: 'markRead')};
}
</g:javascript>
