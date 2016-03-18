<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="main"/>
<title>Payment Confirmation</title>
</head>
<body>
  <div style="padding: 10px 0px 0px 0px;border:1">
	<div class="container">
		
		
			<div class="row">
						<div class="col-sm-2"></div>
				<div class="col-sm-3">
					<h3>
						<span class="label label-default"
							style="background-color: #eee; color: #557;"> Payment Confirmation </span>
					</h3>

				</div>
		
			</div>
			<div style="height: 20px"></div>
			
		<div class="row" style="padding-right: 15px">
			<div class="col-sm-5">
				<span><b>Confirmation: </b>${confNo} </span>
			</div>
			<div class="col-sm-7">
				<span><g:formatDate format="MMM dd,yyyy" date="${new Date()}"/> </span>
			</div>
		</div>	
		<div class="row">
			<div class="col-sm-1" style="height: 10px"></div>
		</div>
		
		<!-- Section 1 filings -->
		<div class="row">
			<div class="col-sm-1" style="height: 10px"></div>
		</div>
  	  	
  	  	<g:render template="showFiling" />  
  	  	
  	  	
  	  	<div class="row">
			<div class="col-sm-1" style="height: 10px"></div>
		</div>
		<g:if test="${accNo=='cheque'}">
			<div class="col-sm-12" style="font-size: 90%">
				<span class="badge">2</span><span class="textLawpro">
					Reminder:</span>
		
				<div class="row">
					<div class="col-sm-1" style="height: 10px"></div>
					
				</div>
				
				<div class="row">
					<div class="col-sm-12" >
					<ul>
					<li><span>Your account balance will remain outstanding until payment is received by LAWPRO and applied to Levy Surcharge Filings</span></li>
					<li><span>Note <span><b>Confirmation#</b>${confNo} </span>, print this page and attach to Cheque</span></li>
					</ul>
					</div>
					
				</div>
				
				
			</div>	
			
					
		</g:if>
		<g:else>
		<!--  section 2 Payment information -->
		<div class="row textLawpro">
			<div class="col-sm-12" style="font-size: 90%">
				
				<div class="row">
					<div class="col-sm-1" ></div>					
					
				</div>
				
							
				<div class="row">
					<div class="col-sm-1" style="height: 10px"></div>
				</div>
				
					
				<div class="row" style="padding-right: 15px">
					<div class="col-sm-1"></div>
					<div class="col-sm-6">
						<span class=""><b>Account#: </b>xxxxxxxx-${accNo} </span>
					</div>
				</div>
				<div class="row">				
					<div class="col-sm-1" style="height: 10px"></div>
				</div>

				<div class="row" style="padding-right: 15px">
					<div class="col-sm-1"></div>
					<div class="col-sm-6">
						<span><b>Amount Processed: </b>
							<g:formatNumber number="${paidAmt}" minFractionDigits="2" maxFractionDigits="2"/> </span>
										
					</div>
				</div>
				<div class="row">
					<div class="col-sm-1" style="height: 10px"></div>
				</div>
				<div class="row" style="padding-right: 15px">
					<div class="col-sm-1"></div>
					<div class="col-sm-6">
						<span><b>Payment Status: </b></span> <span id="${status=="Approved" || status == "Accepted for Processing"? 'noDues': 'overDue'}"> ${status} </span>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-1" style="height: 10px"></div>
				</div>
				
				
				<div class="row" style="padding-right: 15px">
					<div class="col-sm-1"></div>
					<div class="col-sm-6">
						<span><b>Authorization#: </b>${authCode} </span>
					</div>			
				</div>
				<div class="row">
					<div class="col-sm-1" style="height: 10px"></div>
				</div>
				
			</div>
		</div>	
		
		<div class="row">
					<div class="col-sm-1" style="height: 10px"></div>
				</div>
		<div class="row" style="padding-right: 15px">
			<div class="col-sm-7">
				<span><b> </b>Please note <span><b>Confirmation#</b>${confNo} </span> for communicating with LAWPRO on this transaction</span>
			</div>			
		</div>
		<div class="row">
			<div class="col-sm-1" style="height: 10px"></div>
		</div>
  	  	
  	  	</g:else>
  	  	
	  </div> <!-- container -->
  </div>
</body>
</html>