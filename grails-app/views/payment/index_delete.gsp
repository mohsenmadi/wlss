<!-- This gsp will be deleted  -->





<%@ page import="com.lss.payment.Payment"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<title>LSS Payment</title>	
	
</head>

<body>
	<g:form useToken="true" name="payForm" url="[action:'checkout',controller:'payment']" >
	
	<div style="padding: 10px 0px 0px 0px;">
		<div class="container">
			<div class="row textLawpro">
				<div class="col-sm-3"></div>
				<div class="col-sm-9">
					<h1>Make Payment </h1>
				</div>
			</div>
			<!--  Section 1 -->
			
			<g:render template="selectFiling"/>
			
			<!--  Section 2 -->
			<div class="row" style="padding-right: 15px">
				<div class="col-sm-12">
					<span class="badge">2</span><span class="textLawproBold"> Payment Details:	</span>
				</div>				 
			</div>
			<div class="row" style="padding-right: 15px">
				<div class="col-sm-3">
				<table style="width:auto ;font-size: 85%;">
					<tr>
						<td style="width:50%">Amount: </td>
						<td style="width:50%">$<g:field style="width:45px" type="text" class="inputReadOnly" id="payTot" name="payTot" value="0" readonly="true" disabled="true" format="#.##"/></td>						
					</tr>
					<tr>
						<td style="width:50%">Payment Method: </td>
						<td style="width:50%">										
							 <g:select name="payType" from="${payTypes.entrySet()}" optionKey="key" optionValue="value" noSelection="${['null':'Select One...']}"
							   onchange="${remoteFunction(action:'refreshPayMethods',
			  						update:'payMethods',
									params: '\'pMethod=\' + this.value' ) }"/>							
						</td>						
					</tr>
				</table>				
				</div>
				<div id="payMethods">	</div>
			</div>	
		
			<!-- Section 3 -->
			<div class="row">
				<div class="col-sm-1" style="height:15px"></div>
			</div>	
			
			<div class="row textLawpro">				
				<div class="col-sm-12" style="font-size:90%">
				<span class="badge">3</span><span class="textLawproBold"> Disclaimer</span>
				<p style="padding-left: 22px">
					Filings and payments should be received by filing deadline to avoid  suspension by the Law Society of Upper Canada.				 
				</p>
				</div>
			</div>
			<br>
			
			<div class="row">
				<div class="col-sm-1">
					<g:actionSubmit value="pay" class="btn-sm btn-primary" />
				</div>
				<div class="col-sm-1">
					<g:submitToRemote 
						id="cancelBtn" 
						value="cancel" 
						name="cancelBtn" 
						url="[action:'renderFilingQtr']"
						 />
				</div>
				<div class="col-sm-10" style="">
					<div id="paymentMsg"
						style="color: #FF0000;  font-weight: bold; font-style:italic; padding: 3px 0px 3px 5px;"> </div>
					</div>
				</div>			
		</div> <!-- container -->
	</div> <!-- main -->
	
<g:javascript>
function formValidation(){	
	alert($('#selTot').val())
	
	if($('#selTot').val() == "0"){
		$('#paymentMsg').text("Select a filing")
		return false;
	}else if($('#cAuthorize').val() != "on" && $('#payType').val().text() == "CC") {
		$('#paymentMsg').text("Please select authorization")
		return false;
	}else{
	$('#paymentMsg').text("")
		return true;
	}
}

function calcTotal(){		
	 var tot = 0
	 var sKey=""
	 $.each($("input[name='fKey']:checked"), function(){
     		var amt = $(this).val().split("~")[1]
     		tot = parseFloat(tot) + parseFloat(amt)                     		    
    });          		     		
	 $('#selTot').val(tot) <!--Update Totals on screen  -->
	 $('#payTot').val(tot) <!-- update total to be paid -->
}

</g:javascript>
</g:form>
</body>
</html>
