/**
 * 
 */
function calcTotal(){		
	 var tot = 0.00
	 var sKey=""
	 $.each($("input[name='fKey']:checked"), function(){
     		var amt = $(this).val().split("~")[1]
     		tot = parseFloat(tot) + parseFloat(amt)                     		    
    });          		     		
	 var chrg= parseFloat($('#charges').val()) + tot
	 
	 $('#selTot').val(tot.toFixed(2))
	 $('#payTot').val(chrg.toFixed(2))
}


function formValidation(){	
	$('#paymentMsg').text("");
	$('#paymentMsg').css("display", '');
	$('#paymentMsg').css("color", '#ff0000');
	$('#paymentMsg').stop().css({
		opacity : 1
	});

	if($('#selTot').val() == "0.00"){
		$('#filingTable').css("border-color",'#ff0000');
		$('#paymentMsg').text("Select a filing");		
		$('#paymentMsg').fadeOut(60000);
		return false;
	}else if($('#payType').val() == 'none'){
		 $('#paymentMsg').text("Please select payment method");
		 $('#paymentMsg').fadeOut(60000);
		 return false;
	}else if($('#payType').val() == "CC") {
		if (!$('#cAuthorize').is(':checked')) {
			$('#paymentMsg').text("Please select authorization");
			$('#paymentMsg').fadeOut(60000);
			return false;
		} else if ($.trim($("#ccName").val()).length == 0) {
			$("#ccName").focus();
			$('#paymentMsg').text("Enter cardholder's name");
			$('#paymentMsg').fadeOut(60000);
			return false;
		}else if($.trim($("#ccNo").val()).length == 0 ) {
		   $("#ccNo").focus();
		   $('#paymentMsg').text("Enter card number");
		   $('#paymentMsg').fadeOut(60000);
		   return false;
	   }else if(!valid_credit_card($.trim($("#ccNo").val()))){
		   $('#paymentMsg').text("Incorrect card # entered");
		   $('#paymentMsg').fadeOut(60000);
		   return false;
		}else if($('#ccType').val().toUpperCase()!= detectCardType($.trim($("#ccNo").val()))){
			$('#paymentMsg').text("Card type does not match with the entered card#");
			$('#paymentMsg').fadeOut(60000);
			return false;
		} else if(!validDate()){
			$('#paymentMsg').text("Incorrect expiry date");
			$('#paymentMsg').fadeOut(60000);
			return false;
		}
	 }else if($('#payType').val() == "EFT"){
		 if(!$('#cAuthorize').is(':checked')) {
			   $('#paymentMsg').text("Please select authorization");
			   $('#paymentMsg').fadeOut(60000);
			   return false;
			}else if($.trim($("#eName").val()).length == 0 ){
				$("#eName").focus();
				$('#paymentMsg').text("Enter account holder's name");
				$('#paymentMsg').fadeOut(60000);
				return false;
			}else if($("#eTransit").val().length < 5 ){
				$("#eTransit").focus();
				$('#paymentMsg').text("Transit # must be 5 digit number ");
				$('#paymentMsg').fadeOut(60000);
				return false;	
			}else if($("#eBank").val().length < 3 ){
				$("#eBank").focus();
				$('#paymentMsg').text("Institution# must be 3 digit number ");
				$('#paymentMsg').fadeOut(60000);
				return false;	
			}else if($("#eAccount").val().length > 17 ){
				$("#eAccount").focus();
				$('#paymentMsg').text("Account# cannot be more than 17 digit number ");
				$('#paymentMsg').fadeOut(60000);
				return false;	
			}
		 
	 }else if($('#payType').val() == "CHQ"){
		 if(!$('#cAuthorize').is(':checked')) {
			   $('#paymentMsg').text("Please select authorization");
			   $('#paymentMsg').fadeOut(60000);
			   return false;
			}
	 }	
	return true;
}
function validDate(){
	
	var expMonth = $('#mm').val()
	var expYear = $('#yy').val()

	var today = new Date();
    var thisYear = today.getFullYear();

    return ((expYear == thisYear && expMonth >= (today.getMonth() + 1) )? true :expYear>thisYear ? true:false)
}
function updateExpDate(){
	var expMonth = $('#mm').val()
	var expYear = $('#yy').val()
	$('#expiryDate').val(expMonth+"/"+expYear.slice(-2))
}

function isNumberKey(evt){
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}    

function showPayAuth(){
	var a = $('select[name="payType"]').val();	
	if(a == "CHQ" || a == "Select"){
		$('#sInfo').css("display","none");
	}else{
		$('#sInfo').css("display","block");
	}	
}

function valid_credit_card(value) {
	// accept only digits, dashes or spaces
	if (/[^0-9-\s]+/.test(value)) return false;

	// The Luhn Algorithm. It's so pretty.
	var nCheck = 0, nDigit = 0, bEven = false;
	value = value.replace(/\D/g, "");

	for (var n = value.length - 1; n >= 0; n--) {
		var cDigit = value.charAt(n),
				nDigit = parseInt(cDigit, 10);

		if (bEven) {
			if ((nDigit *= 2) > 9) nDigit -= 9;
		}

		nCheck += nDigit;
		bEven = !bEven;
	}

	return (nCheck % 10) == 0;
}

function detectCardType(number) {
	var re = {
		electron: /^(4026|417500|4405|4508|4844|4913|4917)\d+$/,
		maestro: /^(5018|5020|5038|5612|5893|6304|6759|6761|6762|6763|0604|6390)\d+$/,
		dankort: /^(5019)\d+$/,
		interpayment: /^(636)\d+$/,
		unionpay: /^(62|88)\d+$/,
		visa: /^4[0-9]{12}(?:[0-9]{3})?$/,
		mastercard: /^5[1-5][0-9]{14}$/,
		amex: /^3[47][0-9]{13}$/,
		diners: /^3(?:0[0-5]|[68][0-9])[0-9]{11}$/,
		discover: /^6(?:011|5[0-9]{2})[0-9]{12}$/,
		jcb: /^(?:2131|1800|35\d{3})\d{11}$/
	};
	if (re.electron.test(number)) {
		return 'ELECTRON';
	} else if (re.maestro.test(number)) {
		return 'MAESTRO';
	} else if (re.dankort.test(number)) {
		return 'DANKORT';
	} else if (re.interpayment.test(number)) {
		return 'INTERPAYMENT';
	} else if (re.unionpay.test(number)) {
		return 'UNIONPAY';
	} else if (re.visa.test(number)) {
		return 'VISA';
	} else if (re.mastercard.test(number)) {
		return 'MASTERCARD';
	} else if (re.amex.test(number)) {
		return 'AMEX';
	} else if (re.diners.test(number)) {
		return 'DINERS';
	} else if (re.discover.test(number)) {
		return 'DISCOVER';
	} else if (re.jcb.test(number)) {
		return 'JCB';
	} else {
		return undefined;
	}
}