<%@ page import="com.lss.payment.Payment" %>
<!DOCTYPE html>
<html>
<head>
   <meta name="layout" content="main">
   <title>LSS Payment</title>

</head>

<body>
<g:set var="liuService" bean="liuService"/>

<g:form useToken="true" name="payForm" class="form-horizontal" role="form">
   <div style="padding: 10px 0px 0px 0px;border:1">
      <div class="container">

         <div class="row">
            <div class="col-sm-4"></div>

            <div class="col-sm-3">
               <h3>
                  <span class="label label-default" style="background-color: #eee; color: #557;">
                     Making Payment
                  </span>
               </h3>

            </div>
         </div>

         <div style="height: 20px"></div>
      <!--  Section 1 -->
         <g:if test="${paytrxs}">
            <g:render template="selectFiling"/>

            <!--  Section 2 -->
            <div class="row" style="font-size: 85%;padding-right: 15px">
               <div class="col-sm-5">
                  <span class="badge">2</span><span class="textLawpro"> Payment Details:</span><br>
                  <span style="padding-left:25px;font-size:12.5px">Select payment method and enter account details for payment processing</span>

                  <div class="row"><div class="col-sm-12" style="height:10px"></div></div>

                  <div class="row"><!--  Row 1 -->
                     <div class="col-sm-4" style="text-align: right;color: #20495e;">
                        Amount:
                     </div>

                     <div class="col-sm-7">
                        <span style="align:bottom">$</span>
                        <g:textField size="13" align="top" style="border-width: 0px;" id="payTot" name="payTot"
                                     value="0" readonly="true"/>
                     </div>
                  </div> <!-- end of Row 1  -->
                  <div class="row"><div class="col-sm-12" style="height:10px"></div></div>

                  <div class="row"><!--  Row 2 -->
                     <div class="col-sm-4" style="text-align: right;color: #20495e;">
                        Payment Method:
                     </div>

                     <div class="col-sm-7">
                        <g:select id="payType" name="payType" class="required"
                                  from="${payTypes.entrySet()}" value='' optionKey="key"
                                  optionValue="value" noSelection="${['none': 'Select...']}"
                                  onchange="${remoteFunction(action: 'refreshPayMethods',
                                        update: 'payMethods',
                                        params: '\'pMethod=\' + this.value',
                                        onSuccess: 'showPayAuth()')}"/>
                     </div>
                  </div>  <!--  end of Row 2 -->
                  <div class="row"><!--  Row 3 -->
                     <div id="payMethods"></div>
                  </div>  <!--  end of Row 3 -->

               </div> <!-- End payment Details col -->

               <div class="col-sm-4">
                  <div class="row">
                     <div class="col-sm-12"><g:render template="payAuthorize"/></div>
                  </div>
               </div>

            </div> <!-- End payment details row -->

				
				<!-- Section 3 -->
            <div class="row">
               <div class="col-sm-1" style="height: 15px"></div>
            </div>

            <div class="row textLawpro">
               <div class="col-sm-12" style="font-size: 90%">
                  <span class="badge">3</span><span class="textLawpro">
                  Disclaimer</span>

                  <p style="padding-left: 22px">Filings and payments should be
                  received by filing deadline to avoid suspension by the Law
                  Society of Upper Canada.</p>
               </div>
            </div>

            <div class="row">
               <div class="col-sm-6">
                  <g:render template="/lp/addComment"/>
               </div>
            </div>

            <br>

            <div class="row">
               <div class="col-sm-1">
                  <g:actionSubmit
                        id="payBtn"
                        class="btn-sm btn-primary"
                        value="submit"
                        action="checkout"
                        onclick="if(!formValidation()) return false;"/>
               </div>

               <div class="col-sm-1">
                  <g:actionSubmit
                        id="cancelBtn"
                        class="btn-sm btn-primary"
                        action="cancel"
                        value="reset"/>
                  <!-- onclick="return confirm('Are you sure you want to reset?')" />  -->
               </div>

               <g:javascript>
						$(document).ready(function () {
							if (${liuService.liUserIsCustSrv()}) {
								$("#payBtn").prop("disabled", true);
								$("#cancelBtn").prop("disabled", true);
								$("#payBtn").css("background-color", "#adadad");
								$("#cancelBtn").css("background-color", "#adadad");
							}
						});
               </g:javascript>

               <div class="col-sm-10" style="">
                  <div id="paymentMsg"
                       style="color: #FF0000; font-weight: bold; font-style: italic; padding: 3px 0px 3px 5px;">
                  </div>
                  <g:if test="${flash.error}">
                     <div class="alert alert-error" style="display: block">${flash.message}</div>
                  </g:if>
               </div>
            </div>
         </g:if>
         <g:else>
            <div class="col-sm-10" style="">
               <BR>
               No outstanding amount to apply payment. Please file and proceed to payment
            </div>
         </g:else>
      </div>
      <!-- container -->
   </div>
   <!-- main -->
</g:form>
</body>
</html>
