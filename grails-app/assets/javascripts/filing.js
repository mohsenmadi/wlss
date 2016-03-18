function validSubmitExempt() {
	var addBtnVal = $("#addBtn").val();
	if (addBtnVal == "start" || addBtnVal == 'amend') {
		return true;
	}

	var cl = $('#cl').val();
	var re = $('#re').val();
	var reo = $('#reo').val();

	var checkedCls = getCbsCheckedNum('cl', "a");
	var checkedRes = getCbsCheckedNum('re', "a");
	var cbsAdded = getCbs('cl', 'a').length;
	var checkedAdded = checkedCls + checkedRes;

	var msg = "";
	if (cbsAdded > 0 && checkedAdded == 0) {
		msg = "Can't include Additional Members with no selections!";
	}

	if (msg != "") {
		showAmendmentMsg('#exemptMsg', msg, "#dd0000");
		return false;
	}

	return true;
}

function validSubmit() {
	var addBtnVal = $("#addBtn").val();
	if (addBtnVal == "start" || addBtnVal == 'amend') {
		return true;
	}

	var cl = $('#cl').val();
	var re = $('#re').val();
	var reo = $('#reo').val();

	var checkedAddedCl = getCbsCheckedNum('cl', "a");
	var checkedAddedRe = getCbsCheckedNum('re', "a");
	var checkedAdded = checkedAddedCl + checkedAddedRe
	var cbsAdded = getCbs('cl', 'a').length;

	var checkedCls = getCbsCheckedNum('cl', "") + checkedAddedCl;
	var checkedRes = getCbsCheckedNum('re', "") + checkedAddedRe;

	var clEmpty = cl == ""
	var reEmpty = re == ""
	var reoEmpty = reo == ""
	var reFamilyEmpty = reEmpty && reoEmpty
	var checkedClsAre0 = checkedCls == 0
	var checkedResAre0 = checkedRes == 0

	var msg = "";

	if (cbsAdded > 0 && checkedAdded == 0) {
		msg = "Please perform some selections on Additional Members first, or delete them.";

	} else if (clEmpty && reFamilyEmpty && checkedClsAre0 && checkedResAre0) {
		msg = "Empty filing! Perform some selections first or cancel.";

	} else if (!clEmpty && !reFamilyEmpty && checkedClsAre0 && checkedResAre0) {
		msg = "You have selected a number of CL and RE filings, " +
			"but have not performed any member selections!";

	} else if (clEmpty && !checkedClsAre0) {
		msg = "Please enter a valid number of CL filings first, or unselect all CL filings before submitting.";

	} else if (!clEmpty && checkedClsAre0) {
		msg = "Please select some CL filings first, or clear the CL number field before submitting.";

	} else if (reFamilyEmpty && !checkedResAre0) {
		msg = "Please enter a valid number of RE filings first, or unselect all RE filings before submitting.";

	} else if (!reFamilyEmpty && checkedResAre0) {
		msg = "Please select some RE filings first, or clear the RE number field before submitting.";
	}

	if (msg != "") {
		showAmendmentMsg('#amendmentMsg', msg, "#dd0000");
		return false;
	}

	return true;
}

function toggleCbs(col) {
	var cbs = getCbs(col, "");
	var selector = col == 'cl' ? '#selectCls' : '#selectRes';
	var isChecked = $(selector).is(':checked');
	$.each(cbs, function(i, cb) {
		cb.checked = isChecked;
	});
}

function copyCol(col) {
	var colOther = col == 'cl' ? 're' : 'cl';
	var cbsSrc = getCbs(col, "");
	var cbsDst = getCbs(colOther, "");
	$.each(cbsDst, function(i, cb) {
		cb.checked = cbsSrc[i].checked;
	});
	updateMainSelector(colOther);
}

function updateMainSelector(cb) {
	var isChecked = true;
	var selectorType = cb == 'cl' ? 'Cls' : 'Res';
	var cbs = getCbs(cb, "");
	$.each(cbs, function(i, cb) {
		if (!cb.checked) {
			isChecked = false;
			return false;
		}
	});

	var msId = "#select" + selectorType;
	$(msId).prop('checked', isChecked);
}

function getCbsCheckedNum(col, added) {
	var cbs = getCbs(col, added);
	var num = 0;
	$.each(cbs, function(i, cb) {
		if (cb.checked) {
			num++;
		}
	});
	return num;
}

function getCbs(col, added) {
	return $("input:checkbox[id^=\"active" + added + "-" + col + "-\"]");
}

function textIsEmpty(theDiv) {
	if ($(theDiv).val() == "") {
		return true;
	}
	return false;
}

function addFadeOutMsg(theDiv, msg2user) {
	var tokens = msg2user.split("-");
	var msg = tokens[0];
	var color = tokens[1];
	$(theDiv).css("display", '');
	$(theDiv).css("color", color);
	$(theDiv).text(msg);
	$(theDiv).stop().css({
		opacity : 1
	});
	$(theDiv).fadeOut(30000);
}

function showAmendmentMsg(theDiv, msg, color) {
	$(theDiv).css("display", '');
	$(theDiv).css("color", color);
	$(theDiv).text(msg);
	$(theDiv).stop().css({
		opacity : 1
	});
	$(theDiv).fadeOut(60000);
}

function calcDollars(p1, p2, p3, compId, f1, f2, f3) {

	var p1i = $(p1).prop('value') * 1;
	var p2i = $(p2).prop('value') * 1;
	var p3i = $(p3).prop('value') * 1;

	if (p1i < 0 || p1i > 9999) {
		p1i = $(getTrxType(p1)).prop('value') * 1;
		$(p1).prop('value', $(getTrxType(p1)).prop('value'));
		alert("Only numbers 0 to 9999 accepted.")
	} else if ($(p1).prop('value') === '') {
		p1i = $(getTrxType(p1)).prop('value') * 1;
		/*
		 * chrome? works like a charm - non-numeric chars cannot be typed
		 * firefox || safari? bad, so we lose all input but succees in resetting to 0 all row upon bad input
		 * ie? not tested.
		 */
		if (p1i < 10 || getBrowserName()!='chrome') {
			p1i = 0;
		}
		$(p1).prop('value', '');
	}

	$(compId).prop('value', '$' + p1i * f1);
	$('#totTypes').prop('value', p1i + p2i + p3i);
	var tot = p1i * f1 + p2i * f2 + p3i * f3;
	$('#totCost').prop('value', '$' + tot);

	$(getTrxType(p1)).prop('value', $(p1).prop('value'));
}

function getBrowserName() {
	var name = navigator.userAgent.split(')').reverse()[0].match(/(?!Gecko|Version|[A-Za-z]+?Web[Kk]it)[A-Z][a-z]+/g)[0];
	return name.toLowerCase();
}

function getTrxType(trx) {
	switch (trx) {
		case "#cl":
			return "#clOld";
		case "#re":
			return "#reOld";
		case "#reo":
			return "#reoOld";
	}
}

function memberTableExpandContract() {
	(function($) {
		$.fn.hasScrollBar = function() {
			return this.get(0) ? this.get(0).scrollHeight > this.innerHeight() : false;
		}
	})(jQuery);
	var hasScrollBar = $("#fxhtc").hasScrollBar();
	var height = parseInt($("#fxhtc").css("height"), 10);
	height = height > 300 || hasScrollBar ? 300 : "100%";
	if ($("#cbShowTable").prop("checked")) {
		height = "100%";
	}
	$("#fxhtc").css("height", height);
}
