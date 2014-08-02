function updateform(initprice, exceedprice) {
	var grossAmount;
	var netAmount; 
	var averagePrice;
	var averageWeight;

	var totalWeight = parseInt(document.getElementById("totalWeight").value);
	var truckingExpenses = parseInt(document.getElementById("truckingExpenses").value);
	var numberOfHeads = parseInt(document.getElementById("numberOfHeads").value);


	console.log(totalWeight);
	console.log(truckingExpenses);
	console.log(numberOfHeads);

	if (!isNaN(totalWeight) && !isNaN(truckingExpenses) && !isNaN(numberOfHeads)) {
		if (totalWeight > 10) {
			var remainingKg = totalWeight - 10;
			grossAmount = ((10 * parseInt(initprice)) + (remainingKg * parseInt(exceedprice)));
		} else {
			grossAmount = totalWeight * parseInt(initprice);
			console.log("priceinit "+initprice);
		}
		console.log("computed gross amount" + grossAmount);
		document.getElementById("grossAmount").value = grossAmount;
		
		console.log("computed net amount");
		
		netAmount = grossAmount + truckingExpenses
		
		document.getElementById("netAmount").value = netAmount;
		
		if (numberOfHeads != 0) {
			averagePrice = netAmount / numberOfHeads;
			averageWeight = totalWeight / numberOfHeads;
			document.getElementById("averagePrice").value = averagePrice;
			document.getElementById("averageWeight").value = averageWeight;
		}
	}
	document.getElementById("create").disabled = false;
}

function disablesave() {
	document.getElementById("create").disabled = true;
}
